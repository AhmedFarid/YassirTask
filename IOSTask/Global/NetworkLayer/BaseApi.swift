//
//  BaseApi.swift
//  IOSTask
//
//  Created by Farido on 05/09/2024.
//

import Foundation
import Alamofire

class BaseAPI<T: TargetType> {

  func fetchData<M: Codable> (target: T, responseType: M.Type?, completion: @escaping(Result<M?, NSError>) -> Void) {

    let baseURL = target.baseUrl
    let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
    let parameters = buildParams(task: target.task)
    let headers = target.headers ?? [:]

    print("URL\n\n\(baseURL)\n\n")
    print("Request\n\n\(parameters.0 as AnyObject)\n\n")
    print("Headers\n\n\(headers)\n\n")
    print("Method\n\n\(method.rawValue)\n\n")
    AF.request(baseURL, method: method, parameters: parameters.0, encoding: parameters.1, headers: headers).responseDecodable(of: M.self) { response in
      guard let statusCode = response.response?.statusCode else {
        let error = NSError(domain: target.baseUrl, code: 2, userInfo: [NSLocalizedDescriptionKey: MessageAlert().connectionError])
        completion(.failure(error))
        return
      }
      print("StatusCode\n\n\(statusCode)\n\n")
      if statusCode == 200 {
        guard let jsonData = response.data else {
          let error = NSError(domain: target.baseUrl, code: 0, userInfo: [NSLocalizedDescriptionKey: MessageAlert().genericError])
          completion(.failure(error))
          return
        }
        do {
          guard let responseType = responseType else {
            completion(.success(nil))
            return
          }
          let responseObject = try JSONDecoder().decode(responseType, from: jsonData)
          completion(.success(responseObject))
          let encoder = JSONEncoder()
          encoder.outputFormatting = .prettyPrinted
          let data = try! encoder.encode(responseObject)
          print("Response\n\n")
          print(String(data: data, encoding: .utf8)!)
          print("\n\n")
        }
        catch {
          let dataError = String(describing: error)
          print(dataError)
          let error = NSError(domain: target.baseUrl, code: 1, userInfo: [NSLocalizedDescriptionKey: "\(MessageAlert().genericError) (Data Error)"])
          completion(.failure(error as NSError))
        }
      } else if statusCode == 403 {
            // refreshToken
        let error = NSError(domain: target.baseUrl, code: statusCode, userInfo: [NSLocalizedDescriptionKey: "\(MessageAlert().genericError) (\(statusCode))"])
          completion(.failure(error))
        } else {
          let error = NSError(domain: target.baseUrl, code: statusCode, userInfo: [NSLocalizedDescriptionKey: "\(MessageAlert().genericError) (\(statusCode))"])
          print(String(describing: error))
        completion(.failure(error))
        return
      }
    }
  }

  private func buildParams(task: Task) -> ([String:Any], ParameterEncoding) {
     switch task {
     case .plainRequest:
       return ([:], URLEncoding.default)
     case .requestParameters(let parameters, let encoding):
       return (parameters,encoding)
     }
   }
}
