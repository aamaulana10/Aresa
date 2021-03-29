//
//  HomePopularRow.swift
//  Aresa
//
//  Created by aamaulana10 on 29/03/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomePopularRow: View {
  
  var game: GameModel
  var presenter: HomePresenter
  
  let size = UIScreen.main.bounds
  
    var body: some View {
        
      VStack {
        
        WebImage(url: URL(string: game.backgroundImage ?? ""))
            .resizable()
            .indicator(.activity)
            .transition(.fade(duration: 0.5))
            .cornerRadius(10)
      }.frame(minWidth: 0,
              maxWidth: size.width - 100,
              minHeight: 0,
              maxHeight: size.height / 4,
              alignment: .leading
       )
    }
}
