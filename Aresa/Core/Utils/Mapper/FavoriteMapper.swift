//
//  FavoriteMapper.swift
//  Aresa
//
//  Created by aamaulana10 on 31/03/21.
//

import Foundation
import RealmSwift

final class FavoriteMapper {
  
  static func mapGameFavoriteEntitiesToFavoriteDomains(
    input GameFavoriteEntities: [GameFavoriteEntity]
  ) -> [GameFavoriteModel] {
    
    return GameFavoriteEntities.map { result in
      
      return GameFavoriteModel(
        backgroundImage: result.backgroundImage,
        clip: result.clip,
        dominantColor: result.dominantColor,
        genres: GameMapper.mapGenreEntitiesToGenreDomain(input: result.genres),
        id: result.id,
        added: result.added,
        name: result.name,
        platforms: GameMapper.mapPlatformEntitiesToPlatformDomain(input: result.platforms),
        playtime: result.playtime,
        rating: result.rating,
        ratingTop: result.ratingTop,
        ratings: GameMapper.mapRatingsEntitiesToRatingsDomain(input: result.ratings),
        ratingsCount: result.ratingsCount,
        released: result.released,
        reviewsCount: result.reviewsCount,
        reviewsTextCount: result.reviewsTextCount,
        saturatedColor: result.saturatedColor,
        shortScreenshots: GameMapper.mapSSEntitiesToSSDomain(input: result.shortScreenshots),
        slug: result.slug,
        stores: GameMapper.mapStoreEntitiesToStoreDomain(input: result.stores),
        updated: result.updated
      )
    }
  }
  
  static func mapFavouriteEntitiesToFavoritemodel(input game: GameFavoriteEntity) -> GameFavoriteModel {
    
    return GameFavoriteModel(
      backgroundImage: game.backgroundImage,
      clip: game.clip,
      dominantColor: game.dominantColor,
      genres: GameMapper.mapGenreEntitiesToGenreDomain(input: game.genres),
      id: game.id,
      added: game.added,
      name: game.name,
      platforms: GameMapper.mapPlatformEntitiesToPlatformDomain(input: game.platforms),
      playtime: game.playtime,
      rating: game.rating,
      ratingTop: game.ratingTop,
      ratings: GameMapper.mapRatingsEntitiesToRatingsDomain(input: game.ratings),
      ratingsCount: game.ratingsCount,
      released: game.released,
      reviewsCount: game.reviewsCount,
      reviewsTextCount: game.reviewsTextCount,
      saturatedColor: game.saturatedColor,
      shortScreenshots: GameMapper.mapSSEntitiesToSSDomain(input: game.shortScreenshots),
      slug: game.slug,
      stores: GameMapper.mapStoreEntitiesToStoreDomain(input: game.stores),
      updated: game.updated
    )
  }
  
  static func mapFavoriteDomainToFavouriteEntities(input game: GameFavoriteModel) -> GameFavoriteEntity {
    
    let newGame = GameFavoriteEntity()
    newGame.backgroundImage = game.backgroundImage ?? "Unknown"
    newGame.clip = game.clip  ?? "Unknown"
    newGame.dominantColor = game.dominantColor  ?? "Unknown"
    newGame.genres = GameMapper.mapGenreResponsetoGenreEntity(input: game.genres)
    newGame.id = game.id  ?? 0
    newGame.added = game.added  ?? 0
    newGame.name = game.name ?? "Unknown"
    newGame.platforms = GameMapper.mapPlatformsResponsetoPlatformsEntity(input: game.platforms)
    newGame.playtime = game.playtime ?? 0
    newGame.rating = game.rating ?? 0.0
    newGame.ratingTop = game.ratingTop ?? 0
    newGame.ratings = GameMapper.mapRatingsResponsetoRatingEntity(input: game.ratings)
    newGame.ratingsCount = game.ratingsCount ?? 0
    newGame.released = game.released  ?? "Unknown"
    newGame.reviewsCount = game.reviewsCount ?? 0
    newGame.reviewsTextCount = game.reviewsTextCount ?? 0
    newGame.saturatedColor = game.saturatedColor  ?? "Unknown"
    newGame.shortScreenshots = GameMapper.mapSScreenshotsResponsetoSScreenshotsEntity(input: game.shortScreenshots)
    newGame.slug = game.slug  ?? "Unknown"
    newGame.stores = GameMapper.mapStoreResponsetoStoreEntity(input: game.stores)
    newGame.updated = game.updated  ?? "Unknown"
    return newGame
  }
  
  static func mapGameDomainToFavoriteDomain(input game: GameModel) -> GameFavoriteModel {
    
    return GameFavoriteModel(
      backgroundImage: game.backgroundImage,
      clip: game.clip,
      dominantColor: game.dominantColor,
      genres: game.genres,
      id: game.id,
      added: game.added,
      name: game.name,
      platforms: game.platforms,
      playtime: game.playtime,
      rating: game.rating,
      ratingTop: game.ratingTop,
      ratings: game.ratings,
      ratingsCount: game.ratingsCount,
      released: game.released,
      reviewsCount: game.reviewsCount,
      reviewsTextCount: game.reviewsTextCount,
      saturatedColor: game.saturatedColor,
      shortScreenshots: game.shortScreenshots,
      slug: game.slug,
      stores: game.stores,
      updated: game.updated
    )
  }
  
  static func mapFavoriteDomainToGameDomain(input game: GameFavoriteModel) -> GameModel {
    
    return GameModel(
      backgroundImage: game.backgroundImage,
      clip: game.clip,
      dominantColor: game.dominantColor,
      genres: game.genres,
      id: game.id,
      added: game.added,
      name: game.name,
      platforms: game.platforms,
      playtime: game.playtime,
      rating: game.rating,
      ratingTop: game.ratingTop,
      ratings: game.ratings,
      ratingsCount: game.ratingsCount,
      released: game.released,
      reviewsCount: game.reviewsCount,
      reviewsTextCount: game.reviewsTextCount,
      saturatedColor: game.saturatedColor,
      shortScreenshots: game.shortScreenshots,
      slug: game.slug,
      stores: game.stores,
      updated: game.updated
    )
  }
}
