//
//  main.swift
//  LogMacro
//
//  Created by Wonji Suh  on 10/4/24.
//

import LogMacro
import OSLog

// MARK: - LogMacro 사용 예시

/// `Log` 구조체 메서드를 직접 호출하는 예시
Log.debug("Debug")         // → OSLog.debug, .debug 타입으로 출력
Log.network("Network")     // → OSLog.network, .default 타입으로 출력
Log.info("Info")           // → OSLog.info, .info 타입으로 출력
Log.error("Error")         // → OSLog.error, .error 타입으로 출력
Log.test("Test")           // → OSLog.test, .debug 타입으로 출력
Log.custom(category: "Network", "Request started")
// → OSLog.debug(category: "🟢 Network"), .debug 타입으로 출력

/// 매크로(`@freestanding`)를 사용해 컴파일 시점에 자동으로
/// 호출 위치, 파일명, 라인 정보 등을 포함할 수 있는 예시
#logDebug("Debug")
#logNetwork("Network")
#logInfo("Info")
#logError("Error")
#logTest("Test")
#logCustom("Network", "Request started")
