//
//  CharacterRouter.swift
//  RickAndMorty
//
//  Created by Iskhak Zhutanov on 08.06.23.
//

import UIKit

final class CharacterRouter {
    
    weak var viewController: UIViewController?
    
}

extension CharacterRouter: CharacterRouterProtocol {
    func goToDetailedCharacter() {
        viewController?.navigationController?.pushViewController(DetailedCharacterModuleBuilder().build(), animated: true)
    }
}
