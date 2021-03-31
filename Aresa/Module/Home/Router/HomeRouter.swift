//
//  HomeRouter.swift
//  Aresa
//
//  Created by aamaulana10 on 31/03/21.
//

import SwiftUI

class HomeRouter {
    
    func makeDetailView(for game: GameModel) -> some View {
        
        let detailUseCase = Injection.init().provideDetail(game: game)
        let presenter = DetailPresenter(detailUseCase: detailUseCase)
        
        return DetailView(presenter: presenter)
    }
    
}
