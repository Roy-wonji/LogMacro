//
//  main.swift
//  LogMacro
//
//  Created by Wonji Suh  on 10/4/24.
//

import LogMacro
import OSLog

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
