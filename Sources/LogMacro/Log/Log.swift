//
//  Log.swift
//  LogMacro
//
//  Created by Wonji Suh  on 10/4/24.
//

import Foundation
import OSLog

/// 로깅 계층의 진입점이 되는 구조체.
///
/// 다양한 로그 레벨을 정의하고, 해당 레벨에 맞춰
/// iOS/macOS 버전에 따라 적절한 로거(API)를 사용해 메시지를 출력합니다.
public struct Log {
  /// 기본 생성자
  public init() {}
  
  // MARK: - LogLevel
  
  /// 지원하는 로그 레벨 및 커스텀 카테고리를 정의합니다.
  public enum LogLevel {
    /// 디버깅 목적으로 남기는 로그
    case debug
    /// 문제 해결 정보, 상태 등을 남기는 정보성 로그
    case info
    /// 네트워크 관련 이벤트를 남기는 로그
    case network
    /// 오류 발생 시 남기는 에러 로그
    case error
    /// 테스트 코드 실행 시 남기는 로그
    case test
    /// 사용자 지정 카테고리로 남기는 로그
    /// - Parameter category: 카테고리 식별 문자열
    case custom(category: String)
    
    /// 로그 메시지에 사용할 카테고리 문자열(이모지 포함)
    fileprivate var category: String {
      switch self {
      case .debug:
        return "🟡 DEBUG"
      case .info:
        return "🟠 INFO"
      case .network:
        return "🔵 NETWORK"
      case .error:
        return "🔴 ERROR"
      case .test:
        return "🟡 Test"
      case .custom(let category):
        return "🟢 \(category)"
      }
    }
    
    /// `os_log`용 `OSLog` 인스턴스
    @MainActor fileprivate var osLog: OSLog {
      switch self {
      case .debug:
        return OSLog.debug
      case .info:
        return OSLog.info
      case .network:
        return OSLog.network
      case .error:
        return OSLog.error
      case .test:
        return OSLog.test
      case .custom:
        return OSLog.debug
      }
    }
    
    /// `os_log` 메시지 타입
    fileprivate var osLogType: OSLogType {
      switch self {
      case .debug, .custom, .test:
        return .debug
      case .info:
        return .info
      case .network:
        return .default
      case .error:
        return .error
      }
    }
  }
  
  // MARK: - Logging Method
  
  /// 지정된 로그 레벨로 메시지를 출력합니다.
  ///
  /// - Parameters:
  ///   - message: 로그에 남길 주 메시지
  ///   - arguments: 추가로 결합할 인수 배열
  ///   - level: 로그 레벨 (`LogLevel`)
  ///
  /// - Note:
  ///   - DEBUG 빌드에서만 실행됩니다.
  ///   - iOS 14+/macOS 11.0+에서는 `Logger`를 사용하고,
  ///     그 이하 버전(iOS 12+/macOS 10.15+)에서는 `os_log`를 사용합니다.
  @MainActor static func log(
    _ message: Any,
    _ arguments: [Any],
    level: LogLevel
  ) {
#if DEBUG
    let extra = arguments.map(String.init(describing:)).joined(separator: " ")
    let fullMessage = "\(message) \(extra)"
    
    if #available(iOS 14.0, macOS 11.0, *) {
      let logger = Logger(subsystem: OSLog.subsystem, category: level.category)
      switch level {
      case .debug, .custom, .test:
        logger.debug("\(fullMessage, privacy: .public)")
      case .info:
        logger.info("\(fullMessage, privacy: .public)")
      case .network:
        logger.log("\(fullMessage, privacy: .public)")
      case .error:
        logger.error("\(fullMessage, privacy: .public)")
      }
    } else if #available(iOS 12.0, macOS 10.15, *) {
      os_log("%{public}@", log: level.osLog, type: level.osLogType, fullMessage)
    }
#endif
  }
}
