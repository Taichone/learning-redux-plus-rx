//
//  RxStore.swift
//  LearningRedux+Rx
//
//  Created by Taichi on 2024/07/26.
//

import Foundation
import ReSwift
import RxSwift
import RxRelay
import RxCocoa

public class RxStore<AnyStateType>: ReSwift.StoreSubscriber {
    // 最新のStateの発行通知を受け取るためのDriverを公開する
    public lazy var stateDriver: Driver<AnyStateType> = {
        stateRelay.asDriver()
    }()
    // 最新のStateを取得するためのプロパティを公開
    public var state: AnyStateType { return stateRelay.value }

    // 最新のStateをキャッシュする & イベントを流す
    private let stateRelay: BehaviorRelay<AnyStateType>
    private let store: ReSwift.Store<AnyStateType>

    public init(store: ReSwift.Store<AnyStateType>) {
        self.store = store
        self.stateRelay = BehaviorRelay(value: store.state)
        self.store.subscribe(self)
    }

    deinit {
        store.unsubscribe(self)
    }

    // 新しいStateが発行されたときに呼ばれる
    public func newState(state: AnyStateType) {
        // stateReray に新しく発行されたStateを反映する
        stateRelay.accept(state)
    }

    public func dispatch(_ action: ReSwift.Action) {
        // Action の Dispatch はメインスレッドで行うようにする
        guard Thread.isMainThread else {
            DispatchQueue.main.async { [weak self] in
                self?.store.dispatch(action)
            }
            return
        }

        store.dispatch(action)
    }
}

// State extension
extension RxStore where AnyStateType == AppState {
    var countState: Driver<CountState> {
        return stateDriver
            .map { $0.countState }
            .skip(1) // 初期値の通知をスキップ
            .distinctUntilChanged()
    }
}
