//
//  EpisodeViewController.swift
//  RickAndMorty
//
//  Created by Iskhak Zhutanov on 08.06.23.
//

import UIKit
import SnapKit

final class EpisodeViewController: UIViewController {
    
    var presenter: EpisodePresenterProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
}

extension EpisodeViewController: EpisodeViewProtocol {
    
}
