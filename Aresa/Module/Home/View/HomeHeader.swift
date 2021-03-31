//
//  HomeHeader.swift
//  Aresa
//
//  Created by aamaulana10 on 29/03/21.
//

import SwiftUI

extension HomeView {
  
  var HomeHeader: some View {
    VStack {
      
      HStack {
        
        VStack(alignment: .leading) {
          Text("Welcome,")
            .foregroundColor(.white)
            .font(.custom("Arial Rounded MT Bold", size: 36.0))
            .bold()
          Text("What would you like to find?")
            .foregroundColor(.white)
            .font(.system(size: 14))
        }
        Spacer()
        Image(systemName: "square.and.pencil")
        
      }.padding()
      
      SearchBar(placeSearchText: $placeSearchText)
            
    }.frame(minWidth: 0,
            maxWidth: size.width,
            minHeight: 0,
            maxHeight: size.height / 3,
            alignment: .leading
     )
    .background(Color.mainColor)
  }
}
