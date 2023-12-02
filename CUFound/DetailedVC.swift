//
//  DetailedVC.swift
//  CUFound
//
//  Created by Katherine Huang on 11/29/23.
//

import Foundation
import UIKit

class DetailedVC: UIViewController {
    
    private let itemImage = UIImageView()
    private let itemName = UILabel()
    private let locationName = UILabel()
    private let timePostedLabel = UILabel()
    private let itemDescriptionTitle = UILabel()
    private let itemDescriptionText = UILabel()
    private let locationDescriptionTitle = UILabel()
    private let locationDescriptionText = UILabel()
    private let postType = UILabel()
    private let usernameLabel = UILabel()
    
    
    private var post: Post
    
    init(post: Post) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CUFound"
        self.view.backgroundColor = UIColor.a4.white
        setupItemImage()
        setupitemName()
        setuplocationName()
        setupTimePostedLabel()
        setupItemDescriptionTitle()
        setupItemDescriptionText()
        setuplocationDescriptionTitle()
        setuplocationDescriptionText()
        setupPostType()
        setupUserNameLabel()
        
        
    }
    
    // MARK: - Set Up Views
    private func setupItemImage(){
        view.addSubview(itemImage)
        itemImage.translatesAutoresizingMaskIntoConstraints = false
        itemImage.sd_setImage(with: URL(string: post.imageUrl))
        itemImage.layer.cornerRadius = 12
        itemImage.contentMode = .scaleAspectFit
        itemImage.clipsToBounds = true
        NSLayoutConstraint.activate([
            itemImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 159),
            itemImage.heightAnchor.constraint(equalToConstant: 240),
            itemImage.widthAnchor.constraint(equalToConstant: 370),
            itemImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:29),
            itemImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -29),
            itemImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:-498)
        ])
    }
    
    private func setupitemName() {
        itemName.text = post.itemName
        itemName.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        itemName.textColor = UIColor.black
        
        view.addSubview(itemName)
        itemName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            itemName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 29),
            itemName.topAnchor.constraint(equalTo: view.topAnchor, constant: 380),
            itemName.heightAnchor.constraint(equalToConstant: 29)
        ])
    }
    private func setuplocationName(){
        locationName.text = post.locationName
        locationName.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        locationName.textColor = UIColor.black
        
        view.addSubview(locationName)
        locationName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            locationName.topAnchor.constraint(equalTo: view.topAnchor, constant: 380),
            locationName.heightAnchor.constraint(equalToConstant: 29)
            
        ])
        
    }
    private func setupTimePostedLabel() {
        timePostedLabel.text = post.date.convertToAgo()
        timePostedLabel.font = UIFont.systemFont(ofSize: 15, weight:.regular)
        timePostedLabel.textColor = UIColor.a4.silver
        
        view.addSubview(timePostedLabel)
        timePostedLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            timePostedLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 380),
            timePostedLabel.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: -72),
            timePostedLabel.heightAnchor.constraint(equalToConstant: 29)        ])
    }
    
    private func setupItemDescriptionTitle() {
        itemDescriptionTitle.text = "Item Description:"
        itemDescriptionTitle.font = UIFont.systemFont(ofSize: 15, weight:.medium)
        itemDescriptionTitle.textColor = UIColor.a4.black
        itemDescriptionTitle.numberOfLines = 0
        
        view.addSubview(itemDescriptionTitle)
        itemDescriptionTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            itemDescriptionTitle.topAnchor.constraint(equalTo: itemName.bottomAnchor, constant: 30),
            itemDescriptionTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 29),
            itemDescriptionTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:-29),
        ])
    }
    private func setupItemDescriptionText() {
        itemDescriptionText.text = post.itemDescription
        itemDescriptionText.font = UIFont.systemFont(ofSize: 15, weight:.regular)
        itemDescriptionText.textColor = UIColor.a4.silver
        itemDescriptionText.numberOfLines = 0
        
        view.addSubview(itemDescriptionText)
        itemDescriptionText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            itemDescriptionText.topAnchor.constraint(equalTo: itemDescriptionTitle.bottomAnchor, constant: 6),
            itemDescriptionText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 29),
            itemDescriptionText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -29)
        ])
        
    }
    
    private func setuplocationDescriptionTitle(){
        locationDescriptionTitle.text = "Location Description:"
        locationDescriptionTitle.font = UIFont.systemFont(ofSize: 15, weight:.medium)
        locationDescriptionTitle.textColor = UIColor.a4.black
        locationDescriptionTitle.numberOfLines = 0
        
        view.addSubview(locationDescriptionTitle)
        locationDescriptionTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationDescriptionTitle.topAnchor.constraint(equalTo: itemDescriptionText.bottomAnchor, constant: 20),
            locationDescriptionTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 29),
            locationDescriptionTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:-29),
        ])
    }
    
    
    private func setuplocationDescriptionText() {
        locationDescriptionText.text = post.locationDescription
        locationDescriptionText.font = UIFont.systemFont(ofSize: 15, weight:.regular)
        locationDescriptionText.textColor = UIColor.a4.silver
        locationDescriptionText.numberOfLines = 0
        
        view.addSubview(locationDescriptionText)
        locationDescriptionText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationDescriptionText.topAnchor.constraint(equalTo: locationDescriptionTitle.bottomAnchor, constant: 6),
            locationDescriptionText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 29),
            locationDescriptionText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -29)

        ])
        
    }
    
    private func setupPostType() {
        postType.text = "Post Type: \(post.postType)"
        postType.font = UIFont.systemFont(ofSize: 15, weight:.medium)
        postType.textColor = UIColor.a4.black
        postType.numberOfLines = 0
        
        view.addSubview(postType)
        postType.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postType.topAnchor.constraint(equalTo: locationDescriptionText.bottomAnchor, constant: 20),
            postType.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 29),
            postType.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -29)
        ])
        
    }
    
    private func setupUserNameLabel() {
        usernameLabel.text = "posted by \(post.netid)"
        usernameLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        usernameLabel.textColor = UIColor.a4.silver
        
        view.addSubview(usernameLabel)
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 617),
            usernameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -29),
            usernameLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -356),
            usernameLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
}
