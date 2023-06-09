//
//  Character.swift
//  RickAndMorty
//
//  Created by Iskhak Zhutanov on 08.06.23.
//

struct Character: Codable {
    let results: [CharacterModel]
    let info: GeneralInfo
}

struct CharacterModel: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: OriginModel
    let location: LocationModel
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

struct OriginModel: Codable {
    let name: String
    let url: String
}

struct LocationModel: Codable {
    let name: String
    let url: String
}

struct GeneralInfo: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
