//
//  AppReducer.swift
//  LearningRedux+Rx
//
//  Created by Taichi on 2024/07/26.
//

import Foundation
import ReSwift

// top level Reducer
public func appReducer(action: ReSwift.Action, state: AppState?) -> AppState {
    var state = state ?? AppState()
    state.countState = CountState.reducer(action: action, state: state.countState)
    return state
}
