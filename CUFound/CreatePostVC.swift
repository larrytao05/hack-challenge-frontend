//
//  CreatePostVC.swift
//  CUFound
//
//  Created by Katherine Huang on 11/30/23.
//

import Foundation
import UIKit

class CreatePostVC: UIViewController {
    // MARK: - Properties (view)
    private let titleLabel = UILabel()
    private let itemNameField = UITextField()
    private let itemDescriptionField = UITextField()
    private let locationNameField = UITextField()
    private let locationDescriptionField = UITextField()
    private let imageURLField = UITextField()
    private let netidField = UITextField()
    private let typeField = UITextField()
    private let postButton = UIButton()
    
    
    
    
    // MARK: - data
    private var itemNameText: String = ""
    private var locationNameText: String = ""
    private var locationDescriptionText: String = ""
    private weak var delegate: UpdateTextDelegate?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.a4.white
        
        setUpitemNameField()
        setupitemDescriptionField()
        setUplocationNameField()
        setUplocationDescriptionField()
        setupViewControl()
        setupimageURLField()
        setupnetIDField()
        setuptypeField()
        setUppostButton()
        
    }
    // MARK: - Set Up Views
    func setupViewControl() {
        titleLabel.text = "Create Post"
        titleLabel.font =  UIFont.systemFont(ofSize: 36, weight: .bold)
        titleLabel.textColor = UIColor.black
        
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 94),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 29)
        ])
    }
    private func setUpitemNameField(){
        view.addSubview(itemNameField)
        itemNameField.translatesAutoresizingMaskIntoConstraints = false
        itemNameField.layer.borderWidth = 1
        itemNameField.layer.borderColor = UIColor.a4.silver.cgColor
        itemNameField.layer.cornerRadius = 8
        
        switch itemNameField.text{
        case "":
            itemNameField.placeholder = "Item Name"
        default: itemNameField.textColor = UIColor.a4.black
        }
        
        NSLayoutConstraint.activate([
            itemNameField.heightAnchor.constraint(equalToConstant: 41),
            itemNameField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 69),
            itemNameField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 29),
            itemNameField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -29)
        ])}
    
    private func setupitemDescriptionField(){
        view.addSubview(itemDescriptionField)
        itemDescriptionField.translatesAutoresizingMaskIntoConstraints = false
        itemDescriptionField.layer.borderWidth = 1
        itemDescriptionField.layer.borderColor = UIColor.a4.silver.cgColor
        itemDescriptionField.layer.cornerRadius = 8
        
        switch itemDescriptionField.text{
        case "":
            itemDescriptionField.placeholder = "Item Description"
        default: itemDescriptionField.textColor = UIColor.a4.black
        }
        
        NSLayoutConstraint.activate([
            itemDescriptionField.heightAnchor.constraint(equalToConstant: 100),
            itemDescriptionField.topAnchor.constraint(equalTo: itemNameField.bottomAnchor, constant: 13),
            itemDescriptionField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 29),
            itemDescriptionField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -29)
        ])}
    
    private func setUplocationNameField(){
        view.addSubview(locationNameField)
        locationNameField.translatesAutoresizingMaskIntoConstraints = false
        locationNameField.layer.borderWidth = 1
        locationNameField.layer.borderColor = UIColor.a4.silver.cgColor
        locationNameField.layer.cornerRadius = 8
        
        switch locationNameField.text{
        case "":
            locationNameField.placeholder = "Location Area"
        default: locationNameField.textColor = UIColor.a4.black
        }
        
        NSLayoutConstraint.activate([
            locationNameField.heightAnchor.constraint(equalToConstant: 41),
            locationNameField.topAnchor.constraint(equalTo: itemDescriptionField.bottomAnchor, constant: 13),
            locationNameField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 29),
            locationNameField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -29)
        ])}
    
    private func setUplocationDescriptionField(){
        view.addSubview(locationDescriptionField)
        locationDescriptionField.translatesAutoresizingMaskIntoConstraints = false
        locationDescriptionField.layer.borderWidth = 1
        locationDescriptionField.layer.borderColor = UIColor.a4.silver.cgColor
        locationDescriptionField.layer.cornerRadius = 8
        
        switch locationDescriptionField.text{
        case "":
            locationDescriptionField.placeholder = "Location Description"
        default: locationDescriptionField.textColor = UIColor.a4.black
        }
        
        NSLayoutConstraint.activate([
            locationDescriptionField.heightAnchor.constraint(equalToConstant: 100),
            locationDescriptionField.topAnchor.constraint(equalTo: locationNameField.bottomAnchor, constant: 13),
            locationDescriptionField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 29),
            locationDescriptionField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -29)
        ])}
    
    
    private func setupimageURLField(){
        view.addSubview(imageURLField)
        imageURLField.translatesAutoresizingMaskIntoConstraints = false
        imageURLField.layer.borderWidth = 1
        imageURLField.layer.borderColor = UIColor.a4.silver.cgColor
        imageURLField.layer.cornerRadius = 8
        
        switch imageURLField.text{
        case "":
            imageURLField.placeholder = "URL Image"
        default: imageURLField.textColor = UIColor.a4.black
        }
        
        NSLayoutConstraint.activate([
            imageURLField.heightAnchor.constraint(equalToConstant: 41),
            imageURLField.topAnchor.constraint(equalTo: locationDescriptionField.bottomAnchor, constant: 13),
            imageURLField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 29),
            imageURLField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -29)
        ])
    }
    
    private func setupnetIDField(){
        view.addSubview(netidField)
        netidField.translatesAutoresizingMaskIntoConstraints = false
        netidField.layer.borderWidth = 1
        netidField.layer.borderColor = UIColor.a4.silver.cgColor
        netidField.layer.cornerRadius = 8
        
        switch netidField.text{
        case "":
            netidField.placeholder = "NETID"
        default: netidField.textColor = UIColor.a4.black
        }
        
        NSLayoutConstraint.activate([
            netidField.heightAnchor.constraint(equalToConstant: 41),
            netidField.topAnchor.constraint(equalTo: imageURLField.bottomAnchor, constant: 13),
            netidField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 29),
            netidField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -29)
        ])
    }
    
    private func setuptypeField(){
        view.addSubview(typeField)
        typeField.translatesAutoresizingMaskIntoConstraints = false
        typeField.layer.borderWidth = 1
        typeField.layer.borderColor = UIColor.a4.silver.cgColor
        typeField.layer.cornerRadius = 8
        
        switch typeField.text{
        case "":
            typeField.placeholder = "Type: Lost or Found"
        default: typeField.textColor = UIColor.a4.black
        }
        
        NSLayoutConstraint.activate([
            typeField.heightAnchor.constraint(equalToConstant: 41),
            typeField.topAnchor.constraint(equalTo: netidField.bottomAnchor, constant: 13),
            typeField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 29),
            typeField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -29)
        ])
    }
    
    private func setUppostButton(){
        view.addSubview(postButton)
        postButton.translatesAutoresizingMaskIntoConstraints = false
        postButton.setTitle("Post", for: .normal)
        postButton.backgroundColor = UIColor.a4.blue
        postButton.layer.cornerRadius = 16
        postButton.addTarget(self, action: #selector(createPost), for: .touchUpInside)
        NSLayoutConstraint.activate([
            postButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 159),
            postButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -159),
            postButton.topAnchor.constraint(equalTo: typeField.bottomAnchor, constant: 13),
            postButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
    }
    
    // MARK: - Button Helpers
    @objc private func createPost() {
        
        NetworkManager.shared.createPosts(item_name: itemNameField.text ?? "", item_desc: itemDescriptionField.text ?? "", loc_name: locationNameField.text ?? "", loc_desc: locationDescriptionField.text ?? "", post_type: typeField.text ?? "", image_url: imageURLField.text ?? "", netid: netidField.text ?? "") { [weak self] post in
            guard let self = self else { return }
            itemNameField.text = "";
            itemDescriptionField.text = "";
            locationNameField.text = "";
            locationDescriptionField.text = "";
            typeField.text = "";
            imageURLField.text = "";
            netidField.text = ""
            
        }
    }
}
