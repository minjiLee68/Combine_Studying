//
//  CounterViewModel.swift
//  CombineTest
//
//  Created by 이민지 on 2023/06/14.
//

import SwiftUI
import Combine

class CounterViewModel: ObservableObject {
    @Published var count = 0
    @Published var text = ""
    private var cancellables = Set<AnyCancellable>()
    
    func increment() {
        count += 1
    }
    
    init() {
        $count
            .sink { newValue in
                self.text = "Count is now \(newValue)"
            }
            .store(in: &cancellables)
    }
    
    // count의 변경사항을 구독하고 변경사항이 있을 때마다 새로운 값 업데이트
}
