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
        clip: result.clip.full,
        dominantColor: result.dominantColor,
        genres: mapGenreResponsetoGenreDomain(input: result.genres),
        id: result.id,
        metacritic: result.metacritic,
        name: result.name,
        platforms: mapPlatformResponsetoPlatformDomain(input: result.platforms),
        playtime: result.playtime,
        rating: result.rating,
        ratingTop: result.ratingTop,
        ratings: mapRatingResponsetoRatingsDomain(input: result.ratings),
        ratingsCount: result.ratingsCount,
        released: result.released,
        reviewsCount: result.reviewsCount,
        reviewsTextCount: result.reviewsTextCount,
        saturatedColor: result.saturatedColor,
        shortScreenshots: mapShortScreenshotsResponsetoShortScreenshotsDomain(input: result.shortScreenshots),
        slug: result.slug,
        stores: mapStoreResponsetoStoreDomain(input: result.stores),
        updated: result.updated
      )
    }
  }
  
//  static func mapGameResponsesToEntities(
//    input GameResponses: [GameModel]
//  ) -> [GameEntity] {
//
//    return GameResponses.map { result in
//
//      let newGame = GameEntity()
//      newGame.backgroundImage = result.backgroundImage ?? "Unknown"
//      newGame.clip = result.clip  ?? "Unknown"
//      newGame.dominantColor = result.dominantColor  ?? "Unknown"
//      newGame.genres = mapGenreResponsetoGenreEntity(input: result.genres)
//      newGame.id = result.id  ?? 0
//      newGame.metacritic = result.metacritic  ?? 0
//      newGame.name = result.name ?? "Unknown"
//      newGame.platforms = mapPlatformsResponsetoPlatformsEntity(input: result.platforms)
//      newGame.playtime = result.playtime ?? 0
//      newGame.rating = result.rating ?? 0.0
//      newGame.ratingTop = result.ratingTop ?? 0
//      newGame.ratings = mapRatingsResponsetoRatingEntity(input: result.ratings)
//      newGame.ratingsCount = result.ratingsCount ?? 0
//      newGame.released = result.released  ?? "Unknown"
//      newGame.reviewsCount = result.reviewsCount ?? 0
//      newGame.reviewsTextCount = result.reviewsTextCount ?? 0
//      newGame.saturatedColor = result.saturatedColor  ?? "Unknown"
//      newGame.shortScreenshots = mapSScreenshotsResponsetoSScreenshotsEntity(input: result.shortScreenshots)
//      newGame.slug = result.slug  ?? "Unknown"
//      newGame.stores = mapStoreResponsetoStoreEntity(input: result.stores)
//      newGame.updated = result.updated  ?? "Unknown"
//      return newGame
//    }
//  }
//
//      static func mapGameEntitiesToDomains(
//          input gameEntities: [GameEntity]
//      ) -> [GameModel] {
//
//          return gameEntities.map { result in
//
//            return GameModel(
//              backgroundImage: result.backgroundImage,
//              clip: result.clip,
//              dominantColor: result.dominantColor,
//              genres: result.genres,
//              id: result.id,
//              metacritic: result.metacritic,
//              name: result.name,
//              platforms: result.platforms,
//              playtime: result.playtime,
//              rating: result.ratings,
//              ratingTop: result.ratingTop,
//              ratings: result.ratings,
//              ratingsCount: result.ratingsCount,
//              released: result.released,
//              reviewsCount: result.reviewsCount,
//              reviewsTextCount: result.reviewsCount,
//              saturatedColor: result.saturatedColor,
//              shortScreenshots: result.shortScreenshots,
//              slug: result.slug,
//              stores: result.stores,
//              updated: result.updated
//            )
//          }
//      }
  //
  //    static func mapGameFavoriteEntitiesToFavoriteDomains(
  //        input GameFavoriteEntities: [GameFavoriteEntity]
  //    ) -> [GameFavoriteModel] {
  //
  //        return GameFavoriteEntities.map { result in
  //
  //            return GameFavoriteModel(
  //                address: result.address,
  //                description: result.descriptionField,
  //                id: result.id,
  //                image: result.image,
  //                latitude: result.latitude,
  //                like: result.like,
  //                longitude: result.longitude,
  //                name: result.name
  //            )
  //        }
  //    }
  //
  //    static func mapFavouriteEntitiesToFavoritemodel(input Game: GameFavoriteEntity) -> GameFavoriteModel {
  //
  //        return GameFavoriteModel(
  //            address: Game.address,
  //            description: Game.descriptionField,
  //            id: Game.id,
  //            image: Game.image,
  //            latitude: Game.latitude,
  //            like: Game.like,
  //            longitude: Game.longitude,
  //            name: Game.name
  //        )
  //    }
  //
  //    static func mapFavoriteDomainToFavouriteEntities(input Game: GameFavoriteModel) -> GameFavoriteEntity {
  //
  //         newFavorit = GameFavoritEntity()
  //        newFavorit.id = Game.id ?? 0
  //        newFavorit.name = Game.name ?? "Unkown"
  //        newFavorit.descriptionField = Game.description ?? "Unkown"
  //        newFavorit.address     = Game.address ?? "Unkown"
  //        newFavorit.image       = Game.image ?? "Unkown"
  //        newFavorit.like        = Game.like ?? 0
  //        newFavorit.latitude    = Game.latitude ?? 0.0
  //        newFavorit.longitude   = Game.longitude ?? 0.0
  //
  //        return newFavorit
  //    }
  //
  //    static func mapGameDomainToFavoriteDomain(input Game: GameModel) -> GameFavoriteModel {
  //
  //        return GameFavoriteModel(
  //            address: Game.address,
  //            description: Game.description,
  //            id: Game.id,
  //            image: Game.image,
  //            latitude: Game.latitude,
  //            like: Game.like,
  //            longitude: Game.longitude,
  //            name: Game.name
  //        )
  //    }
  //
  //    static func mapFavoriteDomainToGameDomain(input Game: GameFavoriteModel) -> GameModel {
  //
  //        return GameModel(
  //            address: Game.address,
  //            description: Game.description,
  //            id: Game.id,
  //            image: Game.image,
  //            latitude: Game.latitude,
  //            like: Game.like,
  //            longitude: Game.longitude,
  //            name: Game.name)
  //    }
  
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

