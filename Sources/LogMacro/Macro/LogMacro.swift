// The Swift Programming Language
// https://docs.swift.org/swift-book

import OSLog

@freestanding(expression)
public macro logDebug(_ message: Any, _ arguments: Any...) = #externalMacro(module: "LogMacroMacro", type: "LogDebugMacro")

@freestanding(expression)
public macro logInfo(_ message: Any, _ arguments: Any...) = #externalMacro(module: "LogMacroMacro", type: "LogInfoMacro")

@freestanding(expression)
public macro logNetwork(_ message: Any, _ arguments: Any...) = #externalMacro(module: "LogMacroMacro", type: "LogNetworkMacro")

@freestanding(expression)
public macro logError(_ message: Any, _ arguments: Any...) = #externalMacro(module: "LogMacroMacro", type: "LogErrorMacro")

@freestanding(expression)
public macro logTest(_ message: Any, _ arguments: Any...) = #externalMacro(module: "LogMacroMacro", type: "LogTestMacro")


@freestanding(expression)
public macro logCustom(_ category: String, _ message: Any, _ arguments: Any...) = #externalMacro(module: "LogMacroMacro", type: "LogCustomMacro")
