//
//  MainViewBetter.swift
//  cleanSafeSwiftUICode
//
//  Created by Chan Jung on 8/31/22.
//

import SwiftUI

struct CleanMainView: View {
    @ObservedObject var viewModel: CleanMainViewModel = .init()
    
    var body: some View {
        
        VStack {
            Text("CleanMainView")
                .font(.title)
            
            switch viewModel.fetchStatus {
            case .mainView:
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
            
            case .loading:
                ProgressView()
                    .padding(20)
                    .background(Color.gray)
                    .cornerRadius(15)
                
            case .error:
                VStack {
                    Image(systemName: "exclamationmark.triangle")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.red)
                    
                    Text("Error while fetching!!!")
                        .font(.title2)
                        .foregroundColor(.red)
                }
                
            case .success(let book):
                BookInfoView(book: book)
            }
        }
        
    }
}

struct MainViewBetter_Previews: PreviewProvider {
    static var previews: some View {
        CleanMainView()
    }
}
