//
//  ContentView.swift
//  Vin21
//
//  Created by Justine Loubry on 08/02/2021.
//



import SwiftUI
import Firebase

struct ContentView: View {
    @ObservedObject var model: Model
    // Etat définissant l'affichage de la vue de login
    @State var isShowingLogin: Bool
    
    var body: some View {
               
        VStack {
            
            if (model.user?.email == .none) {
                Text("Hello, world!")
                    .multilineTextAlignment(.trailing)
                    .padding()
                    .font(Font.system(size: 13.5))
            } else {
                Text("TCHIN, \(model.user!.email!)")
                    .padding()
                    .multilineTextAlignment(.trailing)
                    .font(Font.system(size: 12.5))
            }
                       
//            Button("Add Wine") {
//                model.add(wine: Wine.test())
//            }.padding()
                     

            
            TabView{
                SuggestionView(model: model, wine: Wine.test())
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Accueil")
                    }
                
                Text("Ma cave")
                    .tabItem {
                        Image("wine-shelf")
                        Text("Ma cave")
                    }
                
                Text("Mes vins")
                    .tabItem {
                        Image("glass-with-wine")
                        Text("Mes vins")
                    }
                
                Text("Recherche")
                    .tabItem {
                        Image("loupe")
                        Text("Recherche")
                    }
            }            
        }
        
        
        // Observation de la valeur de model.user
        // Si user est défini, isShowingLogin prend la valeur false
        // Si user n'est pas défini, isShowingLogin prend la valeur true
        .onChange(of: model.user) { (user) in
            isShowingLogin = model.noSignedUser
        }
        
        // La vue LoginView est affichée par dessus VStack lorsque isShowingLogin est vrai
        .sheet(isPresented: $isShowingLogin) {
            LoginView(model: model)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let model = Model()
        return ContentView(model: model, isShowingLogin: model.noSignedUser)
    }
}
