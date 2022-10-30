//
//  LOLAPI.swift
//  LeagueofLegendApp
//
//  Created by 박호현 on 2022/10/27.
//

import Foundation

let apiKey = "RGAPI-a40f5f52-90b7-4860-806d-a9dcb4557669"

class LoLAPI {
   class func callAPI(completion: @escaping (WelcomeElement) -> Void) {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let urlString = "https://kr.api.riotgames.com/lol/champion-mastery/v4/champion-masteries/by-summoner/B5JrmMGdlL2FTTIFRzFDy-hJahMIuxFoZxzIwpTKhqN5dw"

        guard let url = URL(string: urlString) else { return }
        
        let dataTask = session.dataTask(with: url) { data, response, error in
            let successRange = 200..<300
            guard error == nil, let statusCode = (response as? HTTPURLResponse)?.statusCode, successRange.contains(statusCode) else {
                return
            }
            
            // 파싱하는 부분
            guard let resultData = data else {
                return
            }
            print("나타나\(resultData)")
            let decoder = JSONDecoder()
            let decodedData = try! decoder.decode(WelcomeElement.self, from: resultData)
            print("얼마나오냐\(decodedData)")
            DispatchQueue.main.async {
                completion(decodedData)
            }
        }
        dataTask.resume()
    }
}
