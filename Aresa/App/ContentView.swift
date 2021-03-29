//
//  ContentView.swift
//  Aresa
//
//  Created by aamaulana10 on 25/03/21.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var homePresenter: HomePresenter
    var body: some View {
        HomeView(presenter: homePresenter)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
