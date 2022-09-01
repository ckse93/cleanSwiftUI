//
//  ContentView.swift
//  cleanSafeSwiftUICode
//
//  Created by Chan Jung on 8/31/22.
//

import SwiftUI

struct MessyMainView: View {
    @ObservedObject var viewModel: MessyMainViewModel = .init()
    var body: some View {
        VStack {
            Text("MessyMainView")
                .font(.title)
            
            if !(viewModel.isLoading || viewModel.isError) && viewModel.bookData == nil {
                Button {
                    Task {
                      await viewModel.fetch()
                    }
                } label: {
                    ButtonTextView()
                }
            }
            
            if viewModel.isLoading {
                ProgressViewCustom()
                
            } else if viewModel.isError {
                ErrorView()
                
            } else {
//                if let book = viewModel.bookData {
                BookInfoView(book: viewModel.bookData!)
//                }
            }
        }
    }
}

struct ButtonTextView: View {
    var body: some View {
        Text("fetch book data!")
            .fontWeight(.heavy)
            .padding()
            .background(Color.yellow)
            .cornerRadius(10)
    }
}

struct ProgressViewCustom: View {
    var body: some View {
        ProgressView()
            .padding(20)
            .background(Color.gray)
            .cornerRadius(15)
    }
}

struct ErrorView: View {
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.red)
            
            Text("Error while fetching!!!")
                .font(.title2)
                .foregroundColor(.red)
        }
    }
}
