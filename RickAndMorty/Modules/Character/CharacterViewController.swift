//
//  CharacterViewController.swift
//  RickAndMorty
//
//  Created by Iskhak Zhutanov on 08.06.23.
//

import UIKit
import SnapKit

final class CharacterViewController: UIViewController {
    
    var presenter: CharacterPresenterProtocol?
    
    private var allCharacters: [CharacterViewModel] = []
    private var currentPage = 1
    private var totalPages = 42
    
    private lazy var refreshControl: UIRefreshControl = {
        let view = UIRefreshControl()
        view.addTarget(self, action: #selector(loadNewCharacters), for: .valueChanged)
        return view
    }()
    
    private lazy var charactersCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.delegate = self
        view.dataSource = self
        view.register(CharacterCell.self, forCellWithReuseIdentifier: "CharacterCell")
        view.showsVerticalScrollIndicator = true
        view.refreshControl = refreshControl
        return view
    }()
    
    private lazy var spinnerView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.hidesWhenStopped = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getCharacters(currentPage: currentPage)
        currentPage += 1
        view.backgroundColor = .systemBackground
        layout()
        spinnerView.startAnimating()
    }
    
    @objc func loadNewCharacters() {
        //Fetch new characters
        presenter?.getCharacters(currentPage: currentPage)
        currentPage += 1
        refreshControl.endRefreshing()
    }
    
    private func layout() {
        view.addSubview(charactersCollectionView)
        charactersCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(100)
            make.bottom.equalTo(view.snp.bottom).offset(0)
            make.left.equalTo(view.snp.left).offset(Constants.shared.sideOffset)
            make.right.equalTo(view.snp.right).offset(-Constants.shared.sideOffset)
        }
        
        view.addSubview(spinnerView)
        spinnerView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}

extension CharacterViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allCharacters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = charactersCollectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
        
        cell.layer.borderWidth = 4
        cell.layer.cornerRadius = 10
        cell.backgroundColor = .systemBackground
        
        cell.characterImageView.image = allCharacters[indexPath.row].image
        cell.characterNameLabel.text = allCharacters[indexPath.row].name
        cell.characterStatusLabel.text = "\(allCharacters[indexPath.row].status)"
        
        switch allCharacters[indexPath.row].status {
        case .Alive:
            cell.statusIndicatorView.backgroundColor = .systemGreen
            cell.layer.borderColor = UIColor.systemGreen.cgColor
        case .Dead:
            cell.statusIndicatorView.backgroundColor = .systemRed
            cell.layer.borderColor = UIColor.systemRed.cgColor
        default:
            cell.statusIndicatorView.backgroundColor = .systemGray
            cell.layer.borderColor = UIColor.systemGray.cgColor
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 240)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item == allCharacters.count - 1, currentPage < totalPages {
            loadNewCharacters()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.goToDetailedCharacter()
    }
}

extension CharacterViewController: CharacterViewProtocol {
    func fetchedCharacters(characters: [CharacterViewModel]) {
        allCharacters += characters
        
        DispatchQueue.main.async {
            self.spinnerView.stopAnimating()
            self.charactersCollectionView.reloadData()
        }
    }
}
