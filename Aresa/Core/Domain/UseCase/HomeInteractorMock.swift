//
//  HomeInteractorMock.swift
//  Aresa
//
//  Created by aamaulana10 on 29/03/21.
//

import Foundation
import Combine

protocol HomeUseCaseMock {
    
    func getGame(page: Int, pageSize: Int) -> AnyPublisher<[GameModel], Error>
    func verify() -> Bool
}

class HomeInteractorMock: HomeUseCaseMock {
  
  private let repository: GameRepositoryProtocol
  
  required init(repository: GameRepositoryProtocol) {
     
      self.repository = repository
  }
  
  var functionWasCalled = false
  
  func getGame(page: Int, pageSize: Int) -> AnyPublisher<[GameModel], Error> {
      
      functionWasCalled = true
      
      return repository.getGame(page: page, pageSize: pageSize)
  }

  func verify() -> Bool {
      
    return functionWasCalled
  }
  
}
