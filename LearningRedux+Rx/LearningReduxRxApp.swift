//
//  LearningReduxRxApp.swift
//  LearningRedux+Rx
//
//  Created by Taichi on 2024/07/26.
//

import SwiftUI

@main
struct LearningReduxRxApp: App {
    var body: some Scene {
        WindowGroup {
            CounterView(viewModel: CounterViewModel())
        }
    }
}
