//
//  EACBExecutionData.swift
//  EAAolonFitSDKDev
//
//  Created by Aye on 2025/5/8.
//

import CyberBridgeKit_iOS

// ALAppType
enum ALAppType: Int {
    case phone = 0
    case messages = 1
    case wechat = 2
    case qq = 3
    case facebook = 4
    case twitter = 5
    case instagram = 6
    case skype = 7
    case whatsApp = 8
    case line = 9
    case kakaoTalk = 10
    case email = 11
    case messenger = 12
    case zalo = 13
    case telegram = 14
    case viber = 15
    case NateOn = 16
    case Gmail = 17
    case Calenda = 18
    case DailyHunt = 19
    case Outlook = 20
    case Yahoo = 21
    case Inshorts = 22
    case Phonepe = 23
    case Gpay = 24
    case Paytm = 25
    case Swiggy = 26
    case Zomato = 27
    case Uber = 28
    case Ola = 29
    case ReflexApp = 30
    case Snapchat = 31
    case YtMusic = 32
    case YouTube = 33
    case LinkEdin = 34
    case Amazon = 35
    case Flipkart = 36
    case NetFlix = 37
    case Hotstar = 38
    case AmazonPrime = 39
    case GoogleChat = 40
    case Wynk = 41
    case GoogleDrive = 42
    case Dunzo = 43
    case Gaana = 44
    case MissCall = 45
    case WhatsAppBusiness = 46
    case Dingtalk = 47
    case Tiktok = 48
    case Lyft = 49
    case Mail = 50
    case GoogleMaps = 51
    case Slack = 52
    case MicrosoftTeams = 53
    case MormaiiSmartwatches = 54
    case Reddit = 55
    case Discord = 56
    case Calendar = 57
    case Gojek = 58
    case Lark = 59
    case Garb = 60
    case Shopee = 61
    case Tokopedia = 62
}







// 定义通知名称
extension Notification.Name {
    
    static let NotiNameStatusConnecting     = NSNotification.Name(kNTF_EAConnectStatusConnecting)
    static let NotiNameStatusConnectSucc    = NSNotification.Name(kNTF_EAConnectStatusSucceed)
    static let NotiNameStatusConnectFailed  = NSNotification.Name(kNTF_EAConnectStatusFailed)
    static let NotiNameStatusDisconnect     = NSNotification.Name(kNTF_EAConnectStatusDisconnect)
    
    
    static let NotiNameBlePoweredOn         = NSNotification.Name(kNTF_EABlePoweredOn)
    static let NotiNameBlePoweredOff        = NSNotification.Name(kNTF_EABlePoweredOff)
    
    static let NotiNameDeviceMessage        = NSNotification.Name(kNTF_EAGetDeviceOpsPhoneMessage)
    
}



extension EACBExecutionData {
    
    
    
    func big8803DataUpdateFinish(){
        
        if (self.heartRateCall != nil) {
            
            var data:[HeartRateInfoEntity] = []
            let list:[EAHeartRateModel] = eaBleBigDataManager?.eaGetBigData(withBigDataType: .heartRateData) as! [EAHeartRateModel]
            for model in list {
                
                var entity = HeartRateInfoEntity.init()
                entity.timestamp = Double(model.timeStamp*1000)
                entity.heartRate = model.hrValue
                data.append(entity)
            }
            self.heartRateCall?(data)
        }
        
        if (self.stressCall != nil) {
            
            var data:[StressInfoEntity] = []
            let list:[EAStressDataModel] = eaBleBigDataManager?.eaGetBigData(withBigDataType: .stressData) as! [EAStressDataModel]
            for model in list {
                
                var entity = StressInfoEntity.init()
                entity.timestamp = Double(model.timeStamp*1000)
                entity.stress = model.stessValue
                data.append(entity)
            }
            self.stressCall?(data)
        }
        
        if (self.bloodOxygenCall != nil) {
            
            var data:[BloodOxygenInfoEntity] = []
            let list:[EABloodOxygenDataModel] = eaBleBigDataManager?.eaGetBigData(withBigDataType: .bloodOxygenData) as! [EABloodOxygenDataModel]
            for model in list {
                
                var entity = BloodOxygenInfoEntity.init()
                entity.timestamp = Double(model.timeStamp*1000)
                entity.bloodOxygen = model.bloodOxygenValue
                data.append(entity)
            }
            self.bloodOxygenCall?(data)
            
        }
        
        if (self.sleepCall != nil) {
            
            
            var data:[SleepInfoEntity] = []
            let list:[EADaySleepModel] = eaBleBigDataManager?.eaGetProcessingSleepData(60) as! [EADaySleepModel]
            for model in list {
                
                let oneSleepArray:[EAOneSleepModel] = model.oneSleepArray
                for oneSleepModel in oneSleepArray {
                    
                    var entity = SleepInfoEntity.init()
                    entity.startTimestamp = Double(oneSleepModel.beginTimestamp*1000)
                    entity.endTimestamp = Double(oneSleepModel.endTimestamp*1000)
                    entity.totalTime = oneSleepModel.totalMinutes
                    entity.deepSleepTime = oneSleepModel.deepSleepMinutes
                    entity.lightSleepTime = oneSleepModel.lightSleepMinutes
                    entity.soberTime = oneSleepModel.awakeSleepMinutes
                    entity.remTime = oneSleepModel.remSleepMinutes
                    
                    var details:[SleepInfoEntity.Detail] = []
                    let itemSleepArray:[EAItemSleepModel] = oneSleepModel.itemSleepArray
                    for itemSleepModel in itemSleepArray {
                        
                        var detail = SleepInfoEntity.Detail.init()
                        detail.startTimestamp = Double(itemSleepModel.beginTimestamp*1000)
                        detail.endTimestamp = Double(itemSleepModel.endTimestamp*1000)
                        detail.type = convertEASleepNode(sleepNode: itemSleepModel.eSleepNode)
                        details.append(detail)
                    }
                    
                    entity.detail = details
                    data.append(entity)
                }
            }
            self.sleepCall?(data)
             
        }
        
        if (self.stepCall != nil) {
            
            
            var data:[StepInfoEntity] = []
            let list:[EAStepModel] = eaBleBigDataManager?.eaGetBigData(withBigDataType: .stepData) as! [EAStepModel]
            
            let dayDict:[String:[EAStepModel]] = [:]
            
            for model in list {
                
                let dayTimeStamp = getStartOfDayTimestamp(from: TimeInterval(model.timeStamp))
                var models:[EAStepModel] = dayDict[String(dayTimeStamp)]!
                if (models.count == 0) {
                    
                    models = []
                    models.append(model)
                }
                else {
                    
                    models.append(model)
                }
            }
            
            let days = dayDict.keys
            for day:String in days {
                
                let models:[EAStepModel] = dayDict[day]!
                
                var steps = 0
                var distance = 0
                var calories = 0
                
                var entity = StepInfoEntity.init()
                entity.timestamp = getStartOfDayTimestamp(from: TimeInterval(day)!)*1000
                
                var categorys:[StepInfoEntity.Category] = []
                for itemModel in models {
                    
                    steps += itemModel.steps
                    distance += itemModel.distance
                    calories += itemModel.calorie
                    
                    var category = StepInfoEntity.Category.init()
                    category.timestamp = Double(itemModel.timeStamp*1000)
                    category.step = itemModel.steps
                    category.distance = itemModel.distance/100
                    category.calories = itemModel.calorie/1000
                    categorys.append(category)
                }
                
                entity.step = steps
                entity.distance = distance/100
                entity.calories = calories/1000
                data.append(entity)
            }
            self.stepCall?(data)
             
        }
        
        if (self.exerciseCall != nil) {
            
            
            var data:[ExerciseInfoEntity] = []
            let list:[EASportsDataModel] = eaBleBigDataManager?.eaGetBigData(withBigDataType: .sportsData) as! [EASportsDataModel]
            for model in list {
                
                var exerciseInfoEntity = ExerciseInfoEntity.init()
                exerciseInfoEntity.startTimestamp = Double(model.beginTimeStamp*1000)
                exerciseInfoEntity.endTimestamp = Double(model.endTimeStamp*1000)
                exerciseInfoEntity.exerciseType = model.watchSportType.hashValue
                exerciseInfoEntity.step = model.steps
                exerciseInfoEntity.calories = model.calorie/1000
                exerciseInfoEntity.distance = model.distance/100
                exerciseInfoEntity.activityTime = model.duration
                
                let list:[NSNumber] = eaBleBigDataManager?.aolonFitHrs(withBenginTimestamp: model.beginTimeStamp, endTimestamp: model.endTimeStamp) as! [NSNumber]
                var heartRateList:[Int] = []
                
                for hr in list {
                    
                    heartRateList.append(hr.intValue)
                }
                exerciseInfoEntity.heartRateList = heartRateList
                data.append(exerciseInfoEntity)
            }
            self.exerciseCall?(data)
        }
        
        
        self.heartRateCall = nil
        self.stressCall = nil
        self.bloodOxygenCall = nil
        self.bloodPressureCall = nil
        self.sleepCall = nil
        self.stepCall = nil
        self.exerciseCall = nil
        
    }
    
