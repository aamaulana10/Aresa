//
//  ApiCall.swift
//  Aresa
//
//  Created by aamaulana10 on 26/03/21.
//

import Foundation

struct API {

  static let baseUrl = "https://api.rawg.io/api/"

}

extension API {
  
  static func getHighlightGameByPage(page: Int, pageSize: Int) -> String {
    
    return "\(API.baseUrl)games?page=\(page)&page_size=\(pageSize)"
  }
  
  static func getNewestGameByPage(page: Int, pageSize: Int) -> String {
    
    return "\(API.baseUrl)games?page=\(page)&page_size=\(pageSize)&ordering=released"
  }
  
  static func searchGameByPage(page: Int, pageSize: Int, query: String) -> String {
    
    return "\(API.baseUrl)games?page=\(page)&page_size=\(pageSize)&search=\(query)"
  }
}
