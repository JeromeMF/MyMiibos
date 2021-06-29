//
//  AmiibosListViewModel.swift
//  MyMiibos
//
//  Created by Jérôme Figueiredo on 25/06/2021.
//

import Foundation
import Combine

class AmiibosListViewModel: ObservableObject {
    
    @Published var amiibos = [Amiibo]()
    private var cancellable: AnyCancellable?
    
        init() {
            fetchAllAmiibos()
        }
    
    func fetchAllAmiibos() {
        self.cancellable = ApiWebservice().getAllAmiibos()
            .sink (receiveCompletion:  {_ in }, receiveValue: { values in
                
//                for am in value.amiibo {
//                    print(am.name)
//                }
//                print("\(value)")
                self.amiibos = values.amiibo
                
            })
    }
}
