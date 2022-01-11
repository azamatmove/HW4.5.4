//
//  NewsletterModel.swift
//  HW4.5.4
//
//  Created by Azamat Sarinzhiev on 11/1/22.
//

import Foundation

class NewsletterModel: Codable{
    public var list: [Articles] = []
    
    enum CodingKeys: String, CodingKey{
        case list = "articles"
    }
    
}

class Articles: Codable{
    var title: String? = nil
    var description: String? = nil
    var urlToImage: String? = nil
    
    enum CodingKeys: String, CodingKey{
        case title = "title"
        case description = "description"
        case urlToImage = "urlToImage"
    }
}
