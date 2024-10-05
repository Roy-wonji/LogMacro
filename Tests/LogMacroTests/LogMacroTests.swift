import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import Testing
@testable import LogMacro
@testable import LogMacroMacro

import OSLog


struct LogMacroMacroTests {
    let testMacros: [String: Macro.Type] = [
        "logDebug": LogDebugMacro.self,
        "logInfo": LogInfoMacro.self,
        "logNetwork": LogNetworkMacro.self,
        "logError": LogErrorMacro.self,
        "logTest": LogTestMacro.self,
        "logCustom": LogCustomMacro.self
    ]
    @Test func example() async throws {
        assertMacroExpansion(
             """
             Log.debug("Debug")
             #logDebug("Debug")
             
             Log.network("Network")
             #logNetwork("Network")
             
             Log.info("Info")
             #logInfo("Info")
             
             Log.error("Error")
             #logError("Error")
             
             Log.test("Test")
             #logTest("Test")
             
             Log.custom(category: "Network", "Request started")
             #logCustom("Network", "Request started")
             
             """,
             expandedSource:"""
            Log.debug("Debug")
            #logDebug("Debug")
                             
            Log.network("Network")
            #logNetwork("Network")
                             
            Log.info("Info")
            #logInfo("Info")
                             
            Log.error("Error")
            #logError("Error")
                             
            Log.test("Test")
            #logTest("Test")
            
            Log.custom(category: "Network", "Request started")
            #logCustom("Network", "Request started")
            """
             ,macros: testMacros
        )
    }
}


