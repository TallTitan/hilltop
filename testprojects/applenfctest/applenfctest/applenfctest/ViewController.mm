//
//  ViewController.m
//  applenfctest
//
//  Created by seaschi on 7/24/17.
//  Copyright © 2017 seaschi. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Bitly.h"

#import <CoreNFC/CoreNFC.h>

@interface ViewController () < NFCNDEFReaderSessionDelegate >

// Reference the NFC session
//private var nfcSession: NFCNDEFReaderSession!

@property (nonatomic, strong) NFCNDEFReaderSession* session;

@end

@implementation ViewController

@synthesize session;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Create the NFC Reader Session when the app starts
    session = [[NFCNDEFReaderSession alloc] initWithDelegate:self queue:dispatch_get_main_queue() invalidateAfterFirstRead:NO];
    session.alertMessage = @"You can scan NFC-tags by holding them behind the top of your iPhone, Yeezy.";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onClickNFC:(UIButton *)sender {
    
    [session beginSession];
}

- (IBAction)onClickBitly:(UIButton *)sender {
    TestBitly();
}

- (void)readerSession:(NFCNDEFReaderSession *)session didInvalidateWithError:(NSError *)error {
    NSLog( @"Error: Invalidate." );
}

- (void)readerSession:(NFCNDEFReaderSession *)session didDetectNDEFs:(NSArray<NFCNDEFMessage *> *)messages
{
    NSLog( @"NFC Detected!" );
}

@end
