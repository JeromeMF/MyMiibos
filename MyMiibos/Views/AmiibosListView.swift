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
    
//    init() {
//        UINavigationBar.appearance().backgroundColor = UIColor(displayP3Red: 230/255, green: 0/255, blue: 18/255, alpha: 1.0)
//        UINavigationBar.appearance().tintColor = .white
//        UINavigationBar.appearance().barTintColor = .red
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//    }
    
    var body: some View {
        
        ZStack {
            Color.backgroundColor
            NavigationView {
                List  {
                    ForEach(self.amiiboListVM.amiibos, id:\.name) { amiibo in
//                    }
//                    }
//                (self.amiiboListVM.amiibos, id: \.name) { amiibo in
                        NavigationLink(
                            destination: AmiiboDetailView(head: amiibo.head, tail: amiibo.tail, color: amiibo.amiiboSeriesColor())) {
                            AmiiboListRowView.init(name: amiibo.name, series: amiibo.amiiboSeries, logo: amiibo.amiiboSeriesLogo(), logoColor: amiibo.amiiboSeriesColor()).frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                    }
            }
                    .listStyle(GroupedListStyle())
                    .navigationBarTitle("Amiibos")
                    .navigationBarColor(.red)
                
                    //            .navigationBarItems(trailing: Button(action: {
                    //                print("Fetching amiibos")
                    //            }, label: {
                    //                Text("Fetch amiibos")
                    //            }))
                    
            }
        }
    }
}

struct ListHeader: View {
    var body: some View {
        HStack {
            Image(systemName: "map")
            Text("Hiking Trails in Silicon Valley")
        }
    }
}

struct ListFooter: View {
    var body: some View {
        Text("Remember to pack plenty of water and bring sunscreen.")
    }
}

struct AmiibosListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AmiibosListView()
                
            
        }
    }
}
