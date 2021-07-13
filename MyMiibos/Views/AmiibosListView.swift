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
    @State var searchTerm = ""
    
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
            //            VStack {
            //            SearchBar(searchTerm: $searchTerm)
            NavigationView {
                VStack (alignment: .leading){
                    SearchBar(searchTerm: $searchTerm).padding(.top, 10).padding(.bottom, 4).frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    List  {
                        ForEach(Array(self.amiiboListVM.amiibosDic.keys).sorted(), id: \.self) { series in
                            Section(header: Text("\(series)")) {
                                ForEach(self.amiiboListVM.amiibosDic[series]!.filter({ searchTerm.isEmpty ? true : $0.name.contains(searchTerm) }), id: \.name) { amiibo in
                                    NavigationLink(
                                        destination: AmiiboDetailView(head: amiibo.head, tail: amiibo.tail, color: amiibo.amiiboSeriesColor())) {
                                        AmiiboListRowView.init(name: amiibo.name, series: amiibo.amiiboSeries, logo: amiibo.amiiboSeriesLogo(), logoColor: amiibo.amiiboSeriesColor()).frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    }
                                }
                            }
                        }
                    }
                }
                .listStyle(DefaultListStyle())
                .navigationBarTitle("Amiibos")
                .navigationBarColor(.red)
                
                //            .navigationBarItems(trailing: Button(action: {
                //                print("Fetching amiibos")
                //            }, label: {
                //                Text("Fetch amiibos")
                //            }))
            }
            //            }
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
