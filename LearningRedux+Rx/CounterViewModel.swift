//
//  CounterViewModel.swift
//  LearningRedux+Rx
//
//  Created by Taichi on 2024/07/26.
//

import ReSwift
import RxSwift
import RxRelay
import Foundation

@Observable
class CounterViewModel: CounterViewModelInterface {
    var count: Int = 0
    
    private let disposeBag = DisposeBag()
    private let incrementAction = PublishSubject<Void>()
    private let decrementAction = PublishSubject<Void>()
    
    init() {
        incrementAction
            .subscribe(onNext: {
                AppStore.shared.dispatch(CountState.Action.increment)
            })
            .disposed(by: disposeBag)
        
        decrementAction
            .subscribe(onNext: {
                AppStore.shared.dispatch(CountState.Action.decrement)
            })
            .disposed(by: disposeBag)
        
        // RxStore の stateDriver を利用して countState の変化を監視
        AppStore.shared.countState
            .drive(onNext: { [weak self] countState in
                self?.count = countState.count
            })
            .disposed(by: disposeBag)
    }
    
    func increment() {
        incrementAction.onNext(())
    }
    
    func decrement() {
        decrementAction.onNext(())
    }
}

