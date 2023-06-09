//
//  EpisodeModuleBuilder.swift
//  RickAndMorty
//
//  Created by Iskhak Zhutanov on 08.06.23.
//

import UIKit

final class EpisodeModuleBuilder {
    func build() -> UIViewController {
        let view = EpisodeViewController()
        let presenter = EpisodePresenter()
        let interactor = EpisodeInteractor()
        let router = EpisodeRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.viewController = view
        
        return view
    }
}
