//
//  Extension+Log.swift
//  LogMacro
//
//  Created by Wonji Suh  on 10/4/24.
//

import Foundation

// MARK: - Log Extension for Structured Logging

public extension Log {
  // MARK: - Debug Logs
  
  /// 디버그 레벨로 로깅합니다.
  ///
  /// - Parameters:
  ///   - message: 로그에 남길 메시지
  ///   - arguments: 메시지 포맷에 전달할 추가 인자들
  static func debug(_ message: Any, _ arguments: Any...) {
    log(message, arguments, level: .debug)
  }
  
  /// 테스트용 로그를 디버그 레벨로 기록합니다.
  ///
  /// - Parameters:
  ///   - message: 테스트 로그 메시지
  ///   - arguments: 메시지 포맷에 전달할 추가 인자들
   static func test(_ message: Any, _ arguments: Any...) {
    log(message, arguments, level: .debug)
  }
  
  // MARK: - Informational Logs
  
  /// 정보 레벨로 로깅합니다.
  /// 문제 해결 시 도움이 될 수 있는 부수적인 정보를 남길 때 사용하세요.
  ///
  /// - Parameters:
  ///   - message: 로그에 남길 메시지
  ///   - arguments: 메시지 포맷에 전달할 추가 인자들
  static func info(_ message: Any, _ arguments: Any...) {
    log(message, arguments, level: .info)
  }
  
  // MARK: - Network Logs
  
  /// 네트워크 관련 이벤트를 로깅합니다.
  ///
  /// - Parameters:
  ///   - message: 로그에 남길 메시지
  ///   - arguments: 메시지 포맷에 전달할 추가 인자들
   static func network(_ message: Any, _ arguments: Any...) {
    log(message, arguments, level: .network)
  }
  
  // MARK: - Error Logs
  
  /// 에러 레벨로 로깅합니다.
  ///
  /// - Parameters:
  ///   - message: 로그에 남길 에러 메시지
  ///   - arguments: 메시지 포맷에 전달할 추가 인자들
   static func error(_ message: Any, _ arguments: Any...) {
    log(message, arguments, level: .error)
  }
  
  // MARK: - Custom Category Logs
  
  /// 커스텀 카테고리로 로깅합니다.
  ///
  /// - Parameters:
  ///   - category: 로그 메시지 카테고리 식별자
  ///   - message: 로그에 남길 메시지
  ///   - arguments: 메시지 포맷에 전달할 추가 인자들
   static func custom(category: String, _ message: Any, _ arguments: Any...) {
    log(message, arguments, level: .custom(category: category))
  }
}
