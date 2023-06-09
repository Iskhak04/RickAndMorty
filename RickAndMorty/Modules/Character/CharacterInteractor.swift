//
//  CharacterInteractor.swift
//  RickAndMorty
//
//  Created by Iskhak Zhutanov on 08.06.23.
//

import Alamofire

final class CharacterInteractor {
    
    var presenter: CharacterPresenterProtocol?
    
}

extension CharacterInteractor: CharacterInteractorProtocol {
    func getCharacters(currentPage: Int) {
        //Fetch characters
        let request = AF.request("https://rickandmortyapi.com/api/character/?page=\(currentPage)")
        
        request.responseDecodable(of: Character.self) { (response) in
          guard let characters = response.value else { return }
            
            //Send characters to presenter
            self.presenter?.fetchedCharacters(characters: characters)
        }
    }
}
