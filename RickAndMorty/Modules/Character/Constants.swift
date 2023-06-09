//
//  Constants.swift
//  RickAndMorty
//
//  Created by Iskhak Zhutanov on 08.06.23.
//

import UIKit

final class Constants {
    static let shared = Constants()
    
    //CharacterCell
    var characterNameFont = UIFont(name: "Arial", size: 18)
    var descriptionFont = UIFont(name: "Arial", size: 16)
    var mainDataFont = UIFont(name: "Arial", size: 17)
    
    var characterMainColor = UIColor.label
    var descriptionColor = UIColor.gray
    
    //CharacterViewController
    var sideOffset = 15
    
    
    private init() {}
}
