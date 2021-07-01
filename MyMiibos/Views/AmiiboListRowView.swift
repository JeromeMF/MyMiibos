//
//  AmiiboListRowView.swift
//  MyMiibos
//
//  Created by Jérôme Figueiredo on 29/06/2021.
//

import SwiftUI

struct AmiiboListRowView: View {
    
    var name: String
    var series: String
    var logo: Image
    var logoColor: Color
    
    var body: some View {
        HStack{
            logo.resizable().padding(.all).frame(width: 60.0, height: 60.0).foregroundColor(logoColor).offset(x: -5, y: 0)
            VStack (alignment: .leading) {
                Text(name).font(.system(size: 23)).fontWeight(.bold).lineLimit(1).padding(.leading, -12.0).minimumScaleFactor(0.5)
                Text(series).font(.system(size: 20)).fontWeight(.semibold).lineLimit(1).padding(.leading, -12.0).minimumScaleFactor(0.5)
            }
            Spacer()
        }
    }
}

struct AmiiboListRowView_Previews: PreviewProvider {
    static var previews: some View {
        AmiiboListRowView(name: "Mario Sunshine Very Long", series: "Super nintendo world", logo: Image("zelda"), logoColor: .greenZelda).previewLayout(.fixed(width: UIScreen.main.bounds.width, height: 60))
    }
}
