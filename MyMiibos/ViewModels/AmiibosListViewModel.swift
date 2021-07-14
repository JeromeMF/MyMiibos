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
//    @Published var amiiboSeries = [String]()
    
    private var cancellable: AnyCancellable?
    
    init() {
        //        fetchAllAmiibos()
        fetchAmiibosGroupedByAmiiboSeries()
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
                
                let groupBySeries = Dictionary(grouping: values.amiibo.sorted{ $0.name < $1.name}, by: \.amiiboSeries) // Ex: ["Link OoT": [ZeldaAmiibo1, ZeldaAmiibo2, etc]]()
                self.amiibosDic = groupBySeries                
            })
    }
    
    //    func fetchAmiibosSeries() {
    //        self.cancellable = ApiWebservice().getAllAmiibos()
    //            .sink (receiveCompletion:  {_ in }, receiveValue: { values in
    //                
    //                let uniqueValues = Array(Set(values.amiibo.map{ $0.amiiboSeries }))
    //                
    //                let alphabeticalSeriesArray = uniqueValues.sorted { $0 < $1 }
    //                
    //                self.amiiboSeries = alphabeticalSeriesArray
    //            })
    //    }
    //    
    //    func filterAmiibosByAmiiboSeries(series: String) {
    //        self.cancellable = ApiWebservice().getAllAmiibos()
    //            .sink (receiveCompletion:  {_ in }, receiveValue: { values in
    //
    //                let groupBySeries = Dictionary(grouping: values.amiibo, by: \.amiiboSeries)[series]
    //
    //                guard let goupedAmiibos = groupBySeries else { return }
    //                self.amiibosBySeries = goupedAmiibos
    //
    //
    //            })
    //    }
    //
    //    func fetchAmiibosBy(amiiboSeries: String) {
    //        self.cancellable = ApiWebservice().getAmiibosBy(amiiboSeries: amiiboSeries)
    //            .sink(receiveCompletion: { _ in }, receiveValue: { values in
    //
    //                self.amiibosBySeries = values.amiibo
    //
    ////                print(values.amiibo)
    //            })
    //    }
}
