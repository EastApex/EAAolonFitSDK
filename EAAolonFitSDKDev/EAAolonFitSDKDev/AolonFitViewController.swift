//
//  AolonFitViewController.swift
//  EAAolonFitSDKDev
//
//  Created by Aye on 2025/5/26.
//

import Foundation
import UIKit
import CyberBridgeKit_iOS

class AolonFitViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    var tableView : UITableView!
    static let cellId = "cellIdl"
    var dataSource : NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "AolonFit Test";
        
        view.backgroundColor = UIColor.white
        
        tableView = UITableView.init(frame: view.bounds, style: .grouped)
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(view)
            make.right.equalTo(view)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        dataSource = NSMutableArray.init();
        
        
        let list1:[String] = [
            "手表支持的功能"
        ]
        dataSource.add(list1)
        
        let list2:[String] = [
            "3.1 查询心率数据",
            "3.2 查询压力数据",
            "3.3 查询血氧数据",
            "3.5 查询睡眠数据",
            "3.6 查询步数数据",
            "3.7 查询锻炼数据"]
        dataSource.add(list2)
        
        let list3:[String] = [
            "3.8.1 查询生理周期------不支持",
            "3.8.2设置生理周期"]
        dataSource.add(list3)
        
        let list4:[String] = [
            "4.1.1 查询心率自动测量参数",
            "4.1.2 设置心率自动测量参数",
            "4.1.3 查询最大心率预警参数",
            "4.1.4 设置最大心率预警参数",
            "4.1.5 查询最小心率预警参数",
            "4.1.6 设置最小心率预警参数",
        ]
        dataSource.add(list4)
        
        let list5:[String] = [
            "4.2.1 查询压力自动测量参数",
            "4.2.2 设置压力自动测量参数",
        ]
        dataSource.add(list5)
        
        let list6:[String] = [
            "4.3.1 查询血氧自动测量参数",
            "4.3.1 查询血氧自动测量参数",
        ]
        dataSource.add(list6)
        
        let list7:[String] = [
            "4.4.1 查询公英制",
            "4.4.2 设置公英制",
        ]
        dataSource.add(list7)
        
        let list8:[String] = [
            "4.5.1 查询时间制式",
            "4.5.2 设置时间制式",
        ]
        dataSource.add(list8)
        
        let list9:[String] = [
            "4.6.1 查询抬腕亮屏",
            "4.6.2 设置抬腕亮屏",
        ]
        dataSource.add(list9)
        
        let list10:[String] = [
            "4.7.1 查询勿扰模式",
            "4.7.2 设置勿扰模式",
        ]
        dataSource.add(list10)
        
        let list11:[String] = [
            "4.8.1 查询久坐提醒",
            "4.8.2 设置久坐提醒",
        ]
        dataSource.add(list11)
        
        let list12:[String] = [
            "4.9.1 查询用户信息",
            "4.9.2 设置用户信息",
        ]
        dataSource.add(list12)
        
        let list13:[String] = [
            "4.10.1 查询每日目标",
            "4.10.2 设置每日目标",
        ]
        dataSource.add(list13)
        
        let list14:[String] = [
            "4.11.1 查询温度单位",
            "4.11.2 设置温度单位",
        ]
        dataSource.add(list14)
        
        let list15:[String] = [
            "4.12.1 推送今日天气",
            "4.12.2 推送未来天气",
            "4.12.3 推送天气信息",
        ]
        dataSource.add(list15)
        
        let list16:[String] = [
            "4.13.1 查询闹钟最大数量",
            "4.13.2 查询闹钟列表",
            "4.13.3 添加闹钟",
            "4.13.4 编辑闹钟",
            "4.13.5 删除闹钟",
        ]
        dataSource.add(list16)
        
        let list17:[String] = [
            "4.14.1 查询电量",
        ]
        dataSource.add(list17)
        
        let list18:[String] = [
            "4.15.1 查询联系人最大数量",
            "4.15.2 发送联系人列表",
            "4.15.3 删除单个联系人",
            "4.15.4 删除全部联系人",
            "4.15.5 查询联系人列表",
        ]
        dataSource.add(list18)
        
        let list19:[String] = [
            "4.17.1 查询设备当前语言",
            "4.17.2 设置设备当前语言",
        ]
        dataSource.add(list19)
        
        
        let list20:[String] = [
            "4.18.1 设置 APP 通知",
            "4.18.2 查询APP通知",
        ]
        dataSource.add(list20)
        
        let list21:[String] = [
            "4.19.1 查询 SOS 联系人最大数量",
            "4.19.2 发送 SOS 联系人列表，开关状态",
            "4.19.3 查询SOS联系人列表，开关状态"
        ]
        dataSource.add(list21)
        
        let list22:[String] = [
            "4.20.1 查询当前本地表盘 ID",
            "4.20.2 设置当前本地表盘 ID",
        ]
        dataSource.add(list22)
        
        let list23:[String] = [
            "4.22.1 进入拍照",
            "4.22.2 退出拍照",
        ]
        dataSource.add(list23)
        
        let list24:[String] = [
            "4.23 查找手表",
        ]
        dataSource.add(list24)
        
        let list25:[String] = [
            "4.25 时间同步",
        ]
        dataSource.add(list25)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: ListViewController.cellId)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: ListViewController.cellId)
        }
        
        let list: [String] = dataSource.object(at: indexPath.section) as! [String]
        cell?.textLabel?.text = list[indexPath.row]
        cell?.textLabel?.numberOfLines = 0
        return cell!
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let list: [String] = dataSource.object(at: section) as! [String]
        return list.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 20))
        return headerView
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let list: [String] = dataSource.object(at: indexPath.section) as! [String]
        let text = list[indexPath.row]
        print(text)
        
        
        switch indexPath.section {
        case 0:
            do {
                // FIXME: - 手表支持的功能
                EASCManager.shared.eacbExecutionData.queryHardwareConfig { hardwareConfig in
                    
                }
            };break
        case 1:
            do {
                // FIXME: - 大数据
                switch indexPath.row {
                case 0:
                    do {
                        
                        EASCManager.shared.eacbExecutionData.fetchHeartRate { heartRateInfoEntitys in
                            
                        }
                    }
                    break
                case 1:
                    do {
                        
                        EASCManager.shared.eacbExecutionData.fetchStress { stressInfoEntitys in
                            
                        }
                    }
                    break
                case 2:
                    do {
                        
                        EASCManager.shared.eacbExecutionData.fetchBloodOxygen { bloodOxygenInfoEntitys in
                            
                        }
                    }
                    break
                case 3:
                    do {
                        EASCManager.shared.eacbExecutionData.fetchSleep { sleepInfoEntitys in
                            
                            
                        }
                    }
                    break
                case 4:
                    do {
                        EASCManager.shared.eacbExecutionData.fetchStep { stepInfoEntitys in
                            
                        }
                    }
                    break
                case 5:
                    do {
                        EASCManager.shared.eacbExecutionData.fetchExercise { exerciseInfoEntitys in
                            
                            
                        }
                    }
                    break
                default:break;
                }
                
            };break
            
        case 2:
            do {
                // FIXME: - 生理周期
                switch indexPath.row {
                case 0:  do {
                    print("不支持查询")
                };break
                case 1:  do {
                    var entity: MenstrualCycleEntity = MenstrualCycleEntity.init()
                    entity.lastMenstrualDate = 1748188800
                    entity.menstrualPeriodDays = 5
                    entity.menstrualCycleDays = 28
                    EASCManager.shared.eacbExecutionData.setMenstrualCycleInfo(entity) { result in
                        
                        
                    }
                };break
                default:break;
                }
            };break
        case 3:
            do {
                // FIXME: - 自动心率
                switch indexPath.row {
                case 0:  do {
                    
                    
                };break
                case 1:  do {
                    
                };break
                default:break;
                }
            };break
        case 4:
            do {
                switch indexPath.row {
                case 0:  do {
                    
                };break
                case 1:  do {
                    
                };break
                default:break;
                }
            };break
        case 5:
            do {
                switch indexPath.row {
                case 0:  do {
                    
                };break
                case 1:  do {
                    
                };break
                default:break;
                }
            };break
        case 6:
            do {
                switch indexPath.row {
                case 0:  do {
                    
                };break
                case 1:  do {
                    
                };break
                default:break;
                }
            };break
        case 7:
            do {
                switch indexPath.row {
                case 0:  do {
                    
                };break
                case 1:  do {
                    
                };break
                default:break;
                }
            };break
        case 8:
            do {
                switch indexPath.row {
                case 0:  do {
                    
                };break
                case 1:  do {
                    
                };break
                default:break;
                }
            };break
        case 9:
            do {
                switch indexPath.row {
                case 0:  do {
                    
                };break
                case 1:  do {
                    
                };break
                default:break;
                }
            };break
        case 10:
            do {
                switch indexPath.row {
                case 0:  do {
                    
                };break
                case 1:  do {
                    
                };break
                default:break;
                }
            };break
        case 11:
            do {
                switch indexPath.row {
                case 0:  do {
                    
                };break
                case 1:  do {
                    
                };break
                default:break;
                }
            };break
        case 12:
            do {
                switch indexPath.row {
                case 0:  do {
                    
                };break
                case 1:  do {
                    
                };break
                default:break;
                }
            };break
        case 13:
            do {
                switch indexPath.row {
                case 0:  do {
                    
                };break
                case 1:  do {
                    
                };break
                default:break;
                }
            };break
        case 14:
            do {
                switch indexPath.row {
                case 0:  do {
                    
                };break
                case 1:  do {
                    
                };break
                default:break;
                }
            };break
        case 15:
            do {
                switch indexPath.row {
                case 0:  do {
                    
                };break
                case 1:  do {
                    
                };break
                default:break;
                }
            };break
        case 16:
            do {
                switch indexPath.row {
                case 0:  do {
                    
                };break
                case 1:  do {
                    
                };break
                default:break;
                }
            };break
        case 17:
            do {
                switch indexPath.row {
                case 0:  do {
                    
                };break
                case 1:  do {
                    
                };break
                default:break;
                }
            };break
        case 18:
            do {
                switch indexPath.row {
                case 0:  do {
                    
                };break
                case 1:  do {
                    
                };break
                default:break;
                }
            };break
        case 19:
            do {
                switch indexPath.row {
                case 0:  do {
                    
                };break
                case 1:  do {
                    
                };break
                default:break;
                }
            };break
        case 20:
            do {
                switch indexPath.row {
                case 0:  do {
                    
                };break
                case 1:  do {
                    
                };break
                default:break;
                }
            };break
        case 21:
            do {
                switch indexPath.row {
                case 0:  do {
                    
                };break
                case 1:  do {
                    
                };break
                default:break;
                }
            };break
        case 22:
            do {
                switch indexPath.row {
                case 0:  do {
                    
                };break
                case 1:  do {
                    
                };break
                default:break;
                }
            };break
        case 23:
            do {
                switch indexPath.row {
                case 0:  do {
                    
                };break
                case 1:  do {
                    
                };break
                default:break;
                }
            };break
        case 24:
            do {
                switch indexPath.row {
                case 0:  do {
                    
                };break
                case 1:  do {
                    
                };break
                default:break;
                }
            };break
        case 25:
            do {
                switch indexPath.row {
                case 0:  do {
                    
                };break
                case 1:  do {
                    
                };break
                default:break;
                }
            };break
        default:break;
        }
        
        
        
      
    }
}
