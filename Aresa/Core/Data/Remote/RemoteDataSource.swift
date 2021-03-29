//
//  RemoteDataSource.swift
//  Aresa
//
//  Created by aamaulana10 on 26/03/21.
//

import Foundation
import Alamofire
import Combine

protocol RemoteDataSourceProtocol: class {
    
    func getGame(page: Int, pageSize: Int) -> AnyPublisher<[GameModelResponse], Error>

}

final class RemoteDataSource: NSObject {
    
    private override init() { }
    
    static let sharedInstance: RemoteDataSource =  RemoteDataSource()
    
}

extension RemoteDataSource: RemoteDataSourceProtocol {
    
  func getGame(page: Int, pageSize: Int) -> AnyPublisher<[GameModelResponse], Error> {
       
        return Future<[GameModelResponse], Error> { completion in
          if let url = URL(string: API.getGameByPage(page: page, pageSize: pageSize)) {
           AF.request(url)
             .validate()
             .responseDecodable(of: GameResponse.self) { response in
              
              print("url ", API.getGameByPage(page: page, pageSize: pageSize))
              
              print("response ", response)
              
               switch response.result {
               case .success(let value):
                completion(.success(value.results))
               case .failure:
                 completion(.failure(URLError.invalidResponse))
               }
             }
         }
       }.eraseToAnyPublisher()
     }
    
}
