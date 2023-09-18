//
//  APIManager.swift
//  SeSAC_MVVM_Practice
//
//  Created by 문정호 on 2023/09/14.
//

import Foundation
import Alamofire

struct APIManager{
    static let shared = APIManager()
    
    private init(){}
    
    func requestAlamofireLottoAPI(drwNo: Int, completionHandler: @escaping (LottoModel)->()){
        let baseURL = "https://www.dhlottery.co.kr/common.do"
        guard drwNo > 1000 else {
            print("잘못 된 입력입니다.")
            return
        }
        guard let url = URL(string: baseURL+"?method=getLottoNumber&drwNo=\(drwNo)") else {return}
        
        AF.request(url).validate().responseDecodable(of: LottoModel.self) { response in
            switch response.result{
            case .success(let value):
                completionHandler(value)
            case .failure(let error):
                print(error)
            }
        }

    }
    
    func requestUnsplashRandomAPI( completionHandler: @escaping (PhotoResult) -> ()){
        guard let url = URL(string: "https://api.unsplash.com/photos/random") else { return }
        
        let header: HTTPHeaders = ["Authorization": "Client-ID \(APIKeys.unsplashKey)"]
        AF.request(url, headers: header).validate().responseDecodable(of: PhotoResult.self) { response in
            switch response.result {
            case .success(let value):
                completionHandler(value)
            case .failure(let error):
                print(error)
            }
        }
        
    }
}
