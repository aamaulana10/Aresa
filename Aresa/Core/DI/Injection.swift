//
//  Injection.swift
//  Aresa
//
//  Created by aamaulana10 on 29/03/21.
//

import Foundation
import RealmSwift

final class Injection: NSObject {
  
  private func provideRepository() -> GameRepositoryProtocol {
    
    let realm = try? Realm()
    let locale: LocaleDataSource = LocaleDataSource.sharedInstance(realm)
    let remote: RemoteDataSource = RemoteDataSource.sharedInstance
    
    return GameRepository.sharedInstance(locale, remote)
  }
  
  func provideHome() -> HomeUseCase {
    
    let repository = provideRepository()
    
    return HomeInteractor(repository: repository)
  }
  
  func provideHomeMock() -> HomeUseCaseMock {

    let repository = provideRepository()

    return HomeInteractorMock(repository: repository)
  }
  
  func provideDetail(Game: GameModel) -> DetailUseCase {
    
    let repository = provideRepository()
    
    return DetailInteractor(repository: repository, Game: Game)
  }
  
  func provideFavourite() -> FavouriteUseCase {
    
    let repository = provideRepository()
    
    return FavouriteInteractor(repository: repository)
  }
  
  func provideUser() -> UserUseCase {
    
    let repository = provideRepository()
    
    return UserInteractor(repository: repository)
  }
  
}
