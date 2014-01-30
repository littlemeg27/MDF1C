//
//  MDF1FirstViewController.m
//  MDF1Project4
//
//  Created by Brenna Pavlinchak on 1/27/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import "MDF1FirstViewController.h"
#import "DetailViewController.h"
#import "WeatherItems.h"

@interface MDF1FirstViewController ()

@end

@implementation MDF1FirstViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Table View", @"Table View");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}

- (void)viewDidLoad
{
    weather = [[NSMutableArray alloc] init];
    
    xmlItem = 0; //Setting messages to zero
    
    xmlURL = [[NSURL alloc]initWithString:@"http://i.wxbug.net/REST/SP/getLocationsXML.aspx?api_key=nkzvwtrrrqtnqec8tm4vqeju&SearchString=winterpark"]; //We are creating the URL
    //I wanted a better weather API, but this is the only link that i could get to work
    requestTheXML = [[NSURLRequest alloc] initWithURL:xmlURL]; //
    
    if(requestTheXML != nil)
    {
        connection = [[NSURLConnection alloc]initWithRequest:requestTheXML delegate:self];
        
        requestTheData = [NSMutableData data]; //This holds the data
    }
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if(data !=nil)
    {
        [requestTheData appendData:data];
    }
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *requestTheString = [[NSString alloc]initWithData:requestTheData encoding:NSASCIIStringEncoding]; //This is how we are outputting
    
    if(requestTheString != nil)
    {
        NSArray *pathOfDoc = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES); //Creating the path for the document
        NSString *documentDirectory = [pathOfDoc objectAtIndex:0];
        
        if(documentDirectory !=nil)
        {
            NSString *fullPathOfDocument = [[NSString alloc] initWithFormat:@"%@/%@", documentDirectory, @"index.html"]; //Grabbing the doc directory
            
            if (fullPathOfDocument !=nil)
            {
                [requestTheData writeToFile:fullPathOfDocument atomically:TRUE];
            }
        }
        
        //NSLog(@"%@", requestTheString); //Testing to see if the xml gets requested correctly
    }
    //Starting the parsing
    NSXMLParser *xmlParse = [[NSXMLParser alloc] initWithData:requestTheData]; //We are starting to parse the data we just collected
    
    if(xmlParse != nil)
    {
        [xmlParse setDelegate:self];
        [xmlParse parse];
    }
    //reload tableview with parsed data
    [tableView reloadData];
    
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

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict //Grabs the xml
{
    if([elementName isEqualToString:@"aws:location"]) //Parsing the weather list tag
    {
        cityName = [attributeDict valueForKey:@"cityname"];
        stateName = [attributeDict valueForKey:@"statename"];
        countryName = [attributeDict valueForKey:@"countryname"];
        zipCode = [attributeDict valueForKey:@"zipcode"];
        cityCode = [attributeDict valueForKey:@"citycode"];
        cityType = [attributeDict valueForKey:@"citytype"];
        
        NSLog(@"City: %@, State: %@, Country: %@, Zip Code: %@, City Code: %@, City Type: %@", cityName, stateName, countryName, zipCode, cityCode, cityType);
        
        WeatherItems *item = [[WeatherItems alloc] initWithName:cityName state:stateName country:countryName zip:zipCode code:cityCode type:cityType];
        NSLog(@"Weather Item: %@", item);
        
        if(item !=nil)
        {
            [weather addObject:item];
            NSLog(@"Weather Array: %@", weather);
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath //We need this to do the editing of our tableView
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        NSLog(@"I want to delete: %d", indexPath.row);
        
        [weather removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:[NSMutableArray arrayWithObject:indexPath] withRowAnimation:TRUE];
    }
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section //Creates table view
{
    return [weather count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath //Adds values to each row
{
    static NSString  *cellIdentity = @"Cell";
    
    UITableViewCell *cellRow  = [tableView dequeueReusableCellWithIdentifier: cellIdentity];
    
    if(cellRow == nil)
    {
        cellRow = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: cellIdentity];
    }
    
    WeatherItems *currentWeather = [weather objectAtIndex:indexPath.row]; //Show the name on the table
    
    //add text label
    cellRow.textLabel.text = currentWeather.cityName;
    
    return cellRow;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    DetailViewController *detailView = [[DetailViewController alloc] initWithNibName:@"DetailView" bundle:nil]; //Pop to the detail page
    
    if(detailView !=nil)
    {
        WeatherItems *currentWeather = [weather objectAtIndex:indexPath.row];
        
        detailView.city = currentWeather.cityName; //Show the city on the detail page
        detailView.state = currentWeather.stateName; //Show the state on the detail page
        detailView.country = currentWeather.countryName; //Show the country on the detail page
        detailView.zip = currentWeather.zipCode; //Show the zip on the detail page
        detailView.code = currentWeather.cityCode; //Show the code on the detail page
        detailView.type = currentWeather.cityType; //Show the type on the detail page
        [self presentViewController:detailView animated:YES completion:nil];
        [detailView updateUILabel];
    }
}

-(IBAction)editButton:(id)sender
{
    if(editMode == FALSE) //Ask what type of editing mode
    {
        [tableView setEditing:TRUE];
        [editButton setTitle:@"Finish" forState: UIControlStateNormal];
        editMode = TRUE; //Reset to not be in editing mode
    }
    else
    {
        [tableView setEditing:FALSE];
        [editButton setTitle:@"Edit" forState:UIControlStateNormal];
        editMode = FALSE;
    }
    
}


@end
