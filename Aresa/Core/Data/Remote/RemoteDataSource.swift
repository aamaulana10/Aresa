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
    
    func getHighlightGame(page: Int, pageSize: Int) ->
    AnyPublisher<[GameModelResponse], Error>
  
    func getNewestGame(page: Int, pageSize: Int) ->
    AnyPublisher<[GameModelResponse], Error>
  
  func searchGame(page: Int, pageSize: Int, query: String) ->
    AnyPublisher<[GameModelResponse], Error>

}

final class RemoteDataSource: NSObject {
    
    private override init() { }
    
    static let sharedInstance: RemoteDataSource =  RemoteDataSource()
    
}

extension RemoteDataSource: RemoteDataSourceProtocol {
    
  func getHighlightGame(page: Int, pageSize: Int) -> AnyPublisher<[GameModelResponse], Error> {
       
        return Future<[GameModelResponse], Error> { completion in
          if let url = URL(string: API.getHighlightGameByPage(page: page, pageSize: pageSize)) {
           AF.request(url)
             .validate()
             .responseDecodable(of: GameResponse.self) { response in
              
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
  
  func getNewestGame(page: Int, pageSize: Int) -> AnyPublisher<[GameModelResponse], Error> {
     
      return Future<[GameModelResponse], Error> { completion in
        if let url = URL(string: API.getNewestGameByPage(page: page, pageSize: pageSize)) {
         AF.request(url)
           .validate()
           .responseDecodable(of: GameResponse.self) { response in
        
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
  
  func searchGame(page: Int, pageSize: Int, query: String) -> AnyPublisher<[GameModelResponse], Error> {
     
      return Future<[GameModelResponse], Error> { completion in
        if let url = URL(string: API.searchGameByPage(page: page,
                                                      pageSize: pageSize,
                                                      query: query)) {
         AF.request(url)
           .validate()
           .responseDecodable(of: GameResponse.self) { response in
            
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
