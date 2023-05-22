//
//  SectionModel.swift
//  FitPetSample
//
//  Created by 크림버드공주 on 2023/05/19.
//

import Foundation
import RxDataSources

struct CityWeatherSection
{
    var header : String
    var items : [List]
}

extension CityWeatherSection : AnimatableSectionModelType
{
    typealias Item = List
    var identity: String{ return header }
    
    init(original: CityWeatherSection, items: [List]) {
        self = original
        self.items = items
    }
    
}
