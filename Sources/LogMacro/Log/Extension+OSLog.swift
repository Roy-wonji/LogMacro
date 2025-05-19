//
//  Extension+OSLog.swift
//  LogMacro
//
//  Created by Wonji Suh  on 10/4/24.
//


import Foundation
import OSLog

// MARK: - OSLog Extension

extension OSLog {
  /// 앱 번들 식별자를 기반으로 하는 기본 서브시스템 식별자.
   static let subsystem = Bundle.main.bundleIdentifier ?? "com.default.subsystem"
  
  /// 네트워크 관련 로그를 위한 OSLog 인스턴스.
  ///
  /// - 사용 예:
  ///   ```swift
  ///   os_log("Request started", log: .network, type: .info)
  ///   ```
  static let network = OSLog(subsystem: subsystem, category: "Network")
  
  /// 디버그 레벨 로그를 위한 OSLog 인스턴스.
  ///
  /// - 사용 예:
  ///   ```swift
  ///   os_log("Value: %{public}@", log: .debug, type: .debug, "\(value)")
  ///   ```
  static let debug = OSLog(subsystem: subsystem, category: "Debug")
  
  /// 정보성 로그를 위한 OSLog 인스턴스.
  ///
  /// - 사용 예:
  ///   ```swift
  ///   os_log("User logged in", log: .info, type: .info)
  ///   ```
  static let info = OSLog(subsystem: subsystem, category: "Info")
  
  /// 에러 레벨 로그를 위한 OSLog 인스턴스.
  ///
  /// - 사용 예:
  ///   ```swift
  ///   os_log("Failed to load data: %{public}@", log: .error, type: .error, error.localizedDescription)
  ///   ```
  static let error = OSLog(subsystem: subsystem, category: "Error")
  
  /// 테스트용 로그를 위한 OSLog 인스턴스.
  ///
  /// - 사용 예:
  ///   ```swift
  ///   os_log("Test case passed", log: .test, type: .debug)
  ///   ```
  static let test = OSLog(subsystem: subsystem, category: "Test")
}
