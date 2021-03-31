//
//  GameRepository.swift
//  Aresa
//
//  Created by aamaulana10 on 25/03/21.
//

import Foundation
import Combine

protocol GameRepositoryProtocol {
  
  func getHighlightGame(page: Int, pageSize: Int) -> AnyPublisher<[GameModel], Error>
  func getNewestGame(page: Int, pageSize: Int) -> AnyPublisher<[GameModel], Error>
  func searchGame(page: Int, pageSize: Int, query: String) -> AnyPublisher<[GameModel], Error>
  func addFavoritGame(with Game: GameFavoriteModel) -> AnyPublisher<Bool, Error>
  func getFavourite() -> AnyPublisher<[GameFavoriteModel], Error>
  func deleteFromFavorite(data: GameFavoriteModel) ->AnyPublisher<Bool, Error>
  
  func getUser() -> UserModel
}

final class GameRepository: NSObject {
  
  typealias GameInstance = (LocaleDataSource, RemoteDataSource) -> GameRepository
  fileprivate let remote: RemoteDataSource
  fileprivate let locale: LocaleDataSource
  private init(locale: LocaleDataSource, remote: RemoteDataSource) {
    
    self.remote = remote
    self.locale = locale
  }
  static let sharedInstance: GameInstance = { localeRepo, remoteRepo in
    
    return GameRepository(locale: localeRepo, remote: remoteRepo)
  }
  
}

extension GameRepository: GameRepositoryProtocol {
  
  func getHighlightGame(page: Int, pageSize: Int) -> AnyPublisher<[GameModel], Error> {
    
    return self.locale.getHighlightGame()
      .flatMap { result -> AnyPublisher<[GameModel], Error> in
        if result.isEmpty {
          return self.remote.getHighlightGame(page: page, pageSize: pageSize)
            .map { GameMapper.mapGameResponsesToDomains(input: $0) }
            .map { GameMapper.mapGameResponsesToEntities(input: $0) }
            .flatMap { self.locale.addGame(from: $0) }
            .filter { $0 }
            .flatMap { _ in self.locale.getHighlightGame()
              .map { GameMapper.mapGameEntitiesToDomains(input: $0) }
            }.eraseToAnyPublisher()
          
        } else {
          return self.locale.getHighlightGame()
            .map { GameMapper.mapGameEntitiesToDomains(input: $0) }
            .eraseToAnyPublisher()
        }
      }.eraseToAnyPublisher()
  }
  
  func getNewestGame(page: Int, pageSize: Int) -> AnyPublisher<[GameModel], Error> {
    
    return self.locale.getNewestGame()
      .flatMap { result -> AnyPublisher<[GameModel], Error> in
        if result.isEmpty {
          return self.remote.getNewestGame(page: page, pageSize: pageSize)
            .map { GameMapper.mapGameResponsesToDomains(input: $0) }
            .map { GameMapper.mapGameResponsesToNewestEntities(input: $0) }
            .flatMap { self.locale.addNewestGame(from: $0) }
            .filter { $0 }
            .flatMap { _ in self.locale.getNewestGame()
              .map { GameMapper.mapGameNewestEntitiesToDomains(input: $0) }
            }.eraseToAnyPublisher()
          
        } else {
          return self.locale.getNewestGame()
            .map { GameMapper.mapGameNewestEntitiesToDomains(input: $0) }
            .eraseToAnyPublisher()
        }
      }.eraseToAnyPublisher()
  }
  
  func searchGame(page: Int, pageSize: Int, query: String) -> AnyPublisher<[GameModel], Error> {
    
    return self.remote.searchGame(page: page, pageSize: pageSize, query: query)
      .map {
        GameMapper.mapGameResponsesToDomains(input: $0)
      }.eraseToAnyPublisher()
    
  }
  
  func addFavoritGame(with Game: GameFavoriteModel) -> AnyPublisher<Bool, Error> {
    
    return locale.addToFavorit(
      from: FavoriteMapper.mapFavoriteDomainToFavouriteEntities(
        input: Game)).eraseToAnyPublisher()
  }
  
  func getFavourite() -> AnyPublisher<[GameFavoriteModel], Error> {
    
    return locale.getFavoriteGame().map { FavoriteMapper.mapGameFavoriteEntitiesToFavoriteDomains(input: $0) }
      .eraseToAnyPublisher()
  }
  
  func deleteFromFavorite(data: GameFavoriteModel) -> AnyPublisher<Bool, Error> {
    
    return locale.deleteFromFavorit(
      from: FavoriteMapper.mapFavoriteDomainToFavouriteEntities(
        input: data)).eraseToAnyPublisher()
  }
  
  func getUser() -> UserModel {
    
    return GameMapper.mapUserEntityToUserDomain(input: locale.getUser())
  }
}
