//
//  ViewController.swift
//  MVPArchitecture
//
//  Created by Miguel Zarazua on 6/2/19.
//  Copyright © 2019 Miguel Zarazua. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var descriptionLabel: UILabel!

    private let trafficLightPresenter = TrafficLightPresenter(trafficLigthService: ServiceTrafficLight())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        trafficLightPresenter.setViewDelegate(trafficLightViewDelegate: self)
    }
}

//MARK : - IBActions
extension ViewController
{
    @IBAction func actionGreenLight(_ sender: Any)
    {
        trafficLightPresenter.trafficLightcolorSelected(colorName: "Green")
    }
    
    @IBAction func actionYellowLight(_ sender: Any) {
        trafficLightPresenter.trafficLightcolorSelected(colorName: "Yellow")
    }
    
    @IBAction func actionredLight(_ sender: Any) {
        trafficLightPresenter.trafficLightcolorSelected(colorName: "Red")
    }
}


//MARK : - TrafficViewDelegate Methods
extension ViewController:TrafficLightViewDelegate
{
    func displayTrafficLight(description: String, from: TrafficLightPresenter)
    {
        print("description \(description)")
        self.descriptionLabel.text = description
    }
}
