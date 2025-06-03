//
//  ViewController.swift
//  EAAolonFitSDKDev
//
//  Created by Aye on 2025/4/2.
//


/**
 
 在Build Settings中搜索 SANDBOXING，改为NO即可

 
 */


import UIKit
import CyberBridgeKit_iOS


class ViewController: UIViewController, CyberBridgeDelegate{
    func didState(_ state: CyberBridgeKit_iOS.WatchState) {
        
        print(state)
        if state == .connected {
            
            showView()
        }
    }
    
    func didBatteryManual(_ value: CyberBridgeKit_iOS.QueryBattery) {
        
    }
    
    func takeCamera() {
        
    }
    
    func exitCamera() {
        
    }
    
    func findPhone() {
        
    }
    
    
    
    

    var executionData: EACBExecutionData?
    
    @IBOutlet weak var tableView: UITableView!
    var dataSource:NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        let eacbExecutionData  = EASCManager.shared.eacbExecutionData
        eacbExecutionData.setOnBLEConnectState(listener: self)

        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            print("延时5秒后执行,SDK初始化需要时间处理")
            eacbExecutionData.connect()
        }
        
        
    }
    
    func showView(){
        
        let listViewController = AolonFitViewController()
        let listCtl = UINavigationController(rootViewController: listViewController)
        listCtl.modalPresentationStyle = .fullScreen
        self.present(listCtl, animated: true, completion: nil)
    }
    
}
