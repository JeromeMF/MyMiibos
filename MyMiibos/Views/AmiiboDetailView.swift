//
//  AmiiboDetailView.swift
//  MyMiibos
//
//  Created by Jérôme Figueiredo on 29/06/2021.
//

import SwiftUI

struct AmiiboDetailView: View {
    
    @ObservedObject private var amiiboDetailVM: AmiiboDetailViewModel
    
    var head: String
    var tail: String
    
    var amiibotest: Amiibo = Amiibo(amiiboSeries: "Super Smash Bros.", character: "Mario", gameSeries: "Super Mario", head: "00000000", image: "https://raw.githubusercontent.com/N3evin/AmiiboAPI/master/images/icon_00000000-00000002.png", name: "Mario", tail: "00000002", type: "Figure")
    
    init(head: String, tail: String) {
        self.amiiboDetailVM = AmiiboDetailViewModel()
        self.head = head
        self.tail = tail
    }
    
    var body: some View {
        VStack {
            HStack {
                Image("mushroom").resizable().aspectRatio(contentMode: .fit).aspectRatio(1, contentMode: .fit).foregroundColor(.red).padding(.trailing, 10.0).frame(minWidth: 0, idealWidth: 300, maxWidth: 400, minHeight: 70, idealHeight: 80, maxHeight: 80, alignment: .trailing)
                Spacer()
            }
            
            //            HStack {
            Image("bowser").resizable().scaledToFit().shadow(radius: 15)
            //                Image(uiImage: amiiboDetailVM.loadImage()).aspectRatio(contentMode: .fit).background(Rectangle()).foregroundColor(.orange).overlay(Rectangle().stroke(Color.blue, lineWidth: 4))
            //                Spacer()
            //            }
            Text(amiibotest.amiiboSeries)
            Text(amiibotest.gameSeries)
            Spacer()
        }.onAppear {
            self.amiiboDetailVM.fetchAmiiboDetail(amiiboHead: head, amiiboTail: tail)
        }.navigationTitle(amiiboDetailVM.name)
//        .navigationBarItems(trailing: Image("mushroom").imageScale(.sma)
    }
}

struct AmiiboDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AmiiboDetailView(head: "", tail: "")
    }
}
