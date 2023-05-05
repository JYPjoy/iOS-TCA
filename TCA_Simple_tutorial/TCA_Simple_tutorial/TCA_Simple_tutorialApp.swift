//
//  TCA_Simple_tutorialApp.swift
//  TCA_Simple_tutorial
//
//  Created by Joy on 2023/05/05.
// 

import SwiftUI
import ComposableArchitecture

@main
struct TCA_Simple_tutorialApp: App {
    
    let counterStore = Store(initialState: CounterState(),
                             reducer: counterReducer,
                            environment: CounterEnvironment())
    
    var body: some Scene {
        WindowGroup {
            CounterView(store: counterStore)
        }
    }
}
