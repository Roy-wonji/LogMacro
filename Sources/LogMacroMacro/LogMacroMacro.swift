//
//  LogMacroMacro.swift
//  LogMacro
//
//  Created by Wonji Suh  on 10/4/24.
//

import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import OSLog

// MARK: - LogDebugMacro

/// `#logDebug(...)` 매크로 확장.
///
/// - 인자로 전달된 메시지와 선택적 추가 인자를
///   `Log.debug(...)` 호출로 변환합니다.
/// - 예시:
///   ```swift
///   #logDebug("Value:", x, y)
///   // → Log.debug("Value:", x, y)
///   ```
public struct LogDebugMacro: ExpressionMacro {
  public static func expansion(
    of node: some FreestandingMacroExpansionSyntax,
    in context: some MacroExpansionContext
  ) -> ExprSyntax {
    guard let message = node.arguments.first?.expression else {
      fatalError("compiler bug: no arguments provided to #logDebug")
    }
    let args = node.arguments.dropFirst().map { "\($0.expression)" }.joined(separator: ", ")
    if args.isEmpty {
      return "Log.debug(\(message))"
    } else {
      return "Log.debug(\(message), \(raw: args))"
    }
  }
}

// MARK: - LogInfoMacro

/// `#logInfo(...)` 매크로 확장.
///
/// - `Log.info(...)` 호출로 변환합니다.
/// - 예시:
///   ```swift
///   #logInfo("Started")
///   // → Log.info("Started")
///   ```
public struct LogInfoMacro: ExpressionMacro {
  public static func expansion(
    of node: some FreestandingMacroExpansionSyntax,
    in context: some MacroExpansionContext
  ) -> ExprSyntax {
    guard let message = node.arguments.first?.expression else {
      fatalError("compiler bug: no arguments provided to #logInfo")
    }
    let args = node.arguments.dropFirst().map { "\($0.expression)" }.joined(separator: ", ")
    if args.isEmpty {
      return "Log.info(\(message))"
    } else {
      return "Log.info(\(message), \(raw: args))"
    }
  }
}

// MARK: - LogNetworkMacro

/// `#logNetwork(...)` 매크로 확장.
///
/// - `Log.network(...)` 호출로 변환합니다.
public struct LogNetworkMacro: ExpressionMacro {
  public static func expansion(
    of node: some FreestandingMacroExpansionSyntax,
    in context: some MacroExpansionContext
  ) -> ExprSyntax {
    guard let message = node.arguments.first?.expression else {
      fatalError("compiler bug: no arguments provided to #logNetwork")
    }
    let args = node.arguments.dropFirst().map { "\($0.expression)" }.joined(separator: ", ")
    if args.isEmpty {
      return "Log.network(\(message))"
    } else {
      return "Log.network(\(message), \(raw: args))"
    }
  }
}

// MARK: - LogErrorMacro

/// `#logError(...)` 매크로 확장.
///
/// - `Log.error(...)` 호출로 변환합니다.
public struct LogErrorMacro: ExpressionMacro {
  public static func expansion(
    of node: some FreestandingMacroExpansionSyntax,
    in context: some MacroExpansionContext
  ) -> ExprSyntax {
    guard let message = node.arguments.first?.expression else {
      fatalError("compiler bug: no arguments provided to #logError")
    }
    let args = node.arguments.dropFirst().map { "\($0.expression)" }.joined(separator: ", ")
    if args.isEmpty {
      return "Log.error(\(message))"
    } else {
      return "Log.error(\(message), \(raw: args))"
    }
  }
}

// MARK: - LogTestMacro

/// `#logTest(...)` 매크로 확장.
///
/// - `Log.test(...)` 호출로 변환합니다.
public struct LogTestMacro: ExpressionMacro {
  public static func expansion(
    of node: some FreestandingMacroExpansionSyntax,
    in context: some MacroExpansionContext
  ) -> ExprSyntax {
    guard let message = node.arguments.first?.expression else {
      fatalError("compiler bug: no arguments provided to #logTest")
    }
    let args = node.arguments.dropFirst().map { "\($0.expression)" }.joined(separator: ", ")
    if args.isEmpty {
      return "Log.test(\(message))"
    } else {
      return "Log.test(\(message), \(raw: args))"
    }
  }
}

// MARK: - LogCustomMacro

/// `#logCustom(category:message:...)` 매크로 확장.
///
/// - `Log.custom(category: , ...)` 호출로 변환합니다.
public struct LogCustomMacro: ExpressionMacro {
  /// `#logCustom(category: "Category", "Message", args...)` 매크로를 `Log.custom(...)` 호출로 변환합니다.
  ///
  /// - Parameters:
  ///   - node: 매크로 호출 구문 노드 (`FreestandingMacroExpansionSyntax`)
  ///   - context: 매크로 확장을 위한 컨텍스트 (`MacroExpansionContext`)
  /// - Returns: 컴파일 시점에 삽입될 `ExprSyntax`로,
  ///            `Log.custom(category: <category>, <message>[, <arguments>])` 형태의 코드
  public static func expansion(
    of node: some FreestandingMacroExpansionSyntax,
    in context: some MacroExpansionContext
  ) -> ExprSyntax {
    // 2개 이상의 인자가 반드시 필요합니다.
    guard node.arguments.count >= 2 else {
      fatalError("compiler bug: the macro does not have enough arguments")
    }
    
    // 첫 번째 인자는 카테고리, 두 번째 인자는 메시지
    let category = node.arguments.first!.expression
    let message  = node.arguments.dropFirst().first!.expression
    
    // 나머지 인자가 있으면 쉼표로 연결
    let arguments = node.arguments
      .dropFirst(2)
      .map { "\($0.expression)" }
      .joined(separator: ", ")
    
    if arguments.isEmpty {
      // 추가 인자가 없을 때
      return "Log.custom(category: \(category), \(message))"
    } else {
      // 추가 인자가 있을 때
      return "Log.custom(category: \(category), \(message), \(raw: arguments))"
    }
  }
}
