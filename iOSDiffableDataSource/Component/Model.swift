//
//  Model.swift
//  iOSDiffableDataSource
//
//  Created by Ghazi Tozri on 10/1/2021.
//

// MARK: - Response
struct Response: Decodable, Hashable {
    
    var searchType, expression: String?
    var results: [Result]?
    var errorMessage: String?
}

// MARK: - Result
struct Result: Decodable, Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: Result, rhs: Result) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id, resultType: String?
    let image: String?
    let title, resultDescription: String?

    enum CodingKeys: String, CodingKey {
        case id, resultType, image, title
        case resultDescription = "description"
    }
}
