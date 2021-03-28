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
  
  static func getGameByPage(page:Int, pageSize:Int) -> String {
    
    return "\(API.baseUrl)games?page=\(page)&page_size=\(pageSize)"
  }
}
