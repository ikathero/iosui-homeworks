//
//  PhotosModel.swift
//  Navigation
//
//  Created by Venediktova Kate on 22.05.2022.
//

import Foundation

struct Photos {
  
  let author: String
  let image: String
  //var likes: Int
  //var views: Int
 
    static func makeMockModel() -> [Photos] {
        var photo = [Photos]()
        photo.append(Photos(author: "Venediktova Kate", image: "1"))
        photo.append(Photos(author: "Venediktova Kate", image: "2"))
        photo.append(Photos(author: "Venediktova Kate", image: "3"))
        photo.append(Photos(author: "Venediktova Kate", image: "4"))
        photo.append(Photos(author: "Venediktova Kate", image: "5"))
        photo.append(Photos(author: "Venediktova Kate", image: "6"))
        photo.append(Photos(author: "Venediktova Kate", image: "7"))
        photo.append(Photos(author: "Venediktova Kate", image: "8"))
        photo.append(Photos(author: "Venediktova Kate", image: "9"))
        photo.append(Photos(author: "Venediktova Kate", image: "10"))
        photo.append(Photos(author: "Venediktova Kate", image: "12"))
        photo.append(Photos(author: "Venediktova Kate", image: "13"))
        photo.append(Photos(author: "Venediktova Kate", image: "14"))
        photo.append(Photos(author: "Venediktova Kate", image: "15"))
        photo.append(Photos(author: "Venediktova Kate", image: "16"))
        photo.append(Photos(author: "Venediktova Kate", image: "17"))
        photo.append(Photos(author: "Venediktova Kate", image: "18"))
        photo.append(Photos(author: "Venediktova Kate", image: "19"))
        photo.append(Photos(author: "Venediktova Kate", image: "20"))
        photo.append(Photos(author: "Venediktova Kate", image: "21"))
        return photo
    }
}
