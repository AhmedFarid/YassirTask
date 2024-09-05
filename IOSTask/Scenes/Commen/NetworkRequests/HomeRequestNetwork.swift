//
//  HomeRequestNetwork.swift
//  IOSTask
//
//  Created by Farido on 05/09/2024.
//

import Foundation
import Alamofire

enum HomeRequestNetwork {
  case getHomeData(body: [String: Any])
}

extension HomeRequestNetwork: TargetType {
  var baseUrl: String {
    switch self {
    case .getHomeData:
      return URLs.homeList
    }
  }

  var method: HTTPMethod {
    switch self {
    case .getHomeData:
      return .get
    }
  }

  var task: Task {
    switch self {
    case .getHomeData(body: let body):
      return .requestParameters(parameters: body, encoding: URLEncoding.queryString)
    }
  }

  var headers: Alamofire.HTTPHeaders? {
    switch self {
    default:
      return nil
    }
  }
}
