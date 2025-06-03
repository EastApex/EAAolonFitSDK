//
//  HealthBean.swift
//  CyberWear
//
//  Created by xiao on 18/3/2025.
//

import CoreBluetooth

public class DeviceBean {
    public var peripheral: CBPeripheral?
    public var mac: String
    public var name: String
    public var cloudUUID: String? //云端的uuid
    public var isRetri: Bool = false //true从系统列表获取,false广播获取
    
    public init(mac:String,name:String,pv:CBPeripheral? = nil,cuuid:String? = nil,isRetri:Bool = false){
        self.mac = mac
        self.name = name
        self.peripheral = pv
        self.cloudUUID = cuuid
        self.isRetri = isRetri
    }
    
    public func setPeripheral(_ dv: CBPeripheral){
        self.peripheral = dv
    }
}
public struct HardwareConfig: Codable {
    /// 当前配置信息的版本号，并非 SDK 版本号，默认值：0。起始值 0 往上递增，后续通过修改版本号实现配置信息刷新功能。
    public var configVersion: Int = 0
    /// 是否支持心率功能，默认值：false。
    public var isSupportHeartRate: Bool = false
    /// 是否支持心率自动测量，默认值：false。
    public var isSupportHeartRateAuto: Bool = false
    /// 是否支持设置心率自动测量间隔，默认值：false。
    public var isSupportHeartRateAutoSet: Bool = false
    /// 是否支持心率手动测量，默认值：false。
    public var isSupportHeartRateManual: Bool = false
    /// 是否支持静息心率功能，默认值：false。
    public var isSupportRestingHeartRate : Bool = false
    /// 是否支持血氧功能，默认值：false。
    public var isSupportBloodOxygen: Bool = false
    /// 是否支持血氧自动测量，默认值：false。
    public var isSupportBloodOxygenAuto: Bool = false
    /// 是否支持设置血氧自动测量间隔，默认值：false。
    public var isSupportBloodOxygenAutoSet: Bool = false
    /// 是否支持血氧手动测量，默认值：false。
    public var isSupportBloodOxygenManual: Bool = false
    /// 是否支持压力功能，默认值：false。
    public var isSupportStress: Bool = false
    /// 是否支持压力自动测量，默认值：false。
    public var isSupportStressAuto: Bool = false
    /// 是否支持压力手动测量，默认值：false。
    public var isSupportStressManual: Bool = false
    /// 是否支持睡眠功能，默认值：false。
    public var isSupportSleep: Bool = false
    /// 是否支持睡眠自动测量，默认值：false。
    public var isSupportSleepAuto: Bool = false
    /// 是否支持步数功能，默认值：false。
    public var isSupportStep: Bool = false
    /// 是否支持步数自动测量，默认值：false。
    public var isSupportStepAuto: Bool = false
    /// 是否支持血压功能，默认值：false。
    public var isSupportBloodPressure: Bool = false
    /// 是否支持血压自动测量，默认值：false。
    public var isSupportBloodPressureAuto: Bool = false
    /// 是否支持血压手动测量，默认值：false。
    public var isSupportBloodPressureManual: Bool = false
    /// 是否支持锻炼功能，默认值：false。
    public var isSupportExercise: Bool = false
    /// 是否支持历史锻炼记录，默认值：false。
    public var isSupportExerciseHistory: Bool = false
    /// 是否支持锻炼状态同步，暂停、开始、继续、结束运动等操作，默认值：false。
    public var isSupportExerciseStateSync: Bool = false
    /// 是否支持锻炼时记录 GPS 信息功能，默认值：false。
    public var isSupportExerciseGPS: Bool = false
    /// 是否支持 APP 通知提醒，默认值：false。
    public var isSupportAppNotification: Bool = false
    /// 是否支持短信通知提醒，默认值：false。
    public var isSupportSMSNotification: Bool = false
    /// 是否支持天气，默认值：false。
    public var isSupportWeather: Bool = false
    /// 是否支持天气城市名称，默认值：false。
    public var isSupportWeatherCity: Bool = false
    /// 是否支持心率最高预警，默认值：false。
    public var isSupportHeartRateHighWarning: Bool = false
    /// 是否支持心率最低预警，默认值：false。
    public var isSupportHeartRateLowWarning: Bool = false
    /// 是否支持久坐提醒，默认值：false。
    public var isSupportSedentaryReminder: Bool = false
    /// 是否支持久坐提醒时间段，默认值：false。
    public var isSupportSedentaryReminderTimePeriod: Bool = false
    /// 是否支持久坐提醒提醒间隔，默认值：false。
    public var isSupportSedentaryReminderInterval: Bool = false
    /// 是否支持久坐提醒午休免打扰，默认值：false。
    public var isSupportSedentaryReminderLBNDM: Bool = false
    /// 是否支持久坐提醒午休免打扰时间段，默认值：false。
    public var isSupportSedentaryReminderLBNDMTimePeriod: Bool = false
    /// 是否支持喝水提醒，默认值：false。
    public var isSupportDrinkReminder: Bool = false
    /// 是否支持抬腕亮屏，默认值：false。
    public var isSupportRaiseLightScreen: Bool = false
    /// 是否支持查找手表，默认值：false。
    public var isSupportFindDevice: Bool = false
    /// 是否支持查找手机，默认值：false。
    public var isSupportFindPhone: Bool = false
    /// 是否支持遥控拍照，默认值：false。
    public var isSupportRemoteCamera: Bool = false
    /// 是否支持时间制式，默认值：false。
    public var isSupportTimeFormat: Bool = false
    /// 是否支持温度制式，默认值：false。
    public var isSupportTemperatureFormat: Bool = false
    /// 是否支持公英制，默认值：false。
    public var isSupportMetric: Bool = false
    /// 是否支持音乐播放器，默认值：false。
    public var isSupportMusicPlayer: Bool = false
    /// 是否支持音乐播放器显示音乐信息（歌曲名、歌手名等），默认值：false。
    public var isSupportMusicPlayerInfo: Bool = false
    /// 是否支持勿扰模式，默认值：false。
    public var isSupportNotDisturbMode: Bool = false
    /// 是否支持勿扰模式的开关，默认值：false。
    public var isSupportNotDisturbModeSwitch: Bool = false
    /// 是否支持联系⼈导入，默认值：false。
    public var isSupportImportContact: Bool = false
    /// 是否支持修改语言，默认值：false。
    public var isSupportChangeLanguage: Bool = false
    /// 是否支持表盘功能，默认值：false。
    public var isSupportWatchFace: Bool = false
    /// 是否支持来电提醒，默认值：false。
    public var isSupportCallReminder: Bool = false
    /// 是否需要 BT 配对，默认值：false。
    public var isNeedBond: Bool = false
    /// 是否支持 SOS 功能，默认值：false。
    public var isSupportSOS: Bool = false
    /// 是否支持电子卡片，默认值：false。
    public var isSupportElectronicCard: Bool = false
    /// 是否支持世界时钟，默认值：false。
    public var isSupportWorldClock: Bool = false
    /// 是否支持闹钟，默认值：false。
    public var isSupportAlarmClock: Bool = false
    /// 是否支持短信快捷回复，默认值：false。
    public var isSupportQuickSMSReply: Bool = false
    /// 是否支持设置今日目标（站立时长、运动时长、卡路里、步数、距离），默认值：false。
    public var isSupportSetTodayTarget: Bool = false
    /// 是否支持 SOS 联系人开关，默认值：false。
    public var isSupportSOSContactSwitch: Bool = false
    /// 是否支持生理周期
    public var isSupportMenstrualCycle: Bool = false
    /// 是否支持自定义表盘
    public var isSupportDIYWatchFace: Bool = false
    /// 是否支持在线表盘
    public var isSupportOnlineWatchFace: Bool = false
    /// 是否支持健康自动监测
    public var isSupportHealthAutoMeasure: Bool = false
    /// 是否支持星历AGPS功能
    public var isSupportAGPS: Bool = false
    /// 是否支持未来12小时天气信息
    public var isSupportWeatherFuture24Hours: Bool = false
    public init() {}
}

