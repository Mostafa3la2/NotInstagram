//
//  FeedCell.swift
//  NotInstagram
//
//  Created by Mostafa Alaa on 22/11/2021.
//

import UIKit

class FeedCell:UICollectionViewCell{
    
    private let profileImage:UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.backgroundColor = UIColor.purple
        return iv
    }()
    
    
    private lazy var usernameButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Wow", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        return button
    }()
    
    private let postImageView:UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.backgroundColor = UIColor.purple
        return iv
    }()
    
    
    private lazy var likeButton:UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var shareButton:UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "paperplane"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var commentButton:UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "message"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private let likesLabel:UILabel = {
        let label = UILabel()
        label.text = "1 like"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    private let captionLabel:UILabel = {
        let label = UILabel()
        label.text = "Some interesting caption"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private let postTimeLabel:UILabel = {
        let label = UILabel()
        label.text = "Two days ago"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(profileImage)
        
        profileImage.anchor(top: topAnchor, left: leftAnchor,paddingTop: 12,paddingLeft: 12)
        profileImage.setDimensions(height: 40, width: 40)
        profileImage.layer.cornerRadius = 20
        
        addSubview(usernameButton)
        usernameButton.centerY(inView: profileImage,leftAnchor: profileImage.rightAnchor,paddingLeft: 8)
        
        addSubview(postImageView)
        postImageView.anchor(top:profileImage.bottomAnchor,left:leftAnchor,right: rightAnchor,paddingTop: 8)
        postImageView.heightAnchor.constraint(equalTo: widthAnchor,multiplier: 1).isActive = true
        
        configureActionButtons()
        
        addSubview(likesLabel)
        likesLabel.anchor(top:likeButton.bottomAnchor,left: leftAnchor,paddingTop: -4,paddingLeft: 10)
        
        addSubview(captionLabel)
        captionLabel.anchor(top:likesLabel.bottomAnchor,left: leftAnchor,paddingTop: 8,paddingLeft: 10)
        
        
        addSubview(postTimeLabel)
        postTimeLabel.anchor(top:captionLabel.bottomAnchor,left: leftAnchor,paddingTop: 8,paddingLeft: 10)
    }
    
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
    
    func configureActionButtons(){
        let stackView = UIStackView(arrangedSubviews: [likeButton,commentButton,shareButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        addSubview(stackView)
        stackView.anchor(top:postImageView.bottomAnchor,width: 120,height: 50)
    }
}
