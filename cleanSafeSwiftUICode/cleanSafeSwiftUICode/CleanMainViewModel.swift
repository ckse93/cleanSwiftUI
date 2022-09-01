//
//  MainViewModelBetter.swift
//  cleanSafeSwiftUICode
//
//  Created by Chan Jung on 8/31/22.
//

import Foundation

enum FetchStatus {
    case mainView // when nothing is loading, plain first step
    case loading
    case error
    case success(Book)
    case urlError
    case noInternet
}

final class CleanMainViewModel: ObservableObject {
    @Published var fetchStatus: FetchStatus = .mainView
    
    @MainActor
    func fetch() async {
        self.fetchStatus = .loading
        
        do {
            let book = try await NetworkManager.fetchBookData()
            self.fetchStatus = .success(book)
        } catch(let error) {
            self.fetchStatus = .error
        }
    }
}
