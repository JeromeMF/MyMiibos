//
//  AmiiboDetailText.swift
//  MyMiibos
//
//  Created by Jérôme Figueiredo on 30/06/2021.
//

import SwiftUI

struct AmiiboDetailText: View {
    
    var amiiboSeries: String
    var gameSeries: String
    var type: String
    
    var body: some View {
        VStack(spacing: 30) {
            VStack{
                Text("Amiibo series:").font(.system(size: 23)).fontWeight(.bold).padding(.leading, 15)
                Text(amiiboSeries).font(.system(size: 26)).fontWeight(.light)
            }
            VStack {
                Text("Game series:").font(.system(size: 23)).fontWeight(.bold).padding(.leading, 15)
                Text(gameSeries).font(.system(size: 26)).fontWeight(.light)
            }
            VStack (alignment: .center){
                Text("Type:").font(.system(size: 23)).fontWeight(.bold)
                Text(type).font(.system(size: 26)).fontWeight(.light)
            }
        }.minimumScaleFactor(0.1)
    }
}

struct AmiiboDetailText_Previews: PreviewProvider {
    static var previews: some View {
        AmiiboDetailText(amiiboSeries: "Super Smash Bros.", gameSeries: "The Legend of Zelda", type: "Figure")
    }
}
