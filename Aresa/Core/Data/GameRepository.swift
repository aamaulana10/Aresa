//
//  GameRepository.swift
//  Aresa
//
//  Created by aamaulana10 on 25/03/21.
//

import Foundation
import Combine

protocol GameRepositoryProtocol {
    
    func getGame(page: Int, pageSize: Int) -> AnyPublisher<[GameModel], Error>
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
    
    func getGame(page: Int, pageSize: Int) -> AnyPublisher<[GameModel], Error> {

        return self.locale.getGame()
            .flatMap { result -> AnyPublisher<[GameModel], Error> in
                if result.isEmpty {
                  return self.remote.getGame(page: page, pageSize: pageSize)
                        .map { GameMapper.mapGameResponsesToDomains(input: $0) }
                        .map { GameMapper.mapGameResponsesToEntities(input: $0) }
                        .flatMap { self.locale.addGame(from: $0) }
                        .filter { $0 }
                        .flatMap { _ in self.locale.getGame()
                          .map { GameMapper.mapGameEntitiesToDomains(input: $0) }
                        }.eraseToAnyPublisher()

                } else {
                    return self.locale.getGame()
                        .map { GameMapper.mapGameEntitiesToDomains(input: $0) }
                        .eraseToAnyPublisher()
                }
            }.eraseToAnyPublisher()
    }
    
    func addFavoritGame(with Game: GameFavoriteModel) -> AnyPublisher<Bool, Error> {

        return locale.addToFavorit(
            from: GameMapper.mapFavoriteDomainToFavouriteEntities(
                input: Game)).eraseToAnyPublisher()
    }

    func getFavourite() -> AnyPublisher<[GameFavoriteModel], Error> {

        return locale.getFavoriteGame().map { GameMapper.mapGameFavoriteEntitiesToFavoriteDomains(input: $0) }
            .eraseToAnyPublisher()
    }

    func deleteFromFavorite(data: GameFavoriteModel) -> AnyPublisher<Bool, Error> {

        return locale.deleteFromFavorit(
            from: GameMapper.mapFavoriteDomainToFavouriteEntities(
                input: data)).eraseToAnyPublisher()
    }
    
    func getUser() -> UserModel {
        
        return GameMapper.mapUserEntityToUserDomain(input: locale.getUser())
    }
}
