//
//  DetailedCharacterModuleBuilder.swift
//  RickAndMorty
//
//  Created by Iskhak Zhutanov on 09.06.23.
//

import UIKit

final class DetailedCharacterModuleBuilder {
    
    func build() -> UIViewController {
        let view = DetailedCharacterViewController()
        let presenter = DetailedCharacterPresenter()
        let interactor = DetailedCharacterInteractor()
        let router = DetailedCharacterRouter()
        
        view.presenter = presenter
        
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view
        
        router.viewController = view
        
        interactor.presenter = presenter
        
        return view
    }
    
    
}
