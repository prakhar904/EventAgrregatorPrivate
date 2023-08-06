//
//  ViewController.swift
//  EventAgrregatorPrivate
//
//  Created by prakhar904 on 08/06/2023.
//  Copyright (c) 2023 prakhar904. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            let eventAggregator = EventAggregator()
            
            let eventMap = ["key1": "2", "key2": "3"]
            let success = eventAggregator.addEventToSystem(eventMap)
            print("Event added successfully: \(success)")
            
            let aggregatedValues = eventAggregator.getAggregatedAnswer(for: "key1")
            print("Aggregated values for key1: \(aggregatedValues)")
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 11){
                let aggregatedValue = eventAggregator.getAggregatedAnswer(for: "key1")
                print("Aggregated values for key1: \(aggregatedValue)")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

