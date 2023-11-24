//
//  ViewController.swift
//  phonemacWifi
//
//  Created by vaishnavi  on 04/11/23.
//

import UIKit
import Reachability
import NetworkExtension
import Network

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let reachability = Reachability()
        
        // Get the NetworkStatus enum value for the current network connection.
        let networkStatus = reachability.currentReachabilityStatus()
        
        // Get the current network interface.
        let networkInterface: NetworkTechnology?
        
        switch networkStatus {
        case .notReachable:
            networkInterface = nil
        case .reachableViaWWAN:
            networkInterface = .wwan
        case .reachableViaWiFi:
            networkInterface = .wifi
        }
        
        // Check if the iPhone and Mac are connected to the same network interface.
        if let iPhoneSSID = NWPath.current?.networkInterface?.ssid, iPhoneSSID == networkInterface?.rawValue {
            // The iPhone and Mac are connected to the same network interface.
            print("The iPhone and Mac are connected to the same Wi-Fi network.")
        } else {
            // The iPhone and Mac are not connected to the same network interface.
            print("The iPhone and Mac are not connected to the same Wi-Fi network.")
        }
        
    }
}
