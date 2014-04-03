/** 
 * A plugin to integrate iOS Newsstand.
 *
 * Copyright (c) Jean-Christophe Hoelt 2014
 */

var Newsstand = function () {
};

var noop = function () {};
var log = noop;

var exec = function (methodName, options, success, error) {
    cordova.exec(success, error, "Newsstand", methodName, options);
};

var protectCall = function (callback, context) {
    if (callback && typeof callback === 'function') {
        try {
            var args = Array.prototype.slice.call(arguments, 2); 
            callback.apply(this, args);
        }
        catch (err) {
            log('exception in ' + context + ': "' + err + '"');
        }
    }
};

Newsstand.prototype.init = function (options) {
    if (options.debug) {
        exec('debug', [], noop, noop);
        log = function (msg) {
            console.log("Newsstand[js]: " + msg);
        };
    }
    var that = this;
    var setupOk = function () {
        log('setup ok');
        protectCall(options.success, 'init::success');
    };
    var setupFailed = function () {
        log('setup failed');
        protectCall(options.error, 'init::error');
    };
    exec('setup', [], setupOk, setupFailed);
};

/**
 */
Newsstand.prototype.setIcon = function (options) {

    if (!options.url) {
        protectCall(options.error, 'setIcon::error');
        return;
    }

    var ok = function () {
        log('setIcon ok');
        protectCall(options.success, 'setIcon::success');
    };
    var error = function () {
        log('setIcon error');
        protectCall(options.error, 'setIcon::error');
    };

    return exec('setIcon', [{
        url: options.url || null,
        badge: +(options.badge || 0)
    }], ok, error);
};

module.exports = new Newsstand();

