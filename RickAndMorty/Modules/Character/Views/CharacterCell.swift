//
//  CharacterCell.swift
//  RickAndMorty
//
//  Created by Iskhak Zhutanov on 08.06.23.
//

import UIKit

final class CharacterCell: UICollectionViewCell {
    
    lazy var characterImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "test")
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var characterNameLabel: UILabel = {
        let view = UILabel()
        view.text = "Donna Gueterman"
        view.font = Constants.shared.characterNameFont
        view.textColor = Constants.shared.characterMainColor
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.textAlignment = .center
        return view
    }()
    
    lazy var characterStatusView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    lazy var statusIndicatorView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        
        return view
    }()
    
    lazy var characterStatusLabel: UILabel = {
        let view = UILabel()
        view.text = "Dead"
        view.font = Constants.shared.mainDataFont
        view.textColor = Constants.shared.characterMainColor
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(characterImageView)
        characterImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(Constants.shared.sideOffset)
            make.width.equalTo((Int(frame.width) - 2 * Constants.shared.sideOffset))
            make.height.equalTo((Int(frame.width) - 2 * Constants.shared.sideOffset))
        }
        
        addSubview(characterNameLabel)
        characterNameLabel.snp.makeConstraints { make in
            make.top.equalTo(characterImageView.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.width.equalTo(frame.width - 20)
            make.height.equalTo(41)
        }
        
        addSubview(characterStatusView)
        characterStatusView.snp.makeConstraints { make in
            make.top.equalTo(characterNameLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.height.equalTo(25)
            make.width.equalTo(115)
        }
        
        characterStatusView.addSubview(statusIndicatorView)
        statusIndicatorView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(9)
            make.height.equalTo(16)
            make.width.equalTo(16)
        }
        
        characterStatusView.addSubview(characterStatusLabel)
        characterStatusLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(statusIndicatorView.snp.right).offset(10)
        }
        
//        addSubview(lastKnownLocationLabel)
//        lastKnownLocationLabel.snp.makeConstraints { make in
//            make.top.equalTo(characterStatusView.snp.bottom).offset(15)
//            make.left.equalTo(characterImageView.snp.right).offset(10)
//        }
//
//        addSubview(characterLastKnownLocationLabel)
//        characterLastKnownLocationLabel.snp.makeConstraints { make in
//            make.top.equalTo(lastKnownLocationLabel.snp.bottom).offset(5)
//            make.left.equalTo(characterImageView.snp.right).offset(10)
//        }
//
//        addSubview(firstSeenInLabel)
//        firstSeenInLabel.snp.makeConstraints { make in
//            make.top.equalTo(characterLastKnownLocationLabel.snp.bottom).offset(15)
//            make.left.equalTo(characterImageView.snp.right).offset(10)
//        }
//
//        addSubview(characterFirstSeenInLabel)
//        characterFirstSeenInLabel.snp.makeConstraints { make in
//            make.top.equalTo(firstSeenInLabel.snp.bottom).offset(5)
//            make.left.equalTo(characterImageView.snp.right).offset(10)
//        }
    }
}
