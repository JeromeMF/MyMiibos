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
            Color.background
            
            NavigationView {
                List (self.amiiboListVM.amiibos, id: \.name) { amiibo in
                    
                    NavigationLink(
                        destination: AmiiboDetailView(head: amiibo.head, tail: amiibo.tail, color: amiibo.getAmiiboSeriesColor())) {
                        AmiiboListRowView.init(name: amiibo.name, series: amiibo.amiiboSeries, logo: amiibo.getAmiiboSeriesLogo(), logoColor: amiibo.getAmiiboSeriesColor()).frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                }.listStyle(PlainListStyle())
                .navigationBarTitle("Amiibos")
                //            .navigationBarItems(trailing: Button(action: {
                //                print("Fetching amiibos")
                //            }, label: {
                //                Text("Fetch amiibos")
                //            }))
                .navigationBarColor(.red)
            }
            
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

struct NavigationBarModifier: ViewModifier {

    var backgroundColor: UIColor?

    init( backgroundColor: UIColor?) {
        self.backgroundColor = backgroundColor
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = .clear
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }

    func body(content: Content) -> some View {
        ZStack{
            content
            VStack {
                GeometryReader { geometry in
                    Color(self.backgroundColor ?? .clear)
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
        }
    }
}


extension View {

    func navigationBarColor(_ backgroundColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor))
    }

}
