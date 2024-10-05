# LogMacro

![SPM](https://img.shields.io/badge/SPM-compatible-brightgreen.svg)
![Swift](https://img.shields.io/badge/Swift-6.0-orange.svg)
[![License](https://img.shields.io/github/license/pelagornis/PLCommand)](https://github.com/pelagornis/PLCommand/blob/main/LICENSE)
![Platform](https://img.shields.io/badge/platforms-macOS%2010.5-red)
[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2FMonsteel%2FLogMacro&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://hits.seeyoufarm.com)

💁🏻‍♂️ iOS15+ 를 지원합니다.<br>
💁🏻‍♂️ Log을 기반으로 하여 구현되었습니다.<br>

## 장점
✅ LogMacro를 사용하면, 좀더 편하게 쉽게 로그를 사용할수 있습니다!


## 기반
이 프로젝트는 [OSLOG](https://developer.apple.com/documentation/os/oslog)을 기반으로 구현되었습니다.<br>
보다 자세한 내용은 해당 라이브러리의 문서를 참고해 주세요

## Swift Package Manager(SPM) 을 통해 사용할 수 있어요
```swift
let package = Package(
    ...
    dependencies: [
        .package(url: "https://github.com/Roy-wonji/LogMacro.git", from: "1.0.2")
    ],
    ...
)
```
```swift
import LogMacro
```

## 사용 방법</br>

### LOG Type
```
1. Debug
2. Info
3. Network
4. Error
5. Test
6. Custom
```

### Debug

```swift
import LogMacro

Log.debug("Debug")
#logDebug("Debug")

Log.debug("Debug", "some message")
#logDebug("Debug", "some message")
```

### Info

```swift
import LogMacro

Log.info("Info")
#logInfo("Info")

Log.info("Info", "some message")
#logInfo("Info", "some message")

```

### Network

```swift
import LogMacro

Log.network("Network")
#logNetwork("Network")

Log.network("Network", "some message")
#logNetwork("Network", "some message")
```

### Error

```swift
import LogMacro

Log.error("Error")
#logError("Error")

Log.error("Error", "some message")
#logError("Error", "some message")
```

### Test

```swift
import LogMacro

Log.test("Test")
#logTest("Test")

Log.test("Test", "some message")
#logTest("Test", "some message")
```

### Custom

```swift
import LogMacro

Log.custom(category: "Custom", "Request started")
#logCustom("Custom", "Request started")

Log.custom("Custom", "some message")
#logCustom("Custom", "some message")
```

## Auther
서원지(Roy) [suhwj81@gmail.com](suhwj81@gmail.com)


## 함께 만들어 나가요

개선의 여지가 있는 모든 것들에 대해 열려있습니다.<br>
PullRequest를 통해 기여해주세요. 🙏


## License

LogMacro 는 MIT 라이선스로 이용할 수 있습니다. 자세한 내용은 [라이선스](LICENSE) 파일을 참조해 주세요.<br>
LogMacro is available under the MIT license. See the  [LICENSE](LICENSE) file for more info.


