//
//  FitPetSampleTests.swift
//  FitPetSampleTests
//
//  Created by 크림버드공주 on 2023/05/17.
//

import XCTest
import RxSwift
import Alamofire

@testable import FitPetSample

final class FitPetSampleTests: XCTestCase {
    
    var sut : NetworkManager!
    
    private let appId = "59ac84d1a3c806163e5ccfe3cc3e179a"
    private var VC : ViewController!
    private let disposedBag = DisposeBag()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = NetworkManager.shared
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        VC = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
    }
    
    // NetworkManager Test - Seoul
    func testSeoulFetching()
    {
        let expection = XCTestExpectation.init(description: "Seoul unit test expectation")
        
        var seoulWeatherParams : [String:Any] = [:]
        seoulWeatherParams.updateValue("Seoul", forKey: "q")
        seoulWeatherParams.updateValue(appId, forKey: "appid")
        seoulWeatherParams.updateValue("metric", forKey: "units")
        
        let seoulWeather = sut.get("data/2.5/forecast", seoulWeatherParams, CityWeather.self, .get)
        seoulWeather.subscribe(
            onNext: {
                data in
                
                XCTAssertEqual("Seoul", data.city?.name)
            },
            onError: {
                error in
                
                expection.fulfill()
            }
        ).disposed(by: disposedBag)
    }
    
    // NetworkManager Test - London
    func testLondonFetching()
    {
        
        let expection = XCTestExpectation.init(description: "Seoul unit test expectation")
        
        var londonWeatherParams : [String : Any] = [:]
        londonWeatherParams.updateValue("London", forKey: "q")
        londonWeatherParams.updateValue(appId, forKey: "appid")
        londonWeatherParams.updateValue("metric", forKey: "units")
        
        let londonWeather = sut.get("data/2.5/forecast", londonWeatherParams, CityWeather.self, .get)
        londonWeather.subscribe(
            onNext: {
                data in
                
                XCTAssertEqual("London", data.city?.name)
            },
            onError: {
                error in
                
                expection.fulfill()
                
            }
        ).disposed(by: disposedBag)
    }
    
    // NetworkManager Test - Chicago
    func testChicagoFetching()
    {
        let expection = XCTestExpectation.init(description: "Chicago unit test expectation")
        
        var chicagoWeatherParams : [String : Any] = [:]
        chicagoWeatherParams.updateValue("Chicago", forKey: "q")
        chicagoWeatherParams.updateValue(appId, forKey: "appid")
        chicagoWeatherParams.updateValue("metric", forKey: "units")
        
        let chicagoWeather = sut.get("data/2.5/forecast", chicagoWeatherParams, CityWeather.self, .get)
        chicagoWeather.subscribe(
            onNext: {
                data in
                
                XCTAssertEqual("Chicago", data.city?.name)
            },
            onError: {
                error in
                
                expection.fulfill()
            }
        ).disposed(by: disposedBag)
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
