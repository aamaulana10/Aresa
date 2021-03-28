//
//  GameFavoriteModel.swift
//  Aresa
//
//  Created by aamaulana10 on 26/03/21.
//

import Foundation

struct GameFavoriteModel: Codable, Identifiable {
    
  let backgroundImage : String?
  let clip : String?
  let dominantColor : String?
  let genres : [GenreModel]?
  let id : Int?
  let metacritic : Int?
  let name : String?
  let platforms : [PlatformModel]?
  let playtime : Int?
  let rating : Float?
  let ratingTop : Int?
  let ratings : [RatingsModel]?
  let ratingsCount : Int?
  let released : String?
  let reviewsCount : Int?
  let reviewsTextCount : Int?
  let saturatedColor : String?
  let shortScreenshots : [ShortScreenshotModel]?
  let slug : String?
  let stores : [StoreModel]?
  let updated : String?
}
