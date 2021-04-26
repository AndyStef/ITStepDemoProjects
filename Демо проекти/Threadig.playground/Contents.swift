import UIKit

// MARK: - Priorities

func testPriorities() {
    let queue1 = DispatchQueue(label: "MyThread1", qos: .utility)
    let queue2 = DispatchQueue(label: "MyThread2", qos: .userInteractive)
    
    queue1.async {
        for i in 0..<100 {
            print("🦀", i)
        }
    }
    
    queue2.async {
        for i in 0..<100 {
            print("🐬", i)
        }
    }
}

//testPriorities()

// MARK: - Sync vs Async

func testSyncAsync() {
    let queue1 = DispatchQueue(label: "MyThread1", qos: .background, attributes: .concurrent)
    
    queue1.sync {
        for i in 0..<100 {
            print("🦀", i)
        }
    }
    
    // wait till done
    
    queue1.async {
        for i in 0..<100 {
            print("🐬", i)
        }
    }
    
    queue1.async {
        for i in 0..<100 {
            print("🐰", i)
        }
    }
}

//testSyncAsync()

// MARK: - Delay

func testDelay() {
    print(Date())
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        print(Date())
    }
}

//testDelay()

// MARK: - Group of requests

func testDispatchGroup() {
    let imageURLs = [
        "http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg",
        "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg",
        "http://bestkora.com/IosDeveloper/wp-content/uploads/2016/12/Screen-Shot-2017-01-17-at-9.33.52-PM.png",
        "http://www.picture-newsletter.com/arctic/arctic-12.jpg"
    ]
    var _ = [UIImage?]()
    
    let imageDownloadGroup = DispatchGroup()
    for imageURLString in imageURLs {
        imageDownloadGroup.enter()
        DispatchQueue.global().async {
            print("Started downloading image \(imageURLString)")
            guard let imageURL = URL(string: imageURLString), let _ = try? Data(contentsOf: imageURL) else {
                imageDownloadGroup.leave()
                return
            }
            
            print("Downloaded image \(imageURLString)")
            imageDownloadGroup.leave()
        }
    }
    
    imageDownloadGroup.notify(queue: .main) {
        print("All work is done")
    }
}

testDispatchGroup()

// MARK: - Showcase of different function types when working with GCD

func sortNumbersSync(_ input: [Int]) -> [Int] {
    let result = input.sorted()
    return result
}

func testSyncNumbersSort() {
    DispatchQueue.global().async {
        let sortedArray = sortNumbersSync([2, 1, 5])
        
        DispatchQueue.main.async {
            // update UI with sorted array
        }
    }
}

func sortNumbersAsync(_ input: [Int], callback: @escaping (([Int]) -> Void)) {
    let result = input.sorted()
    callback(result)
}

func testAsyncNumbersSort() {
    DispatchQueue.global().async {
        sortNumbersAsync([2, 1, 5]) { result in
            DispatchQueue.main.async {
                // update UI with sorted array
            }
        }
    }
}

func sortNumbersWithResult(_ input: [Int], result: @escaping (Result<[Int], Error>) -> Void) {
    let sortResult = input.sorted()
    result(.success(sortResult))
}

func testResultSortNumbers() {
    DispatchQueue.global().async {
        sortNumbersWithResult([2, 1, 5]) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let resultArray):
                    // update UI with sorted array
                    print(resultArray)
                case .failure(let error):
                    // show error on UI
                    print(error)
                }
            }
        }
    }
}

// MARK: - Callback hell example

func showCallbackHell() {
    makeRequest { result in
        switch result {
        case .success:
            makeRequest { result2 in
                switch result2 {
                case .success:
                    makeRequest { result3 in
                        switch result3 {
                        case .success:
                            print("Finall success")
                            
                        case .failure:
                            print("Error 3")
                        }
                    }
                    
                case .failure:
                    print("Error 2")
                }
            }
            
        case .failure:
            print("Error 1")
        }
    }
}

func makeRequest(callback: @escaping (Result<String, Error>) -> Void) {
    // do some network request
}

// MARK: - Promise example

//func makeRequest() -> Promise<String> {
//    Promise { resolve, reject in
//        makeRequest { result in
//            switch result {
//            case .success(let resultString):
//                resolve(resultString)
//
//            case .failure(let error):
//                reject(error)
//            }
//        }
//    }
//}

//makeRequest()
//    .then(makeRequest)
//    .then(makeRequst)
//    .then(makeRequst)
//    .onError(showError)
//    .finally(hideLoadingView)
//

// MARK: - Async await example

//func makeRequest() async -> String {
//    // call server
//    return "Some network result"
//}
//
//func testAsyncAwait() {
//    let result1 = await makeRequest()
//    let result2 = await makeRequest()
//    let result3 = await makeRequest()
//    let result4 = await makeRequest()
//
//    // Final result
//}

class OrdersResult: Codable {
    let orders: [Order]
}

class Order: Codable {
    let restaurant: String
    let sum: Double
    let timestamp: TimeInterval
    let items: [OrderItem]
}

class OrderItem: Codable {
    let name: String
}
