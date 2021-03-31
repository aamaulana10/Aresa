//
//  DetailSsRow.swift
//  Aresa
//
//  Created by aamaulana10 on 31/03/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailSsRow: View {
  
  var screenshoot: ShortScreenshotModel
  var presenter: DetailPresenter
  
  let size = UIScreen.main.bounds
  
    var body: some View {
        
      VStack {
        
        WebImage(url: URL(string: screenshoot.image ?? ""))
            .resizable()
            .indicator(.activity)
            .transition(.fade(duration: 0.5))
            .cornerRadius(10)
      }.frame(minWidth: size.width - 100,
              maxWidth: size.width - 100,
              minHeight: 0,
              maxHeight: size.height / 4,
              alignment: .leading
       )
    }
}
