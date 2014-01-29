//
//  MDF1ViewController.m
//  XMLParsing
//
//  Created by Brenna Pavlinchak on 1/29/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import "MDF1ViewController.h"

@interface MDF1ViewController ()

@end

@implementation MDF1ViewController

- (void)viewDidLoad
{
    NSData *theXMLData = [self GetFileDataFromFile:@""]; //Still have no file to put in here
    
    NSXMLParser *theParse = [[NSXMLParser alloc] initWithData:theXMLData];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(NSData*)GetFileDataFromFile:(NSString*)filename
{
    NSString *theFilePath = nil;
    
    NSFileManager *getFileManager = [NSFileManager defaultManager]; //Create the file manager
    
    NSArray *thePath = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES); //Get the path to the document directory
    
    NSString *theDocumentDirectory = [thePath objectAtIndex: 0];
    
    theFilePath = [theDocumentDirectory stringByAppendingPathComponent:filename]; //Create the the fullpath to the data file
    
    if ([getFileManager fileExistsAtPath:theFilePath]) //Does it exist?
    {
        return [NSData dataWithContentsOfFile:theFilePath]; //returns back the NSData for the file
    }
    return nil;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
