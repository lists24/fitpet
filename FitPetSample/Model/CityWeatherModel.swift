//
//  CityWeatherModel.swift
//  FitPetSample
//
//  Created by 크림버드공주 on 2023/05/17.
//

import Foundation
import Differentiator

struct CityWeather : Codable
{
    var cod : String?
    var message : Int?
    var cng : Int?
    var list : [List]?
    var city : City?
}

struct List : Codable
{
    var weather : [List_Weather]?
    var main : List_Main?
    var dt_txt : String?
}

struct List_Main : Codable
{
    var temp : Float?
    var feels_like : Float?
    var temp_min : Float?
    var temp_max : Float?
}
       
struct List_Weather : Codable
{
    var main : String?
    var descruotuib : String?
    var icon : String?
    
}

struct City : Codable
{
    var id : Int?
    var name : String?
    var coord : City_Coord?
}

struct City_Coord : Codable
{
    var lat : Double?
    var lon : Double?
}

extension CityWeather
{
    static let EMPTY = CityWeather.init(cod: "" , message: 0 , cng: 0, list: [],city: City.EMPTY)
}

extension List
{
    static let EMPTY = List.init(weather: [],main: List_Main.EMPTY,dt_txt: "")
}

extension List : IdentifiableType , Equatable
{
    static func == (lhs: List, rhs: List) -> Bool {
        return lhs.dt_txt == rhs.dt_txt
    }
    
    var identity: String
    {
        return dt_txt ?? ""
    }
}

extension List_Main
{
    static let EMPTY = List_Main.init(temp: 0,feels_like: 0,temp_min: 0, temp_max: 0)
}

extension City
{
    static let EMPTY = City.init(id: 0,name: "",coord: City_Coord.EMPTY)
}

extension City_Coord
{
    static let EMPTY = City_Coord(lat: 0,lon: 0)
}
