//
//  NetworkManager.swift
//  cleanSafeSwiftUICode
//
//  Created by Chan Jung on 8/31/22.
//

import Foundation

final class NetworkManager {
    
    static func fetchBookData() async throws -> Book {
        try await Task.sleep(nanoseconds: 1_000_000_000)  // wait for 1 second to simulate some loading
        
        guard let url = URL(string: "https://openlibrary.org/works/OL45883W.json") else {
            throw NetworkManagerError.unableToMakeURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let book: Book = try JSONDecoder().decode(Book.self, from: data)
        return book
    }
}

enum NetworkManagerError: Error {
    case unableToMakeURL
}
