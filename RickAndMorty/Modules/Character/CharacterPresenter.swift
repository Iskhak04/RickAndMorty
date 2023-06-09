//
//  CharacterPresenter.swift
//  RickAndMorty
//
//  Created by Iskhak Zhutanov on 08.06.23.
//

import UIKit

final class CharacterPresenter {
    
    var view: CharacterViewProtocol?
    var interactor: CharacterInteractorProtocol?
    var router: CharacterRouterProtocol?
    
}

extension CharacterPresenter: CharacterPresenterProtocol {
    func goToDetailedCharacter() {
        router?.goToDetailedCharacter()
    }
    
    func getCharacters(currentPage: Int) {
        interactor?.getCharacters(currentPage: currentPage)
    }
    
    func fetchedCharacters(characters: Character) {
        Task {
            do {
                var allCharacters: [CharacterViewModel] = []
                
                for i in 0..<characters.results.count {
                    let image = try await downloadImages(imageString: characters.results[i].image)
                    
                    var status = CharacterStatus.Unknown
                    
                    if characters.results[i].status == "Alive" {
                        status = CharacterStatus.Alive
                    } else if characters.results[i].status == "Dead" {
                        status = CharacterStatus.Dead
                    } else {
                        status = CharacterStatus.Unknown
                    }
                    
                    allCharacters.append(CharacterViewModel(id: characters.results[i].id, name: characters.results[i].name, status: status, species: characters.results[i].species, type: characters.results[i].type, gender: characters.results[i].gender, image: image, episode: characters.results[i].episode, characterURL: characters.results[i].url, created: characters.results[i].created, originName: characters.results[i].origin.name, originURL: characters.results[i].origin.url, locationName: characters.results[i].location.name, locationURL: characters.results[i].location.url, generalInfoCount: characters.info.count, generalInfoPages: characters.info.pages, generalInfoNext: characters.info.next, generalInfoPrev: characters.info.prev))
                }
                
                view?.fetchedCharacters(characters: allCharacters)
            } catch {
                print("error")
            }
        }
    }
}

func downloadImages(imageString: String) async throws -> UIImage {
    guard let imageUrl = URL(string: imageString) else { throw CharacterError.invalidUrl }
    
    let (data, response) = try await URLSession.shared.data(from: imageUrl)
    
    guard let newResponse = response as? HTTPURLResponse, newResponse.statusCode == 200 else { throw CharacterError.genericError }
    
    guard let image = UIImage(data: data) else { throw CharacterError.genericError }
    
    return image
}


