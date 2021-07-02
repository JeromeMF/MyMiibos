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
    @Published var amiibosDic = [String: [Amiibo]]()
    @Published var amiibosBySeries = [Amiibo]()
    
    private var cancellable: AnyCancellable?
    
    init() {
        fetchAllAmiibos()
    }
    
    func fetchAllAmiibos() {
        self.cancellable = ApiWebservice().getAllAmiibos()
            .sink (receiveCompletion:  {_ in }, receiveValue: { values in
                self.amiibos = values.amiibo
            })
    }
    
    func fetchAmiibosGroupedByAmiiboSeries() {
        self.cancellable = ApiWebservice().getAllAmiibos()
            .sink (receiveCompletion:  {_ in }, receiveValue: { values in
                
                let groupBySeries = Dictionary(grouping: values.amiibo, by: \.amiiboSeries)
                self.amiibosDic = groupBySeries
            })
    }
    
    func filterAmiibosByAmiiboSeries(series: String) {
        self.cancellable = ApiWebservice().getAllAmiibos()
            .sink (receiveCompletion:  {_ in }, receiveValue: { values in
                
                let groupBySeries = Dictionary(grouping: values.amiibo, by: \.amiiboSeries)[series]
                
                guard let goupedAmiibos = groupBySeries else { return }
                self.amiibosBySeries = goupedAmiibos
            })
    }
}
