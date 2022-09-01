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
                    ButtonTextView()
                }
            
            case .loading:
                ProgressViewCustom()
                
            case .error:
                ErrorView()
                
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
