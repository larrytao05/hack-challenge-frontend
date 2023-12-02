//
//  NetworkManager.swift
//  CUFound
//
//  Created by Katherine Huang on 11/30/23.
//
import Alamofire
import Foundation

class NetworkManager {
    
    /// Shared singleton instance
    static let shared = NetworkManager()
    
    private init() {}
    
    /// Endpoint for dev server
    private let devEndpoint: String = "http://35.230.166.117"
    
    // MARK: - Requests
    func fetchAllPosts(completion: @escaping ([Post]) -> Void ) {
        let endpoint = "\(devEndpoint)/api/posts/"
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        AF.request(endpoint, method: .get)
            .validate()
            .responseDecodable(of: PostResponse.self, decoder: decoder) {response in
                switch  response.result {
                case .success(let posts):
                    print("Successfully fetched posts")
                    completion(posts.posts)
                case .failure(let error):
                    print("Error in NetworkManager.fetchAllPosts: \(error)")
                }
            }
    }
    
    func createPosts(item_name: String, item_desc: String, loc_name: String, loc_desc: String, post_type: String, image_url: String, netid: String, completion: @escaping (Post) -> Void ) {
        let endpoint = "\(devEndpoint)/api/posts/\(netid)/"
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let parameters: Parameters = [
            "item_name": item_name,
            "item_desc": item_desc,
            "loc_name": loc_name,
            "loc_desc": loc_desc,
            "post_type": post_type,
            "image_url": image_url
        
        ]
        
        AF.request(endpoint, method: .post, parameters: parameters)
            .validate()
            .responseDecodable(of: Post.self, decoder: decoder) {response in
                switch  response.result {
                case .success(let posts):
                    print("Successfully created posts")
                    completion(posts)
                case .failure(let error):
                    print("Error in NetworkManager.createPosts: \(error)")
                }
            }
    }
}