    func convertEASleepNode(sleepNode:EASleepNode) -> Int {
        
        // type 睡眠阶段的类型，0 清醒，1 浅睡，2 深睡，3 REM（快速眼动）。
        var type:Int = 0
        switch sleepNode {
        case .activity:
            type = 0
            break
        case .enter:
            type = 1
            break
        case .wake:
            type = 0
            break
        case .rem:
            type = 3
            break
        case .light:
            type = 1
            break
        case .deep:
            type = 2
            break
        case .quit:
            type = 0
            break
        default:
            
            break
        }
        return type
    }
    
    func getStartOfDayTimestamp(from timestamp: TimeInterval) -> TimeInterval {
        
        let date = Date(timeIntervalSince1970: timestamp)
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        if let startOfDay = calendar.date(from: components) {
            return startOfDay.timeIntervalSince1970
        }
        return timestamp
    }
    
    func getDayTimeString(from timestamp: TimeInterval) -> String {
        
        let date = Date(timeIntervalSince1970: timestamp)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"  // 格式化为"年-月-日"
        // dateFormatter.timeZone = TimeZone(identifier: "UTC")  // 如需指定时区，取消此行注释
        let dayString = dateFormatter.string(from: date)
        return dayString
    }
    
    func getTimeString(from milliseconds: TimeInterval) -> String {
        
        // 1. 将毫秒转换为秒（Date 需要秒级时间戳）
        let seconds = TimeInterval(milliseconds) / 1000.0
        let date = Date(timeIntervalSince1970: seconds)
        
        // 2. 创建日期格式化器
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd-HH-mm-ss" //
        formatter.locale = Locale(identifier: "zh_CN") // 设置中文环境
        
        // 3. 格式化日期
        return formatter.string(from: date)
    }
    
    func getEAWeatherType(from type:Int) -> EAWeatherType {
        
        //        天气类型，0  多云，1  雾，2  阴天，3  雨，4  雪，5  晴，6  沙尘暴，7  阴霾，8  其他。(映射不上默认0)
        let weatherTypes:[EAWeatherType] = [.cloudy,.fog,.gloomy,.heavyRain,.heavySnow,.clear,.sandstorm,.haze,.cloudy]
        let weatherType:EAWeatherType = weatherTypes[type]
        return weatherType
    }
 
    func getWeatherRaysType(from uv:Int) -> EAWeatherRaysType {
        
        if uv <= 2 {
            return .weak;
        } else if uv > 3 && uv <= 4 {
            return .medium;
        } else if uv > 5 && uv <= 6 {
            return .strong;
        }  else if uv > 7 && uv <= 8 {
            return .veryStrong;
        } else {
            return .superStrong
        }
    }
    
    func getWeekCycle(from weekCycleBit:Int) -> [Int] {
        
        let weekCycleString = EADataValue.getWeekCycleBit(byWeekCycle: weekCycleBit)
        
        var week:[Int] = []
        var day: Int = 0
        for char in weekCycleString {
            if char == "1" {
                week.append(day)
            }
            day += 1
        }
        return week
    }
    
    func getEAWeekCycle(from week:[Int]) -> Int {
        
        var weekCycleString = "0000000"
        var charArray = Array(weekCycleString)
        // 遍历 week 数组，将对应位置的字符设为 "1"
        for day in week {
            if day >= 0 && day < charArray.count {
                charArray[day] = "1"
            }
        }
        // 将字符数组转回字符串
        weekCycleString = String(charArray)
        return EADataValue.getWeekCycle(byWeekCycleBitString: weekCycleString)
    }
    
    func getLanguageType(from eaType:EALanguageType) -> Int  {
        
        
        var danguageDict:[EALanguageType:Int] = [:]
    
        danguageDict[.default] = 1
        danguageDict[.english] = 1 //  英语
        danguageDict[.chineseSimplifid] = 2  //中文简体
        danguageDict[.chineseTraditional] = 10  //中文繁体
        danguageDict[.korean] = 4  //韩语
        danguageDict[.thai] = 26  //泰语
        danguageDict[.japanese] = 3  //日语
        danguageDict[.spanish] = 7  //西班牙语
        danguageDict[.francais] = 6  //法语
        danguageDict[.deutsch] = 5  //德语
        danguageDict[.italiano] = 11  //意大利语
        danguageDict[.polski] = 14  //波兰语
        danguageDict[.portuguese] = 12  //葡萄牙语
        danguageDict[.russian] = 9  //俄语
        danguageDict[.dutch] = 13  //荷兰语
        danguageDict[.arabic] = 8  //阿拉伯语
        danguageDict[.greek] = 1
        danguageDict[.hebrew] = 1
        danguageDict[.swedish] = 15  //瑞典语
        danguageDict[.osmanli] = 1
        danguageDict[.czech] = 20  //捷克语
        danguageDict[.indonesia] = 25  //印度尼西亚语
        danguageDict[.melayu] = 38  //马来语
        danguageDict[.farsi] = 1
        danguageDict[.vietnamese] = 28  //越南语
        danguageDict[.belarusian] = 1
        danguageDict[.hungarian] = 19  //匈牙利语
        danguageDict[.hindi] = 1
        danguageDict[.ukrainian] = 27  //乌克兰语
        danguageDict[.romanian] = 22  //罗马尼亚语
        danguageDict[.moldovan] = 1
        danguageDict[.bengali] = 1
        danguageDict[.slovak] = 23  //斯洛伐克语
        danguageDict[.danish] = 17  //丹麦语
        danguageDict[.norwegian] = 18  //挪威语
        danguageDict[.finnish] = 16  //芬兰语
        
        var alLanType : Int = 1
        alLanType = danguageDict[eaType] ?? 1
        return alLanType
        
    }
    
    func getEALanguageType(from alType:Int) -> EALanguageType {
        
        // 创建反向映射：Int -> EALanguageType
            let reverseDict: [Int: EALanguageType] = [
                1: .english,             // 英语
                2: .chineseSimplifid,    // 中文简体
                10: .chineseTraditional, // 中文繁体
                4: .korean,              // 韩语
                26: .thai,               // 泰语
                3: .japanese,            // 日语
                7: .spanish,             // 西班牙语
                6: .francais,            // 法语
                5: .deutsch,             // 德语
                11: .italiano,           // 意大利语
                14: .polski,             // 波兰语
                12: .portuguese,         // 葡萄牙语
                9: .russian,             // 俄语
                13: .dutch,              // 荷兰语
                8: .arabic,              // 阿拉伯语
                15: .swedish,            // 瑞典语
                20: .czech,              // 捷克语
                25: .indonesia,          // 印度尼西亚语
                38: .melayu,             // 马来语
                28: .vietnamese,         // 越南语
                19: .hungarian,          // 匈牙利语
                27: .ukrainian,          // 乌克兰语
                22: .romanian,           // 罗马尼亚语
                23: .slovak,             // 斯洛伐克语
                17: .danish,             // 丹麦语
                18: .norwegian,          // 挪威语
                16: .finnish             // 芬兰语
            ]
            
            // 返回映射的语言类型，若未找到则返回默认值（需根据实际情况调整）
            return reverseDict[alType] ?? .english
        
    }
    
    func getAlNotify(from socialSwitchModel:EASocialSwitchModel,appMessageSwitchData:EAAppMessageSwitchData) -> [CyberBridgeKit_iOS.NotifyEntity] {
        
        var list : [CyberBridgeKit_iOS.NotifyEntity] = []
        
//        let showAppMessageModel = EAShowAppMessageModel.eaAllocInit(with: appMessageSwitchData)

        var phone = NotifyEntity.init()
        phone.type = ALAppType.phone.rawValue
        phone.isEnabled = (socialSwitchModel.sIncomingcall.sw == 1)
        
        var email = NotifyEntity.init()
        email.type = ALAppType.email.rawValue
        email.isEnabled = (socialSwitchModel.sEmail.sw == 1)
        
        var sms = NotifyEntity.init()
        sms.type = ALAppType.messages.rawValue
        sms.isEnabled = (socialSwitchModel.sSms.sw == 1)
        
        list.append(phone)
        list.append(email)
        list.append(sms)
        
        let sAppSwArray : [EAAppMessageSwitchModel] = appMessageSwitchData.sAppSwArray as! [EAAppMessageSwitchModel]
        for appMessageSwitchModel in sAppSwArray {
            
            let alType = convertToALAppType(appMessageSwitchModel.showAppType)
            if alType != nil {
                
                var entity = NotifyEntity.init()
                entity.type = alType!.rawValue
                entity.isEnabled = (appMessageSwitchModel.sw)
                list.append(entity)
            }
        }
        return list
    }
    
