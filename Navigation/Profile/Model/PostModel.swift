//
//  Post.swift
//  Navigation
//
//  Created by Venediktova Kate on 22.05.2022.
//

import Foundation

struct Post {
  
  var author: String // nickname
  var description: String?  // text
  var image: String // pic from assets
  var likes: Int
  var views: Int
 
    static func makePost() -> [Post] {
        var model = [Post]()
        
        model.append(Post(author: "VOGUE", description: "The best photos from British Vogue. \nBy: Steven Meisel", image: "vogue", likes: 27890, views: 135982))
        model.append(Post(author: "Elite Netflix", description: "The fifth season released on 8 April 2022", image: "elite", likes: 2349, views: 28461))
        model.append(Post(author: "Live Well Bake Often", description: "This is my favorite recipe for homemade carrot cake!  This cake is so easy to make, perfectly moist, and topped with an easy homemade cream cheese frosting.", image: "carrotCake", likes: 456, views: 867))
        model.append(Post(author: "Venediktova Kate", description: "Saint-Petersburg, 'Foggy morning'", image: "city", likes: 134, views: 298))
        model.append(Post(author: "Venediktova Kate", description: "Street Fashion 2019", image: "streetFashion", likes: 129, views: 278))

        return model
    }
}
