//
//  ViewController.swift
//  peticionOpenLibrary
//
//  Created by novyk on 18/5/18.
//  Copyright © 2018 novyk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        asincrono()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    func sincrono() {
        let urls = "https://www.hackingwitswift.com"
        let url = URL(string: urls)
        do {
            let datos: Data? = try Data(contentsOf: url!)
            let texto = String(data: datos!, encoding: String.Encoding.utf8)
            print(texto!)
        } catch {
            print("errror")
        }
        
    }

    func sincrono2() {
    if let url = URL(string: "https://www.hackingwithswift.com") {
        do {
            let contents = try String(contentsOf: url)
            print(contents)
        } catch {
            // contents could not be loaded
        }
    } else {
    // the URL was bad!
    }
    }
    
    
    func asincrono() {
        let url = URL(string: "https://www.hackingwithswift.com")
        let sesion = URLSession.shared
        
        let bloque = {
            (datos: Data?, resp: URLResponse?, error: Error?) -> Void in
            let texto = String(data: datos!, encoding: String.Encoding.utf8)
            print (texto!)
        }
        
        let dt = sesion.dataTask(with: url!, completionHandler: bloque)
        dt.resume()
        print("antes o después")
    }

    
}


//
//
//if let url = URL(string: "https://www.hackingwithswift.com") {
//    do {
//        let contents = try String(contentsOf: url)
//        print(contents)
//    } catch {
//        // contents could not be loaded
//    }
//} else {
//    // the URL was bad!
//}
