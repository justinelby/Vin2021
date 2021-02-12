//
//  Wine.swift
//  Vin21
//
//  Created by Justine Loubry on 10/02/2021.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift


struct Wine: Identifiable, Codable {
    @DocumentID var id: String?
    let title: String
    let producer: String
    let region: String
    let type: String
    let millesime: String
    let number: Int
    let place: String
    let comment: String
    let cepage: String
    let when: String
    let color: String
    let before: Int
    
    static func test() -> Wine{
        Wine(
            id: .none,
            title: "Test",
            producer: "Test",
            region: "",
            type: "",
            millesime: "1996",
            number: 1,
            place: "",
            comment: "",
            cepage: "",
            when: "",
            color: "pink",
            before: 2022
        )
    }
}
