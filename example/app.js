var win = Ti.UI.createWindow({
    backgroundColor: '#fff',
    title: 'Placeholder Example'
});

var nav = Ti.UI.iOS.createNavigationWindow({
    window: win
});

var list = Ti.UI.createListView({
    footerTitle: '',
    placeholder: {
        title: Ti.UI.createAttributedString({
            text: 'No Data available'
        }),
        description: Ti.UI.createAttributedString({
            text: 'There is no data available right now.'
        }),
        buttonTitle: Ti.UI.createAttributedString({
            text: 'Reload'
        }),
    }
});

// Handle click events
list.addEventListener('placeholderclick', function(e) {
    if (e.clicksource === 'button') {
        alert('Button clicked!');
        // Handle button click
    } else if (e.clicksource === 'view') {
        // Handle general view
        alert('Placeholder clicked!');
    }
});

// Toogle placeholder on/off
setTimeout(function() {
    list.togglePlaceholder(true);
}, 1000);

win.add(list);
nav.open();
