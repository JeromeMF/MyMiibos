//
//  AmiiboListRowView.swift
//  MyMiibos
//
//  Created by Jérôme Figueiredo on 29/06/2021.
//

import SwiftUI

struct AmiiboListRowView: View {
    
    var name: String
    
    var body: some View {
        HStack{
            Image("zelda").resizable().padding(.all).background(Rectangle().foregroundColor(.red)).frame(width: 80.0, height: 80.0).foregroundColor(.black)
            Text(name).font(.system(size: 30)).fontWeight(.bold).lineLimit(1).padding(.leading).minimumScaleFactor(0.5)
            Spacer()
        }
    }
}

struct AmiiboListRowView_Previews: PreviewProvider {
    static var previews: some View {
        AmiiboListRowView(name: "Mario").previewLayout(.fixed(width: 500, height: 80))
    }
}
