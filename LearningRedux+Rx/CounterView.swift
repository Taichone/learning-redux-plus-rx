//
//  CounterView.swift
//  LearningRedux+Rx
//
//  Created by Taichi on 2024/07/26.
//

import SwiftUI

protocol CounterViewModelInterface {
    var count: Int { get }
    func increment()
    func decrement()
}

struct CounterView: View {
    @State var viewModel: CounterViewModelInterface
    
    var body: some View {
        VStack {
            Text("\(viewModel.count)")
                .font(.largeTitle)
            HStack {
                Button(action: {
                    viewModel.increment()
                }) {
                    Text("Increment")
                }
                Button(action: {
                    viewModel.decrement()
                }) {
                    Text("Decrement")
                }
            }
        }
        .padding()
    }
}

#Preview {
    CounterView(viewModel: CounterViewModel())
}
