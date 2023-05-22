//
//  ViewController.swift
//  FitPetSample
//
//  Created by 크림버드공주 on 2023/05/17.
//

import UIKit
import Alamofire
import RxSwift
import RxDataSources
import RxRelay

class ViewController: UIViewController {

    @IBOutlet weak var tbView: UITableView!
    
    let disposeBag = DisposeBag()
    var dataSource : RxTableViewSectionedReloadDataSource<CityWeatherSection>!
    var section : [CityWeatherSection] = []
    
    private var subject : BehaviorRelay<[CityWeatherSection]> = BehaviorRelay(value: [])
    private let appId = "59ac84d1a3c806163e5ccfe3cc3e179a"
    
    let disposedBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TableView Setting
        tbView.register(UINib.init(nibName: "ItemCell", bundle: nil), forCellReuseIdentifier: "ItemCell")
        
        //DataSource Setting
        let dataSource = RxTableViewSectionedReloadDataSource<CityWeatherSection>(configureCell:{
            dataSource , tableView , indexPath , item in
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
            cell.selectionStyle = .none
            cell.weatherList = item
            
            return cell
        })
        
        subject.accept(section)
        
        dataSource.titleForHeaderInSection = {
            dataSource,index in
            return dataSource.sectionModels[index].header
        }
        
        self.dataSource = dataSource
        
        tbView.rx.setDelegate(self).disposed(by: disposeBag)
        
        subject.bind(to: tbView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)
        
        // 서울
        var seoulWeatherParams : [String:Any] = [:]
        seoulWeatherParams.updateValue("Seoul", forKey: "q")
        seoulWeatherParams.updateValue(appId, forKey: "appid")
        seoulWeatherParams.updateValue("metric", forKey: "units")
        
        let seoulWeather = NetworkManager.shared.get("data/2.5/forecast", seoulWeatherParams, CityWeather.self, .get)
        seoulWeather.subscribe(
            onNext: {
                data in
                
                self.section.append(CityWeatherSection.init(header: data.city?.name ?? "", items: data.list ?? []))
                self.subject.accept(self.section)
            },
            onError: {
                error in
                
                print(error.localizedDescription)
            }
        ).disposed(by: disposedBag)
        
        // 런던
        var londonWeatherParams : [String : Any] = [:]
        londonWeatherParams.updateValue("London", forKey: "q")
        londonWeatherParams.updateValue(appId, forKey: "appid")
        londonWeatherParams.updateValue("metric", forKey: "units")
        
        let londonWeather = NetworkManager.shared.get("data/2.5/forecast", londonWeatherParams, CityWeather.self, .get)
        londonWeather.subscribe(
            onNext: {
                data in
                
                self.section.append(CityWeatherSection.init(header: data.city?.name ?? "", items: data.list ?? []))
                self.subject.accept(self.section)
            },
            onError: {
                error in
                
                print(error.localizedDescription)
            }
        ).disposed(by: disposedBag)
        
        // 시카고
        var chicagoWeatherParams : [String : Any] = [:]
        chicagoWeatherParams.updateValue("Chicago", forKey: "q")
        chicagoWeatherParams.updateValue(appId, forKey: "appid")
        chicagoWeatherParams.updateValue("metric", forKey: "units")
        
        let chicagoWeather = NetworkManager.shared.get("data/2.5/forecast", chicagoWeatherParams, CityWeather.self, .get)
        chicagoWeather.subscribe(
            onNext: {
                data in
                
                self.section.append(CityWeatherSection.init(header: data.city?.name ?? "", items: data.list ?? []))
                self.subject.accept(self.section)
            },
            onError: {
                error in
                
                print(error.localizedDescription)
            }
        ).disposed(by: disposedBag)
    }


}

extension ViewController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}

