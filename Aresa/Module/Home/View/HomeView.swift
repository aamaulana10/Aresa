//
//  HomeView.swift
//  Aresa
//
//  Created by aamaulana10 on 29/03/21.
//

import SwiftUI

struct HomeView: View {
  
  @ObservedObject var presenter: HomePresenter
  let size = UIScreen.main.bounds
  
  var body: some View {
    
    ZStack {
      if presenter.loadingState {
        
        VStack {
          ProgressView("Loading...")
        }
      }else {
        
        ScrollView(.vertical, showsIndicators: false) {
          HomeHeader()
            .frame(height: 300)
          categories
          popular
        }
      }
    }.onAppear {
      
      presenter.getGame()
    }
    
  }
}

extension HomeView {
  
  var categories: some View {
    
    VStack(alignment: .center) {
      
      HStack(spacing: 30) {
        
        Button(action: {
          print("clicked")
        }) {
          VStack {
            
            VStack {
              
              Image(systemName: "number.circle")
                .scaledToFill()
                .padding()
              
            }
            .foregroundColor(.white)
            .frame(width: 60, height: 60)
            .background(Color.mainColor)
            .cornerRadius(8)
            
            Text("Arcade")
              .foregroundColor(.black)
              .font(.system(size: 14))
              .fontWeight(.medium)
          }
          
        }
        
        Button(action: {
          print("clicked")
        }) {
          VStack {
            
            VStack {
              
              Image(systemName: "number.circle")
                .scaledToFill()
                .padding()
              
            }
            .foregroundColor(.white)
            .frame(width: 60, height: 60)
            .background(Color.mainColor)
            .cornerRadius(8)
            
            Text("Racing")
              .foregroundColor(.black)
              .font(.system(size: 14))
              .fontWeight(.medium)
          }
          
        }
        
        Button(action: {
          print("clicked")
        }) {
          VStack {
            
            VStack {
              
              Image(systemName: "number.circle")
                .scaledToFill()
                .padding()
              
            }
            .foregroundColor(.white)
            .frame(width: 60, height: 60)
            .background(Color.mainColor)
            .cornerRadius(8)
            
            Text("Strategy")
              .foregroundColor(.black)
              .font(.system(size: 14))
              .fontWeight(.medium)
          }
          
        }
        
        Button(action: {
          print("clicked")
        }) {
          VStack {
            
            VStack {
              
              Image(systemName: "number.circle")
                .scaledToFill()
                .padding()
              
            }
            .foregroundColor(.white)
            .frame(width: 60, height: 60)
            .background(Color.mainColor)
            .cornerRadius(8)
            
            Text("More")
              .foregroundColor(.black)
              .font(.system(size: 14))
              .fontWeight(.medium)
          }
          
        }
        
      }
    }
    .frame(minWidth: 0,
           maxWidth: size.width,
           minHeight: 0,
           alignment: .center
    )
  }
}

extension HomeView {
  
  var popular: some View {
    
    VStack(alignment: .leading) {
      
      Text("Popular Game")
        .font(.system(size: 16))
        .bold()
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 8, trailing: 16))
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 20) {
          ForEach(
            self.presenter.game
          ) { game in
            ZStack {
              //              self.presenter.linkBuilder(for: tourism) {
              HomePopularRow(game: game, presenter: presenter)
                .buttonStyle(PlainButtonStyle())
            }
          }
        }.padding()
      }
    }
  }
}
