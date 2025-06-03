//
//  ExecutionData.swift
//  CyberWear
//
//  Created by xiao on 14/3/2025.
//

import ObjectiveC
import Foundation

//父类其他的手表sdk 继承于他

open class ExecutionData:NSObject,CyberBridgeProtocol {
    
    open var heartRateCall:HeartRateCallback?
    open var stressCall:StressCallback?
    open var bloodOxygenCall:BloodOxygenCallback?
    open var bloodPressureCall:BloodPressureCallback?
    open var sleepCall:SleepCallback?
    open var stepCall:StepCallback?
    open var exerciseCall:ExerciseCallback?
    
    open weak var delegate:CyberBridgeDelegate?
    //设备模型
    open var device:DeviceBean
    
    public init(device:DeviceBean) {
        self.device = device
    }
    
    open func initSDK() {
        
    }
    
    open func connect() {
        
    }
    
    open func disconnect() {
        
    }
    
    open func unbind() {
        
    }
    
    open func setOnBLEConnectState(listener: (any CyberBridgeDelegate)?) {
        
    }
    
    open func queryHardwareConfig(_ complete: HandwarwCallback01?) {
        
    }
    
    open func fetchHeartRate(complete: HeartRateCallback?) {
        self.heartRateCall = complete
    }
    
    open func fetchStress(complete: StressCallback?) {
        self.stressCall = complete
    }
    
    open func fetchBloodOxygen(complete: BloodOxygenCallback?) {
        self.bloodOxygenCall = complete
    }
    
    open func fetchBloodPressure(complete: BloodPressureCallback?) {
        self.bloodPressureCall = complete
    }
    
    open func fetchSleep(complete: SleepCallback?) {
        self.sleepCall = complete
    }
    
    open func fetchStep(complete: StepCallback?) {
        self.stepCall = complete
    }
    
    open func fetchExercise(complete: ExerciseCallback?) {
        self.exerciseCall = complete
    }
    
    open func queryHeartRateAutoMesure(complete: HeartRateMesureCallback?) {
        
    }
    
    open func setHeartRateAutoMeasure(_ entity: HeartRateMesureEntity, complete: BoolCallback?) {
        
    }
    
    open func queryHeartRateHighRemind(complete: HeartRateMesureCallback?) {
        
    }
    
    open func setHeartRateHighRemind(_ entity: HeartRateMesureEntity, complete: BoolCallback?) {
        
    }
    
    open func queryHeartRateLowRemind(complete: HeartRateMesureCallback?) {
        
    }
    
    open func setHeartRateLowRemind(_ entity: HeartRateMesureEntity, complete: BoolCallback?) {
        
    }
    
    open func queryStressAutoMeasure(complete: StressMesureCallback?) {
        
    }
    
    open func setStressAutoMeasure(_ entity: StressMeasureEntity, complete: BoolCallback?) {
        
    }
    
    open func queryBloodOxygenAutoMeasure(complete: BloodOxygenMesureCallback?) {
        
    }
    
    open func setBloodOxygenAutoMeasure(_ entity: BloodOxygenSetEntity, complete: BoolCallback?) {
        
    }
    
    open func queryMetricAndImperialUnit(complete: IntCallback?) {
        
    }
    
    open func setMetricAndImperialUnit(_ metricImperial: Int, complete: BoolCallback?) {
        
    }
    
    open func queryTimeFormat(complete: IntCallback?) {
        
    }
    
    open func setTimeFormat(_ timeFormat: Int, complete: BoolCallback?) {
        
    }
    
    open func queryRaiseLightScreen(complete: RaiseLightScreenCallback?) {
        
    }
    
    open func setRaiseLightScreen(_ entity: RaiseLightScreenEntity, complete: BoolCallback?) {
        
    }
    
    open func queryNotDisturbMode(complete: NotDisturbModeCallback?) {
        
    }
    
    open func setNotDisturbMode(_ entity: NotDisturbModeEntity, complete: BoolCallback?) {
        
    }
    
    open func querySedentaryReminder(complete: SedentaryReminderCallback?) {
        
    }
    
    open func setSedentaryReminder(_ entity: SedentaryReminderEntity, complete: BoolCallback?) {
        
    }
    
    open func queryUserInfo(complete: UserProfileCallback?) {
        
    }
    
    open func setUserInfo(_ entity: UserProfileEntity, complete: BoolCallback?) {
        
    }
    
    open func queryDailyTarget(complete: DailyTargetCallback?) {
        
    }
    
    open func setDailyTarget(_ entity: DailyTargetEntity, complete: BoolCallback?) {
        
    }
    
