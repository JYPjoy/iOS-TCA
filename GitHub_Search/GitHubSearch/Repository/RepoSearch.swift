import Foundation

import ComposableArchitecture

struct RepoSearch: ReducerProtocol {
    struct State: Equatable {
        // TODO: 지금 앱은 어떤 상태들로 정의되는가?
        // keyword와 searchResults 상태 추가하기
        var keyword = ""
        var searchResults = [String]()
        var requestCount = 0
    }
    
    enum Action: Equatable {
        // TODO: 상태들을 변화시키는 사용자의 액션은 무엇인가?
        // keywordChanged, search 액션 추가하기
        case keywordChanged(String)
        case search
        case dataLoaded(TaskResult<RepositoryModel>)
    }
    
    
    @Dependency (\.repoSearchClient) var repoSearchClient
    @Dependency (\.continuousClock) var clock
    
    private enum DebounceSearchID {}
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> { //sideEffect들을 EffectTask로 추상화함
        // TODO: 각각의 Action이 발생했을 때 상태는 어떻게 변화해야 하는가?
        switch action {
        case let .keywordChanged(keyword):
            state.keyword = keyword
            return .run { send in
                try await self.clock.sleep(for: .seconds(1))
                await send(.search)
            }
            .cancellable(id: DebounceSearchID.self, cancelInFlight: true)
            // last task
            
        case .search:
            state.requestCount += 1
            return EffectTask.run { [keyword = state.keyword] send in
                let result = await TaskResult {try await repoSearchClient.search(keyword)
                }
                await send(.dataLoaded(result))
            }
            
        case let .dataLoaded(.success(repositoryModel)):
            state.searchResults = repositoryModel.items.map{$0.name}
            return .none
            
        case .dataLoaded(.failure):
            state.searchResults = []
            return .none
        }
    }
}
