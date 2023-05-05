//
//  ContentView.swift
//  TCA_Simple_tutorial
//
//  Created by Joy on 2023/05/05.
//

import SwiftUI
import ComposableArchitecture

//MARK: State
/// 도메인 + 상태
struct CounterState: Equatable{
    var count = 0
}

//MARK: Action
// 도메인 + 액션
enum CounterAction: Equatable{
    case addCount // 카운트를 더하는 액션
    case subtractCount // 카운트를 빼는 액션
}

struct CounterEnvironment{}

//MARK: Reducer
// Action과 State를 연결
let counterReducer = AnyReducer<CounterState, CounterAction, CounterEnvironment> {state, action, environment in
    switch action{
    case .addCount:
        state.count += 1
        return EffectTask.none
        
    case .subtractCount:
        state.count -= 1
        return EffectTask.none
    }
}

struct CounterView: View {
    
    //MARK: Store
    let store: Store<CounterState, CounterAction>
    
    var body: some View {
        // View와 Store를 연결
        WithViewStore(self.store) { viewStore in
            VStack{
                Text("Count:\(viewStore.state.count) ")
                    .padding()
                HStack{
                    Button("더하기", action: {viewStore.send(.addCount)})
                    Button("빼기", action: {viewStore.send(.subtractCount)})
                }
            }
        }
    }
}

