//
//  CharacterProtocols.swift
//  RickAndMorty
//
//  Created by Iskhak Zhutanov on 08.06.23.
//

//Conforms View, Presenter -> View
protocol CharacterViewProtocol {
    func fetchedCharacters(characters: [CharacterViewModel])
}

//Conforms Presenter, View -> Presenter, Interactor -> Presenter
protocol CharacterPresenterProtocol {
    func getCharacters(currentPage: Int)
    func fetchedCharacters(characters: Character)
    func goToDetailedCharacter()
}

//Conforms Interactor, Presenter -> Interactor
protocol CharacterInteractorProtocol {
    func getCharacters(currentPage: Int)
}

//Conforms Router, Presenter -> Router
protocol CharacterRouterProtocol {
    func goToDetailedCharacter()
}
