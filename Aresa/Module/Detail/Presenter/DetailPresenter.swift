//
//  DetailPresenter.swift
//  Aresa
//
//  Created by aamaulana10 on 31/03/21.
//

import SwiftUI
import Combine

class DetailPresenter: ObservableObject {
    
    private let detailUseCase: DetailUseCase
    
    @Published var game: GameModel
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false
    @Published var isFavourite: Bool = false
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(detailUseCase: DetailUseCase) {
        self.detailUseCase = detailUseCase
      game = detailUseCase.getGame()
      game.shortScreenshots.removeFirst()
    }
    
    func addToFavorite(gameData: GameModel) {
        
        detailUseCase.addToFavorite(data: FavoriteMapper.mapGameDomainToFavoriteDomain(input: gameData))
            .receive(on: RunLoop.main)
            .sink { (completion) in
                switch completion {
                
                case .failure:
                    self.errorMessage = String(describing: completion)
                    
                case .finished:
                    self.loadingState = false
                }
            } receiveValue: { _ in
                  self.checkIsFavorite(gameData: gameData)
            }
            .store(in: &cancellables)
        
    }
    
    func deleteFromFavourite(data: GameModel) {
        
        loadingState = true
        detailUseCase.deleteFromFavorite(data: FavoriteMapper.mapGameDomainToFavoriteDomain(input: data))
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.errorMessage = String(describing: completion)
                case .finished:
                    self.loadingState = false
                }
            }, receiveValue: { _ in
               
                self.checkIsFavorite(gameData: self.game)
            })
            .store(in: &cancellables)
    }

    func checkIsFavorite(gameData: GameModel) {
        
        loadingState = true
        detailUseCase.getFavourite()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.errorMessage = String(describing: completion)
                case .finished:
                    self.loadingState = false
                }
            }, receiveValue: { data in
                
                let fav = data.filter {
                    $0.id == gameData.id
                }
                
                if fav.first != nil {
                    
                    self.isFavourite = true
                } else {
                    self.isFavourite = false
                }
            })
            .store(in: &cancellables)
    }
    
}
