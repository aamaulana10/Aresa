//
//  HomeView.swift
//  Aresa
//
//  Created by aamaulana10 on 29/03/21.
//

import SwiftUI

struct HomeView: View {
  
  @ObservedObject var presenter: HomePresenter
  @State var placeSearchText = ""
  
  let size = UIScreen.main.bounds
  
  var body: some View {
    
    ZStack {
      if presenter.loadingState {
        
        VStack {
          ProgressView("Loading...")
        }
      } else {
        ScrollView(.vertical, showsIndicators: false) {
          HomeHeader
            .frame(height: 300)
          categories
          byHighlight
          byNewest
        }
      }
      Spacer()
    }.onAppear {
      
      presenter.getHighlightGame()
      presenter.getNewestGame(isLoadMore: false)
    }
    .edgesIgnoringSafeArea(.top)
    .navigationBarHidden(true)
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
              
              Image("Arcade")
                .resizable()
                .frame(
                  width: 40,
                  height: 40
                )
                .padding()
              
            }
            .foregroundColor(.white)
            .frame(width: 60, height: 60)
            .background(Color.mainColor)
            .cornerRadius(8)
            
            Text("Arcade")
              .foregroundColor(.black)
              .font(.system(size: 13))
          }
          
        }
        
        Button(action: {
          print("clicked")
        }) {
          VStack {
            
            VStack {
              
              Image("Racing")
                .resizable()
                .frame(
                  width: 40,
                  height: 40
                )
                .padding()
              
            }
            .foregroundColor(.white)
            .frame(width: 60, height: 60)
            .background(Color.racing)
            .cornerRadius(8)
            
            Text("Racing")
              .foregroundColor(.black)
              .font(.system(size: 13))
          }
          
        }
        
        Button(action: {
          print("clicked")
        }) {
          VStack {
            
            VStack {
              
              Image("Strategy")
                .resizable()
                .frame(
                  width: 40,
                  height: 40
                )
                .padding()
              
            }
            .foregroundColor(.white)
            .frame(width: 60, height: 60)
            .background(Color.strategy)
            .cornerRadius(8)
            
            Text("Strategy")
              .foregroundColor(.black)
              .font(.system(size: 13))
          }
          
        }
        
        Button(action: {
          print("clicked")
        }) {
          VStack {
            
            VStack {
              
              Image("More")
                .resizable()
                .frame(
                  width: 40,
                  height: 40
                )
                .padding()
              
            }
            .foregroundColor(.white)
            .frame(width: 60, height: 60)
            .background(Color.more)
            .cornerRadius(8)
            
            Text("More")
              .foregroundColor(.black)
              .font(.system(size: 13))
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
  
  var byHighlight: some View {
    
    VStack(alignment: .leading) {
      
      Text("Games you must try")
        .font(.custom("Arial Rounded MT Bold", size: 16.0))
        .bold()
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 8, trailing: 16))
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 20) {
          ForEach(
            self.presenter.game
          ) { game in
            ZStack {
              self.presenter.linkBuilder(for: game) {
                HomePopularRow(game: game, presenter: presenter)
                  .buttonStyle(PlainButtonStyle())
              }
            }
          }
        }.padding()
      }
    }
  }
  
  var byNewest: some View {
    
    VStack(alignment: .leading) {
      
      Text("New coming game")
        .font(.custom("Arial Rounded MT Bold", size: 16.0))
        .bold()
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 8, trailing: 16))
      
      VStack(spacing: 20) {
        
        List(self.presenter.newestGame) { newestGame in
          
          VStack {
            self.presenter.linkBuilder(for: newestGame) {
              HomeNewestRow(game: newestGame, presenter: presenter)
                .buttonStyle(PlainButtonStyle())
            }
          }
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        .hasScrollEnabled(false)
        .frame(height: CGFloat(self.presenter.newestGame.count) * 100)
        
        Button(action: {
          
          self.presenter.getNewestGame(isLoadMore: true)
        }) {
            Text("Load more")
              .font(.custom("Arial Rounded MT Bold", size: 13.0))
        }
        
      }.padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
    }
  }
}
