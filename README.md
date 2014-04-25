PhoneGap-Newsstand-iOS
======================

This plugin can be used to configure a PhoneGap application as a Newstand application, then change the cover icon to reflect the latest issue.

Installation
------------

To install from **command line**:

    cordova plugin add https://github.com/j3k0/PhoneGap-Newsstand-iOS.git

or:

    phonegap local plugin add https://github.com/j3k0/PhoneGap-Newsstand-iOS.git

Documentation
-------------

Tutorial here: http://fovea.cc/blog/index.php/tutorial-for-phonegap-newsstand-applications/

This is code as documentation... I'll do better later.

    document.addEventListener('deviceready', function () {
        var iconURL = 'http://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Art-Journal_cover_1858.jpg/220px-Art-Journal_cover_1858.jpg';
        newsstand.init({
            debug: true,
            success: function () {
                console.log('newsstand success');
                newsstand.setIcon({
                    url: iconURL,
                    badge: 0,
                    success: function () {
                        console.log('setIcon success');
                    },
                    error: function () {
                        console.log('setIcon error');
                    }
                });
            },
            error: function () {
                console.log('newsstand error');
            }
        });
    }, true);