    // 转换函数：ALAppType -> EAShowAppType
    func convertToEAShowAppType(_ alAppType: ALAppType) -> EAShowAppType {
        switch alAppType {
        case .wechat:
            return .wechat
        case .qq:
            return .QQ
        case .facebook:
            return .facebook
        case .twitter:
            return .twitter
        case .instagram:
            return .instagram
        case .skype:
            return .skype
        case .whatsApp:
            return .whatsApp
        case .line:
            return .line
        case .kakaoTalk:
            return .kakaotalk
        case .Gmail:
            return .gmail
        case .Outlook:
            return .outlook
        case .Yahoo:
            return .yahoo
        case .messenger:
            return .messenger
        case .viber:
            return .viber
        case .telegram:
            return .telegram
        case .Snapchat:
            return .snapchat
        case .YouTube:
            return .youtube
        case .LinkEdin:
            return .linkedin
        case .Amazon:
            return .amazon
        case .Discord:
            return .discord
        case .GoogleMaps:
            return .googleMaps
        case .Reddit:
            return .reddit
        case .MicrosoftTeams:
            return .teams
        case .Tiktok:
            return .tiktok
        case .Uber:
            return .uber
        case .Dingtalk:
            return .dingTalk
        case .Hotstar:
            return .hotstar
        case .Phonepe:
            return .phonePe
        case .Zomato:
            return .zomato
        case .DailyHunt:
            return .dailyhunt
        case .Inshorts:
            return .inshorts
        case .Paytm:
            return .paytm
        case .Swiggy:
            return .swiggy
        case .Calendar:
            return .calendar
        case .Wynk:
            return .wynkMusic
        case .Gaana:
            return .gaana
        case .Flipkart:
            return .flipkart
        case .NetFlix:
            return .netflix
        case .AmazonPrime:
            return .amazonPrime
        case .Gpay:
            return .googlePay
        case .Ola:
            return .ola
        case .zalo:
            return .zalo
        case .YtMusic:
            return .ytMusic
        case .Dunzo:
            return .dunzo
        case .GoogleDrive:
            return .googleDrive
        default:
            return .dingTalk
        }
    }
    
    
    // 转换函数
    func convertToALAppType(_ showAppType: EAShowAppType) -> ALAppType? {
        switch showAppType {
//        case .unknow:
//            return nil
        case .wechat:
            return .wechat
        case .QQ:
            return .qq
        case .facebook:
            return .facebook
        case .twitter:
            return .twitter
        case .messenger:
            return .messenger
        case .gmail:
            return .Gmail
        case .viber:
            return .viber
        case .snapchat:
            return .Snapchat
        case .whatsApp:
            return .whatsApp
        case .instagram:
            return .instagram
        case .linkedin:
            return .LinkEdin
        case .line:
            return .line
        case .skype:
            return .skype
        case .kakaotalk:
            return .kakaoTalk
        case .telegram:
            return .telegram
        case .youtube:
            return .YouTube
        case .outlook:
            return .Outlook
        case .amazon:
            return .Amazon
        case .discord:
            return .Discord
        case .googleMaps:
            return .GoogleMaps
        case .reddit:
            return .Reddit
        case .teams:
            return .MicrosoftTeams
        case .tiktok:
            return .Tiktok
        case .uber:
            return .Uber
        case .dingTalk:
            return .Dingtalk
        case .hotstar:
            return .Hotstar
        case .phonePe:
            return .Phonepe
        case .zomato:
            return .Zomato
        case .dailyhunt:
            return .DailyHunt
        case .inshorts:
            return .Inshorts
        case .yahoo:
            return .Yahoo
        case .paytm:
            return .Paytm
        case .swiggy:
            return .Swiggy
        case .calendar:
            return .Calendar
        case .wynkMusic:
            return .Wynk
        case .gaana:
            return .Gaana
        case .flipkart:
            return .Flipkart
        case .netflix:
            return .NetFlix
        case .amazonPrime:
            return .AmazonPrime
        case .googlePay:
            return .Gpay
        case .ola:
            return .Ola
        case .zalo:
            return .zalo
        case .ytMusic:
            return .YtMusic
        case .dunzo:
            return .Dunzo
        case .googleDrive:
            return .GoogleDrive
        default:
            return nil
        }
    }
    
    func getBigData(){
        
        eaBleBigDataManager?.eaSendSyncBigData { respondCodeType in
            
            
        }
    }
    
}

@objc public class EACBExecutionData:ExecutionData {
    
    
    private var eaBleManager: EABleManager?
    private var eaBleSendManager: EABleSendManager?
    private var eaBleBigDataManager: EABleBigDataManager?
    
    @objc func notiConnecting() {
        
        delegate?.didState(.connecting)
    }
    
    @objc func notiConnectSucc() {
        
        let bindWatch = EABingingOps()
        bindWatch.ops = .end //  Set EABindingOpsType. End to complete the binding
        eaBleSendManager?.operationChange(bindWatch) { respondModel in
            
        }
        delegate?.didState(.connected)
    }
    
    @objc func notiConnectFailed() {
        
        delegate?.didState(.disconnected)
    }
    
    @objc func notiDisconnect() {
        
        delegate?.didState(.disconnected)
    }
    
    func notiDeviceMessage(_ no:NSNotification) {
        
        let operatingModel = no.object as! EAPhoneOpsModel
        
        switch operatingModel.eOps {
            
        case .searchPhone:
            
            delegate?.findPhone()
            break
    
        case .startTakingPictures:
            delegate?.takeCamera()
            
            break
        case .stopTakingPictures:
            delegate?.exitCamera()
            break
            
        case .big8803DataUpdateFinish:
            
            big8803DataUpdateFinish()
            break
        default:
            
            break
        }
    }
    
