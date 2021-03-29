//
//  UserInteractor.swift
//  Aresa
//
//  Created by aamaulana10 on 29/03/21.
//

import Foundation
import Combine

protocol UserUseCase {
    func getUser() -> UserModel
}

class UserInteractor: UserUseCase {
    
    private let repository: GameRepositoryProtocol
    
    required init(repository: GameRepositoryProtocol) {
        
        self.repository = repository
    }
    
    func getUser() -> UserModel {
        
        return self.repository.getUser()
    }
}
