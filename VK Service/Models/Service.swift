//
//  Service.swift
//  VK Service
//
//  Created by SergeyK on 14.07.2022.
//

import Foundation


class Service{
    
    func getService() -> [ServicesModels]? {
        let semaphore = DispatchSemaphore (value: 0)
        var returnData: ServiceModel?
        
        var request = URLRequest(url: URL(string: "https://publicstorage.hb.bizmrg.com/sirius/result.json")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                semaphore.signal()
                return
            }
            returnData = try? JSONDecoder().decode(ServiceModel.self, from: data)
            
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
    
        return returnData?.body.services
    }
    
}