extension GameMapper {
  
  static func mapGenreResponsetoGenreDomain(
    input genre: [GenreResponse]) -> [GenreModel] {
    
    return genre.map { result in
      
      return GenreModel(
        gamesCount: result.gamesCount,
        id: result.id,
        imageBackground: result.imageBackground,
        name: result.name,
        slug: result.slug
      )
    }
  }
  
  static func mapPlatformResponsetoPlatformDomain(
    input platform: [PlatformResponse]) -> [PlatformModel] {
    
    return platform.map { result in
      
      return PlatformModel(
        gamesCount: result.gamesCount,
        id: result.id,
        image: result.image,
        imageBackground: result.imageBackground,
        name: result.name,
        slug: result.slug,
        yearEnd: result.yearEnd,
        yearStart: result.yearStart
      )
    }
  }
  
  static func mapRatingResponsetoRatingsDomain(
    input rating: [RatingsResponse]) -> [RatingsModel] {
    
    return rating.map { result in
      
      return RatingsModel(
        count: result.count,
        id: result.id,
        percent: result.percent,
        title: result.title
      )
    }
  }
  
  static func mapShortScreenshotsResponsetoShortScreenshotsDomain(
    input shortScreenshoot: [ShortScreenshotResponse]) -> [ShortScreenshotModel] {
    
    return shortScreenshoot.map { result in
      
      return ShortScreenshotModel(
        id: result.id,
        image: result.image
      )
    }
  }
  
  static func mapStoreResponsetoStoreDomain(
    input store: [StoreResponse]) -> [StoreModel] {
    
    return store.map { result in
      
      return StoreModel(
        domain: result.domain,
        gamesCount: result.gamesCount,
        id: result.id,
        imageBackground: result.imageBackground,
        name: result.name,
        slug: result.slug
      )
    }
  }
}

extension GameMapper {
  
  static func mapGenreResponsetoGenreEntity(
    input genre: [GenreModel]) -> List<GenreEntity> {
    
    let list = List<GenreEntity>()
    
    for result in genre {
      
      let newGenre =  GenreEntity()
      newGenre.gamesCount = result.gamesCount ?? 0
      newGenre.id = result.id ?? 0
      newGenre.imageBackground = result.imageBackground ?? "Unknown"
      newGenre.name = result.name ?? "Unknown"
      newGenre.slug = result.slug ?? "Unknown"
      
      list.append(newGenre)
      
      return list
    }
    
    return list.isEmpty ? list : list
    
  }
  
//  static func mapPlatformsResponsetoPlatformsEntity(
//    input platform: [PlatformModel]) -> List<PlatformEntity> {
//
//    let list = List<PlatformEntity>()
//
//    for result in platform {
//
//      let newPlatform =  PlatformEntity()
//      newPlatform.gamesCount = result.gamesCount ?? 0
//      newPlatform.id = result.id ?? 0
//      newPlatform.imageBackground = result.imageBackground ?? "Unknown"
//      newPlatform.name = result.name ?? "Unknown"
//      newPlatform.slug = result.slug ?? "Unknown"
//      newPlatform.image = result.image ?? "Unknown"
//      newPlatform.yearEnd = result.yearEnd ?? "Unknown"
//      newPlatform.yearStart = result.yearStart ?? "Unknown"
//
//      list.append(newPlatform)
//
//      return list
//    }
//  }
//
//  static func mapRatingsResponsetoRatingEntity(
//    input rating: [RatingsModel]) -> List<RatingsEntity> {
//
//    let list = List<RatingsEntity>()
//
//    for result in rating {
//
//      let newRating =  RatingsEntity()
//      newRating.count = result.count ?? 0
//      newRating.id = result.id ?? 0
//      newRating.percent = result.percent ?? 0.0
//      newRating.title = result.title ?? "Unknown"
//
//      list.append(newRating)
//
//      return list
//    }
//  }
//
//  static func mapSScreenshotsResponsetoSScreenshotsEntity(
//    input shortScreenshoot: [ShortScreenshotModel]) -> List<ShortScreenshotEntity> {
//
//    let list = List<ShortScreenshotEntity>()
//
//    for result in shortScreenshoot {
//
//      let newShortScreenshoot =  ShortScreenshotEntity()
//      newShortScreenshoot.image = result.image ?? "Unknown"
//      newShortScreenshoot.id = result.id ?? 0
//
//      list.append(newShortScreenshoot)
//
//      return list
//    }
//  }
//
//  static func mapStoreResponsetoStoreEntity(
//    input store: [StoreModel]) -> List<StoreEntity> {
//
//    let list = List<StoreEntity>()
//
//    for result in store {
//
//      let newStore =  StoreEntity()
//      newStore.domain = result.domain ?? "Unknown"
//      newStore.id = result.id ?? 0
//      newStore.gamesCount = result.gamesCount ?? 0
//      newStore.imageBackground = result.imageBackground ?? "Unknown"
//      newStore.name = result.name ?? "Unknown"
//      newStore.slug = result.slug ?? "Unknown"
//
//      list.append(newStore)
//
//      return list
//    }
//  }

}
