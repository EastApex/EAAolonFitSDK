//
//  EASCManager.swift
//  EAAolonFitSDKDev
//
//  Created by Aye on 2025/5/23.
//

import Foundation
import CyberBridgeKit_iOS

class EASCManager {
    
    static let shared = EASCManager()
    var eacbExecutionData: EACBExecutionData
   
    private init() {
     
        let deviceBean = CyberBridgeKit_iOS.DeviceBean.init(mac: "006056240322000005", name: "G16")
        eacbExecutionData = EACBExecutionData.init(device: deviceBean)
        eacbExecutionData.initSDK()
    }
}

