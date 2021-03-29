//
//  FavoriteInteractor.swift
//  Aresa
//
//  Created by aamaulana10 on 29/03/21.
//

import Foundation
import Combine

protocol FavouriteUseCase {
    func getFavourite() -> AnyPublisher<[GameFavoriteModel], Error>
    func deleteFromFavorite(data: GameFavoriteModel) ->AnyPublisher<Bool, Error>
}

class FavouriteInteractor: FavouriteUseCase {
    
    private let repository: GameRepositoryProtocol
    
    required init(repository: GameRepositoryProtocol) {
        
        self.repository = repository
    }
    
    func getFavourite() -> AnyPublisher<[GameFavoriteModel], Error> {
        
        return self.repository.getFavourite()
    }
    
    func deleteFromFavorite(data: GameFavoriteModel) -> AnyPublisher<Bool, Error> {
        
        return self.repository.deleteFromFavorite(data: data)
    }
    
}
