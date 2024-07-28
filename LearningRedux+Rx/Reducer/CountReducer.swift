//
//  CountReducer.swift
//  LearningRedux+Rx
//
//  Created by Taichi on 2024/07/26.
//

import Foundation
import ReSwift

extension CountState {
    public static func reducer(action: ReSwift.Action, state: CountState?) -> CountState {
        var state = state ?? CountState()
        guard let action = action as? CountState.Action else { return state }
        
        switch action {
        case .increment:
            state.count += 1
        case .decrement:
            state.count -= 1
        }

        return state
    }
}
