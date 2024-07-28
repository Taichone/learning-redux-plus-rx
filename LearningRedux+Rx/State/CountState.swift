//
//  CountState.swift
//  LearningRedux+Rx
//
//  Created by Taichi on 2024/07/26.
//

import Foundation
import ReSwift

public struct CountState: Equatable {
    public internal(set) var count: Int = 0 // ReadOnly
}

extension CountState {
    public enum Action: ReSwift.Action {
        case increment
        case decrement
    }
}
