//
//  ServiceTrafficight.swift
//  MVPArchitecture
//
//  Created by Miguel Zarazua on 6/2/19.
//  Copyright © 2019 Miguel Zarazua. All rights reserved.
//

import Foundation

class ServiceTrafficLight
{
    /**
     This function receives
     - Parameter colorName: An string value that could be a green,yellow or red value and in function of that determinate wich description returns in completion
     - Parameter completion: returns a TraffciLight Model wich contains colorName and a description
     */
    func getTrafficLight(colorName:String, completion: (TraficLight?) -> Void)
    {
        let trafficLights = [TraficLight(colorName: "Red", description: "Stop"),
                            TraficLight(colorName: "Green", description: "Go"),
                            TraficLight(colorName: "Yellow", description: "About to change to red")
                            ]
        if let foundTrafficLight = trafficLights.first(where: {$0.colorName == colorName})
        {
            completion(foundTrafficLight)
        }
        else
        {
            completion(nil)
        }
    }
    
}
