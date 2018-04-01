//
//  TiUIListView+EmpyState.h
//  titanium-empty-state
//
//  Created by Hans Knöchel on 01.04.18.
//

#import <UIKit/UIKit.h>

#import "TiBase.h"
#import "TiUIListView.h"
#import "TiUIListViewProxy.h"

#import "UIScrollView+EmptyDataSet.h"

// TODO: Use own delegate to be passed to ListView and TableView to improve maintenance

@interface TiUIListViewProxy (EmptyStateProxy)

- (void)setPlaceholder:(id)arguments;

- (void)togglePlaceholder:(id)visible;

@end

@interface TiUIListView (EmptyState) <DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

@end
