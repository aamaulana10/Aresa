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
}

struct GameClipResponse: Codable {
  
  let full : String
  
}

struct GenreResponse: Codable {
  
  let gamesCount : Int?
  let id : Int?
  let imageBackground : String?
  let name : String?
  let slug : String?
  
}

struct PlatformResponse: Codable {
  
  let gamesCount : Int?
  let id : Int?
  let image : String?
  let imageBackground : String?
  let name : String?
  let slug : String?
  let yearEnd : String?
  let yearStart : String?
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
  
  let domain : String?
  let gamesCount : Int?
  let id : Int?
  let imageBackground : String?
  let name : String?
  let slug : String?
}
