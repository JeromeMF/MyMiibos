//
//  AmiibosListView.swift
//  MyMiibos
//
//  Created by Jérôme Figueiredo on 25/06/2021.
//

import SwiftUI
import Combine

struct AmiibosListView: View {
    
    @ObservedObject var amiiboListVM = AmiibosListViewModel()
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(displayP3Red: 230/255, green: 0/255, blue: 18/255, alpha: 1.0)
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//        UINavigationBar.appearance().largeTitleTextAttributes.
    }
    
    var body: some View {
        NavigationView {
            List (self.amiiboListVM.amiibos, id: \.name) { amiibo in
                
                NavigationLink(
                    destination: AmiiboDetailView(head: amiibo.head, tail: amiibo.tail)) {
                    AmiiboListRowView.init(name: amiibo.name, logo: amiibo.getAmiiboSeriesLogo()).frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
            }
            .navigationBarTitle("Amiibos")
            //            .navigationBarItems(trailing: Button(action: {
            //                print("Fetching amiibos")
            //            }, label: {
            //                Text("Fetch amiibos")
            //            }))
            
        }
        
        
    }
}

struct AmiibosListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AmiibosListView()
        }
    }
}
