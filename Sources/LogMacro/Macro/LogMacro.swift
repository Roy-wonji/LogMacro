// The Swift Programming Language
// https://docs.swift.org/swift-book

import OSLog

// MARK: - Stringify Macro

/// 값과 해당 값의 문자열 표현을 함께 반환하는 매크로.
///
/// - Parameters:
///   - value: 임의의 타입 `T` 값.
/// - Returns: `(value, String(describing: value))` 튜플.
/// - Note: 컴파일 시점에 소스 코드 텍스트를 추출해 문자열로 만들어 주므로,
///         런타임 오버헤드 없이 디버깅 정보를 제공합니다.
@freestanding(expression)
public macro stringify<T>(_ value: T) -> (T, String) =
#externalMacro(module: "LogMacroMacro", type: "StringifyMacro")

// MARK: - Log Debug Macro

/// 디버그 레벨 로그를 자동 생성하는 매크로.
///
/// - Parameters:
///   - message: 로그에 남길 주 메시지.
///   - arguments: 메시지 포맷에 전달할 추가 인자들.
/// - Note: `os_log` 또는 `Logger` API를 호출하는 코드를 컴파일 시점에 삽입합니다.
@freestanding(expression)
public macro logDebug(_ message: Any, _ arguments: Any...) =
#externalMacro(module: "LogMacroMacro", type: "LogDebugMacro")

// MARK: - Log Info Macro

/// 정보성 로그를 자동 생성하는 매크로.
///
/// - Parameters:
///   - message: 로그에 남길 주 메시지.
///   - arguments: 메시지 포맷에 전달할 추가 인자들.
@freestanding(expression)
public macro logInfo(_ message: Any, _ arguments: Any...) =
#externalMacro(module: "LogMacroMacro", type: "LogInfoMacro")

// MARK: - Log Network Macro

/// 네트워크 관련 로그를 자동 생성하는 매크로.
///
/// - Parameters:
///   - message: 네트워크 이벤트 메시지.
///   - arguments: 메시지 포맷에 전달할 추가 인자들.
@freestanding(expression)
public macro logNetwork(_ message: Any, _ arguments: Any...) =
#externalMacro(module: "LogMacroMacro", type: "LogNetworkMacro")

// MARK: - Log Error Macro

/// 에러 레벨 로그를 자동 생성하는 매크로.
///
/// - Parameters:
///   - message: 에러 메시지.
///   - arguments: 메시지 포맷에 전달할 추가 인자들.
@freestanding(expression)
public macro logError(_ message: Any, _ arguments: Any...) =
#externalMacro(module: "LogMacroMacro", type: "LogErrorMacro")

// MARK: - Log Test Macro

/// 테스트 실행 로그를 자동 생성하는 매크로.
///
/// - Parameters:
///   - message: 테스트 로그 메시지.
///   - arguments: 메시지 포맷에 전달할 추가 인자들.
@freestanding(expression)
public macro logTest(_ message: Any, _ arguments: Any...) =
#externalMacro(module: "LogMacroMacro", type: "LogTestMacro")

// MARK: - Log Custom Macro

/// 사용자 지정 카테고리 로그를 자동 생성하는 매크로.
///
/// - Parameters:
///   - category: 커스텀 카테고리 식별자.
///   - message: 로그에 남길 주 메시지.
///   - arguments: 메시지 포맷에 전달할 추가 인자들.
@freestanding(expression)
public macro logCustom(
  _ category: String,
  _ message: Any,
  _ arguments: Any...
) = #externalMacro(module: "LogMacroMacro", type: "LogCustomMacro")
