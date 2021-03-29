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
        clip: result.clip.clip,
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
      newGame.metacritic = result.metacritic  ?? 0
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
        metacritic: result.metacritic,
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
  
  static func mapGameFavoriteEntitiesToFavoriteDomains(
    input GameFavoriteEntities: [GameFavoriteEntity]
  ) -> [GameFavoriteModel] {
    
    return GameFavoriteEntities.map { result in
      
      return GameFavoriteModel(
        backgroundImage: result.backgroundImage,
        clip: result.clip,
        dominantColor: result.dominantColor,
        genres: mapGenreEntitiesToGenreDomain(input: result.genres),
        id: result.id,
        metacritic: result.metacritic,
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
  
  static func mapFavouriteEntitiesToFavoritemodel(input game: GameFavoriteEntity) -> GameFavoriteModel {
    
    return GameFavoriteModel(
      backgroundImage: game.backgroundImage,
      clip: game.clip,
      dominantColor: game.dominantColor,
      genres: mapGenreEntitiesToGenreDomain(input: game.genres),
      id: game.id,
      metacritic: game.metacritic,
      name: game.name,
      platforms: mapPlatformEntitiesToPlatformDomain(input: game.platforms),
      playtime: game.playtime,
      rating: game.rating,
      ratingTop: game.ratingTop,
      ratings: mapRatingsEntitiesToRatingsDomain(input: game.ratings),
      ratingsCount: game.ratingsCount,
      released: game.released,
      reviewsCount: game.reviewsCount,
      reviewsTextCount: game.reviewsTextCount,
      saturatedColor: game.saturatedColor,
      shortScreenshots: mapSSEntitiesToSSDomain(input: game.shortScreenshots),
      slug: game.slug,
      stores: mapStoreEntitiesToStoreDomain(input: game.stores),
      updated: game.updated
    )
  }
  
  static func mapFavoriteDomainToFavouriteEntities(input game: GameFavoriteModel) -> GameFavoriteEntity {
    
    let newGame = GameFavoriteEntity()
    newGame.backgroundImage = game.backgroundImage ?? "Unknown"
    newGame.clip = game.clip  ?? "Unknown"
    newGame.dominantColor = game.dominantColor  ?? "Unknown"
    newGame.genres = mapGenreResponsetoGenreEntity(input: game.genres)
    newGame.id = game.id  ?? 0
    newGame.metacritic = game.metacritic  ?? 0
    newGame.name = game.name ?? "Unknown"
    newGame.platforms = mapPlatformsResponsetoPlatformsEntity(input: game.platforms)
    newGame.playtime = game.playtime ?? 0
    newGame.rating = game.rating ?? 0.0
    newGame.ratingTop = game.ratingTop ?? 0
    newGame.ratings = mapRatingsResponsetoRatingEntity(input: game.ratings)
    newGame.ratingsCount = game.ratingsCount ?? 0
    newGame.released = game.released  ?? "Unknown"
    newGame.reviewsCount = game.reviewsCount ?? 0
    newGame.reviewsTextCount = game.reviewsTextCount ?? 0
    newGame.saturatedColor = game.saturatedColor  ?? "Unknown"
    newGame.shortScreenshots = mapSScreenshotsResponsetoSScreenshotsEntity(input: game.shortScreenshots)
    newGame.slug = game.slug  ?? "Unknown"
    newGame.stores = mapStoreResponsetoStoreEntity(input: game.stores)
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
      metacritic: game.metacritic,
      name: game.name,
      platforms:game.platforms,
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
      metacritic: game.metacritic,
      name: game.name,
      platforms:game.platforms,
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
        gamesCount: result.platform?.gamesCount ?? 0,
        id: result.platform?.id ?? 0,
        image: result.platform?.image ?? "Unknown",
        imageBackground: result.platform?.imageBackground ?? "Unknows",
        name: result.platform?.name ?? "Unknows",
        slug: result.platform?.slug ?? "Unknows"
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
        domain: result.store?.domain ?? "Unknown",
        gamesCount: result.store?.gamesCount ?? 0,
        id: result.id,
        imageBackground: result.store?.imageBackground ?? "Unknown",
        name: result.store?.name ?? "Unknown",
        slug: result.store?.slug ?? "Unknown"
      )
    }
  }
}

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

