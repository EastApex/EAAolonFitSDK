//
//  CyberBridgeProtocol.swift
//  CyberWear
//
//  Created by xiao on 20/3/2025.
//

import Foundation

public protocol CyberBridgeProtocol{
    typealias HandwarwCallback01 = (HardwareConfig)->()
    typealias HeartRateCallback = ([HeartRateInfoEntity])->()
    typealias StressCallback = ([StressInfoEntity])->()
    typealias BloodOxygenCallback = ([BloodOxygenInfoEntity])->()
    typealias BloodPressureCallback = ([BloodPressureInfoEntity])->()
    typealias SleepCallback = ([SleepInfoEntity])->()
    typealias StepCallback = ([StepInfoEntity])->()
    typealias ExerciseCallback = ([ExerciseInfoEntity])->()
    typealias HeartRateMesureCallback = (HeartRateMesureEntity)->()
    typealias BoolCallback = (Bool)->()
    typealias StressMesureCallback = (StressMeasureEntity)->()
    typealias BloodOxygenMesureCallback = (BloodOxygenSetEntity)->()
    typealias IntCallback = (Int)->()
    typealias RaiseLightScreenCallback = (RaiseLightScreenEntity)->()
    typealias NotDisturbModeCallback = (NotDisturbModeEntity)->()
    typealias SedentaryReminderCallback = (SedentaryReminderEntity)->()
    typealias UserProfileCallback = (UserProfileEntity)->()
    typealias DailyTargetCallback = (DailyTargetEntity)->()
    typealias AlarmCallback = ([AlarmEntity])->()
    typealias BatteryCallback = (QueryBattery)->()
    typealias CardsCallback = ([CardEntity])->()
    typealias IntArrCallBack = ([Int])->()
    typealias NotifysCallBack = ([NotifyEntity])->()
    typealias HealthAutoMeasureCallBack = (HealthAutoMeasureEntity)->()
    typealias MenstrualCycleCallBack = (MenstrualCycleEntity)->()
    typealias WorldClockCallBack = ([WorldClockEntity])->()
    typealias SosCallBack = ([SosCallEntity],Bool)->()
    typealias ContactPersonCallBack = ([ContactPersonEntity])->()
    typealias StringCallBack = (String)->()
    //创建一个sdk实例对象，只创建一次
    func initSDK()
    //连接设备
    func connect()
    //断开
    func disconnect()
    //移除
    func unbind()
    //监听连接
    func setOnBLEConnectState(listener: CyberBridgeDelegate?)
    //查询配置信息
    func queryHardwareConfig(_ complete:HandwarwCallback01?)
    //查询心率
    func fetchHeartRate(complete: HeartRateCallback?)
    //查询压力
    func fetchStress(complete: StressCallback?)
    //查询血氧数
    func fetchBloodOxygen(complete: BloodOxygenCallback?)
    //查询血压
    func fetchBloodPressure(complete: BloodPressureCallback?)
    //查询睡眠数据
    func fetchSleep(complete: SleepCallback?)
    //查询步数数据
    func fetchStep(complete: StepCallback?)
    //查询锻炼数据
    func fetchExercise(complete: ExerciseCallback?)
    //查询心率自动测量参数
    func queryHeartRateAutoMesure(complete: HeartRateMesureCallback?)
    //设置心率自动测量参数
    func setHeartRateAutoMeasure(_ entity: HeartRateMesureEntity, complete: BoolCallback?)
    //查询最大心率预警参数
    func queryHeartRateHighRemind(complete: HeartRateMesureCallback?)
    //设置最大心率预警参数
    func setHeartRateHighRemind(_ entity: HeartRateMesureEntity, complete: BoolCallback?)
    //查询最小心率预警参数
    func queryHeartRateLowRemind(complete: HeartRateMesureCallback?)
    //设置最小心率预警参数
    func setHeartRateLowRemind(_ entity: HeartRateMesureEntity, complete: BoolCallback?)
    //查询压力自动测量参数
    func queryStressAutoMeasure(complete: StressMesureCallback?)
    //设置压力自动测量参数
    func setStressAutoMeasure(_ entity: StressMeasureEntity, complete: BoolCallback?)
    //查询血氧自动测量参数
    func queryBloodOxygenAutoMeasure(complete: BloodOxygenMesureCallback?)
    //设置血氧自动测量参数
    func setBloodOxygenAutoMeasure(_ entity: BloodOxygenSetEntity, complete: BoolCallback?)
    //查询公英制(公英制单位，1 公制，2 英制。)
    func queryMetricAndImperialUnit(complete: IntCallback?)
    //设置公英制(公英制单位，1 公制，2 英制。)
    func setMetricAndImperialUnit(_ metricImperial: Int, complete: BoolCallback?)
    //查询时间制式(1  24 小时制，2  12 小时制。)
    func queryTimeFormat(complete: IntCallback?)
    //设置时间制式
    func setTimeFormat(_ timeFormat: Int, complete: BoolCallback?)
    //查询抬腕亮屏
    func queryRaiseLightScreen(complete: RaiseLightScreenCallback?)
    //设置抬腕亮屏
    func setRaiseLightScreen(_ entity: RaiseLightScreenEntity, complete: BoolCallback?)
    //查询勿扰模式
    func queryNotDisturbMode(complete: NotDisturbModeCallback?)
    //设置勿扰模式
    func setNotDisturbMode(_ entity: NotDisturbModeEntity, complete: BoolCallback?)
    //查询久坐提醒
    func querySedentaryReminder(complete: SedentaryReminderCallback?)
    //设置久坐提醒
    func setSedentaryReminder(_ entity: SedentaryReminderEntity, complete: BoolCallback?)
    //查询用户信息
    func queryUserInfo(complete: UserProfileCallback?)
    //设置用户信息
    func setUserInfo(_ entity: UserProfileEntity, complete: BoolCallback?)
    //查询每日目标
    func queryDailyTarget(complete: DailyTargetCallback?)
    //设置每日目标
    func setDailyTarget(_ entity: DailyTargetEntity, complete: BoolCallback?)
    //查询温度单位(1  摄氏度，2  华氏度。)
    func queryTemperatureUnit(complete: IntCallback?)
    //设置温度单位
    func setTemperatureUnit(_ value: Int, complete: BoolCallback?)
    //推送今日天气
    func pushTodayWeather(_ entity: TodayWeatherEntity, complete: BoolCallback?)
    //推送未来天气
    func pushFutureWeather(_ entitys: [FutureWeatherEntity], complete: BoolCallback?)
    //推送天气
    func pushTodayWeather(_ todayWeather: TodayWeatherEntity,_ futureWeathers:[FutureWeatherEntity],_ FutureHourWeathers:[FutureHourWeatherEntity], complete: BoolCallback?)
    //查询闹钟最大数量
    func queryAlarmMaxCount(complete: IntCallback?)
    //查询闹钟列表
    func queryAlarmList(complete: AlarmCallback?)
    //添加闹钟
    func addAlarm(_ entity: AlarmEntity, complete: BoolCallback?)
    //编辑闹钟
    func editAlarm(_ entity: AlarmEntity, complete: BoolCallback?)
    //删除闹钟
    func deleteAlarm(_ entity: AlarmEntity, complete: BoolCallback?)
    //查询电量
    func queryBattery(complete: BatteryCallback?)
    //查询联系人最大数量
    func queryContactMaxCount(complete: IntCallback?)
    //发送联系人列表
    func sendContactList(_ contacts: [ContactPersonEntity], complete: BoolCallback?)
    //删除单个联系人
    func deleteContact(_ entity: ContactPersonEntity, complete: BoolCallback?)
    //删除全部联系人
    func deleteAllContact(complete: BoolCallback?)
    //查询电子名片最大数量
    func queryEleCardMaxCount(complete: IntCallback?)
    //查询电子名片长度限制
    func queryEleCardLengthLimit(complete: IntCallback?)
    //查询电子名片列表
    func queryEleCardList(complete: CardsCallback?)
    //发送电子名片列表
    func sendEleCard(_ entitys: [CardEntity], complete: BoolCallback?)
    //电子卡片排序
    func sortEleCard(_ ids:[Int],complete:BoolCallback?)
    //删除单个电子名片
    func deleteEleCard(_ entity: CardEntity, complete: BoolCallback?)
    //查询设备当前语言
    /*
     语言 id ，示例：若无法映射，默认英语。
     1  英语，2  中文简体，3  日语，4  韩语，
     5  德语，6  法语，7  西班牙语，8  阿拉伯语，
     9  俄语，10  中文繁体，11  意大利语，12  葡萄牙语，
     13  荷兰语，14  波兰语，15  瑞典语，16  芬兰语，
     17  丹麦语，18  挪威语，19  匈牙利语，20  捷克语，
     21  保加利亚语，22  罗马尼亚语，23  斯洛伐克语，24  拉脱维亚语，
     25  印度尼西亚语，26  泰语，27  乌克兰语，28  越南语，
     38  马来语，
     */
    func queryLanguage(complete: IntCallback?)
    //设置设备当前语言
    func setLanguage(_ languageId: Int, complete: BoolCallback?)
    //查询 SOS 联系人最大数量
    func querySOSContactMaxCount(complete: IntCallback?)
    //设置联系人及sos开关
    func sendSOSContacts(_ entitys:[SosCallEntity],_ isEnabled:Bool ,complete:BoolCallback?)
    //查询当前表盘 ID
    func queryDisplayWatchFace(complete: StringCallBack?)
    //设置当前表盘 ID
    func setDisplayWatchFace(_ id: String, complete: BoolCallback?)
    //查询世界时钟最大数量
    func queryWorldClockMaxCount(complete: IntCallback?)
    //发送世界时钟列表
    func sendWorldClock(_ entitys: [WorldClockEntity], complete: BoolCallback?)
    //删除单个世界时钟
    func deleteWorldClock(_ entity: WorldClockEntity, complete: BoolCallback?)
    //查询所有世界时钟
    func queryWorldClocks(complete: WorldClockCallBack?)
    //进入拍照
    func enterCamera(complete: BoolCallback?)
    //退出拍照
    func exitCamera(complete: BoolCallback?)
    //查找手表
    func findDevice(complete: BoolCallback?)
    //设置⾳频媒体开关  0：未连接通话蓝⽛，1：A2DP连接，2：A2DP断开，0xFF：不⽀持A2DP控制
    func setMusicControlSwitch(state:Int,complete:BoolCallback?)
    //获取音频媒体状态
    func queryMusicControlSwitch(complete:IntCallback?)
    //查看本地app通知类型
    func queryAppNotify(complete: NotifysCallBack?)
    //设置 APP 通知
    func setAppNotify(_ entitys: [NotifyEntity], complete: BoolCallback?)
    //同步手表手机时间
    func syncTime(value:Int,complete: BoolCallback?)
    //查询健康自动监测参数
    func queryHealthAutoMeasure(complete: HealthAutoMeasureCallBack?)
    //设置健康自动监测参数
    func setHealthAutoMeasure(_ entity:HealthAutoMeasureEntity,complete:BoolCallback?)
    //查询生理周期参数
    func queryMenstrualCycleInfo(complete:MenstrualCycleCallBack?)
    //设置生理周期参数
    func setMenstrualCycleInfo(_ entity:MenstrualCycleEntity,complete:BoolCallback?)
    //联系人查询
    func queryContactList(complete: ContactPersonCallBack?)
    //sos联系人查询
    func querySOSList(complete: SosCallBack?)
    //清空世界时钟
    func clearWorldClock(complete: BoolCallback?)
}
