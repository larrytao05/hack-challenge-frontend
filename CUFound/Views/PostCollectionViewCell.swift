//
//  PostCollectionViewCell.swift
//  CUFound
//
//  Created by Katherine Huang on 11/29/23.
//

import Foundation

import UIKit

import SDWebImage

class PostCollectionViewCell: UICollectionViewCell {
    //MARK: -Properties (view)
    private let itemImageView = UIImageView()
    private let itemLabel = UILabel()
    private let locationLabel = UILabel()
    private let usernameLabel = UILabel()
    private let timePostedLabel = UILabel()
    // MARK: - Properties (data)
    
    static let reuse: String = "PostCollectionViewCellReuse"
    
    //MARK: - configure
    //for usernameLabel, get username and aModeldd it to string "posted by"
    func configure(post: Post) {
        itemImageView.sd_setImage(with: URL(string: post.imageUrl))
        itemLabel.text = post.itemName
        locationLabel.text = post.locationName
        usernameLabel.text = "posted by \(String(post.netid))"
        timePostedLabel.text = post.date.convertToAgo()
    }
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.a4.grayish
        layer.cornerRadius = 16
        
        setupItemImage()
        setupItemLabel()
        setupLocationLabel()
        setupUsernameLabel()
        setupTimePostedLabel()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Set Up Views:
    
    private func setupItemImage() {
        contentView.addSubview(itemImageView)
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        itemImageView.clipsToBounds = true
        NSLayoutConstraint.activate([
            itemImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18),
            itemImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            itemImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -241),
            itemImageView.heightAnchor.constraint(equalToConstant: 111)
        ])
    }
    
    private func setupItemLabel() {
        itemLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        itemLabel.textColor = UIColor.a4.black
        
        contentView.addSubview(itemLabel)
        itemLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            itemLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
            itemLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 142),
            itemLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -86),
            itemLabel.heightAnchor.constraint(equalToConstant: 29)
        ])
    }
    private func setupLocationLabel() {
        locationLabel.font = UIFont.systemFont(ofSize: 18, weight:.medium)
        locationLabel.textColor = UIColor.a4.black
        
        contentView.addSubview(locationLabel)
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 61),
            locationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 142),
            locationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -65),
            locationLabel.heightAnchor.constraint(equalToConstant: 21)
        ])
        
    }
    private func setupUsernameLabel() {
        usernameLabel.font = UIFont.systemFont(ofSize: 15, weight:.regular)
        usernameLabel.textColor = UIColor.a4.silver
        
        contentView.addSubview(usernameLabel)
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 98),
            usernameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 142),
            usernameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -31),
            locationLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    private func setupTimePostedLabel() {
        timePostedLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        timePostedLabel.textColor = UIColor.a4.silver
        
        contentView.addSubview(timePostedLabel)
        timePostedLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            timePostedLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            timePostedLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -14),
            timePostedLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -115),
            timePostedLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
}