public struct HeartRateInfoEntity: Codable {
    public var timestamp: TimeInterval = 0 //心率值测量的时间戳。
    public var heartRate: Int = 0  //心率测量结果值，必须大于 0。
    public var measureType: Int = 0 //测量类型，1 自动测量，2 手动测量。
    public init() {}
}

public struct StressInfoEntity: Codable {
    public var timestamp: TimeInterval = 0 //压力值测量的时间戳。
    public var stress: Int = 0  //压力测量结果值，必须大于 0。
    public var measureType: Int = 0 //测量类型，1 自动测量，2 手动测量。
    public init() {}
}

public struct BloodOxygenInfoEntity: Codable {
    public var timestamp: TimeInterval = 0 //血氧值测量的时间戳。
    public var bloodOxygen: Int = 0  //血氧测量结果值，必须大于 0。
    public var measureType: Int = 0 //测量类型，1 自动测量，2 手动测量。
    public init() {}
}

public struct BloodPressureInfoEntity: Codable {
    public var timestamp: TimeInterval = 0 //血氧值测量的时间戳。
    public var sbp: Int = 0  //收缩压（高压值）测量结果值，必须大于 0。
    public var dbp: Int = 0  //舒张压（低压值）测量结果值，必须大于 0。
    public var measureType: Int = 0 //测量类型，1 自动测量，2 手动测量。
    public init() {}
}

