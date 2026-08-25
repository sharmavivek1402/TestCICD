//
//  FAQ.swift
//  TestCaseDemo
//
//  Created by Vivek_Ios on 08/05/26.
//

import Foundation

// Top-level response
struct FAQModel: Codable {
    let success: Bool
    let data: FAQ?
}

// Data object containing faqs + relationshipAppFail
struct FAQ: Codable {
    let faqs: [FAQItem]?
    let relationshipAppFail: RelationshipAppFail?
    let relationshipBlueprint :RelationshipBlueprint?
    let startBuilding: StartBuilding?
    let monthToReach: MonthToReach?
}

// FAQ item
struct FAQItem: Codable {
    let id: String
    let question: String
    let answer: String
    var isExpanded: Bool = false   // 👈 UI purpose

    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case question
        case answer
    }
}

// RelationshipAppFail object
struct RelationshipAppFail: Codable {
    let id: String
    let title: String
    let videoUrl: String
    let isDeleted: Bool
    let createdAt: String
    let updatedAt: String
    let v: Int
    let videoThumbnail: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title
        case videoUrl
        case isDeleted
        case createdAt
        case updatedAt
        case v = "__v"
        case videoThumbnail
    }
}


// RelationshipBlueprint object
struct RelationshipBlueprint: Codable {
let id: String
let createdAt: String
let updatedAt: String
let v: Int
let text: String

enum CodingKeys: String, CodingKey {
    case id = "_id"
    case createdAt
    case updatedAt
    case v = "__v"
    case text
}
}


// MARK: - Start Building
struct StartBuilding: Codable {
let id: String
let title: String
let description: String
let createdAt: String
let updatedAt: String

enum CodingKeys: String, CodingKey {
    case id = "_id"
    case title
    case description
    case createdAt
    case updatedAt
}
}

// MARK: - Month To Reach
struct MonthToReach: Codable {
let id: String
let title: String
let description: String
let isDeleted: Bool
let createdAt: String
let updatedAt: String

enum CodingKeys: String, CodingKey {
    case id = "_id"
    case title
    case description
    case isDeleted
    case createdAt
    case updatedAt
}
}
