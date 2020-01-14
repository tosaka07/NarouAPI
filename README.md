# NarouAPI

小説家になろうAPIクライアント

## Feature

- [x] 小説API
- [x] ユーザー検索API
- [x] 小説ランキングAPI
- [x] 殿堂入りAPI

## TODO

- [ ] Error Handling
- [ ] Request Parameter Validation 
- [ ] Support gzip

## Installation

### Carthage

```
github "tosaka07/NarouAPI"
```

## Basic Usage

### 小説API

[Official Documentation](https://dev.syosetu.com/man/api/)

```swift
NarouAPIClient.fetchNovels(options: [.limit(6)], filterOptions: [.wname(.init(word: "foo"))]) { result in
    switch result {
    case .success(let response):
    case .failure(let failure):
    }
}
```

### ユーザー検索API

[Official Documentation](https://dev.syosetu.com/man/userapi/)

```swift
NarouAPIClient.fetchUsers(options: [], filterOptions: [.userID(123)]) { result in
    switch result {
    case .success(let response):
    case .failure(let failure):
    }
}
```

### 小説ランキングAPI

[Official Documentation](https://dev.syosetu.com/man/rankapi/)

```swift
NarouAPIClient.fetchRankings(options: [.rankingType(.init(date: Date(), type: .daily))]) { result in
    switch result {
    case .success(let response):
    case .failure(let failure):
    }
}
```

### 殿堂入りAPI

[Official Documentation](https://dev.syosetu.com/man/rankinapi/)

```swift
NarouAPIClient.fetchRanks(ncode: "xxx", options: []) { result in
    switch result {
    case .success(let response):
    case .failure(let failure):
    }
}
```

## Link

- [Official Site](https://syosetu.com/)
- [Official API](https://dev.syosetu.com/man/api/)

## Licence

NarouAPI is released under the MIT license.