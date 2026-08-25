//
//  Login.swift
//  TestCaseDemo
//
//  Created by Vivek_Ios on 08/05/26.
//



struct LoginRequest: Encodable {
    let email: String
    let password: String
}


struct LoginResponse: Decodable {
    let success: Bool
    let accessToken: String?
    let refreshToken: String?
    let user: User?
    let message: String
    let genderRequired: Bool?
}

struct User: Codable {
    let id: String
    let name: String
    let email: String
    var isPartnerInvited: Bool
    var isCounselingAdded: Bool
    var isAssessmentPaid: Bool
    let isBluePrintSuccess: Bool?
    var user_type: String?
}
