//
//  GameMapper.swift
//  Aresa
//
//  Created by aamaulana10 on 26/03/21.
//

import Foundation
import RealmSwift

final class GameMapper {
  
  static func mapGameResponsesToDomains(
    input GameResponses: [GameModelResponse]
  ) -> [GameModel] {
    
    return GameResponses.map { result in
      
      return GameModel(
        backgroundImage: result.backgroundImage,
        clip: result.clip?.clip,
        dominantColor: result.dominantColor,
        genres: mapGenreResponsetoGenreDomain(input: result.genres ?? []),
        id: result.id,
        added: result.added,
        name: result.name,
        platforms: mapPlatformResponsetoPlatformDomain(input: result.platforms ?? []),
        playtime: result.playtime,
        rating: result.rating,
        ratingTop: result.ratingTop,
        ratings: mapRatingResponsetoRatingsDomain(input: result.ratings ?? []),
        ratingsCount: result.ratingsCount,
        released: result.released,
        reviewsCount: result.reviewsCount,
        reviewsTextCount: result.reviewsTextCount,
        saturatedColor: result.saturatedColor,
        shortScreenshots: mapShortScreenshotsResponsetoShortScreenshotsDomain(input: result.shortScreenshots ?? []),
        slug: result.slug,
        stores: mapStoreResponsetoStoreDomain(input: result.stores),
        updated: result.updated
      )
    }
  }
  
  static func mapGameResponsesToEntities(
    input GameResponses: [GameModel]
  ) -> [GameEntity] {
    
    return GameResponses.map { result in
      
      let newGame = GameEntity()
      newGame.backgroundImage = result.backgroundImage ?? "Unknown"
      newGame.clip = result.clip  ?? "Unknown"
      newGame.dominantColor = result.dominantColor  ?? "Unknown"
      newGame.genres = mapGenreResponsetoGenreEntity(input: result.genres)
      newGame.id = result.id  ?? 0
      newGame.added = result.added  ?? 0
      newGame.name = result.name ?? "Unknown"
      newGame.platforms = mapPlatformsResponsetoPlatformsEntity(input: result.platforms)
      newGame.playtime = result.playtime ?? 0
      newGame.rating = result.rating ?? 0.0
      newGame.ratingTop = result.ratingTop ?? 0
      newGame.ratings = mapRatingsResponsetoRatingEntity(input: result.ratings)
      newGame.ratingsCount = result.ratingsCount ?? 0
      newGame.released = result.released  ?? "Unknown"
      newGame.reviewsCount = result.reviewsCount ?? 0
      newGame.reviewsTextCount = result.reviewsTextCount ?? 0
      newGame.saturatedColor = result.saturatedColor  ?? "Unknown"
      newGame.shortScreenshots = mapSScreenshotsResponsetoSScreenshotsEntity(input: result.shortScreenshots)
      newGame.slug = result.slug  ?? "Unknown"
      newGame.stores = mapStoreResponsetoStoreEntity(input: result.stores)
      newGame.updated = result.updated  ?? "Unknown"
      return newGame
    }
  }
  
  static func mapGameResponsesToNewestEntities(
    input GameResponses: [GameModel]
  ) -> [GameNewestEntity] {
    
    return GameResponses.map { result in
      
      let newGame = GameNewestEntity()
      newGame.backgroundImage = result.backgroundImage ?? "Unknown"
      newGame.clip = result.clip  ?? "Unknown"
      newGame.dominantColor = result.dominantColor  ?? "Unknown"
      newGame.genres = mapGenreResponsetoGenreEntity(input: result.genres)
      newGame.id = result.id  ?? 0
      newGame.added = result.added  ?? 0
      newGame.name = result.name ?? "Unknown"
      newGame.platforms = mapPlatformsResponsetoPlatformsEntity(input: result.platforms)
      newGame.playtime = result.playtime ?? 0
      newGame.rating = result.rating ?? 0.0
      newGame.ratingTop = result.ratingTop ?? 0
      newGame.ratings = mapRatingsResponsetoRatingEntity(input: result.ratings)
      newGame.ratingsCount = result.ratingsCount ?? 0
      newGame.released = result.released  ?? "Unknown"
      newGame.reviewsCount = result.reviewsCount ?? 0
      newGame.reviewsTextCount = result.reviewsTextCount ?? 0
      newGame.saturatedColor = result.saturatedColor  ?? "Unknown"
      newGame.shortScreenshots = mapSScreenshotsResponsetoSScreenshotsEntity(input: result.shortScreenshots)
      newGame.slug = result.slug  ?? "Unknown"
      newGame.stores = mapStoreResponsetoStoreEntity(input: result.stores)
      newGame.updated = result.updated  ?? "Unknown"
      return newGame
    }
  }
  
  static func mapGameEntitiesToDomains(
    input gameEntities: [GameEntity]
  ) -> [GameModel] {
    
    return gameEntities.map { result in
      
      return GameModel(
        backgroundImage: result.backgroundImage,
        clip: result.clip,
        dominantColor: result.dominantColor,
        genres: mapGenreEntitiesToGenreDomain(input: result.genres),
        id: result.id,
        added: result.added,
        name: result.name,
        platforms: mapPlatformEntitiesToPlatformDomain(input: result.platforms),
        playtime: result.playtime,
        rating: result.rating,
        ratingTop: result.ratingTop,
        ratings: mapRatingsEntitiesToRatingsDomain(input: result.ratings),
        ratingsCount: result.ratingsCount,
        released: result.released,
        reviewsCount: result.reviewsCount,
        reviewsTextCount: result.reviewsTextCount,
        saturatedColor: result.saturatedColor,
        shortScreenshots: mapSSEntitiesToSSDomain(input: result.shortScreenshots),
        slug: result.slug,
        stores: mapStoreEntitiesToStoreDomain(input: result.stores),
        updated: result.updated
      )
    }
  }
  
  static func mapGameNewestEntitiesToDomains(
    input gameEntities: [GameNewestEntity]
  ) -> [GameModel] {
    
    return gameEntities.map { result in
      
      return GameModel(
        backgroundImage: result.backgroundImage,
        clip: result.clip,
        dominantColor: result.dominantColor,
        genres: mapGenreEntitiesToGenreDomain(input: result.genres),
        id: result.id,
        added: result.added,
        name: result.name,
        platforms: mapPlatformEntitiesToPlatformDomain(input: result.platforms),
        playtime: result.playtime,
        rating: result.rating,
        ratingTop: result.ratingTop,
        ratings: mapRatingsEntitiesToRatingsDomain(input: result.ratings),
        ratingsCount: result.ratingsCount,
        released: result.released,
        reviewsCount: result.reviewsCount,
        reviewsTextCount: result.reviewsTextCount,
        saturatedColor: result.saturatedColor,
        shortScreenshots: mapSSEntitiesToSSDomain(input: result.shortScreenshots),
        slug: result.slug,
        stores: mapStoreEntitiesToStoreDomain(input: result.stores),
        updated: result.updated
      )
    }
  }
  
  static func mapUserEntityToUserDomain(input user: UserEntity) -> UserModel {
    
    return UserModel(
      picture: user.picture,
      name: user.name,
      job: user.job,
      email: user.email,
      phone: user.phone
    )
  }
  
}
