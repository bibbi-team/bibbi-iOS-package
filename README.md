<img src="https://github.com/rlarjsdn3/allen-uikit-learning-notes/assets/21079970/7e41818d-a11f-499d-9e2d-fca4efe74fe8" align="center" width="150" height="150">

Bibbi Package는 삐삐(Bibbi) 앱을 개발하는 데 유용한 `Macro`가 포함되어 있습니다. 해당 리포지토리는 구현된 매크로의 사용 방법을 소개하고 있습니다. 

## Table Of Content

* **Freestanding**
  + Expression 
    * [#URL](#URL)
    
* **Attched**
  + MemberAttribute
    * [@Deprecated](#Deprecated)

## Freestanding

### Expression

#### URL

```swift
let zizi = #URL("https://rlarjsdn3.github.io")

// expanding a macro
let zizi = URL(string: "https://rlarjsdn3.github.io")!
```

## Attahced

### MemberAttribute

#### Deprecated

```swift
@Deprecated
class HomeUseCase {
    func execute() { ... }
}

// expanding a macro
class HomeUseCase {
    @available(*, deprecated)
    func execute() { ... }
}
```


## ChangeLog

* v0.1.0
   + (공란)
