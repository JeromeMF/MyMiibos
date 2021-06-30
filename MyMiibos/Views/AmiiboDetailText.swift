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
        VStack(spacing: 20) {
            HStack{
                Text("Amiibo series: ").font(.system(size: 25)).fontWeight(.bold).padding(.leading, 15)
                Text(gameSeries).font(.system(size: 25)).fontWeight(.light)
                Spacer()
            }
            HStack {
                Text("Game series: ").font(.system(size: 25)).fontWeight(.bold).padding(.leading, 15)
                Text(gameSeries).font(.system(size: 25)).fontWeight(.light)
                Spacer()
            }
            HStack {
                Text("Type: ").font(.system(size: 25)).fontWeight(.bold).padding(.leading, 15)
                Text(type).font(.system(size: 25)).fontWeight(.light).padding(.trailing, 30)
                Spacer()
            }
        }.minimumScaleFactor(0.1)
    }
}

struct AmiiboDetailText_Previews: PreviewProvider {
    static var previews: some View {
        AmiiboDetailText(amiiboSeries: "Super Smash Bros.", gameSeries: "The Legend of Zelda", type: "Figure")
    }
}
