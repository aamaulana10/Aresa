//
//  GameModel.swift
//  Aresa
//
//  Created by aamaulana10 on 26/03/21.
//

import Foundation

struct GameModel: Codable, Identifiable {
    
  let backgroundImage : String?
  let clip : String?
  let dominantColor : String?
  var genres : [GenreModel] = []
  let id : Int?
  let metacritic : Int?
  let name : String?
  let platforms : [PlatformModel]
  let playtime : Int?
  let rating : Float?
  let ratingTop : Int?
  let ratings : [RatingsModel]
  let ratingsCount : Int?
  let released : String?
  let reviewsCount : Int?
  let reviewsTextCount : Int?
  let saturatedColor : String?
  let shortScreenshots : [ShortScreenshotModel]
  let slug : String?
  let stores : [StoreModel]
  let updated : String?
}

struct GenreModel: Codable {
  
  let gamesCount : Int?
  let id : Int?
  let imageBackground : String?
  let name : String?
  let slug : String?
  
}

struct PlatformModel: Codable {
  
  let gamesCount : Int?
  let id : Int?
  let image : String?
  let imageBackground : String?
  let name : String?
  let slug : String?
  let yearEnd : String?
  let yearStart : String?
}

struct RatingsModel: Codable {
  
  let count : Int?
  let id : Int?
  let percent : Float?
  let title : String?
}

struct ShortScreenshotModel: Codable {
  
  let id : Int?
  let image : String?
}

struct StoreModel: Codable {
  
  let domain : String?
  let gamesCount : Int?
  let id : Int?
  let imageBackground : String?
  let name : String?
  let slug : String?
}