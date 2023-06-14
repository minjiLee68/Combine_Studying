//
//  ContentView.swift
//  CombineTest
//
//  Created by 이민지 on 2023/06/14.
//

import SwiftUI
import Combine

struct ContentView: View {
    @StateObject var viewModel = CounterViewModel()
    
    var body: some View {
        VStack {
            Text("Count : \(viewModel.count)")
                .font(.title2)
            
            Button {
                viewModel.increment()
            } label: {
                Text(viewModel.text)
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
