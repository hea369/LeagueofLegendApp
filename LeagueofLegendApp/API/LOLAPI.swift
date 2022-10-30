//
//  LOLAPI.swift
//  LeagueofLegendApp
//
//  Created by 박호현 on 2022/10/27.
//

// URL ssecion 통신





//import Foundation
//import Alamofire
//
//let apiKey = "RGAPI-f8aa7694-24de-44fc-b30f-5a1e913585d3"
//
//class LoLAPI {
//   class func callAPI(completion: @escaping (LOLChampion) -> Void) {

//        let config = URLSessionConfiguration.default
//        let session = URLSession(configuration: config)
//        let urlString = "http://ddragon.leagueoflegends.com/cdn/12.20.1/data/ko_KR/champion.json"
//
//        guard let url = URL(string: urlString) else { return }
       
//       var request = URLRequest(url: url)
//       request.httpMethod = "GET"
//       request.setValue("RGAPI-f8aa7694-24de-44fc-b30f-5a1e913585d3", forHTTPHeaderField: "X-Riot-Token")
//
//        let dataTask = session.dataTask(with: url) { data, response, error in
//            let successRange = 200..<300
//            guard error == nil, let statusCode = (response as? HTTPURLResponse)?.statusCode, successRange.contains(statusCode) else {
//                return
//            }
//
//            // 파싱하는 부분
//            guard let resultData = data else {
//                return
//            }
//            print("나타나\(resultData)")
//            let decoder = JSONDecoder()
//            let decodedData = try! decoder.decode(LOLChampion.self, from: resultData)
//            print("얼마나오냐\(decodedData)")
//            DispatchQueue.main.async {
//                completion(decodedData)
//            }
//        }
//        dataTask.resume()
//    }
//}
