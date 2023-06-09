//
//  CharacterViewModel.swift
//  RickAndMorty
//
//  Created by Iskhak Zhutanov on 08.06.23.
//

import UIKit

struct CharacterViewModel {
    let id: Int
    let name: String
    let status: CharacterStatus
    let species: String
    let type: String
    let gender: String
    let image: UIImage
    let episode: [String]
    let characterURL: String
    let created: String
    let originName: String
    let originURL: String
    let locationName: String
    let locationURL: String
    let generalInfoCount: Int
    let generalInfoPages: Int
    let generalInfoNext: String?
    let generalInfoPrev: String?
}
