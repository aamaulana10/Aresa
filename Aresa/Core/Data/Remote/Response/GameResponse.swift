//
//  GameResponse.swift
//  Aresa
//
//  Created by aamaulana10 on 25/03/21.
//

import Foundation

struct GameResponse: Codable {
  
  let results : [GameModelResponse]
}

struct GameModelResponse: Codable {
  
  let backgroundImage : String?
  let clip : GameClipResponse
  let dominantColor : String?
  let genres : [GenreResponse]
  let id : Int?
  let metacritic : Int?
  let name : String?
  let platforms : [PlatformResponse]
  let playtime : Int?
  let rating : Float?
  let ratingTop : Int?
  let ratings : [RatingsResponse]
  let ratingsCount : Int?
  let released : String?
  let reviewsCount : Int?
  let reviewsTextCount : Int?
  let saturatedColor : String?
  let shortScreenshots : [ShortScreenshotResponse]
  let slug : String?
  let stores : [StoreResponse]
  let updated : String?
  
  
  enum CodingKeys: String, CodingKey {
    case backgroundImage = "background_image"
    case clip = "clip"
    case dominantColor = "dominant_color"
    case genres = "genres"
    case id = "id"
    case metacritic = "metacritic"
    case name = "name"
    case platforms = "platforms"
    case playtime = "playtime"
    case rating = "rating"
    case ratingTop = "rating_top"
    case ratings = "ratings"
    case ratingsCount = "ratings_count"
    case released = "released"
    case reviewsCount = "reviews_count"
    case reviewsTextCount = "reviews_text_count"
    case saturatedColor = "saturated_color"
    case shortScreenshots = "short_screenshots"
    case slug = "slug"
    case stores = "stores"
    case updated = "updated"
  }
  
}

struct GameClipResponse: Codable {
  
  let clip : String
  
}

struct GenreResponse: Codable {
  
  let gamesCount : Int?
  let id : Int?
  let imageBackground : String?
  let name : String?
  let slug : String?
  
  enum CodingKeys: String, CodingKey {
    case gamesCount = "games_count"
    case id = "id"
    case imageBackground = "image_background"
    case name = "name"
    case slug = "slug"
  }
  
}

struct PlatformResponse: Codable {
   
  let platform : PlatformModelResponse?
}

struct PlatformModelResponse: Codable {
  
  let gamesCount : Int?
  let id : Int?
  let image : String?
  let imageBackground : String?
  let name : String?
  let slug : String?
  
  
  enum CodingKeys: String, CodingKey {
    case gamesCount = "games_count"
    case id = "id"
    case image = "image"
    case imageBackground = "image_background"
    case name = "name"
    case slug = "slug"
  }
}

struct RatingsResponse: Codable {
  
  let count : Int?
  let id : Int?
  let percent : Float?
  let title : String?
}

struct ShortScreenshotResponse: Codable {
  
  let id : Int?
  let image : String?
  
}

struct StoreResponse: Codable {
  
  let id : Int?
  let store : StoreModelResponse?
}

struct StoreModelResponse: Codable {
  
  let domain : String?
  let gamesCount : Int?
  let id : Int?
  let imageBackground : String?
  let name : String?
  let slug : String?
  
  enum CodingKeys: String, CodingKey {
    case domain = "domain"
    case gamesCount = "games_count"
    case id = "id"
    case imageBackground = "image_background"
    case name = "name"
    case slug = "slug"
  }
}
