//
//  Detailinteractor.swift
//  Aresa
//
//  Created by aamaulana10 on 29/03/21.
//

import Foundation
import Combine

protocol DetailUseCase {
    
    func getGame() -> GameModel
    
    func addToFavorite(data: GameFavoriteModel) ->AnyPublisher<Bool, Error>
    func getFavourite() -> AnyPublisher<[GameFavoriteModel], Error>
    func deleteFromFavorite(data: GameFavoriteModel) ->AnyPublisher<Bool, Error>
}

class DetailInteractor: DetailUseCase {
    
    private let repository: GameRepositoryProtocol
    private let Game: GameModel
    
    required init(
        repository: GameRepositoryProtocol,
        Game: GameModel
    ) {
        
        self.repository = repository
        self.Game = Game
    }
    
    func getGame() -> GameModel {
        
        return Game
    }
    
    func addToFavorite(data: GameFavoriteModel) -> AnyPublisher<Bool, Error> {
        
        return repository.addFavoritGame(with: data)
    }
    
    func getFavourite() -> AnyPublisher<[GameFavoriteModel], Error> {
        
        return repository.getFavourite()
    }
    
    func deleteFromFavorite(data: GameFavoriteModel) -> AnyPublisher<Bool, Error> {
        
        return self.repository.deleteFromFavorite(data: data)
    }
    
}
