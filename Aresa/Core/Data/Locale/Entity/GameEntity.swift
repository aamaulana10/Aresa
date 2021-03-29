//
//  GameEntity.swift
//  Aresa
//
//  Created by aamaulana10 on 26/03/21.
//

import Foundation
import RealmSwift

class GameEntity: Object, Identifiable {
    
  @objc dynamic var backgroundImage : String = ""
  @objc dynamic var clip : String = ""
  @objc dynamic var dominantColor : String = ""
  @objc dynamic var id : Int = 0
  @objc dynamic var metacritic : Int = 0
  @objc dynamic var name : String = ""
  @objc dynamic var playtime : Int = 0
  @objc dynamic var rating : Float = 0.0
  @objc dynamic var ratingTop : Int = 0
  @objc dynamic var ratingsCount : Int = 0
  @objc dynamic var released : String = ""
  @objc dynamic var reviewsCount : Int = 0
  @objc dynamic var reviewsTextCount : Int = 0
  @objc dynamic var saturatedColor : String = ""
  @objc dynamic var slug : String = ""
  @objc dynamic var updated : String = ""
  var stores = List<StoreEntity>()
  var ratings = List<RatingsEntity>()
  var shortScreenshots = List<ShortScreenshotEntity>()
  var genres       =  List<GenreEntity>()
  var platforms = List<PlatformEntity>()
    
    override static func primaryKey() -> String? {
      
        return "id"
    }
    
}

class GenreEntity: Object {
  
  @objc dynamic var gamesCount : Int = 0
  @objc dynamic var id : Int = 0
  @objc dynamic var imageBackground : String = ""
  @objc dynamic var name : String = ""
  @objc dynamic var slug : String = ""
  
}

class PlatformEntity: Object {
  
  @objc dynamic var gamesCount : Int = 0
  @objc dynamic var id : Int = 0
  @objc dynamic var image : String = ""
  @objc dynamic var imageBackground : String = ""
  @objc dynamic var name : String = ""
  @objc dynamic var slug : String = ""
}

class RatingsEntity: Object {
  
  @objc dynamic var count : Int = 0
  @objc dynamic var id : Int = 0
  @objc dynamic var percent : Float = 0.0
  @objc dynamic var title : String = ""
}

class ShortScreenshotEntity: Object {
  
  @objc dynamic var id : Int = 0
  @objc dynamic var image : String = ""
}

class StoreEntity: Object {
  
  @objc dynamic var domain : String = ""
  @objc dynamic var gamesCount : Int = 0
  @objc dynamic var id : Int = 0
  @objc dynamic var imageBackground : String = ""
  @objc dynamic var name : String = ""
  @objc dynamic var slug : String = ""
}
