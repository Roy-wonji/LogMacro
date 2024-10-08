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
        guard let message = node.arguments.first?.expression else {
            fatalError("compiler bug: the macro does not have any arguments")
        }

        let arguments = node.arguments.dropFirst().map { "\($0.expression)" }.joined(separator: ", ")

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
        guard let message = node.arguments.first?.expression else {
            fatalError("compiler bug: the macro does not have any arguments")
        }

        let arguments = node.arguments.dropFirst().map { "\($0.expression)" }.joined(separator: ", ")

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
        guard let message = node.arguments.first?.expression else {
            fatalError("compiler bug: the macro does not have any arguments")
        }

        let arguments = node.arguments.dropFirst().map { "\($0.expression)" }.joined(separator: ", ")

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
        guard let message = node.arguments.first?.expression else {
            fatalError("compiler bug: the macro does not have any arguments")
        }

        let arguments = node.arguments.dropFirst().map { "\($0.expression)" }.joined(separator: ", ")

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
        guard let message = node.arguments.first?.expression else {
            fatalError("compiler bug: the macro does not have any arguments")
        }

        let arguments = node.arguments.dropFirst().map { "\($0.expression)" }.joined(separator: ", ")

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
        guard node.arguments.count >= 2 else {
            fatalError("compiler bug: the macro does not have enough arguments")
        }

        let category = node.arguments.first!.expression
        let message = node.arguments.dropFirst().first!.expression

        let arguments = node.arguments.dropFirst(2).map { "\($0.expression)" }.joined(separator: ", ")

        if arguments.isEmpty {
            return "Log.custom(category: \(category), \(message))"
        } else {
            return "Log.custom(category: \(category), \(message), \(raw: arguments))"
        }
    }
}




