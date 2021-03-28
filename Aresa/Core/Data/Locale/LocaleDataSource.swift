//
//  LocaleDataSource.swift
//  Aresa
//
//  Created by aamaulana10 on 26/03/21.
//

import Foundation
import RealmSwift
import Combine

protocol LocaleDataSourceProtocol: class {
    
    func getGame() -> AnyPublisher<[GameEntity], Error>
    func addGame(from Games: [GameEntity]) -> AnyPublisher<Bool, Error>
    
    func addToFavorit(from favorit: GameFavoriteEntity) -> AnyPublisher<Bool, Error>
    func deleteFromFavorit(from favorit: GameFavoriteEntity) -> AnyPublisher<Bool, Error>
    func getFavoriteGame() -> AnyPublisher<[GameFavoriteEntity], Error>
    
    func getUser() -> UserEntity
}

final class LocaleDataSource: NSObject {
    
    private let realm: Realm?
    private init(realm: Realm?) {
        self.realm = realm
    }
    
    static let sharedInstance: (Realm?) -> LocaleDataSource = { realmDatabase in
        
        return LocaleDataSource(realm: realmDatabase)
    }
    
}

extension LocaleDataSource: LocaleDataSourceProtocol {
    
    func getGame() -> AnyPublisher<[GameEntity], Error> {
        
        return Future<[GameEntity], Error> { completion in
            if let realm = self.realm {
                let Games: Results<GameEntity> = {
                    realm.objects(GameEntity.self)
                        .sorted(byKeyPath: "name", ascending: true)
                }()
                
                completion(.success(Games.toArray(ofType: GameEntity.self)))
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func addGame(
        from Game: [GameEntity]
    ) -> AnyPublisher<Bool, Error> {
        
        return Future<Bool, Error> { completion in
            if let realm = self.realm {
                do {
                    try realm.write {
                        for Game in Game {
                            realm.add(Game, update: .all)
                        }
                        completion(.success(true))
                    }
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func addToFavorit(
        from favorit: GameFavoriteEntity
    ) -> AnyPublisher<Bool, Error> {
        
        return Future<Bool, Error> { completion in
            if let realm = self.realm {
                do {
                    try realm.write {
                        
                        realm.add(favorit, update: .all)
                        
                        completion(.success(true))
                    }
                    
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func deleteFromFavorit(from favorit: GameFavoriteEntity) -> AnyPublisher<Bool, Error> {
        
        return Future<Bool, Error> { completion in
            if let realm = self.realm {
                do {
                    
                    try realm.write {
                        
                        realm.delete(realm.objects(GameFavoriteEntity.self).filter("name=%@", favorit.name))
                                     
                        completion(.success(true))
                    }
                    
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func getFavoriteGame() -> AnyPublisher<[GameFavoriteEntity], Error> {
        
        return Future<[GameFavoriteEntity], Error> { completion in
            if let realm = self.realm {
                let Games: Results<GameFavoriteEntity> = {
                    realm.objects(GameFavoriteEntity.self)
                        .sorted(byKeyPath: "name", ascending: true)
                }()
                
                completion(.success(Games.toArray(ofType: GameFavoriteEntity.self)))
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func getUser() -> UserEntity {
        
        return UserEntity(
            picture: "me",
            name: "Aa Maulana",
            job: "Senior IOS Developer at PT. Gorry Holdings",
            email: "aamaulanabola10@gmail.com",
            phone: "081219257853"
        )
    }
    
}
