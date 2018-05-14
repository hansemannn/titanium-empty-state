//
//  TiUITableView+EmptyState.h
//  titanium-empty-state
//
//  Created by Hans Knöchel on 01.04.18.
//

#import <UIKit/UIKit.h>

#import "TiBase.h"
#import "TiUITableView.h"
#import "TiUITableViewProxy.h"

#import "UIScrollView+EmptyDataSet.h"

// TODO: Use own delegate to be passed to ListView and TableView to improve maintenance

@interface TiUITableViewProxy (EmptyStateProxy)

- (void)setPlaceholder:(id)arguments;

- (void)togglePlaceholder:(id)visible;

@end

@interface TiUITableView (EmptyState) <DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

@end
