//
//  ItemCellViewModel.swift
//  FitPetSample
//
//  Created by 크림버드공주 on 2023/05/19.
//

import Foundation
import RxSwift

class ItemCellViewModel : NSObject
{
    var list : List = List.EMPTY
    let weatherImage : Observable<UIImage?>
    let weather : Observable<String?>
    let temp_min : Observable<String?>
    let temp_max : Observable<String?>
    var date : Observable<String?>?
    
    init(list: List) {
        
        self.weatherImage = Observable.just(UIImage(named: list.weather?[0].icon ?? ""))
        self.weather = Observable.just(list.weather?[0].main ?? "")
        self.temp_max = Observable.just(String(format: "%d °C", Int(floor(list.main?.temp_max ?? 0))))
        self.temp_min = Observable.just(String(format: "%d °C", Int(floor(list.main?.temp_min ?? 0))))
        
        super.init()
        
        let date = DateTimeSetting(list.dt_txt ?? "")
        self.date = Observable.just(date)
    }
    
    private func DateTimeSetting(_ sTime : String) -> String
    {
        guard let date = sTime.toDate() else { return "" }
        
        let dateFormatter_Month = DateFormatter.init()
        dateFormatter_Month.locale = Locale.init(identifier: "en_US")
        dateFormatter_Month.dateFormat = "LLL"
        
        let dateFormatter_Week = DateFormatter.init()
        dateFormatter_Week.locale = Locale.init(identifier: "en_US")
        dateFormatter_Week.dateFormat = "EEE"
        
        let dateFormatter_Hour = DateFormatter.init()
        dateFormatter_Hour.dateFormat = "HH"
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day,.hour,.minute,.second], from: date)
        
        let day = components.day
        let month = dateFormatter_Month.string(from: date)
        let week = dateFormatter_Week.string(from: date)
        let hour = components.hour
        let minute = components.minute
        let second = components.second
        
        if calendar.isDateInToday(date)
        {
            return String(format: "Today %02d:%02d:%02d", hour ?? "",minute ?? "",second ?? "")
        }
        else if calendar.isDateInTomorrow(date)
        {
            return String(format: "Tommorrow %02d:%02d:%02d", hour ?? "",minute ?? "",second ?? "")
        }
        else
        {
            return String(format: "%@ %02d %@ %02d:%02d:%02d",week,day ?? "",month, hour ?? "",minute ?? "",second ?? "")
        }
    }
}
