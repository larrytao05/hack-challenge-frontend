//
//  HomeVC.swift
//  CUFound
//
//  Created by Katherine Huang on 11/29/23.
//

import UIKit

protocol UpdateTextDelegate: AnyObject{
    func updateText(newTextitemName: String, newTextlocationName: String, newTextlocationDescription: String)
    
}

class HomepageViewController: UIViewController, UpdateTextDelegate {
    func updateText(newTextitemName: String, newTextlocationName: String, newTextlocationDescription: String) {
    }
    
    // MARK: - Properties (view)
    
    private var postCollectionView: UICollectionView!
    private var filterCollectionView: UICollectionView!
    let titleLabel = UILabel()
    let logoImageView = UIImageView()
    let createPostButton = UIButton()
    let searchBar = UISearchBar()
    let searchController = UISearchController()
   
    // MARK: - Properties (data)
    
    private var allPosts: [Post] = Post.dummydata
    private var posts: [Post] = Post.dummydata
    private var texts = ["All", "North", "Central", "West"]
    private var selected = "All"
   
    
    // MARK: -viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.a4.white
        setupLogo()
        setupSearchBar()
        setupViewControl()
        setupFilterCollectionView()
        setupPostCollectionView()
        setupCreatePostButton()
        fetchAllPosts()
        
        
        //search bar
           // let imageView = UIImageView(image: UIImage(named: "logo")!)
         //   imageView.contentMode = .scaleAspectFit

          //  let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 107, height: 30))
         //    imageView.frame       = titleView.bounds
          //  titleView.addSubview(imageView)

         //   self.navigationItem.titleView = titleView

           
            
    }
    // MARK: - Networking
    @objc func fetchAllPosts() {
        NetworkManager.shared.fetchAllPosts { posts in
            self.allPosts = posts
        }
    }
    
    
    // MARK: - Set Up Views
    
    func setupLogo() {
        logoImageView.image = UIImage(named: "logo")
        
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 94),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -324.97),
            logoImageView.heightAnchor.constraint(equalToConstant: 32),
            //logoImageView.widthAnchor.constraint(equalToConstant: 96)
        ])
    }
    func setupSearchBar() {
        view.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.delegate = self
     
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 134),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        
        ])
    }
    
    func setupViewControl() {
        titleLabel.text = "CUFound"
        titleLabel.font =  UIFont.systemFont(ofSize: 36, weight: .bold)
        titleLabel.textColor = UIColor.black
        
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            titleLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 8)
        ])
    }
    
    

    func setupFilterCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 12
        layout.minimumLineSpacing = 12
        
        filterCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        filterCollectionView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: FilterCollectionViewCell.reuse)
        filterCollectionView.delegate = self
        filterCollectionView.dataSource = self
        filterCollectionView.translatesAutoresizingMaskIntoConstraints = false
        filterCollectionView.showsHorizontalScrollIndicator = false
        
        view.addSubview(filterCollectionView)
        NSLayoutConstraint.activate([
            filterCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 210),
            filterCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            filterCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            filterCollectionView.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        filterCollectionView.contentInset = UIEdgeInsets(top: 0, left: 32, bottom: 0, right: 32)
        
    }
    func setupPostCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 21
        
        postCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        postCollectionView.alwaysBounceVertical = true
        postCollectionView.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: PostCollectionViewCell.reuse)
        postCollectionView.delegate = self
        postCollectionView.dataSource = self
        postCollectionView.backgroundColor = UIColor.a4.white
        postCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(postCollectionView)
        
        NSLayoutConstraint.activate([
            postCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 261),
            postCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 29),
            postCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            postCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -29)
        ])
    }
    func setupCreatePostButton(){
            view.addSubview(createPostButton)
            createPostButton.translatesAutoresizingMaskIntoConstraints = false
            createPostButton.setTitle("+", for: .normal)
            createPostButton.setTitleColor(UIColor.a4.blue, for: .normal)
            createPostButton.backgroundColor = UIColor.a4.grayish
            createPostButton.layer.cornerRadius = 16
            createPostButton.addTarget(self, action: #selector(createPostButtonTapped), for: .touchUpInside)
            NSLayoutConstraint.activate([
                createPostButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 94),
                createPostButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 290),
                createPostButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                createPostButton.heightAnchor.constraint(equalToConstant: 32),
                //createPostButton.widthAnchor.constraint(equalToConstant: 386)
            ])
            
        }
        ///
        @objc func createPostButtonTapped() {
            let createPostVC = CreatePostVC()
            navigationController?.pushViewController(createPostVC, animated: true)
           
        }
    
    
}
// MARK: - UICollectionViewDelegate

extension HomepageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == postCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.reuse, for: indexPath) as? PostCollectionViewCell else { return UICollectionViewCell() }
            let post = posts[indexPath.row]
            cell.configure(post: post)
            return cell
        } else {
            guard let cell = filterCollectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.reuse, for: indexPath) as? FilterCollectionViewCell else { return UICollectionViewCell() }
            let text = texts[indexPath.row]
            cell.configure(text: text, selectedfilter: selected)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == postCollectionView {
            return posts.count
        }
        else {
            return texts.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == postCollectionView {
            return CGSize(width: collectionView.frame.width, height: 147)
        } else {
            return CGSize(width: 116, height: 32)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == filterCollectionView {
            selected = texts[indexPath.row]
            filterCollectionView.reloadData()
            
            if selected == "All" {
                posts = allPosts
            } else {
                posts = allPosts.filter { post in
                    post.locationName.contains(selected)
                }
            }
            postCollectionView.reloadData()
        } else {
            let post = posts[indexPath.row]
            let detailVC = DetailedVC(post: post)
            navigationController?.pushViewController(detailVC, animated: true)
        }
        
    }
}

extension HomepageViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //call network function here (give text string (searchText), backend gives list of posts that corresopond)
        //refresh data source
        //postCollectionView.reloadData()
    }
}
