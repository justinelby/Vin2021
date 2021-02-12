//
//  SuggestionView.swift
//  Vin21
//
//  Created by Justine Loubry on 11/02/2021.
//

import Foundation
import SwiftUI

struct SuggestionView: View {
    @ObservedObject var model: Model
    let wine: Wine
    
    var body: some View {
        
        VStack() {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 130.0, height: 50.0)
            
//            Text("Suggestions")
//                .font(.title)
//            Text("A consommer bientôt")
//                .font(Font.system(size: 13.5))
            
            HStack(){
                
                // On affiche les vins qui doivent être un consommés dans maximum un an ou moins
                if((wine.before) - 2021 <= 1) {
                    
                    //On affiche une bouteille de la couleur du vin qui s'affiche
                    //                        if (wine.color == "rouge") {
                    //                        Image("red-bottle")
                    //                            .resizable()
                    //                            .aspectRatio(contentMode: .fill)
                    //                            .frame(width: 10.0, height: 30.0)}
                    //
                    //                        else if (wine.color == "rose") {
                    //                            Image("pink-bottle")
                    //                                .resizable()
                    //                                .aspectRatio(contentMode: .fill)
                    //                                .frame(width: 10.0, height: 30.0)
                    //                        } else {
                    //                            Image("white-bottle")
                    //                                .resizable()
                    //                                .aspectRatio(contentMode: .fill)
                    //                                .frame(width: 10.0, height: 30.0)}
                    
                    NavigationView {
                        
                        List(model.wines) { wine in
                            NavigationLink(destination: WineDetail(model: model, wine: wine)) {
                                WineView(model: model, wine: wine)
                            }
                        }.navigationBarTitleDisplayMode(.large)
                        .toolbar { // <2>
                                    ToolbarItem(placement: .principal) { // <3>
                                        VStack {
                                            Text("Suggestions").font(.headline)
                                            Text("A consommer bientôt").font(.subheadline)
                                        }
                                    }
                                }
                    }
                }
                
                else {
                    Text("No suggestions today")
                }
            }
            .frame(width: nil)
            
            
            Image("bottles")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 138.0, height: 100.0)
            
            Button("Add Wine") {
                model.add(wine: Wine.test())
            }.padding()
            
            Button("Sign Out") {
                model.signOut()
            }
        }
        
        // Sign Out sans Future
        //                do {
        //                    try Auth.auth().signOut()
        //                    model.user = .none
        //                } catch {
        //                    print("Sign Out Error: \(error.localizedDescription)")
        //                }
    }
}


struct SuggestionView_Previews: PreviewProvider {
    static var previews: some View {
        let model = Model()
        return SuggestionView(model: model, wine: Wine.test())
    }
}
