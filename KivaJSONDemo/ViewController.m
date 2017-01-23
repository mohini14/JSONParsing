//#define kBgQueue dispatch_get_global_queue (
//DISPATCH_QUEUE_PRIORITY_DEFAULT,;0)
//#define kLatestKivaLoansURL [NSURL URLWithString:
//@"http://api.kivaws.org/v1/loans/search.json?status=fundraising"] //2
//



#import "ViewController.h"


@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	NSURLSession *session=[NSURLSession sharedSession];
	
	NSURL *url=[NSURL URLWithString:@"http://api.kivaws.org/v1/loans/search.json?status=fundraising"];
	
	NSURLSessionDataTask *dataTask=[session dataTaskWithURL:url completionHandler:^(NSData * data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
		
		if(error == nil){
		NSDictionary* json =(NSDictionary *)[NSJSONSerialization dataWithJSONObject:data options:0 error:nil];
							  
		NSLog(@"JSON OBJ=%@",json);
		}
	}];
	
	[dataTask resume];
	
	
//	dispatch_async(dispatch_ge t_global_queue (
//											  DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^{
//		NSData* data = [NSData dataWithContentsOfURL:
//						[NSURL URLWithString:@"http://api.kivaws.org/v1/loans/search.json?status=fundraising"]];
//		[self performSelectorOnMainThread:@selector(fetchedData:)
//          withObject:data waitUntilDone:YES];
//	});
}

//
//- (void)fetchedData:(NSData *)responseData {
//	//parse out the json data
//	NSError* error;
//	NSDictionary* json = [NSJSONSerialization
//        JSONObjectWithData:responseData //1
//						  
//        options:kNilOptions
//        error:&error];
// 
//	NSArray* latestLoans = [json objectForKey:@"loans"]; //2
// 
//	NSLog(@"loans: %@", latestLoans); //3
//}


@end
