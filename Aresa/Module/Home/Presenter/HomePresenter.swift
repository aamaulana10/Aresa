//
//  HomePresenter.swift
//  Aresa
//
//  Created by aamaulana10 on 29/03/21.
//

import SwiftUI
import Combine

class HomePresenter: ObservableObject {
  
  //    private let router = HomeRouter()
  private let homeUseCase: HomeUseCase
  private var page = 1
  private var pageSize = 10
  
  @Published var game: [GameModel] = []
  @Published var errorMessage: String = ""
  @Published var loadingState: Bool = false
  
  @State var showView = false
  private var cancellables: Set<AnyCancellable> = []
  
  init(homeUseCase: HomeUseCase) {
    
    self.homeUseCase = homeUseCase
  }
  
  func getGame() {
    
    print("called presenter")
    
    loadingState = true
    homeUseCase.getGame(page: page, pageSize: pageSize)
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
        print("game ", data)
      })
      .store(in: &cancellables)
  }
  
  //    func linkBuilder<Content: View>( for game: GameModel, @ViewBuilder content: () -> Content
  //    ) -> some View {
  //        NavigationLink(
  //            destination: router.makeDetailView(for: game)) { content() }
  //    }
  
}
