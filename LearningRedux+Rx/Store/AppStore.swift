//
//  AppStore.swift
//  LearningRedux+Rx
//
//  Created by Taichi on 2024/07/26.
//

import Foundation
import RxSwift
import RxCocoa
import RxRelay
import ReSwift

final public class AppStore {
    private let store: RxStore<AppState>
    
    // singleton
    private static let instance = AppStore()
    public static var shared: RxStore<AppState> {
        return instance.store
    }

    private init() {
        store = RxStore(store: ReSwift.Store<AppState>(
            reducer: appReducer, // Storeで使うReducerを登録
            state: nil, // 初期Stateを登録
            middleware: [] // Middlewareを使わない場合は空の配列を渡す
        ))
    }
}
