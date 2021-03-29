//
//  HomeInteractor.swift
//  Aresa
//
//  Created by aamaulana10 on 29/03/21.
//

import Foundation
import Combine

protocol HomeUseCase {
    
    func getGame(page: Int, pageSize: Int) -> AnyPublisher<[GameModel], Error>
    
}

class HomeInteractor: HomeUseCase {
    
    private let repository: GameRepositoryProtocol
    
    required init(repository: GameRepositoryProtocol) {
       
        self.repository = repository
    }
    
    func getGame(page: Int, pageSize: Int) -> AnyPublisher<[GameModel], Error> {
       
        return repository.getGame(page: page, pageSize: pageSize)
    }
    
}
