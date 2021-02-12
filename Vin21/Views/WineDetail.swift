//
//  WineDetail.swift
//  Vin21
//
//  Created by Justine Loubry on 12/02/2021.
//

import Foundation
import SwiftUI


struct WineDetail: View {
    let model: Model
    let wine: Wine
    
    var body: some View {
        HStack {
            navigationTitle("Fiche produit")
            Text("Nom du titre : \(wine.title)")
            Text("Nom du producteur : \(wine.producer)")
            Text("Nom de la région : \(wine.region)")
            Text("Millésime : \(wine.millesime)")
            Text("A consommer avant : \(wine.before)")
            
            Spacer()
//            Button("Delete") {
//                guard let wineId = wine.id else { return }
//                model.deleteWine(id: wineId)
//            }
        }
    }
}
