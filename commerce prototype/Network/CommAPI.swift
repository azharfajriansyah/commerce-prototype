//
//  CommAPI.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 27/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation

class CommAPI {
	static let shared = CommAPI()
	
	let defaultSession = URLSession(configuration: .default)
	
	func request<T: Decodable>(request: CommAPIRequest, expectedDataType: T.Type, completion: @escaping (CommAPIResult<CommAPIResponse<T>>) -> ()) {
		var dataTask: URLSessionTask?
		var result: CommAPIResult<CommAPIResponse<T>>!
		
		guard let urlRequest = request.urlRequest else {
			return
		}
		
		dataTask = defaultSession.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
			defer {
				dataTask = nil
			}
			
			if let error = error {
				result = .error(error as NSError)
			} else {
				guard let data = data else {
					result = .error(CommAPIError.default.asNSError())
					completion(result)
					return
				}
				
				let decoder = JSONDecoder()
				
				do {
					if let _response = try? decoder.decode([CommAPIResponse<T>].self, from: data), let _firstObject = _response.first {
						result = .success(_firstObject)
					} else {
						let _response = try decoder.decode(CommAPIResponse<T>.self, from: data)
						result = .success(_response)
					}
				} catch {
					debugPrint(error.localizedDescription)
					result = .error(CommAPIError.invalidData.asNSError())
				}
			}
			
			completion(result)
		})
		
		dataTask?.resume()
	}
	
}
