//
//  NetworkManager.swift
//  FitPetSample
//
//  Created by 크림버드공주 on 2023/05/18.
//

import Foundation
import RxSwift
import Alamofire

class NetworkManager : NSObject
{
    static let shared = NetworkManager()
    
    let baseURL = URL.init(string: "http://api.openweathermap.org/")!
    
    func get<T:Codable>(_ path : String ,_ params : [String : Any]? ,_ type : T.Type,_ methodType : HTTPMethod) -> Observable<T>
    {
        return Observable<T>.create{
            observer in
            
            let url = self.baseURL.appendingPathComponent(path)
            
            let dataRequest = AF.request(url , method: methodType , parameters: params , encoding: URLEncoding.default,headers: nil)
                .validate(contentType: ["text/html","application/json","text/json","text/javascript"])
                .responseDecodable(of: type.self)
            {
                response in
                
                switch response.result
                {
                case .success(let data):
                    observer.onNext(data)
                case .failure(let error):
                    observer.onError(error)
                }
                
                observer.onCompleted()
            }
            
            return Disposables.create {
                dataRequest.cancel()
            }
        }
    }
    
}
