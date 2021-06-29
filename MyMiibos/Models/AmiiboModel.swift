//
//  AmiiboModel.swift
//  MyMiibos
//
//  Created by Jérôme Figueiredo on 25/06/2021.
//

import Foundation

// MARK: - Amiibos List
struct AmiiboList: Codable {
    let amiibo: [Amiibo]
}

struct SingleAmiibo: Codable {
    let amiibo: Amiibo
}

// MARK: - Amiibo
struct Amiibo: Codable {
    let amiiboSeries: String
    let character: String
    let gameSeries: String
    let head: String
    let image: String
    let name: String
//    let release: Release
    let tail: String
    let type: String
}

// MARK: - Release
struct Release: Codable, Hashable  {
    let au : String?
    let eu : String?
    let jp : String?
    let na : String?
}

extension SingleAmiibo {
    
    static func placeholder() -> SingleAmiibo {
        return SingleAmiibo(amiibo: Amiibo(amiiboSeries: "N/A", character: "N/A", gameSeries: "N/A", head: "", image: "", name: "Loading...", tail: "", type: "N/A"))
    }
}

