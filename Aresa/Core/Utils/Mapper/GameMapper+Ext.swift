//
//  GameMapper+Ext.swift
//  Aresa
//
//  Created by aamaulana10 on 31/03/21.
//

import Foundation
import RealmSwift

extension GameMapper {
  
  static func mapGenreResponsetoGenreEntity(
    input genre: [GenreModel]) -> List<GenreEntity> {
    
    let genreEntityList = List<GenreEntity>()
    genre.forEach { result in
      let newGenre =  GenreEntity()
      newGenre.gamesCount = result.gamesCount ?? 0
      newGenre.id = result.id ?? 0
      newGenre.imageBackground = result.imageBackground ?? "Unknown"
      newGenre.name = result.name ?? "Unknown"
      newGenre.slug = result.slug ?? "Unknown"
      genreEntityList.append(newGenre)
    }
    
    return genreEntityList
        
  }
  
  static func mapPlatformsResponsetoPlatformsEntity(
    input platform: [PlatformModel]) -> List<PlatformEntity> {
    
    let list = List<PlatformEntity>()
    
    platform.forEach { result in
      
      let newPlatform =  PlatformEntity()
      newPlatform.gamesCount = result.gamesCount ?? 0
      newPlatform.id = result.id ?? 0
      newPlatform.imageBackground = result.imageBackground ?? "Unknown"
      newPlatform.name = result.name ?? "Unknown"
      newPlatform.slug = result.slug ?? "Unknown"
      newPlatform.image = result.image ?? "Unknown"
      
      list.append(newPlatform)
      
    }
    
    return list
    
  }
  
  static func mapRatingsResponsetoRatingEntity(
    input rating: [RatingsModel]) -> List<RatingsEntity> {
    
    let list = List<RatingsEntity>()
    
    rating.forEach { result in
      
      let newRating =  RatingsEntity()
      newRating.count = result.count ?? 0
      newRating.id = result.id ?? 0
      newRating.percent = result.percent ?? 0.0
      newRating.title = result.title ?? "Unknown"
      
      list.append(newRating)
    }
    
    return list
  }
  
  static func mapSScreenshotsResponsetoSScreenshotsEntity(
    input shortScreenshoot: [ShortScreenshotModel]) -> List<ShortScreenshotEntity> {
    
    let list = List<ShortScreenshotEntity>()
    
    shortScreenshoot.forEach { result in
      
      let newShortScreenshoot =  ShortScreenshotEntity()
      newShortScreenshoot.image = result.image ?? "Unknown"
      newShortScreenshoot.id = result.id ?? 0
      
      list.append(newShortScreenshoot)
    }
    
    return list
  }
  
  static func mapStoreResponsetoStoreEntity(
    input store: [StoreModel]) -> List<StoreEntity> {
    
    let list = List<StoreEntity>()
    
    store.forEach { result in
      
      let newStore =  StoreEntity()
      newStore.domain = result.domain ?? "Unknown"
      newStore.id = result.id ?? 0
      newStore.gamesCount = result.gamesCount ?? 0
      newStore.imageBackground = result.imageBackground ?? "Unknown"
      newStore.name = result.name ?? "Unknown"
      newStore.slug = result.slug ?? "Unknown"
      
      list.append(newStore)
    }
    
    return list
  }
  
}

extension GameMapper {
  
  static func mapGenreEntitiesToGenreDomain(
    input genre: List<GenreEntity>) -> [GenreModel] {
    
    var genreModel = [GenreModel]()
    
    genre.forEach { result in
      
      let newGenre = GenreModel(
        gamesCount: result.gamesCount,
        id: result.id,
        imageBackground: result.imageBackground,
        name: result.name,
        slug: result.slug
      )
      
      genreModel.append(newGenre)
    }
    
    return genreModel
    
  }
  
  static func mapPlatformEntitiesToPlatformDomain(
    input platform: List<PlatformEntity>) -> [PlatformModel] {
    
    var platformModel = [PlatformModel]()
    
    platform.forEach { result in
      
      let newPlatform = PlatformModel(
        gamesCount: result.gamesCount,
        id: result.id,
        image: result.image,
        imageBackground: result.imageBackground,
        name: result.name,
        slug: result.slug
      )
      
      platformModel.append(newPlatform)
    }
    
    return platformModel
    
  }
  
  static func mapRatingsEntitiesToRatingsDomain(
    input ratings: List<RatingsEntity>) -> [RatingsModel] {
    
    var ratingsModel = [RatingsModel]()
    
    ratings.forEach { result in
      
      let newRatings = RatingsModel(
        count: result.count,
        id: result.id,
        percent: result.percent,
        title: result.title
      )
      
      ratingsModel.append(newRatings)
    }
    
    return ratingsModel
    
  }
  
  static func mapSSEntitiesToSSDomain(
    input ss: List<ShortScreenshotEntity>) -> [ShortScreenshotModel] {
    
    var ssModel = [ShortScreenshotModel]()
    
    ss.forEach { result in
      
      let newScreenshoot = ShortScreenshotModel(
        id: result.id,
        image: result.image
      )
      
      ssModel.append(newScreenshoot)
    }
    
    return ssModel
    
  }
  
  static func mapStoreEntitiesToStoreDomain(
    input store: List<StoreEntity>) -> [StoreModel] {
    
    var storeModel = [StoreModel]()
    
    store.forEach { result in
      
      let newStore = StoreModel(
        domain: result.domain,
        gamesCount: result.gamesCount,
        id: result.id,
        imageBackground: result.imageBackground,
        name: result.name,
        slug: result.slug
      )
      
      storeModel.append(newStore)
    }
    
    return storeModel
    
  }
}
