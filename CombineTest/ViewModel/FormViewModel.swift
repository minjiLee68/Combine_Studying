//
//  FormViewModel.swift
//  CombineTest
//
//  Created by 이민지 on 2023/06/14.
//

import SwiftUI
import Combine

class FormViewModel: ObservableObject {
    @Published var inputValue = ""
    @Published var isInputValid = false
    
    private var calcellables = Set<AnyCancellable>()
    
    init() {
        $inputValue
            .receive(on: DispatchQueue.main)
            .map { input in
                // 여기에 유효성 검사 로직을 작성한다.
                return input.count >= 3 // 예제로 입력값이 3자리 이상일 때 유효하다고 가정한다.
            }
            .assign(to: \.isInputValid, on: self)
            .store(in: &calcellables)
    }
}
