//
//  ViewController.m
//  AtristApp
//
//  Created by pqj647 on 1/28/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

#import "ViewController.h"
#import "ArtistFacade.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ArtistFacade *f = [ArtistFacade getSharedInstance];
    [f callArtistService:^(NSArray *resultArray, NSError *error) {
        NSLog(@"");
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
