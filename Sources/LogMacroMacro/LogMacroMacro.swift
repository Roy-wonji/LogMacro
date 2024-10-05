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

public struct LogDebugMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        guard let message = node.argumentList.first?.expression else {
            fatalError("compiler bug: the macro does not have any arguments")
        }

        let arguments = node.argumentList.dropFirst().map { "\($0.expression)" }.joined(separator: ", ")

        if arguments.isEmpty {
            return "Log.debug(\(message))"
        } else {
            return "Log.debug(\(message), \(raw: arguments))"
        }
    }
}

public struct LogInfoMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        guard let message = node.argumentList.first?.expression else {
            fatalError("compiler bug: the macro does not have any arguments")
        }

        let arguments = node.argumentList.dropFirst().map { "\($0.expression)" }.joined(separator: ", ")

        if arguments.isEmpty {
            return "Log.info(\(message))"
        } else {
            return "Log.info(\(message), \(raw: arguments))"
        }
    }
}

public struct LogNetworkMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        guard let message = node.argumentList.first?.expression else {
            fatalError("compiler bug: the macro does not have any arguments")
        }

        let arguments = node.argumentList.dropFirst().map { "\($0.expression)" }.joined(separator: ", ")

        if arguments.isEmpty {
            return "Log.network(\(message))"
        } else {
            return "Log.network(\(message), \(raw: arguments))"
        }
    }
}

public struct LogTestMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        guard let message = node.argumentList.first?.expression else {
            fatalError("compiler bug: the macro does not have any arguments")
        }

        let arguments = node.argumentList.dropFirst().map { "\($0.expression)" }.joined(separator: ", ")

        if arguments.isEmpty {
            return "Log.test(\(message))"
        } else {
            return "Log.test(\(message), \(raw: arguments))"
        }
    }
}

public struct LogErrorMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        guard let message = node.argumentList.first?.expression else {
            fatalError("compiler bug: the macro does not have any arguments")
        }

        let arguments = node.argumentList.dropFirst().map { "\($0.expression)" }.joined(separator: ", ")

        if arguments.isEmpty {
            return "Log.error(\(message))"
        } else {
            return "Log.error(\(message), \(raw: arguments))"
        }
    }
}

public struct LogCustomMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        // Ensure there are at least two arguments: category and message
        guard node.argumentList.count >= 2 else {
            fatalError("compiler bug: the macro does not have enough arguments")
        }

        // Extract category and message separately
        let category = node.argumentList.first!.expression
        let message = node.argumentList.dropFirst().first!.expression

        // Extract remaining arguments
        let arguments = node.argumentList.dropFirst(2).map { "\($0.expression)" }.joined(separator: ", ")

        // Construct the final expression without labels for `message` and `arguments`
        if arguments.isEmpty {
            return "Log.custom(category: \(category), \(message))"
        } else {
            return "Log.custom(category: \(category), \(message), \(raw: arguments))"
        }
    }
}

@main
struct MyMacroPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        LogDebugMacro.self,
        LogInfoMacro.self,
        LogNetworkMacro.self,
        LogTestMacro.self,
        LogErrorMacro.self,
        LogCustomMacro.self,
    ]
}