public struct SleepInfoEntity: Codable{
    public var startTimestamp:TimeInterval = 0 //睡眠开始时间戳，单位：毫秒。
    public var endTimestamp:TimeInterval = 0 //睡眠结束时间戳，单位：毫秒。
    public var totalTime = 0 //睡眠总时长，包含清醒时长，单位：分钟。
    public var deepSleepTime = 0 //深睡阶段总时长，单位：分钟。
    public var lightSleepTime = 0 //浅睡阶段总时长，单位：分钟。
    public var soberTime = 0 //清醒阶段总时长，单位：分钟。
    public var remTime = 0 //REM 睡眠阶段总时长，单位：分钟
    public var detail:[SleepInfoEntity.Detail]?//睡眠阶段数据列表。
    public init() {}
    
    public struct Detail: Codable {
        public var startTimestamp:TimeInterval = 0 //睡眠阶段开始时间戳，单位：毫秒。
        public var endTimestamp:TimeInterval = 0 //睡眠阶段结束时间戳，单位：毫秒。
        public var type:Int = 0 //睡眠阶段的类型，0 清醒，1 浅睡，2 深睡，3 REM（快速眼动）。
        public init() {}
    }
}

public struct StepInfoEntity: Codable{
    public var timestamp:TimeInterval = 0 //测量时间，步数当天 0 点时间戳，单位：毫秒。
    public var step:Int = 0 //总步数。
    public var distance = 0 //总距离，单位：米。
    public var calories = 0 //总卡路里，单位：千卡。
    public var activityTime:Int? //总活动时长，单位：秒。
    public var category:[StepInfoEntity.Category]?//步数详细数据列表，总步数等于 0 时可为 nil 或 空列表。手表 SDK 需要确保 总步数 与 步数详情 一致。
    public init() {}
    public struct Category: Codable {
        public var timestamp:TimeInterval = 0 //步数产生的时间戳，单位：毫秒。
        public var step:Int = 0 //步数
        public var distance:Int = 0 //距离，单位：米。
        public var calories:Int = 0 //卡路里，单位：千卡。
        public init() {}
    }
}

public struct ExerciseInfoEntity: Codable{
    public var startTimestamp:TimeInterval = 0 //锻炼开始时间，单位：毫秒。
    public var endTimestamp:TimeInterval = 0 //锻炼结束时间，单位：毫秒。
    public var exerciseType = 0 //锻炼类型，由手表 SDK 提供 锻炼类型 参数文件。示例：1 散步，2 跑步。
    public var step = 0 //步数。如锻炼类型不支持步数参数，使用默认值 0 。
    public var calories = 0 //卡路里，单位：千卡。
    public var distance:Int = 0 //距离，单位：米。如锻炼类型不支持距离参数，使用默认值 0 。
    public var activityTime = 0 //活动时长，单位：秒。
    public var heartRateList:[Int]? //锻炼期间的心率值数组数据。如不支持设置，使用默认值 nil。
    public init() {}

}

