window.flutterReady = false;

if (!window.applet) {
  window.applet = {
    ready: () => window.flutterReady,
    waitFlutter: () => new Promise((resolve) => {
      if (window.applet.ready()) {
        resolve();
      }
      else {
        window.addEventListener('flutterInAppWebViewPlatformReady', function (event) {
          window.flutterReady = true;
          resolve();
        });
      }
    }),
    $exec: (handler, caller, args) => new Promise((resolve) => {
      window.applet.waitFlutter().then(() => {
        if (args != undefined) {
          window.flutter_inappwebview.callHandler(handler, caller, ...args).then((result) => {
            resolve(result);
          });
        }
        else {
          window.flutter_inappwebview.callHandler(handler, caller).then((result) => {
            resolve(result);
          });
        }
      });
    }),
    execute: (caller, args) => window.applet.$exec('exec', caller, args),
    queryFrame: () => window.applet.execute('queryFrame'),
    http: {
      get: (url, param) => window.applet.execute('httpGet', [ url, param ]),
      post: (url, param) => window.applet.execute('httpPost', [ url, param ])
    }
  }

  window.addEventListener('flutterInAppWebViewPlatformReady', function (event) {
    window.flutterReady = true;
  });
}

var applet = window.applet;
applet.login = ({ clientId, redirectUri, success, failed }) => {
  //alert(applet.ready());
  window.applet.execute('appletLogin', [{ client_id: clientId, redirect_uri: redirectUri }]).then((result) => {
    if (result.data) {
      if (result.data.state) {
        if (success) success(result.data.data);
      }
      else {
        if (failed) failed(result.data);
      }
    }
    else {
      if (failed) failed(result.exception);
    }
  });
};

window.applet.login = applet.login;