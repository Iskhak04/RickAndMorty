//
//  LocationModuleBuilder.swift
//  RickAndMorty
//
//  Created by Iskhak Zhutanov on 08.06.23.
//

import UIKit

final class LocationModuleBuilder {
    func build() -> UIViewController {
        let view = LocationViewController()
        let presenter = LocationPresenter()
        let interactor = LocationInteractor()
        let router = LocationRouter()
        
        view.presenter = presenter
        
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.viewController = view
        
        return view
    }
}
