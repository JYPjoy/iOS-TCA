//
//  MemoClient.swift
//  TCA_Simple_tutorial
//
//  Created by Joy on 2023/05/05.
//

import Foundation
import ComposableArchitecture

//API 통신
struct MemoClient {
//    var fetchMemoItem: (_ id: String) -> Effect<Memo, Failure>
//    struct Failure: Error, Equatable{}
    
    //단일 아이템 조회
    var fetchMemoItem: (_ id: String) -> EffectTask<Memo>
    var fecthMemos: () -> EffectTask<Memos>
}

//extension MemoClient {
//    static let live = Self(
//        fetchMemoItem: {id in
//            EffectTask.task{
//                let (data, _) = try await URLSession.shared.data(from: URL(string: "https://6454ae77a74f994b33460a38.mockapi.io/"))
//            }
//        },
//        fecthMemos: {
//            
//        }
//    )
//    
//}
