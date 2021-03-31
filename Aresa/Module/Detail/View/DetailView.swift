//
//  DetailView.swift
//  Aresa
//
//  Created by aamaulana10 on 31/03/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
  
  @ObservedObject var presenter: DetailPresenter
  
  var body: some View {
    
    ZStack(alignment: .bottom) {
      
      if presenter.loadingState {
        
        VStack {
          ProgressView("Loading...")
        }
      } else {
        
        ScrollView(.vertical, showsIndicators: false) {
          detailHeader
          content
        }
        
      }
      
      HStack {
        
        Button(action: {
           setFavorite()
        }) {
            Text(presenter.isFavourite == false ? "Favourite" : "Delete From Favourite")
                .foregroundColor(.white).bold()
                .frame(maxHeight: 45)
        }
        .frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width - 32, minHeight: 45, maxHeight: 45, alignment: .center)
        .background(presenter.isFavourite == false ? Color.blue : Color.red)
        .cornerRadius(20)
        
      }.padding()
      
    }.onAppear {
      
      presenter.checkIsFavorite(gameData: presenter.game)
    }
    .edgesIgnoringSafeArea(.top)
  }
  
  func setFavorite() {
      
      presenter.isFavourite == false ?
          presenter.addToFavorite(gameData: presenter.game) :
          
          DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
              presenter.deleteFromFavourite(data: presenter.game)
          })
  }
}

extension DetailView {
  
  var content: some View {
    
    VStack {
      
      HStack(alignment: VerticalAlignment.top) {
        
        WebImage(url: URL(string: self.presenter.game.backgroundImage ?? ""))
            .resizable()
            .indicator(.activity)
            .transition(.fade(duration: 0.5))
            .frame(
                width: 80,
              height: 80)
          .cornerRadius(20)
        
        VStack(alignment: .leading, spacing: 8) {
          
          Text(self.presenter.game.name ?? "")
            .font(.custom("Arial Rounded MT Bold", size: 24.0))
          Text(self.presenter.game.genres.first?.name ?? "")
            .font(.custom("Arial Rounded MT Bold", size: 14.0))
          
          HStack {
            
            HStack {
              
              Image(systemName: "star.fill")
                .foregroundColor(.yellow)
                .frame(width: 30, height: 30)
              
              Text(String(format: "%.2f", self.presenter.game.rating ?? 0.0))
                .font(.system(size: 14))
            }
            
            HStack {
              
              Image(systemName: "tray.and.arrow.down.fill")
                .foregroundColor(.mainColor)
                .frame(width: 15, height: 15)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 4))
              
              Text("\(self.presenter.game.added ?? 0)")
                .font(.system(size: 14))
            }.padding()
            
          }
        }
        
        Spacer()
      }.padding()
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 20) {
          ForEach(
            self.presenter.game.shortScreenshots
          ) { screenshoot in
            ZStack {
//              self.presenter.linkBuilder(for: game) {
                  DetailSsRow(screenshoot: screenshoot, presenter: presenter)
                    .buttonStyle(PlainButtonStyle())
//              }
            }
          }
        }.padding()
      }
      
//      Text(self.presenter.game)
    }
  }
}
