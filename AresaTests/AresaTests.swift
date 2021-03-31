//
//  AresaTests.swift
//  AresaTests
//
//  Created by aamaulana10 on 25/03/21.
//

import XCTest
import Combine
@testable import Aresa

class AresaTests: XCTestCase {
  
  private var cancellables: Set<AnyCancellable> = []

  func checkIsHightListgameExist() {
    
    let useCase = Injection.init().provideHomeMock()
    useCase.getHighlightGame(page: 1, pageSize: 10)
        .receive(on: RunLoop.main)
        .sink(receiveCompletion: { _ in
            
        }, receiveValue: { data in
            
            XCTAssert(
                data.first != nil
            )
        })
        .store(in: &cancellables)
  }
  
  func checkIsNewestgameExist() {
    
    let useCase = Injection.init().provideHomeMock()
    useCase.getNewestGame(page: 1, pageSize: 10)
        .receive(on: RunLoop.main)
        .sink(receiveCompletion: { _ in
            
        }, receiveValue: { data in
            
            XCTAssert(
                data.first != nil
            )
        })
        .store(in: &cancellables)
  }

}
