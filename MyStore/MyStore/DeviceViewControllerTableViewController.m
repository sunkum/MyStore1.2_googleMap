//
//  DeviceViewControllerTableViewController.m
//  MyStore
//
//  Created by sunil on 1/5/15.
//  Copyright (c) 2015 sunil. All rights reserved.
//

#import "DeviceViewControllerTableViewController.h"
#import "Device.h"  // this is included for NSManagedObject


@interface DeviceViewControllerTableViewController ()
@property (strong) NSMutableArray *itemsArray;

@end

@implementation DeviceViewControllerTableViewController


- (NSManagedObjectContext *)managedObjectContextFunction
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Fetch the devices from persistent data store
    NSManagedObjectContext *managedObjectContext = [self managedObjectContextFunction];
    
  
    
    NSURL *url = [[NSURL alloc] initWithString:@"https://ajax.googleapis.com/ajax/services/search/images?v=1.0&q=barack%20obama&start=12&rsz=2"];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (connectionError) {
            NSLog(@"connection error %@",connectionError);
        }else {
            
            NSError *error1;
            
            id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error1];
            
            if (error1) {
                NSLog(@"parsing error %@",error1);
            }else {
                //       NSLog(@"%@\n\n%@ \n\n\n%@",response,json, json[@"responseStatus"]);
                
                NSArray *array = [json[@"responseData"][@"results"]  mutableCopy];
                long int itemCount = array.count;
                
                for(int i=0;i<itemCount;i++){
                     NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Device" inManagedObjectContext:managedObjectContext];
                    NSString *personName = json[@"responseData"][@"results"][i][@"contentNoFormatting"];
                    NSString *personImageURL = json[@"responseData"][@"results"][i][@"tbUrl"];
                    [newDevice setValue:personImageURL.description forKey:@"name"];
                    [newDevice setValue:personName.description forKey:@"company"];
                    
                }
                NSError *saveError=nil;
                if (![managedObjectContext save:&saveError]){
                    NSLog(@"save error %@", saveError);
                }
            }
        }
        
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Device"];
        self.itemsArray = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
        [self.tableView reloadData];
    }];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Device"];
    self.itemsArray = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    [self.tableView reloadData];

}

/*- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}*/

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
   
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    //return 0;
    
    NSLog(@"number of row %lu", (unsigned long)self.itemsArray.count);
   return self.itemsArray.count;
}


 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     NSLog(@"in cellforRow 01");
    static NSString *CellIdentifier = @"Cell";
     
     NSLog(@"in cellforRow 02");
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
     
     NSLog(@"cell text%@", cell.textLabel.text);
     NSLog(@"details %@", cell.detailTextLabel.text);
    
    // Configure the cell...
    NSManagedObject *itemsInDatabase = [self.itemsArray objectAtIndex:indexPath.row];
    
    //image view start
     if ([itemsInDatabase valueForKey:@"name"]) {
      // NSURL *imageURL = [[NSURL alloc] initWithString:[itemsInDatabase valueForKey:@"name"]];
     
       NSURL *imageURL = [[NSURL alloc] initWithString:[itemsInDatabase valueForKey:@"name"]];
    
     //NSURL *imageURL = [[NSURL alloc] initWithString:@"http://t3.gstatic.com/images?q=tbn:ANd9GcQHhQgsGxTkIu7AZJApij-OtaZPXH3dzVUaUvFqAwXGyOReKfFydtzSs5ML"];
     
     NSURLRequest *imageRequest = [[NSURLRequest alloc] initWithURL:imageURL];
     
     [NSURLConnection sendAsynchronousRequest:imageRequest queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse *imageResponse, NSData *imageData, NSError *connectionError) {
         if (connectionError) {
             NSLog(@"connection error %@",connectionError);
         }else {
             UIImage *image=[UIImage imageWithData:imageData];
             cell.imageView.image = image;
             [cell.textLabel setText:[itemsInDatabase valueForKey:@"company"]];
             
         }
     }];
     
     }
     

     
     
     
     
     
     
  //image view
   // [cell.textLabel setText:[itemsInDatabase valueForKey:@"company"]];
    //[cell.detailTextLabel setText:[itemsInDatabase valueForKey:@"company"]];
    
    return cell;
}



-(void ) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    UIColor *cellColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.1];
                           cell.backgroundColor = cellColor;
}




// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSManagedObjectContext *context = [self managedObjectContextFunction];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        [context deleteObject:[self.itemsArray objectAtIndex:indexPath.row]];
        NSError *error = nil;
        if (![context save:&error]) {
            NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
            return;
        }
        
        [self.itemsArray removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}



/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
