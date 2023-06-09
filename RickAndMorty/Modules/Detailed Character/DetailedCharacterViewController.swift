//
//  DetailedCharacterViewController.swift
//  RickAndMorty
//
//  Created by Iskhak Zhutanov on 09.06.23.
//

import UIKit
import SnapKit

final class DetailedCharacterViewController: UIViewController {
    
    var presenter: DetailedCharacterPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
    }
}

extension DetailedCharacterViewController: DetailedCharacterViewProtocol {
    
}
