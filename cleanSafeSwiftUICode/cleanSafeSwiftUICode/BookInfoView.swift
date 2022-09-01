//
//  BookInfoView.swift
//  cleanSafeSwiftUICode
//
//  Created by Chan Jung on 8/31/22.
//

import SwiftUI

struct BookInfoView: View {
    let book: Book
    
    var body: some View {
        ScrollView {
            VStack {
                Text(book.title)
                    .font(.title)
                    .fontWeight(.heavy)
                    .padding()
                
                Text("subjects: ")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                VStack {
                    ForEach(book.subjects, id: \.self) { subject in
                        Text(subject)
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("Description")
                        .fontWeight(.bold)
                    Text(book.bookDescription)
                }
                .padding()
            }
            .padding()
        }
    }
}
