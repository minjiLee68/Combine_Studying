//
//  FormView.swift
//  CombineTest
//
//  Created by 이민지 on 2023/06/14.
//

import SwiftUI

struct FormView: View {
    @StateObject var viewModel = FormViewModel()
    
    var body: some View {
        VStack {
            TextField("값을 입력하세요", text: $viewModel.inputValue)
                .padding()
                .border(Color.gray, width: 1)
            
            Button("Submit") {
                // Submit 버튼을 누를 때 동작할 코드를 작성합니다.
                print("Submitted!")
            }
            .padding()
            .background(viewModel.isInputValid ? Color.blue : Color.gray)
            .foregroundColor(.white)
            .cornerRadius(10)
            .disabled(!viewModel.isInputValid)
        }
        .padding()
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
