//
//  HGLogger.swift
//  HGLogger
//
//  Created by Hardik on 23/02/18.
//  Copyright © 2018 HDG. All rights reserved.
//

import Foundation
import UIKit

/**
 Log type for logging
 */
public enum LogType: String {
    case verbose = "💜 VERBOSE"
    case debug = "💙 DEBUG"
    case info = "💚 INFO"
    case warn = "💛 WARN"
    case error = "❤️ ERROR"
}

public class HGLogger {
    
    /**
     Singleton instance of LightyLogger
     */
    public static let sharedInstance: HGLogger = HGLogger()
    
    /**
     DateFormatter used in logs to format log date and time
     */
    public var dateFormatter: DateFormatter!
    
    /**
     String used to separate log message
     */
    public var separator = " : "
    
    /**
     Enable/disable formatted date for logs
     */
    public var enableTime = true
    
    /**
     Enable/disable logging
     */
    public var enable = true
    
    internal init() {
        dateFormatter = createDateFormatter()
    }
    
    internal func createDateFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .medium
        return dateFormatter
    }
    
    internal func getFormattedDate() -> String {
        if enableTime {
            return dateFormatter.string(from: Date())
        }
        return ""
    }
    
    internal func threadName() -> String {
            if Thread.isMainThread {
                return ""
            } else {
                let threadName = Thread.current.name
                if let threadName = threadName, !threadName.isEmpty {
                    return threadName
                } else {
                    return String(format: "%@%p", separator, Thread.current)
                }
            }
    }
    
    public func log(type: LogType,
                    message: String,
                    file: String = #file,
                    function: String = #function,
                    line: Int = #line) {
        if enable {
            let fileUrl = URL(fileURLWithPath: file)
            let fileExtension = fileUrl.pathExtension
            let fileName = fileUrl.deletingPathExtension().lastPathComponent
            
            let trackedString = "\(fileName).\(fileExtension): \(function) \(line)"
            
            print(type.rawValue +
                " " +
                getFormattedDate() +
                separator +
                trackedString +
                separator +
                message +
                threadName())
        }
    }
    
}
