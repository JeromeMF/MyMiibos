//
//  AmiiboListRowView.swift
//  MyMiibos
//
//  Created by Jérôme Figueiredo on 29/06/2021.
//

import SwiftUI

struct AmiiboListRowView: View {
    
    var name: String
    var logo: Image
    
    var body: some View {
        HStack{
//            Image("zelda").resizable().padding(.all).background(Rectangle().foregroundColor(.red)).frame(width: 80.0, height: 80.0).foregroundColor(.black)
            logo.resizable().padding(.all).frame(width: 60.0, height: 60.0).foregroundColor(.yellow).offset(x: -5, y: 0)
            Text(name).font(.system(size: 23)).fontWeight(.bold).lineLimit(1).padding(.leading, -12.0).minimumScaleFactor(0.5)
            Spacer()
        }
    }
}

struct AmiiboListRowView_Previews: PreviewProvider {
    static var previews: some View {
        AmiiboListRowView(name: "Mario Sunshine Very Long", logo: Image("zelda")).previewLayout(.fixed(width: 320, height: 60))
    }
}
