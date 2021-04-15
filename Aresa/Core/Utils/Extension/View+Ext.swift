//
//  View+Ext.swift
//  Aresa
//
//  Created by aamaulana10 on 31/03/21.
//

import SwiftUI

extension View {
    
    func hasScrollEnabled(_ value: Bool) -> some View {
        self.onAppear {
            UITableView.appearance().isScrollEnabled = value
        }
    }
}
