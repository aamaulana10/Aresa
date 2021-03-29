//
//  HomeHeader.swift
//  Aresa
//
//  Created by aamaulana10 on 29/03/21.
//

import SwiftUI

struct HomeHeader: View {
  
  let size = UIScreen.main.bounds
  @State private var placeSearchText = ""
  
  var body: some View {
    VStack {
      
      HStack {
        
        VStack(alignment: .leading){
          Text("Welcome,")
            .foregroundColor(.white)
            .font(.largeTitle)
            .bold()
          Text("What would you like to find?")
            .foregroundColor(.white)
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

struct HomeHeader_Previews: PreviewProvider {
  static var previews: some View {
    HomeHeader()
  }
}
