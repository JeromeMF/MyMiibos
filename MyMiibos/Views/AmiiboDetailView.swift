//
//  AmiiboDetailView.swift
//  MyMiibos
//
//  Created by Jérôme Figueiredo on 29/06/2021.
//

import SwiftUI

struct AmiiboDetailView: View {
    
    @ObservedObject var amiiboDetailVM: AmiiboDetailViewModel
    
    var head: String
    var tail: String
    var color: Color
    
    init(head: String, tail: String, color: Color) {
        self.amiiboDetailVM = AmiiboDetailViewModel()
        self.head = head
        self.tail = tail
        self.color = color
//        UINavigationBar.appearance().backgroundColor = UIColor(color)
    }
    
    var body: some View {
        VStack(spacing: 50) {
            //            HStack {
            //            Image().resizable().scaledToFit().shadow(radius: 15).frame(width: 300, height: 300, alignment: .center)
            Image(uiImage: amiiboDetailVM.loadImage()).resizable().scaledToFit().frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).shadow(radius: 30)//.background(Rectangle()).foregroundColor(.orange).overlay(Rectangle().stroke(Color.gray, lineWidth: 4)).shadow(radius: 15)
            
            AmiiboDetailText(amiiboSeries: amiiboDetailVM.amiiboSeries, gameSeries: amiiboDetailVM.gameSeries, type: amiiboDetailVM.type)
            Spacer()
        }
        .padding(.top, 50.0)
        .onAppear {
            self.amiiboDetailVM.fetchAmiiboDetail(amiiboHead: head, amiiboTail: tail)
        }.navigationTitle(amiiboDetailVM.name).minimumScaleFactor(0.5)
        //        .navigationBarItems(trailing: Image("mushroom").imageScale(.sma)
        .navigationBarColor(UIColor(color))
    }
}

struct AmiiboDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AmiiboDetailView(head: "0008ff00", tail: "023b0702", color: .blueMegaMan)
    }
}
