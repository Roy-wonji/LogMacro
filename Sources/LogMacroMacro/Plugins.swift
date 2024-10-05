//
//  Plugins.swift
//  LogMacro
//
//  Created by Wonji Suh  on 10/5/24.
//

import SwiftCompilerPlugin
import SwiftSyntaxMacros

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