public struct MenstrualCycleEntity: Codable{
    public var lastMenstrualDate:TimeInterval = 0 //上一次月经的日期时间戳，0时0分0秒，单位：毫秒。
    public var menstrualPeriodDays:Int = 0 //经期天数。
    public var menstrualCycleDays:Int = 0 //经期周期天数。
    public init() {}
}

public struct HeartRateMesureEntity: Codable{
    public var isEnabled = false //心率自动测量的开关，true 开启，false 关闭。
    public var value = 0 //心率自动测量的间隔，单位：分钟。如不支持修改最大心率预警值，使用默认值 0。
    public init() {}
}

public struct StressMeasureEntity: Codable {
    public var isEnabled = false //压力自动测量的开关，true 开启，false 关闭。
    public var value = 0 //压力自动测量的间隔，单位：分钟。如不支持自动测量间隔，使用默认值 0。
    public init() {}
}


public struct BloodOxygenSetEntity: Codable{
    public var isEnabled = false //血氧自动测量的开关，true 开启，false 关闭。
    public var value = 0 //血氧自动测量的间隔，单位：分钟。如不支持自动测量间隔，使用默认值 0。
    public init() {}
}

public struct RaiseLightScreenEntity: Codable {
    public var isEnabled = false //抬腕亮屏开关。（true：开启，false：关闭）
    public var startTime = 0 //抬腕亮屏的开始时间，单位：分钟，取值范围：0～1440，例子：390 表示时间 06:30。如不支持设置，使用默认值 0。
    public var endTime = 0 //抬腕亮屏的结束时间，单位：分钟，取值范围：0～1440，例子：1290 表示时间 21:30。如不支持设置，使用默认值 0。
    public init() {}
}

public struct NotDisturbModeEntity: Codable {
    public var isEnabled = false //勿扰模式开关。（true：开启，false：关闭）
    public var startTime = 0 //勿扰模式的开始时间，单位：分钟，取值范围：0～1440，例子：1320 表示时间 22:00。如不支持设置，使用默认值 0。
    public var endTime = 0 //勿扰模式的结束时间，单位：分钟，取值范围：0～1440，例子：480 表示时间 08:00。如不支持设置，使用默认值 0。
    public init() {}
}

public struct SedentaryReminderEntity: Codable {
    public var isEnabled = false //久坐提醒开关。（true：开启，false：关闭）
    public var startTime = 0 //久坐提醒的开始时间，单位：分钟，取值范围：0～1440，例子：540 表示时间 09:00。如不支持设置，使用默认值 0。
    public var endTime = 0 //久坐提醒的结束时间，单位：分钟，取值范围：0～1440，例子：540 表示时间 09:00。如不支持设置，使用默认值 0。
    public var interval = 0 //久坐提醒间隔，单位：分钟。如如不支持设置，使用默认值 0。
    public var isLaunchBreakEnabled = false //久坐提醒的午休免打扰开关。如不支持设置，使用默认值 false。
    public init() {}
}

public struct UserProfileEntity: Codable {
    public var weight = 0 //用户体重，单位：kg。
    public var height = 0 //用户身高，单位：cm。
    public var gender = 0 //用户性别，0  女性，1  男性。
    public var age = 0 //用户年龄。
    public init() {}
}

public struct DailyTargetEntity: Codable {
    public var step = 0 //每日目标步数。
    public var calories = 0 //每日目标卡路里，单位：千卡。如不支持设置，使用默认值 0。
    public init() {}
}

