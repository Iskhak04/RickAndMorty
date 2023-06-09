//
//  EpisodePresenter.swift
//  RickAndMorty
//
//  Created by Iskhak Zhutanov on 08.06.23.
//

final class EpisodePresenter {
    var view: EpisodeViewProtocol?
    var interactor: EpisodeInteractorProtocol?
    var router: EpisodeRouterProtocol?
}

extension EpisodePresenter: EpisodePresenterProtocol {
    
}
