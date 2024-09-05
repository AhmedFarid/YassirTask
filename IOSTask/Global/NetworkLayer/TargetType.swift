//
//  TargetType.swift
//  IOSTask
//
//  Created by Farido on 05/09/2024.
//

import Foundation
import Alamofire

public enum HTTPMethod: String{
  case get = "GET"
  case post = "POST"
}

public enum Task{
  case plainRequest
  case requestParameters(parameters: [String: Any],encoding: ParameterEncoding)
}

public protocol TargetType{
  var baseUrl: String { get }

  var method: HTTPMethod { get }

  var task: Task { get }

  var headers: HTTPHeaders? { get }
}
