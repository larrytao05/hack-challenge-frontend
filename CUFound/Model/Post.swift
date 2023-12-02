//
//  Post.swift
//  CUFound
//
//  Created by Katherine Huang on 11/29/23.
//

import Foundation

struct Post: Codable {
    var itemName: String
    var itemDescription: String
    var date: Date
    var locationName: String
    var locationDescription: String
    var netid: String
    var postType: String
    var imageUrl: String
}

struct PostResponse: Codable {
    var posts: [Post]
}

    extension Post {
        
        static let dummydata = [
            Post(itemName: "Airpods", itemDescription: "Pink case", date: Date(), locationName: "North", locationDescription: "RPCC - Left on the tables inside Nasties", netid: "kh784", postType: "Found", imageUrl: "https://m.media-amazon.com/images/I/61SUj2aKoEL._AC_UF894,1000_QL80_.jpg"
                ),
            Post(itemName: "Umbrella", itemDescription: "pink", date:Date().addingTimeInterval(-7200), locationName: "North", locationDescription: "on bench", netid: "kh784", postType: "Lost", imageUrl: "https://as1.ftcdn.net/v2/jpg/01/07/38/54/1000_F_107385430_ZN6i3Zu033VckC6gbnwyIHdwBI77vXWL.jpg"
                ),
            Post(itemName: "ipad", itemDescription: "blbalbal", date: Date(), locationName: "Central", locationDescription: "Okenshields - on floor", netid: "kh784", postType: "Lost", imageUrl: "https://www.techrepublic.com/wp-content/uploads/2018/08/1-ipad.jpg"
                ),
            Post(itemName: "socks", itemDescription: "pink", date: Date(), locationName: "West", locationDescription: "Cook house on table", netid: "kh784", postType: "Found", imageUrl: "https://png.pngtree.com/png-clipart/20201218/ourmid/pngtree-red-yellow-white-striped-socks-clipart-png-image_2573545.jpg"
                ),
            Post(itemName: "Scarf", itemDescription: "brown and white plaid patterned", date: Date(), locationName: "Central", locationDescription: "Temple of Zeus", netid: "kh784", postType: "Found", imageUrl: "https://image.shutterstock.com/image-photo/red-green-warm-scarves-on-260nw-521347525.jpg"
                )
        ]
    }

