//
//  DetailHeader.swift
//  Aresa
//
//  Created by aamaulana10 on 31/03/21.
//

import SwiftUI
import SDWebImageSwiftUI
extension DetailView {
  
  var detailHeader: some View {
  
    VStack {
      
      WebImage(url: URL(string: self.presenter.game.backgroundImage ?? ""))
          .resizable()
          .indicator(.activity)
          .transition(.fade(duration: 0.5))
          .frame(
              width: UIScreen.main.bounds.width,
            height: UIScreen.main.bounds.height / 3
          )
        .brightness(-0.3)
    }
//    .overlay(headerIcon, alignment: .center)
  }
  
  var headerIcon: some View {
    
    WebImage(url: URL(string: self.presenter.game.backgroundImage ?? ""))
        .resizable()
        .indicator(.activity)
        .transition(.fade(duration: 0.5))
        .frame(
            width: 80,
          height: 80)
      .cornerRadius(20)
  }
}
