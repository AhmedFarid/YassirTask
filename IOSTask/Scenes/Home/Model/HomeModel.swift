//
//  HomeModel.swift
//  IOSTask
//
//  Created by Farido on 05/09/2024.
//

import Foundation

struct HomeModel: Codable {
    var info: Info?
    var results: [ResultData]?

    enum CodingKeys: String, CodingKey {
        case info = "info"
        case results = "results"
    }
}

struct Info: Codable {
    var count: Int?
    var pages: Int?
    var next: String?
    var prev: String?

    enum CodingKeys: String, CodingKey {
        case count = "count"
        case pages = "pages"
        case next = "next"
        case prev = "prev"
    }
}

struct ResultData: Codable {
    var id: Int?
    var name: String?
    var status: String?
    var species: String?
    var type: String?
    var gender: String?
    var image: String?
    var location: Location?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case status = "status"
        case species = "species"
        case type = "type"
        case gender = "gender"
        case image = "image"
        case location = "location"
    }
}


struct Location: Codable {
    var name: String?
    var url: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
}
