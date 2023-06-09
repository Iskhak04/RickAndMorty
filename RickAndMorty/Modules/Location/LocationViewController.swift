//
//  LocationViewController.swift
//  RickAndMorty
//
//  Created by Iskhak Zhutanov on 08.06.23.
//

import UIKit
import SnapKit

final class LocationViewController: UIViewController {
    
    var presenter: LocationPresenterProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
}

extension LocationViewController: LocationViewProtocol {
    
}
