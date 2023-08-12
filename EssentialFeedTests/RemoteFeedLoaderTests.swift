//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Hamid on 8/12/23.
//

import XCTest

class RemoteFeedLoader {
    let client: HttpClient
    
    init(client: HttpClient) {
        self.client = client
    }
    
    func load() {
//        HttpClient.shared.get(from: URL(string: "https://a-url.com")!)
        client.get(from: URL(string: "https://a-url.com")!)
    }
}

//class HttpClient {
protocol HttpClient {
//    static var shared = HttpClient()
    
//    func get(from url: URL) {}
    func get(from url: URL)
}

class HttpClientSpy: HttpClient {
    func get(from url: URL) {
        requestedURL = url
    }
    
    var requestedURL : URL?
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let client = HttpClientSpy()
//        HttpClient.shared = client
        _ = RemoteFeedLoader(client: client)
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        let client = HttpClientSpy()
//        HttpClient.shared = client
        let sut = RemoteFeedLoader(client: client)
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }
    
}
