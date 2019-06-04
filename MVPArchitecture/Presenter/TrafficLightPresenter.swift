//
//  TrafficLightPresenter.swift
//  MVPArchitecture
//
//  Created by Miguel Zarazua on 6/2/19.
//  Copyright © 2019 Miguel Zarazua. All rights reserved.
//

import Foundation

protocol TrafficLightViewDelegate:NSObjectProtocol
{
    func displayTrafficLight(description: String, from: TrafficLightPresenter)
}

class TrafficLightPresenter
{
    private let trafficLightService: ServiceTrafficLight
    weak private var trafficLightViewDelegate: TrafficLightViewDelegate?
    
    init(trafficLigthService: ServiceTrafficLight) {
        self.trafficLightService = trafficLigthService
    }
    
    func setViewDelegate(trafficLightViewDelegate: TrafficLightViewDelegate?)
    {
        self.trafficLightViewDelegate = trafficLightViewDelegate
    }
    
    
    func trafficLightcolorSelected(colorName:String)
    {
        trafficLightService.getTrafficLight(colorName: colorName)
        {
            [weak self] traficLight in
            
            if let traficLight = traficLight
            {
                self?.trafficLightViewDelegate?.displayTrafficLight(description: traficLight.description, from: self!)
            }
        }
    }
    
}
