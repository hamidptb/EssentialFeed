//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Hamid on 8/12/23.
//

import XCTest

class RemoteFeedLoader {
    let client: HttpClient
    let url: URL
    
    init(url: URL, client: HttpClient) {
        self.url = url
        self.client = client
    }
    
    func load() {
        client.get(from: url)
    }
}

protocol HttpClient {
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
        let url = URL(string: "https://a-url.com")!
        let client = HttpClientSpy()
        _ = RemoteFeedLoader(url: url, client: client)
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        let url = URL(string: "https://b-url.com")!
        let client = HttpClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        
        sut.load()
        
        XCTAssertEqual(client.requestedURL, url)
    }
    
}
