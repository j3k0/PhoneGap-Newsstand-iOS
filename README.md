PhoneGap-Newsstand-iOS
======================

THIS IS WORK IN PROGRESS. Can only be used to change the cover icon of a Newsstand app.

Installation
------------

To install from **command line**:

    cordova plugin add https://github.com/j3k0/PhoneGap-Newsstand-iOS.git

or:

    phonegap local plugin add https://github.com/j3k0/PhoneGap-Newsstand-iOS.git

Documentation
-------------

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