    open func queryTemperatureUnit(complete: IntCallback?) {
        
    }
    
    open func setTemperatureUnit(_ value: Int, complete: BoolCallback?) {
        
    }
    
    open func pushTodayWeather(_ entity: TodayWeatherEntity, complete: BoolCallback?) {
        
    }
    
    open func pushFutureWeather(_ entitys: [FutureWeatherEntity], complete: BoolCallback?) {
        
    }
    
    open func pushTodayWeather(_ todayWeather: TodayWeatherEntity, _ futureWeathers: [FutureWeatherEntity], _ FutureHourWeathers: [FutureHourWeatherEntity], complete: BoolCallback?) {
        
    }
    
    open func queryAlarmMaxCount(complete: IntCallback?) {
        
    }
    
    open func queryAlarmList(complete: AlarmCallback?) {
        
    }
    
    open func addAlarm(_ entity: AlarmEntity, complete: BoolCallback?) {
        
    }
    
    open func editAlarm(_ entity: AlarmEntity, complete: BoolCallback?) {
        
    }
    
    open func deleteAlarm(_ entity: AlarmEntity, complete: BoolCallback?) {
        
    }
    
    open func queryBattery(complete: BatteryCallback?) {
        
    }
    
    open func queryContactMaxCount(complete: IntCallback?) {
        
    }
    
    open func sendContactList(_ contacts: [ContactPersonEntity], complete: BoolCallback?) {
        
    }
    
    open func deleteContact(_ entity: ContactPersonEntity, complete: BoolCallback?) {
        
    }
    
    open func deleteAllContact(complete: BoolCallback?) {
        
    }
    
    open func queryEleCardMaxCount(complete: IntCallback?) {
        
    }
    
    open func queryEleCardLengthLimit(complete: IntCallback?) {
        
    }
    
    open func queryEleCardList(complete: CardsCallback?) {
        
    }
    
    open func sendEleCard(_ entitys: [CardEntity], complete: BoolCallback?) {
        
    }
    
    open func sortEleCard(_ ids: [Int], complete: BoolCallback?) {
        
    }
    
    open func deleteEleCard(_ entity: CardEntity, complete: BoolCallback?) {
        
    }
    
    open func queryLanguage(complete: IntCallback?) {
        
    }
    
    open func setLanguage(_ languageId: Int, complete: BoolCallback?) {
        
    }
    
    open func querySOSContactMaxCount(complete: IntCallback?) {
        
    }
    
    open func sendSOSContacts(_ entitys: [SosCallEntity],_ isEnable:Bool = true, complete: BoolCallback?) {
        
    }
    
    open func queryDisplayWatchFace(complete: StringCallBack?) {
        
    }
    
    open func setDisplayWatchFace(_ id: String, complete: BoolCallback?) {
        
    }
    
    open func queryWorldClockMaxCount(complete: IntCallback?) {
        
    }
    
    open func sendWorldClock(_ entitys: [WorldClockEntity], complete: BoolCallback?) {
        
    }
    
    open func deleteWorldClock(_ entity: WorldClockEntity, complete: BoolCallback?) {
        
    }
    
    open func queryWorldClocks(complete: WorldClockCallBack?) {
        
    }
    
    open func enterCamera(complete: BoolCallback?) {
        
    }
    
    open func exitCamera(complete: BoolCallback?) {
        
    }
    
    open func findDevice(complete: BoolCallback?) {
        
    }
    
    open func setMusicControlSwitch(state: Int, complete: BoolCallback?) {
        
    }
    
    open func queryMusicControlSwitch(complete: IntCallback?) {
        
    }
    
    open func queryAppNotify(complete: NotifysCallBack?) {
        
    }
    
    open func setAppNotify(_ entitys: [NotifyEntity], complete: BoolCallback?) {
        
    }
    
    open func syncTime(value: Int, complete: BoolCallback?) {
        
    }
    
    open func queryHealthAutoMeasure(complete: HealthAutoMeasureCallBack?) {
        
    }
    
    open func setHealthAutoMeasure(_ entity: HealthAutoMeasureEntity, complete: BoolCallback?) {
        
    }
    
    open func queryMenstrualCycleInfo(complete: MenstrualCycleCallBack?) {
        
    }
    
    open func setMenstrualCycleInfo(_ entity: MenstrualCycleEntity, complete: BoolCallback?) {
        
    }
    
    open func queryContactList(complete: ContactPersonCallBack?) {
        
    }
    
    open func querySOSList(complete: SosCallBack?) {
        
    }
    
    open func clearWorldClock(complete: BoolCallback?) {
        
    }

}

