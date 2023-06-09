//
//  LocationPresenter.swift
//  RickAndMorty
//
//  Created by Iskhak Zhutanov on 08.06.23.
//

final class LocationPresenter {
    var view: LocationViewProtocol?
    var interactor: LocationInteractorProtocol?
    var router: LocationRouterProtocol?
    
}

extension LocationPresenter: LocationPresenterProtocol {
    
}
