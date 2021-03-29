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
  var genres : [GenreModel] = []
  let id : Int?
  let metacritic : Int?
  let name : String?
  var platforms : [PlatformModel] = []
  let playtime : Int?
  let rating : Float?
  let ratingTop : Int?
  var ratings : [RatingsModel] = []
  let ratingsCount : Int?
  let released : String?
  let reviewsCount : Int?
  let reviewsTextCount : Int?
  let saturatedColor : String?
  var shortScreenshots : [ShortScreenshotModel] = []
  let slug : String?
  var stores : [StoreModel] = []
  let updated : String?
}
