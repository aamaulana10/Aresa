//
//  HomeNewestRow.swift
//  Aresa
//
//  Created by aamaulana10 on 31/03/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeNewestRow: View {
  
  var game: GameModel
  var presenter: HomePresenter
  
  let size = UIScreen.main.bounds
  
    var body: some View {
        
      VStack {
        
        HStack(alignment: VerticalAlignment.center) {
          
          WebImage(url: URL(string: self.game.backgroundImage ?? ""))
              .resizable()
              .indicator(.activity)
              .transition(.fade(duration: 0.5))
              .frame(
                  width: 80,
                height: 80)
            .cornerRadius(20)
          
          VStack(alignment: .leading, spacing: 0) {
            
            Text(self.game.name ?? "")
              .font(.custom("Arial Rounded MT Bold", size: 16.0))
              .foregroundColor(.black)
              .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
            
            Text(self.game.genres.first?.name ?? "Unknown")
              .font(.system(size: 14))
              .foregroundColor(.black)
              .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))
            
            HStack {
              
              HStack {
                
                Image(systemName: "star.fill")
                  .foregroundColor(.yellow)
                  .frame(width: 30, height: 30)
                
                Text(String(format: "%.2f", self.game.rating ?? 0.0))
                  .font(.system(size: 14))
                  .foregroundColor(.black)
              }
              
              HStack {
                
                Image(systemName: "tray.and.arrow.down.fill")
                  .foregroundColor(.mainColor)
                  .frame(width: 15, height: 15)
                  .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 4))
                
                Text("\(self.game.added ?? 0)")
                  .font(.system(size: 14))
                  .foregroundColor(.black)
              }.padding()
              
            }
          }
          
        }
      }
      .frame(minWidth: size.width,
              maxWidth: size.width,
              minHeight: 100,
              maxHeight: 100,
              alignment: .leading
       )
    }
}
