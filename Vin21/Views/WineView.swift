//
//  WineView.swift
//  Vin21
//
//  Created by Justine Loubry on 10/02/2021.
//

import Foundation
import SwiftUI

struct WineView: View {
    let model: Model
    let wine: Wine
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if wine.color == "rouge" {
                    Image("red-bottle")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 10, height: 30, alignment: .center)
                } else if wine.color == "blanc" {
                    Image("white-bottle")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 10, height: 30, alignment: .center)
                } else if wine.color == "rose" {
                    Image("pink-bottle")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 10, height: 30, alignment: .center)
                }
                    
                Text("x")
                    .bold()
                    .font(Font.system(size: 12.5))
                Text(String(wine.number))
                    .font(Font.system(size: 12.5))
                    .bold()
                Text(wine.title)
                    .font(Font.system(size: 12.5))
 
                if wine.producer != "" {
                    Text(wine.producer)
                        .font(Font.system(size: 12.5))
                }
                if wine.millesime != "" {
                    Text(" - \(wine.millesime)")
                        .font(Font.system(size: 12.5))
                }
            
                    VStack{
                        Image("warning")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30.0, height: 30.0)
                        Text("avant \(String(wine.before))")
                            .font(Font.system(size: 10.5))
                    }
            }
        }
    }
}
