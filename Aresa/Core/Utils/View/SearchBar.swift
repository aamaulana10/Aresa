//
//  SearchBar.swift
//  Aresa
//
//  Created by aamaulana10 on 29/03/21.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var placeSearchText: String
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            
            TextField("Search game", text: $placeSearchText)
                .font(.system(size: 13))
                .foregroundColor(.gray)
                .padding(7)
                .frame(height: 50)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(25)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.mainColor)
                            .frame(
                                minWidth: 0,
                                maxWidth: .infinity,
                                alignment: .leading
                            )
                            .padding(.leading, 8)
                        
                        if isEditing {
                            Button(action: {
                                self.placeSearchText = ""
                                
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
            
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.placeSearchText = ""
                    
                    UIApplication.shared.sendAction(
                        #selector(UIResponder.resignFirstResponder),
                        to: nil,
                        from: nil,
                        for: nil
                    )
                }) {
                  Text("Cancel").foregroundColor(.white).bold()
                }
                .padding(.trailing, 10)
            }
        }.padding(EdgeInsets(
            top: 16,
            leading: 8,
            bottom: 8,
            trailing: 8
        )
        )
        
    }
}
