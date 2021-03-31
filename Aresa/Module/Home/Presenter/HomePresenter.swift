//
//  HomePresenter.swift
//  Aresa
//
//  Created by aamaulana10 on 29/03/21.
//

import SwiftUI
import Combine

class HomePresenter: ObservableObject {
  
  private let router = HomeRouter()
  private let homeUseCase: HomeUseCase
  @Published  var page = 1
  private var pageSize = 10
  
  @Published var game: [GameModel] = []
  @Published var newestGame: [GameModel] = []
  @Published var errorMessage: String = ""
  @Published var loadingState: Bool = false
  
  @State var showView = false
  private var cancellables: Set<AnyCancellable> = []
  
  init(homeUseCase: HomeUseCase) {
    
    self.homeUseCase = homeUseCase
  }
  
  func getHighlightGame() {
    
    loadingState = true
    homeUseCase.getHighlightGame(page: page, pageSize: pageSize)
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure:
          self.errorMessage = String(describing: completion)
        case .finished:
          self.loadingState = false
        }
      }, receiveValue: { data in
        self.game = data
      })
      .store(in: &cancellables)
  }
  
  func getNewestGame(isLoadMore: Bool) {
    
    if isLoadMore == true {
      
      self.page += 1
      
    } else {
      
      self.game.removeAll()
      self.page = 1
    }
    
    loadingState = true
    homeUseCase.getNewestGame(page: page, pageSize: pageSize)
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure:
          self.errorMessage = String(describing: completion)
        case .finished:
          self.loadingState = false
        }
      }, receiveValue: { data in
        
        if isLoadMore == true {
          
          self.newestGame.append(contentsOf: data)
          
        } else {
          
          self.newestGame = data
          
        }
        
      })
      .store(in: &cancellables)
  }
  
  func linkBuilder<Content: View>( for game: GameModel, @ViewBuilder content: () -> Content
  ) -> some View {
    NavigationLink(
      destination: router.makeDetailView(for: game)) { content() }
  }
  
}
