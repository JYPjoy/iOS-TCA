//
//  ContentView.swift
//  TCA_Simple_tutorial
//
//  Created by Joy on 2023/05/05.
//

import SwiftUI
import ComposableArchitecture

// 도메인 + 상태
struct CounterState: Equatable{
    var count = 0
}

// 도메인 + 액션
enum CounterAction: Equatable{
    case addCount // 카운트를 더하는 액션
    case subtractCount // 카운트를 빼는 액션
}

struct CounterEnvironment{}

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
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        CounterView()
//    }
//}
