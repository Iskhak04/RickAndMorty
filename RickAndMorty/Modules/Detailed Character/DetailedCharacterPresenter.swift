//
//  DetailedCharacterPresenter.swift
//  RickAndMorty
//
//  Created by Iskhak Zhutanov on 09.06.23.
//

final class DetailedCharacterPresenter {
    
    var view: DetailedCharacterViewProtocol?
    var router: DetailedCharacterRouterProtocol?
    var interactor: DetailedCharacterInteractorProtocol?
    
}

extension DetailedCharacterPresenter: DetailedCharacterPresenterProtocol {
    
}
