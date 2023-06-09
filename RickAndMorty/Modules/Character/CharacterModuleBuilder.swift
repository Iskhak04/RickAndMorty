//
//  CharacterModuleBuilder.swift
//  RickAndMorty
//
//  Created by Iskhak Zhutanov on 08.06.23.
//

import UIKit

final class CharacterModuleBuilder {
    func build() -> UIViewController {
        let view = CharacterViewController()
        let presenter = CharacterPresenter()
        let interactor = CharacterInteractor()
        let router = CharacterRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.viewController = view
        
        return view
    }
}
