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
    }
    
    var body: some View {
        NavigationView {
            List (self.amiiboListVM.amiibos, id: \.name) { amiibo in
                
                NavigationLink(
                    destination: AmiiboDetailView(head: amiibo.head, tail: amiibo.tail)) {
//                    Text("\(amiibo.name)")
                    AmiiboListRowView.init(name: amiibo.name)
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
        AmiibosListView()
    }
}
