// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let book = try? newJSONDecoder().decode(Book.self, from: jsonData)

import Foundation

// MARK: - Book
struct Book: Codable {
    let bookDescription, title: String
    let covers: [Int]
    let subjectPlaces, subjects, subjectPeople: [String]
    let key: String
    let authors: [Author]
    let subjectTimes: [String]
    let type: TypeClass
    let location: String
    let latestRevision, revision: Int
    let created, lastModified: Created

    enum CodingKeys: String, CodingKey {
        case bookDescription = "description"
        case title, covers
        case subjectPlaces = "subject_places"
        case subjects
        case subjectPeople = "subject_people"
        case key, authors
        case subjectTimes = "subject_times"
        case type, location
        case latestRevision = "latest_revision"
        case revision, created
        case lastModified = "last_modified"
    }
}

// MARK: - Author
struct Author: Codable {
    let author, type: TypeClass
}

// MARK: - TypeClass
struct TypeClass: Codable {
    let key: String
}

// MARK: - Created
struct Created: Codable {
    let type, value: String
}
