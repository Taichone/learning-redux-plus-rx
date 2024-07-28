//
//  AppState.swift
//  LearningRedux+Rx
//
//  Created by Taichi on 2024/07/26.
//

import Foundation
import ReSwift

public struct AppState: Equatable{
    public internal(set) var countState = CountState() // ReadOnly
}
