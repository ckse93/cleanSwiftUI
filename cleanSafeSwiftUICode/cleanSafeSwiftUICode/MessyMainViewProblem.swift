//
//  ContentView.swift
//  cleanSafeSwiftUICode
//
//  Created by Chan Jung on 8/31/22.
//

import SwiftUI

struct MessyMainViewProblem: View {
    @ObservedObject var viewModel: MessyMainViewModel = .init()
    var body: some View {
        VStack {
            Text("MessyMainViewProblem")
                .font(.title)
            
            if !(viewModel.isLoading || viewModel.isError) && viewModel.bookData == nil {
                Button {
                    Task {
                      await viewModel.fetch()
                    }
                } label: {
                    Text("fetch book data!")
                        .fontWeight(.heavy)
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(10)
                }
            }
            
            if viewModel.isLoading {
                ProgressView()
                    .padding(20)
                    .background(Color.gray)
                    .cornerRadius(15)
            } else if viewModel.isError {
                VStack {
                    Image(systemName: "exclamationmark.triangle")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.red)
                    
                    Text("Error while fetching!!!")
                        .font(.title2)
                        .foregroundColor(.red)
                }
                
            } else {
                if let book = viewModel.bookData {
                    BookInfoView(book: book)
                }
            }
        }
    }
}
