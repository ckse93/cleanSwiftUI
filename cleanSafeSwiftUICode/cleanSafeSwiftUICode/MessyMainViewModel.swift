//
//  MessyMainViewModel.swift
//  cleanSafeSwiftUICode
//
//  Created by Chan Jung on 8/31/22.
//

import Foundation

final class MessyMainViewModel: ObservableObject {
    @Published var isError: Bool = false
    @Published var isLoading: Bool = false
    @Published var bookData: Book? = nil
    
    @MainActor
    func fetch() async {
        self.isLoading = true
        do {
            let book = try await NetworkManager.fetchBookData()
            self.bookData = book
            isLoading = false
            isError = false
        } catch {
            isLoading = false
            isError = true
        }
    }
}