    // FIXME: - initSDK
    public override func initSDK() {
        
        super.initSDK()
        
        let config = EABleConfig.getDefault();
        config.debug = true;
        config.saveLog = true;// Whether to save logs. This parameter is disabled by default.This function takes effect only when 'config.debug' is set to YES
        config.openCmdTimeOut = true;
        
        eaBleManager = EABleManager.default()
        eaBleManager?.bleConfig = config;

        eaBleSendManager = EABleSendManager.default()
        eaBleBigDataManager = EABleBigDataManager.default()
        
        // 通知.连接状态
        NotificationCenter.default.addObserver(self, selector: #selector(notiConnecting), name:.NotiNameStatusConnecting, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(notiConnectSucc), name:.NotiNameStatusConnectSucc, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(notiConnectFailed), name:.NotiNameStatusConnectFailed, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(notiDisconnect), name:.NotiNameStatusDisconnect, object: nil)
        
        // 通知.手表消息
        NotificationCenter.default.addObserver(
            forName: .NotiNameDeviceMessage,
            object: nil,
            queue: .main
        ) { [self] notification in
            
            notiDeviceMessage(notification as NSNotification)
        }
        
        
    }
    
    // FIXME: - connect
    public override func connect() {
        
        if (device.cloudUUID != nil) {
            
            eaBleManager?.reConnectToPeripheral(withUUIDString: device.cloudUUID!)
            
        } else if (!device.mac.isEmpty) {
            
            eaBleManager?.reConnect(toPeripheral: device.mac)
            
        } else {
            
            print("error connect")
        }
    }
    
    public override func disconnect() {
        
        eaBleManager?.disconnectPeripheral()
    }
    
    public override func unbind() {
        
        eaBleManager?.unbindAndResetPeripheral()
    }
    
    
    
    // FIXME: - listener
    public override func setOnBLEConnectState(listener: (any CyberBridgeDelegate)?) {
        
        delegate = listener
    }
 
    // FIXME: - 手表支持的功能
    public override func queryHardwareConfig(_ complete: ExecutionData.HandwarwCallback01?) {
        
        eaBleSendManager?.operationGetInfo(with: .watchSupport) { baseModel in
            
            if baseModel.isKind(of: EAWatchSupportModel.self) {
                
                let model = baseModel as! EAWatchSupportModel;
                
                var hardwareConfig = HardwareConfig.init()
                
                /// 是否支持心率功能，默认值：false。
                hardwareConfig.isSupportHeartRate = true

                /// 是否支持心率自动测量，默认值：false。
                hardwareConfig.isSupportHeartRateAuto = model.hrMonitoring

                /// 是否支持设置心率自动测量间隔，默认值：false。
                hardwareConfig.isSupportHeartRateAutoSet = model.hrMonitoring

                /// 是否支持心率手动测量，默认值：false。
                hardwareConfig.isSupportHeartRateManual = model.supportAppDetectionHr

                /// 是否支持静息心率功能，默认值：false。
                hardwareConfig.isSupportRestingHeartRate = false

                /// 是否支持血氧功能，默认值：false。
                hardwareConfig.isSupportBloodOxygen = true

                /// 是否支持血氧自动测量，默认值：false。
                hardwareConfig.isSupportBloodOxygenAuto = model.bloodPressureMonitoring

                /// 是否支持设置血氧自动测量间隔，默认值：false。
                hardwareConfig.isSupportBloodOxygenAutoSet = false

                /// 是否支持血氧手动测量，默认值：false。
                hardwareConfig.isSupportBloodOxygenManual = model.supportAppDetectionSqO2

                /// 是否支持压力功能，默认值：false。
                hardwareConfig.isSupportStress = true

                /// 是否支持压力自动测量，默认值：false。
                hardwareConfig.isSupportStressAuto = model.stressMonitorSetting

                /// 是否支持压力手动测量，默认值：false。
                hardwareConfig.isSupportStressManual = model.stressMonitorInterval

                /// 是否支持睡眠功能，默认值：false。
                hardwareConfig.isSupportSleep = true

                /// 是否支持睡眠自动测量，默认值：false。
                hardwareConfig.isSupportSleepAuto = false

                /// 是否支持步数功能，默认值：false。
                hardwareConfig.isSupportStep = true

                /// 是否支持步数自动测量，默认值：false。
                hardwareConfig.isSupportStepAuto = true

                /// 是否支持血压功能，默认值：false。
                hardwareConfig.isSupportBloodPressure = false

                /// 是否支持血压自动测量，默认值：false。
                hardwareConfig.isSupportBloodPressureAuto = false

                /// 是否支持血压手动测量，默认值：false。
                hardwareConfig.isSupportBloodPressureManual = false

                /// 是否支持锻炼功能，默认值：false。
                hardwareConfig.isSupportExercise = true

                /// 是否支持历史锻炼记录，默认值：false。
                hardwareConfig.isSupportExerciseHistory = true

                /// 是否支持锻炼状态同步，暂停、开始、继续、结束运动等操作，默认值：false。
                hardwareConfig.isSupportExerciseStateSync = model.appLaunchScreenSport

                /// 是否支持锻炼时记录 GPS 信息功能，默认值：false。
                hardwareConfig.isSupportExerciseGPS = model.gpsSetting

                /// 是否支持 APP 通知提醒，默认值：false。
                hardwareConfig.isSupportAppNotification = true

                /// 是否支持短信通知提醒，默认值：false。
                hardwareConfig.isSupportSMSNotification = true

                /// 是否支持天气，默认值：false。
                hardwareConfig.isSupportWeather = true

                /// 是否支持天气城市名称，默认值：false。
                hardwareConfig.isSupportWeatherCity = true

                /// 是否支持心率最高预警，默认值：false。
                hardwareConfig.isSupportHeartRateHighWarning = model.hrWarning

                /// 是否支持心率最低预警，默认值：false。
                hardwareConfig.isSupportHeartRateLowWarning = model.hrWarning

                /// 是否支持久坐提醒，默认值：false。
                hardwareConfig.isSupportSedentaryReminder = model.sedentaryMonitoring

                /// 是否支持久坐提醒时间段，默认值：false。
                hardwareConfig.isSupportSedentaryReminderTimePeriod = model.sedentaryMonitoring

                /// 是否支持久坐提醒提醒间隔，默认值：false。
                hardwareConfig.isSupportSedentaryReminderInterval = model.sedentaryMonitoring

                /// 是否支持久坐提醒午休免打扰，默认值：false。
                hardwareConfig.isSupportSedentaryReminderLBNDM = model.sedentaryMonitoring

                /// 是否支持久坐提醒午休免打扰时间段，默认值：false。
                hardwareConfig.isSupportSedentaryReminderLBNDMTimePeriod = model.sedentaryMonitoring

                /// 是否支持喝水提醒，默认值：false。
                hardwareConfig.isSupportDrinkReminder = model.monitorReminder

                /// 是否支持抬腕亮屏，默认值：false。
                hardwareConfig.isSupportRaiseLightScreen = model.gesturesWakeUpSettings

                /// 是否支持查找手表，默认值：false。
                hardwareConfig.isSupportFindDevice = model.findWatch

                /// 是否支持查找手机，默认值：false。
                hardwareConfig.isSupportFindPhone = true

                /// 是否支持遥控拍照，默认值：false。
                hardwareConfig.isSupportRemoteCamera = true

                /// 是否支持时间制式，默认值：false。
                hardwareConfig.isSupportTimeFormat = true

                /// 是否支持温度制式，默认值：false。
                hardwareConfig.isSupportTemperatureFormat = false

                /// 是否支持公英制，默认值：false。
                hardwareConfig.isSupportMetric = true

                /// 是否支持音乐播放器，默认值：false。
                hardwareConfig.isSupportMusicPlayer = true

                /// 是否支持音乐播放器显示音乐信息（歌曲名、歌手名等），默认值：false。
                hardwareConfig.isSupportMusicPlayerInfo = true

                /// 是否支持勿扰模式，默认值：false。
                hardwareConfig.isSupportNotDisturbMode = model.disturbSetting

                /// 是否支持勿扰模式的开关，默认值：false。
                hardwareConfig.isSupportNotDisturbModeSwitch = model.disturbSetting

                /// 是否支持联系⼈导入，默认值：false。
                hardwareConfig.isSupportImportContact = model.phoneContact

                /// 是否支持修改语言，默认值：false。
                hardwareConfig.isSupportChangeLanguage = true

                /// 是否支持表盘功能，默认值：false。
                hardwareConfig.isSupportWatchFace = true

                /// 是否支持来电提醒，默认值：false。
                hardwareConfig.isSupportCallReminder = true

                /// 是否需要 BT 配对，默认值：false。
                hardwareConfig.isNeedBond = model.supportBtOps

                /// 是否支持 SOS 功能，默认值：false。
                hardwareConfig.isSupportSOS = model.contactSos

                /// 是否支持电子卡片，默认值：false。
                hardwareConfig.isSupportElectronicCard = false

                /// 是否支持世界时钟，默认值：false。
                hardwareConfig.isSupportWorldClock = false

                /// 是否支持闹钟，默认值：false。
                hardwareConfig.isSupportAlarmClock = true

                /// 是否支持短信快捷回复，默认值：false。
                hardwareConfig.isSupportQuickSMSReply = false

                /// 是否支持设置今日目标（站立时长、运动时长、卡路里、步数、距离），默认值：false。
                hardwareConfig.isSupportSetTodayTarget = true

                /// 是否支持 SOS 联系人开关，默认值：false。
                hardwareConfig.isSupportSOSContactSwitch = false

                /// 是否支持生理周期
                hardwareConfig.isSupportMenstrualCycle = model.menstrualSetting

                /// 是否支持自定义表盘
                hardwareConfig.isSupportDIYWatchFace = true

                /// 是否支持在线表盘
                hardwareConfig.isSupportOnlineWatchFace = true

                /// 是否支持健康自动监测
                hardwareConfig.isSupportHealthAutoMeasure = false

                /// 是否支持星历AGPS功能
                hardwareConfig.isSupportAGPS = model.gpsSetting

                /// 是否支持未来12小时天气信息
                hardwareConfig.isSupportWeatherFuture24Hours = false
                
                complete?(hardwareConfig)
                
            }
            
            
           
        }
    }
    
    
    // FIXME: - 大数据
    public override func fetchHeartRate(complete: ExecutionData.HeartRateCallback?) {
        
        getBigData()
        self.heartRateCall = complete

    }
  
    public override func fetchStress(complete: ExecutionData.StressCallback?) {
        
        getBigData()
        self.stressCall = complete

    }
    
    public override func fetchBloodOxygen(complete: ExecutionData.BloodOxygenCallback?) {
        
        getBigData()
        self.bloodOxygenCall = complete
    }
    
    public override func fetchSleep(complete: ExecutionData.SleepCallback?) {
        
        getBigData()
        self.sleepCall = complete
       
    }
    
    public override func fetchStep(complete: ExecutionData.StepCallback?) {
     
        getBigData()
        self.stepCall = complete
   
    }
    
    public override func fetchExercise(complete: ExecutionData.ExerciseCallback? = nil) {
        
        getBigData()
        self.exerciseCall = complete
    }
    
    // FIXME: - 生理周期
    public override func queryMenstrualCycleInfo(complete: ExecutionData.MenstrualCycleCallBack?) {
        
        // 不支持查询
        let menstrualCycleEntity = MenstrualCycleEntity.init()
        complete?(menstrualCycleEntity)
    }
    
    public override func setMenstrualCycleInfo(_ entity: MenstrualCycleEntity, complete: ExecutionData.BoolCallback?) {
        
        let model = EAMenstruals.eaAllocInit(withStartDate: getDayTimeString(from: entity.lastMenstrualDate), keepDay: entity.menstrualPeriodDays, cycleDay: entity.menstrualCycleDays, judgeCurrentTime: false)
        eaBleSendManager?.operationChange(model) { respondModel in
            
            complete?(respondModel.eErrorCode == .success)
        }
    }
    
    // FIXME: - 自动心率
    public override func queryHeartRateAutoMesure(complete: ExecutionData.HeartRateMesureCallback?) {
        
        eaBleSendManager?.operationGetInfo(with: .autoCheckHeartRate) { baseModel in
            
            if baseModel.isKind(of: EAAutoCheckHeartRateModel.self) {
                
                let autoCheckHeartRateModel = baseModel as! EAAutoCheckHeartRateModel;
                
                var entity = HeartRateMesureEntity.init()
                entity.isEnabled = autoCheckHeartRateModel.interval > 0   //  间隔时长：单位分钟，0为关闭监测功能
                entity.value = autoCheckHeartRateModel.interval
                complete?(entity)
            }
        }
        
    }

    public override func setHeartRateAutoMeasure(_ entity: HeartRateMesureEntity, complete: ExecutionData.BoolCallback? = nil) {
        
        let model = EAAutoCheckHeartRateModel.init()
        if entity.isEnabled {
            model.interval = entity.value
        }
        else
        {
            model.interval = 0
        }
        eaBleSendManager?.operationChange(model) { respondModel in
            
            complete?(respondModel.eErrorCode == .success)
        }
        
    }
        
    // FIXME: - 心率告警
    public override func queryHeartRateHighRemind(complete: ExecutionData.HeartRateMesureCallback?) {
        
        eaBleSendManager?.operationGetInfo(with: .heartRateWaringSetting) { baseModel in
            
            if baseModel.isKind(of: EAHeartRateWaringSettingModel.self) {
                
                let model = baseModel as! EAHeartRateWaringSettingModel
                
                var entity = HeartRateMesureEntity.init()
                entity.isEnabled = (model.sw == 1)
                entity.value = model.maxHr
                complete?(entity)
            }
        }
        
    }
    
    public override func setHeartRateHighRemind(_ entity: HeartRateMesureEntity, complete: ExecutionData.BoolCallback? = nil) {
        
        
        eaBleSendManager?.operationGetInfo(with: .heartRateWaringSetting) { [weak self] baseModel in
            
            if baseModel.isKind(of: EAHeartRateWaringSettingModel.self) {
                
                let model = baseModel as! EAHeartRateWaringSettingModel
                
                model.sw = entity.isEnabled.hashValue
                model.maxHr = entity.value
                
                self?.eaBleSendManager?.operationChange(model) { respondModel in
                    
                    complete?(respondModel.eErrorCode == .success)
                }
            }
        }
        
        
    }

    public override func queryHeartRateLowRemind(complete: ExecutionData.HeartRateMesureCallback?) {
        
        eaBleSendManager?.operationGetInfo(with: .heartRateWaringSetting) { baseModel in
            
            if baseModel.isKind(of: EAHeartRateWaringSettingModel.self) {
                
                let model = baseModel as! EAHeartRateWaringSettingModel
                
                var entity = HeartRateMesureEntity.init()
                entity.isEnabled = (model.sw == 1)
                entity.value = model.minHr
                complete?(entity)
            }
        }
    }
    
    public override func setHeartRateLowRemind(_ entity: HeartRateMesureEntity, complete: ExecutionData.BoolCallback?) {
        
        eaBleSendManager?.operationGetInfo(with: .heartRateWaringSetting) { [weak self] baseModel in
            
            if baseModel.isKind(of: EAHeartRateWaringSettingModel.self) {
                
                let model = baseModel as! EAHeartRateWaringSettingModel
                
                model.sw = entity.isEnabled.hashValue
                model.minHr = entity.value
                
                self?.eaBleSendManager?.operationChange(model) { respondModel in
                    
                    complete?(respondModel.eErrorCode == .success)
                }
            }
        }
    }

    // FIXME: - 自动压力
    public override func queryStressAutoMeasure(complete: ExecutionData.StressMesureCallback?) {
     
        eaBleSendManager?.operationGetInfo(with: .stressMonitor) { baseModel in
            
            if baseModel.isKind(of: EAStressMonitor.self) {
                
                let model = baseModel as! EAStressMonitor;
                
                var entity = StressMeasureEntity.init()
                entity.isEnabled = model.sw
                entity.value = model.interval
                complete?(entity)
            }
        }
    }

    public override func setStressAutoMeasure(_ entity: StressMeasureEntity, complete: ExecutionData.BoolCallback? = nil) {
        
        let model = EAStressMonitor.init()
        model.sw = entity.isEnabled
        model.interval = entity.value
        
        eaBleSendManager?.operationChange(model) { respondModel in
            
            complete?(respondModel.eErrorCode == .success)
        }
    }

    // FIXME: - 自动血氧
    public override func queryBloodOxygenAutoMeasure(complete: ExecutionData.BloodOxygenMesureCallback?) {
        
        eaBleSendManager?.operationGetInfo(with: .sleepBloodOxygenMonitor) { baseModel in
            
            if baseModel.isKind(of: EASleepBloodOxygenMonitor.self) {
                
                let model = baseModel as! EASleepBloodOxygenMonitor
                
                var entity = BloodOxygenSetEntity.init()
                entity.isEnabled = model.sw
                entity.value = model.interval
                complete?(entity)
            }
        }
    }
    
    public override func setBloodOxygenAutoMeasure(_ entity: BloodOxygenSetEntity, complete: ExecutionData.BoolCallback?) {
        
        let model = EASleepBloodOxygenMonitor.init()
        model.sw = entity.isEnabled
        model.interval = entity.value
        
        eaBleSendManager?.operationChange(model) { respondModel in
            
            complete?(respondModel.eErrorCode == .success)
        }
    }
    
    // FIXME: - 单位（公英制）
    public override func queryMetricAndImperialUnit(complete: ExecutionData.IntCallback?) {
        
        eaBleSendManager?.operationGetInfo(with: .unifiedUnit) { baseModel in
            
            if baseModel.isKind(of: EAUnifiedUnitModel.self) {
                
                let model = baseModel as! EAUnifiedUnitModel
                var unit = 2
                if(model.unit == .lengthUnitMetric) {
                    unit = 1
                }
                complete?(unit)
            }
        }
    }
    
    public override func setMetricAndImperialUnit(_ metricImperial: Int, complete: ExecutionData.BoolCallback? = nil) {
        
        let model = EAUnifiedUnitModel.init()
        model.unit = .lengthUnitMetric
        if(metricImperial == 2) {
            model.unit = .lengthUnitBritish
        }
        eaBleSendManager?.operationChange(model) { respondModel in
            
            complete?(respondModel.eErrorCode == .success)
        }
    }
    

    // FIXME: - 单位（时间制式）==> 1:24小时制,  2:12小时制
    public override func queryTimeFormat(complete: ExecutionData.IntCallback?) {
        
        eaBleSendManager?.operationGetInfo(with: .syncTime) { baseModel in
            
            if baseModel.isKind(of: EASyncTime.self) {
                
                let model = baseModel as! EASyncTime
                var unit = 1
                if(model.timeHourType == .hour12) {
                    unit = 2
                }
                complete?(unit)
            }
        }
    }
    
    public override func setTimeFormat(_ timeFormat: Int, complete: ExecutionData.BoolCallback? = nil) {
        
        eaBleSendManager?.operationGetInfo(with: .syncTime) { [weak self] baseModel in
            
            if baseModel.isKind(of: EASyncTime.self) {
                
                let model = baseModel as! EASyncTime
                model.timeHourType = .hour24
                if(timeFormat == 2) {
                    model.timeHourType = .hour12
                }
                self?.eaBleSendManager?.operationChange(model) { respondModel in
                    
                    complete?(respondModel.eErrorCode == .success)
                }
            }
        }
   
    }
    
    // FIXME: - 抬手亮屏(仅支持开关)
    public override func queryRaiseLightScreen(complete: ExecutionData.RaiseLightScreenCallback?) {
        
        eaBleSendManager?.operationGetInfo(with: .gesturesSetting) { baseModel in
            
            if baseModel.isKind(of: EAGesturesSettingModel.self) {
                
                let model = baseModel as! EAGesturesSettingModel
               
                var entity = RaiseLightScreenEntity.init()
                entity.isEnabled = (model.eBrightSrc == .allDay)
                complete?(entity)
            }
        }
    }
    
    public override func setRaiseLightScreen(_ entity: RaiseLightScreenEntity, complete: ExecutionData.BoolCallback? = nil) {
        
        let model = EAGesturesSettingModel.init()
        model.eBrightSrc = (entity.isEnabled == true ) ? .allDay : .close;
        eaBleSendManager?.operationChange(model) { respondModel in
            
            complete?(respondModel.eErrorCode == .success)
        }
    }

    // FIXME: - 勿扰设置
    public override func queryNotDisturbMode(complete: ExecutionData.NotDisturbModeCallback?) {
        
        eaBleSendManager?.operationGetInfo(with: .notDisturb) { baseModel in
            
            if baseModel.isKind(of: EANotDisturbModel.self) {
                
                let model = baseModel as! EANotDisturbModel
               
                var entity = NotDisturbModeEntity.init()
                entity.isEnabled = (model.sw == 1)
                entity.startTime = model.beginHour*60 + model.beginMinute
                entity.endTime   = model.endHour*60 + model.endMinute
                complete?(entity)
            }
        }
    }
    
    public override func setNotDisturbMode(_ entity: NotDisturbModeEntity, complete: ExecutionData.BoolCallback? = nil) {
        
        let model = EANotDisturbModel.init()
        model.sw            = entity.isEnabled.hashValue
        model.beginHour     = entity.startTime / 60
        model.beginMinute   = entity.startTime % 60
        model.endHour       = entity.endTime / 60
        model.endMinute     = entity.endTime % 60
        
        eaBleSendManager?.operationChange(model) { respondModel in
            
            complete?(respondModel.eErrorCode == .success)
        }
        
    }

    // FIXME: - 久坐
    public override func querySedentaryReminder(complete: ExecutionData.SedentaryReminderCallback?) {
        
        eaBleSendManager?.operationGetInfo(with: .autoCheckSedentariness) { baseModel in
            
            if baseModel.isKind(of: EAAutoCheckSedentarinessModel.self) {
                
                let model = baseModel as! EAAutoCheckSedentarinessModel
               
                var entity                  = SedentaryReminderEntity.init()
                entity.isEnabled            = (model.sw == 11)
                entity.startTime            = model.beginHour*60 + model.beginMinute
                entity.endTime              = model.endHour*60 + model.endMinute
                entity.interval             = model.interval
                entity.isLaunchBreakEnabled = (model.noonSw  == 1)
                
                complete?(entity)
            }
        }
    }
    
    public override func setSedentaryReminder(_ entity: SedentaryReminderEntity, complete: ExecutionData.BoolCallback? = nil) {
        
        /**
         午休时间可以修改
         */
        let model = EAAutoCheckSedentarinessModel.init()
        model.sw            = entity.isEnabled.hashValue + 10
        model.beginHour     = entity.startTime / 60
        model.beginMinute   = entity.startTime % 60
        model.endHour       = entity.endTime / 60
        model.endMinute     = entity.endTime % 60
        model.interval      = entity.interval
        model.noonSw        = entity.isLaunchBreakEnabled.hashValue
        model.noonBeginHour     = 12
        model.noonBeginMinute   = 0
        model.noonEndHour       = 14
        model.noonEndMinute     = 0
        
        eaBleSendManager?.operationChange(model) { respondModel in
            
            complete?(respondModel.eErrorCode == .success)
        }
    }
    
    // FIXME: - 用户信息
    public override func queryUserInfo(complete: ExecutionData.UserProfileCallback?) {
        
        eaBleSendManager?.operationGetInfo(with: .user) { baseModel in
            
            if baseModel.isKind(of: EAUserModel.self) {
                
                let model = baseModel as! EAUserModel
               
                var entity                  = UserProfileEntity.init()
                entity.weight               = model.weight / 1000
                entity.height               = model.height
                entity.gender               = (model.sexType == .male) ? 1 : 0
                entity.age                  = model.age
                
                complete?(entity)
            }
        }
    }
    
    public override func setUserInfo(_ entity: UserProfileEntity, complete: ExecutionData.BoolCallback? = nil) {
        
        let model = EAUserModel.init()
        model.weight    = entity.weight*1000
        model.height    = entity.height
        model.sexType   = (entity.gender == 1) ? .male : .male
        model.age       = entity.age
        
        eaBleSendManager?.operationChange(model) { respondModel in
            
            complete?(respondModel.eErrorCode == .success)
        }
    }
    
    // FIXME: - 日常目标
    public override func queryDailyTarget(complete: ExecutionData.DailyTargetCallback?) {
     
        eaBleSendManager?.operationGetInfo(with: .dailyGoal) { baseModel in
            
            if baseModel.isKind(of: EADailyGoalModel.self) {
                
                let model = baseModel as! EADailyGoalModel
               
                var entity                  = DailyTargetEntity.init()
                entity.step                 = model.sStep.goal
                entity.calories             = model.sCalorie.goal/1000
                complete?(entity)
            }
        }
    }
    
    public override func setDailyTarget(_ entity: DailyTargetEntity, complete: ExecutionData.BoolCallback?) {
        
        let model               = EADailyGoalModel.init()
        model.sStep.goal        = entity.step
        model.sCalorie.goal     = entity.calories*1000
        model.sStep.sw          = 1
        model.sCalorie.sw       = 1
        
//        model.sSleep.sw         = 0
//        model.sDistance.sw      = 0
//        model.sDuration.sw      = 0
//        model.sSleep.goal       = 8*60
//        model.sDistance.goal    = 5*1000
//        model.sDuration.goal    = 120
        
        eaBleSendManager?.operationChange(model) { respondModel in
            
            complete?(respondModel.eErrorCode == .success)
        }
        
    }
    
    // FIXME: - 单位（天气）1摄氏度，2华氏度
    public override func queryTemperatureUnit(complete: ExecutionData.IntCallback?) {
        
        eaBleSendManager?.operationGetInfo(with: .weather) { baseModel in
            
            if baseModel.isKind(of: EAWeatherModel.self) {
                
                let model = baseModel as! EAWeatherModel
                var unit = 2
                if(model.eFormat == .centigrade) {
                    unit = 1
                }
                complete?(unit)
            }
        }
    }
    // 不支持单独设置
    public override func setTemperatureUnit(_ entity: Int, complete: ExecutionData.BoolCallback? = nil) {
        
      
    }
    public override func pushTodayWeather(_ entity: TodayWeatherEntity, complete: ExecutionData.BoolCallback?) {
        
        let weatherType:EAWeatherType = getEAWeatherType(from:  entity.type)
        let eRays:EAWeatherRaysType = getWeatherRaysType(from: entity.uv)
        eaBleSendManager?.operationGetInfo(with: .weather) {  [weak self] baseModel in
            
            if baseModel.isKind(of: EAWeatherModel.self) {
                
                let model = baseModel as! EAWeatherModel
                model.currentTemperature = entity.temperature;
                
                
                var sDayArray:[EADayWeatherModel] = model.sDayArray as! [EADayWeatherModel] //EADayWeatherModel*> *sDayArray
                
                let dayWeather = EADayWeatherModel.init()
                dayWeather.eDayType = weatherType
                dayWeather.eNightType = weatherType
                dayWeather.maxTemperature = entity.maxTemperature
                dayWeather.minTemperature = entity.minTemperature
                dayWeather.sunriseTimestamp = entity.sunrise
                dayWeather.sunsetTimestamp = entity.sunset
                dayWeather.airHumidity = entity.humidity
                dayWeather.airGrade = entity.aqiLevel
                dayWeather.eRays = eRays
                
                if sDayArray.count == 0 {
                    
                    sDayArray.append(dayWeather)
                }
                else
                {
                    sDayArray.removeFirst()
                    sDayArray.insert(dayWeather, at: 0)
                }
                
                model.sDayArray = NSMutableArray.init(array: sDayArray)
                self?.eaBleSendManager?.operationChange(model) { respondModel in
                    
                    complete?(respondModel.eErrorCode == .success)
                }
            }
        }
        
    }
    
    public override func pushFutureWeather(_ entity: [FutureWeatherEntity], complete: ExecutionData.BoolCallback?) {
     
        var weatherType:EAWeatherType = .cloudy
        var eRays:EAWeatherRaysType = .weak
        eaBleSendManager?.operationGetInfo(with: .weather) {  [weak self] baseModel in
            
            if baseModel.isKind(of: EAWeatherModel.self) {
                
                let model = baseModel as! EAWeatherModel
                
                var sDayArray:[EADayWeatherModel] = model.sDayArray as! [EADayWeatherModel] //EADayWeatherModel*> *sDayArray
                
                if sDayArray.count == 0 {
                    
                    complete?(false)  // 先下发今天天气
                }
                else
                {
                   
                    // 保留今天数据，删除其他
                    sDayArray.removeSubrange(1..<sDayArray.count)
                    
                    for item in entity {
                        
                        weatherType = (self?.getEAWeatherType(from:  item.type))! as EAWeatherType
                        eRays = (self?.getWeatherRaysType(from: item.uv))! as EAWeatherRaysType
                        
                        let dayWeather = EADayWeatherModel.init()
                        dayWeather.eDayType = weatherType
                        dayWeather.eNightType = weatherType
                        dayWeather.maxTemperature = item.highTemperature
                        dayWeather.minTemperature = item.lowTemperature
                        dayWeather.airHumidity = item.humidity
                        dayWeather.eRays = eRays
                        
                        sDayArray.append(dayWeather)
                    }
                }
               
                model.sDayArray = NSMutableArray.init(array: sDayArray)
                self?.eaBleSendManager?.operationChange(model) { respondModel in
                    
                    complete?(respondModel.eErrorCode == .success)
                }
            }
        }
    }
    
    public override func pushTodayWeather(_ todayWeather: TodayWeatherEntity, _ futureWeathers: [FutureWeatherEntity], _ FutureHourWeathers: [FutureHourWeatherEntity], complete: ExecutionData.BoolCallback?) {
        
        eaBleSendManager?.operationGetInfo(with: .weather) {  [weak self] baseModel in
            
            var weatherType:EAWeatherType = .cloudy
            var eRays:EAWeatherRaysType = .weak
            
            if baseModel.isKind(of: EAWeatherModel.self) {
                
                let model = baseModel as! EAWeatherModel
                model.currentTemperature = todayWeather.temperature;
                
                var sDayArray:[EADayWeatherModel] = []
                
                let dayWeather = EADayWeatherModel.init()
                dayWeather.eDayType = weatherType
                dayWeather.eNightType = weatherType
                dayWeather.maxTemperature = todayWeather.maxTemperature
                dayWeather.minTemperature = todayWeather.minTemperature
                dayWeather.sunriseTimestamp = todayWeather.sunrise
                dayWeather.sunsetTimestamp = todayWeather.sunset
                dayWeather.airHumidity = todayWeather.humidity
                dayWeather.airGrade = todayWeather.aqiLevel
                dayWeather.eRays = eRays
                
                sDayArray.append(dayWeather)
                
                for item in futureWeathers {
                    
                    weatherType = (self?.getEAWeatherType(from:  item.type))! as EAWeatherType
                    eRays = (self?.getWeatherRaysType(from: item.uv))! as EAWeatherRaysType
                    
                    let dayWeather = EADayWeatherModel.init()
                    dayWeather.eDayType = weatherType
                    dayWeather.eNightType = weatherType
                    dayWeather.maxTemperature = item.highTemperature
                    dayWeather.minTemperature = item.lowTemperature
                    dayWeather.airHumidity = item.humidity
                    dayWeather.eRays = eRays
                    
                    sDayArray.append(dayWeather)
                }
                
                model.sDayArray = NSMutableArray.init(array: sDayArray)
                self?.eaBleSendManager?.operationChange(model) { respondModel in
                    
                    complete?(respondModel.eErrorCode == .success)
                }
            }
        }
        
        
        
        
        
    }
    
    // FIXME: - 闹钟
    public override func queryAlarmMaxCount(complete: ExecutionData.IntCallback?) {
        
        complete?(10)
    }
    
    public override func queryAlarmList(complete conplete: ExecutionData.AlarmCallback?) {
        
        eaBleSendManager?.operationGetInfo(with: .reminder) { [weak self] baseModel in
            
            if baseModel.isKind(of: EAReminderOps.self) {
                
                let model = baseModel as! EAReminderOps
                let list:[EAReminderModel] = model.sIndexArray as! [EAReminderModel]
                
                var alarmList:[AlarmEntity] = []
                for reminderModel in list {
                    
                    if reminderModel.reminderEventType == .alarm {
                        var alarmEntity = AlarmEntity.init()
                        alarmEntity.id = reminderModel.id_p
                        alarmEntity.hour = reminderModel.hour
                        alarmEntity.minute = reminderModel.minute
                        alarmEntity.isEnabled = (reminderModel.sw == 1)
                        alarmEntity.repeats = (self?.getWeekCycle(from: reminderModel.weekCycleBit))!
                        
                        alarmList.append(alarmEntity)
                    }
                }
                conplete?(alarmList)
            }
        }
    }
    
    public override func addAlarm(_ entity: AlarmEntity, complete: ExecutionData.BoolCallback?) {
        
        let model = EAReminderModel.init()
        model.sw            = entity.isEnabled.hashValue
        model.hour          = entity.hour
        model.minute        = entity.minute
        model.sw            = entity.isEnabled ? 1 : 0
        model.weekCycleBit  = getEAWeekCycle(from: entity.repeats)
        
        let sIndexArray:[EAReminderModel] = [model]
        
        let ops = EAReminderOps.init()
        ops.eOps = .add
        ops.sIndexArray = sIndexArray as! NSMutableArray
        
        eaBleSendManager?.operationChange(ops) { respondModel in
            
            complete?(respondModel.eErrorCode == .success)
        }
    }
    
    public override func editAlarm(_ entity: AlarmEntity, complete: ExecutionData.BoolCallback?) {
        
        let model = EAReminderModel.init()
        model.sw            = entity.isEnabled.hashValue
        model.hour          = entity.hour
        model.minute        = entity.minute
        model.sw            = entity.isEnabled ? 1 : 0
        model.weekCycleBit  = getEAWeekCycle(from: entity.repeats)
        model.id_p          = entity.id
        
        let sIndexArray:[EAReminderModel] = [model]
        
        let ops = EAReminderOps.init()
        ops.eOps = .edit
        ops.sIndexArray = sIndexArray as! NSMutableArray
        
        eaBleSendManager?.operationChange(ops) { respondModel in
            
            complete?(respondModel.eErrorCode == .success)
        }
    }
    
    public override func deleteAlarm(_ entity: AlarmEntity, complete: ExecutionData.BoolCallback?) {
        
        let model = EAReminderModel.init()
        model.id_p          = entity.id
        
        let sIndexArray:[EAReminderModel] = [model]
        
        let ops = EAReminderOps.init()
        ops.eOps = .del
        ops.sIndexArray = sIndexArray as! NSMutableArray
        
        eaBleSendManager?.operationChange(ops) { respondModel in
            
            complete?(respondModel.eErrorCode == .success)
        }
    }
    
    // FIXME: - 电量
    public override func queryBattery(complete: ExecutionData.BatteryCallback?) {
        
        eaBleSendManager?.operationGetInfo(with: .battery) { baseModel in
            
            if baseModel.isKind(of: EABatteryModel.self) {
                
                let model = baseModel as! EABatteryModel
                
                var entity = QueryBattery.init()
                entity.percentage = model.level
                entity.isCharging = (model.batteryStatus == .inCharging)
                complete?(entity)
            }
        }
    }
    
    // FIXME: - 通讯录
    public override func queryContactMaxCount(complete: ExecutionData.IntCallback?) {
        complete?(20)
    }
    
    public override func sendContactList(_ contacts: Array<ContactPersonEntity>, complete: ExecutionData.BoolCallback? = nil) {
        
        var contactList:[EAContactModel] = []
        
        for contact in contacts {
            
            let book = EAContactModel.init()
            book.name = contact.name
            book.num = contact.phoneNumber
            contactList.append(book)
        }
        
        let model = EATelephoneBookModel.init()
        model.sIndexArray = contactList as! NSMutableArray
        eaBleSendManager?.operationChange(model) { respondModel in
            
            complete?(respondModel.eErrorCode == .success)
        }
    }

    public override func deleteAllContact(complete: ExecutionData.BoolCallback? = nil) {
        
        let model = EATelephoneBookModel.init()
        model.sIndexArray = []
        eaBleSendManager?.operationChange(model) { respondModel in
            
            complete?(respondModel.eErrorCode == .success)
        }
    }
    
    public override func queryContactList(complete: ExecutionData.ContactPersonCallBack?) {
        
        eaBleSendManager?.operationGetInfo(with: .readTelephoneBook) { baseModel in
            
            if baseModel.isKind(of: EAReadTelephoneBookModel.self) {
                
                var list : [ContactPersonEntity] = []
                
                let model = baseModel as! EAReadTelephoneBookModel
                let sIndexArray : [EAPhoneModel] = model.sIndexArray as! [EAPhoneModel]
                for phoneModel in sIndexArray {
                    
                    var entity : ContactPersonEntity = ContactPersonEntity.init()
                    entity.phoneNumber = phoneModel.num
                    
                    list.append(entity)
                }
                complete?(list)
            }
        }
    }
    

    // FIXME: - 语言
    public override func queryLanguage(complete: ExecutionData.IntCallback?) {
        
        eaBleSendManager?.operationGetInfo(with: .language) { [weak self] baseModel in

            if baseModel.isKind(of: EALanguageModel.self) {
                
                let model = baseModel as! EALanguageModel
                complete?(self?.getLanguageType(from: model.language) ?? 1)
            }
        }
        
    }
    
    public override func setLanguage(_ languageId: Int, complete: ExecutionData.BoolCallback? = nil) {
        
        let eaType = getEALanguageType(from: languageId)
        let model = EALanguageModel.init()
        model.language = eaType
        eaBleSendManager?.operationChange(model) { respondModel in
            
            complete?(respondModel.eErrorCode == .success)
        }
    }


    // FIXME: - SOS
    // 不支持开关
//    public func setSOSContactSwitch(_ isEnabled: Bool, complete: CyberBridgeKit_iOS.ExecutionData.BoolCallback?)

    public override func querySOSContactMaxCount(complete: ExecutionData.IntCallback?) {
        
        complete?(1)
    }
    
    public override func sendSOSContacts(_ entitys: [SosCallEntity], _ isEnable: Bool = true, complete: ExecutionData.BoolCallback?) {
        
        let model = EASos.init()
        let entity = entitys.first
        
        model.name = entity?.name ?? ""
        model.num = entity?.phoneNumber ?? ""
        
        eaBleSendManager?.operationChange(model) { respondModel in
            
            complete?(respondModel.eErrorCode == .success)
        }
    }

    public override func querySOSList(complete: ExecutionData.SosCallBack?) {
        
        eaBleSendManager?.operationGetInfo(with: .sos) { baseModel in
            
            if baseModel.isKind(of: EASos.self) {
                
                var list : [SosCallEntity] = []
                
                let model = baseModel as! EASos
                    
                var entity : SosCallEntity = SosCallEntity.init()
                entity.phoneNumber  = model.num
                entity.name         = model.name
                list.append(entity)
                
                complete?(list,true)
            }
        }
    }
    
    // FIXME: - 本地表盘  //表盘id, (0代表手表在线自定义表盘，1~n，内置表盘编号)
    public override func queryDisplayWatchFace(complete: ExecutionData.StringCallBack?) {
        
        eaBleSendManager?.operationGetInfo(with: .dialPlate) { baseModel in

            if baseModel.isKind(of: EADialPlateModel.self) {
                
                let model = baseModel as! EADialPlateModel
                complete?(String(model.id_p))
            }
        }
    }
  
    public override func setDisplayWatchFace(_ id: String, complete: ExecutionData.BoolCallback?) {
     
        let model = EADialPlateModel.init()
        model.id_p = Int(id) ?? 1
        eaBleSendManager?.operationChange(model) { respondModel in
            
            complete?(respondModel.eErrorCode == .success)
        }
    }

    

    // FIXME: - 世界时钟
//    public func queryWorldClockMaxCount(complete: CyberBridgeKit_iOS.ExecutionData.IntCallback?)
//    public func sendWorldClock(_ entitys: [CyberBridgeKit_iOS.WorldClockEntity], complete: CyberBridgeKit_iOS.ExecutionData.BoolCallback?)
//    public func deleteWorldClock(_ id: Int, complete: CyberBridgeKit_iOS.ExecutionData.BoolCallback?)
//    public func queryWorldClocks(complete: CyberBridgeKit_iOS.ExecutionData.WorldClockCallBack?)
//    public func clearWorldClock(complete: Self.BoolCallback?)
    
    // FIXME: - 相机、找手表
    public override func enterCamera(complete: ExecutionData.BoolCallback?) {
        
        let model = EADeviceOps.eaInitDeviceOpsType(.startPhoneCamera)
        eaBleSendManager?.operationChange(model) { respondModel in
            
            complete?(respondModel.eErrorCode == .success)
        }
    }
    
    public override func exitCamera(complete: ExecutionData.BoolCallback? = nil) {
        
        let model = EADeviceOps.eaInitDeviceOpsType(.stopCamera)
        eaBleSendManager?.operationChange(model) { respondModel in
            
            complete?(respondModel.eErrorCode == .success)
        }
    }
    
    
    public override func findDevice(complete: ExecutionData.BoolCallback? = nil) {
        
        let model = EADeviceOps.eaInitDeviceOpsType(.startSearchWatch)
        eaBleSendManager?.operationChange(model) { respondModel in
            
            complete?(respondModel.eErrorCode == .success)
        }
    }
    
    // FIXME: - APP 通知
    public override func queryAppNotify(complete: ExecutionData.NotifysCallBack?) {
        
        // 获取来电等
        eaBleSendManager?.operationGetInfo(with: .socialSwitch) { [weak self] baseModel in

            if baseModel.isKind(of: EASocialSwitchModel.self) {
                
                let socialSwitchModel = baseModel as! EASocialSwitchModel
                
                // 获取app
                self?.eaBleSendManager?.operationGetInfo(with: .appMessage) { baseModel in

                    if baseModel.isKind(of: EAAppMessageSwitchData.self) {
                        
                        let appMessageSwitchData = baseModel as! EAAppMessageSwitchData
                        
                        let list : [CyberBridgeKit_iOS.NotifyEntity] = self?.getAlNotify(from: socialSwitchModel, appMessageSwitchData: appMessageSwitchData) ?? []
                        complete?(list)
                        
                    }
                }
            }
        }
    }
    
    public override func setAppNotify(_ entitys: [NotifyEntity], complete: ExecutionData.BoolCallback?) {
        
        let socialSwitchModel:EASocialSwitchModel = EASocialSwitchModel.init()
        let showAppMessageModel:EAShowAppMessageModel = EAShowAppMessageModel.eaAllocInitWithAll(onOff: true)
        let appMessageSwitchData:EAAppMessageSwitchData = showAppMessageModel.getEAAppMessageSwitchData()
        
        for entity:NotifyEntity in entitys {
            
            if entity.type == ALAppType.phone.rawValue {
                
                socialSwitchModel.sIncomingcall = EASocialOps.eaInitWith(onOff: entity.isEnabled ? 1 : 0, remindActionType: .longShortVibration)
                socialSwitchModel.sMissedcall = EASocialOps.eaInitWith(onOff: entity.isEnabled ? 1 : 0, remindActionType: .oneShortVibration)
            }
            else if entity.type == ALAppType.messages.rawValue {
                
                socialSwitchModel.sSms = EASocialOps.eaInitWith(onOff: entity.isEnabled ? 1 : 0, remindActionType: .oneShortVibration)
            }
            else if entity.type == ALAppType.email.rawValue {
                
                socialSwitchModel.sEmail = EASocialOps.eaInitWith(onOff: entity.isEnabled ? 1 : 0, remindActionType: .oneShortVibration)
            }
            else {
                
                let eaAppType : EAShowAppType = convertToEAShowAppType(ALAppType(rawValue: entity.type)!)
                let appMessageSwitch : EAAppMessageSwitchModel = appMessageSwitchData.sAppSwArray.object(at: Int(eaAppType.rawValue)) as! EAAppMessageSwitchModel
                appMessageSwitch.sw = entity.isEnabled
            }
        }
        eaBleSendManager?.operationChange(appMessageSwitchData) { respondModel in
            
            complete?(respondModel.eErrorCode == .success)
        }
    }
    
    
    // FIXME: - 同步时间
    public override func syncTime(value: Int, complete: ExecutionData.BoolCallback?) {
        
        let model = EASyncTime.getCurrent()
        let timeString = getTimeString(from: TimeInterval(value))
        let list:[String] = timeString.components(separatedBy: "-")
        model.year = Int(list[0])!
        model.month = Int(list[0])!
        model.day = Int(list[0])!
        model.hour = Int(list[0])!
        model.minute = Int(list[0])!
        model.second = Int(list[0])!
        eaBleSendManager?.operationChange(model) { respondModel in
            
            complete?(respondModel.eErrorCode == .success)
        }
    }



   
    




    
}

