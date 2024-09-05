//
//  HomeRequestAPI.swift
//  IOSTask
//
//  Created by Farido on 05/09/2024.
//

import Foundation

class HomeRequestAPI: BaseAPI<HomeRequestNetwork> {
  func getHomeData(body: [String: Any],completion: @escaping(Result<HomeModel?, NSError>) -> Void){
    self.fetchData(target: .getHomeData(body: body), responseType: HomeModel.self) { result in
      completion(result)
    }
  }
}

