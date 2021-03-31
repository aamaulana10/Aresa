//
//  HomeInteractor.swift
//  Aresa
//
//  Created by aamaulana10 on 29/03/21.
//

import Foundation
import Combine

protocol HomeUseCase {
  
  func getHighlightGame(page: Int, pageSize: Int) -> AnyPublisher<[GameModel], Error>
  func getNewestGame(page: Int, pageSize: Int) -> AnyPublisher<[GameModel], Error>
}

class HomeInteractor: HomeUseCase {
  
  private let repository: GameRepositoryProtocol
  
  required init(repository: GameRepositoryProtocol) {
    
    self.repository = repository
  }
  
  func getHighlightGame(page: Int, pageSize: Int) -> AnyPublisher<[GameModel], Error> {
    
    return repository.getHighlightGame(page: page, pageSize: pageSize)
  }
  
  func getNewestGame(page: Int, pageSize: Int) -> AnyPublisher<[GameModel], Error> {
    
    return repository.getNewestGame(page: page, pageSize: pageSize)
  }
  
}
