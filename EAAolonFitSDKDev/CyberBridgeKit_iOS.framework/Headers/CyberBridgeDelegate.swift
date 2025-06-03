//
//  Untitled.swift
//  CyberWear
//
//  Created by xiao on 20/3/2025.
//

import CoreBluetooth

public enum WatchState:Int {
    case disconnected
    case connecting
    case syncing
    case connected
}

public protocol CyberBridgeDelegate:AnyObject{
    //状态回掉代理
    func didState(_ state:WatchState)
    //电量更新上报
    func didBatteryManual(_ value:QueryBattery)
    //手表点击拍照上报
    func takeCamera()
    //手表退出拍照界面上报
    func exitCamera()
    //查找手机
    func findPhone()
}