public struct TodayWeatherEntity: Codable {
    public var city = "" //城市名称，可能会传空字符串，但不会传 nil 值。
    public var temperature = 0 //温度值，单位：摄氏度。
    public var type = 0 //天气类型，0  多云，1  雾，2  阴天，3  雨，4  雪，5  晴，6  沙尘暴，7  阴霾，8  其他。
    public var sunrise = 0 //日出时间，单位：分钟。取值范围：0～1439，例子：405 表示时间 06:45。如不支持设置，使用默认值 0。
    public var sunset = 0 //日落时间，单位：分钟。取值范围：0～1439，例子：1110 表示时间 18:30。如不支持设置，使用默认值 0。
    public var maxTemperature = 0 //当天最高温度，单位：摄氏度。
    public var minTemperature = 0 //当天最低温度，单位：摄氏度。
    public var uv = 0 //紫外线强度。如不支持设置，使用默认值 0。
    public var humidity = 0 //空气湿度百分比。如不支持设置，使用默认值 0。
    public var pm25 = 0 //pm2.5空气质量。如不支持设置，使用默认值 0。
    public var updateTimeInMillis:TimeInterval = 0 //天气更新的时间戳，单位：毫秒。
    public var aqiLevel = 0 //AQI空气质量等级。 1 = 好，2 = 一般，3 = 中等，4 = 差，5 = 非常差
    public init() {}
}

public struct FutureWeatherEntity: Codable {
    public var lowTemperature = 0 //最低温度值，单位：摄氏度。
    public var highTemperature = 0 //最高温度值，单位：摄氏度。
    public var type = 0 //天气类型，0  多云，1  雾，2  阴天，3  雨，4  雪，5  晴，6  沙尘暴，7  阴霾，8  其他。
    public var uv = 0 //紫外线强度。如不支持设置，使用默认值 0。
    public var humidity = 0 //空气湿度百分比。如不支持设置，使用默认值 0。
    public var timeInMillis:TimeInterval = 0 //天气更新的时间戳，单位：毫秒。
    public init() {}
}

public struct AlarmEntity: Codable {
    public var id = 0 //闹钟 ID，从 0 开始包含 0，取值范围：0  ~ （最大数量-1）。
    public var hour = 0 //闹钟小时值。
    public var minute = 0 //闹钟分钟值。
    public var isEnabled = false //闹钟开启状态
    public var repeats = [0]//每周重复模式，值代表周几。周日为0，周六为6。[]表示单次，[0,1,2,3,4,5,6]表示每天
    public init() {}
}


public struct QueryBattery: Codable {
    public var percentage = 0 //当前电量的百分比值（0-100）
    public var isCharging = false //是否处于充电中。如不支持则使用默认值：false。
    public init() {}
}


public struct ContactPersonEntity: Codable {
    public var id = 0 //联系人 Id，从 0 开始包含 0，取值范围：0  ~ （最大数量-1）。
    public var name = "" //联系人名称。
    public var phoneNumber = "" //联系人电话号码。
    public init() {}
}

public struct CardEntity: Codable {
    public var id = 0 //电子名片 ID
    public var title = "" //电子名片标题。
    public var url = "" //电子名片链接，手表用此链接生产对应二维码。
    public init() {}
}

public struct NotifyEntity: Codable {
    public var isEnabled = false //第三方App消息推送开关，（true：开启，false：关闭）
    public var type = 0
    public init() {}
}

public struct SosCallEntity: Codable {
    public var name = "" //联系人名称。
    public var phoneNumber = "" //联系人电话号码。
    public init() {}
}

public struct WorldClockEntity: Codable {
    public var id = 0 //世界时钟的 id，从 0 开始包含 0，取值范围：0  ~ （最大数量-1）。
    public var city = "" //添加时钟的所在城市。
    public var currentTimeZone = 0 //当前手表所在地区的时区，单位：秒。
    public var targetTimeZone = 0 //设置目标地区的时区，单位：秒。
    public init() {}
}


public struct HealthAutoMeasureEntity: Codable {
    public var isEnabled = 0 //健康自动监测的开关，true 开启，false 关闭。
    public var value = 0 //健康自动监测的间隔，单位：分钟。如不支持自动测量间隔，使用默认值 0。
    public init() {}
}



public struct FutureHourWeatherEntity: Codable{
    public var timestamp:TimeInterval = 0 //小时天气数据的时间戳，0分0秒。
    public var type = 0 //天气类型，0  多云，1  雾，2  阴天，3  雨，4  雪，5  晴，6  沙尘暴，7  阴霾，8  其他。
    public var temperature = 0 //小时天气温度。
    public var uv = 0 //紫外线强度。如不支持设置，使用默认值 0。
    public var humidity = 0 //空气湿度百分比。如不支持设置，使用默认值 0。
    public init() {}
}
