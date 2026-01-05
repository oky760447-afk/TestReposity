//
//  Post.swift
//  DisplayPost
//
//  Created by macOS15 on 14/12/25.
//

import Foundation

//struct Post:Decodable{
//
//    var id     : Int
//    var userID : Int
//    var title  : String
//    var body   : String
//
//    enum Codingkeys: String, CodingKey {
//        case userID = "userId"
//        case id , title, body
//    }
//
//}

struct Post: Codable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}



