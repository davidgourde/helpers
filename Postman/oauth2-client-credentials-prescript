/*
README

The client-credentials pre-script checks if a non-expired token is already available.
If not, it requests a new one and stores it in the Postman environment variables.
This variable can be used to authorize your requests.

1. Make sure you have the correct environment variables setup.
  - grant_type
  - resource
  - client_id
  - client_secret
  - oauth_login_url
2. Paste the content of this file to the pre-script tab of the request.
3. In "Authorization", select "Bearer Token" and type "{{currentAccessToken}}" to use the token that will be generated from the pre-script.
*/

var getToken = true;

if (!pm.environment.get('accessTokenExpiry') || 
    !pm.environment.get('currentAccessToken')) {
    console.log('Token or expiry date are missing')
} else if (pm.environment.get('accessTokenExpiry') <= (new Date()).getTime()) {
    console.log('Token is expired')
} else {
    getToken = false;
    console.log('Token and expiry date are OK');
}

const echoPostRequest = {
    url: pm.environment.get("oauth_login_url"),
    method: 'POST',
    header: {
        'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: {
        mode: 'urlencoded',
        urlencoded: [
            {key: 'grant_type', value: pm.environment.get("grant_type")},
            {key: 'resource', value: pm.environment.get("client_resource")},
            {key: 'client_id', value: pm.environment.get("client_id")},
            {key: 'client_secret', value: pm.environment.get("client_secret")}
        ]
    }
}

if (getToken === true) {
    pm.sendRequest(echoPostRequest, function (err, res) {
    console.log(err ? err : res.json());
        if (err === null) {
            console.log('Saving the token and expiry date')
            var responseJson = res.json();
            pm.environment.set('currentAccessToken', responseJson.access_token)
    
            var expiryDate = new Date();
            expiryDate.setSeconds(expiryDate.getSeconds() + parseInt(responseJson.expires_in));
            pm.environment.set('accessTokenExpiry', expiryDate.getTime());
        }
    });
}