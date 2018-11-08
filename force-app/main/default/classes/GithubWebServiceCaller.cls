@RestResource(urlMapping='/github/*')
global with sharing class GithubWebServiceCaller {
    @HttpGet
    global static String getXiXiaoUserInfo() {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://api.github.com/users/xixiao007');
        req.setMethod('GET');
        Http http = new Http();
        HttpResponse res = http.send(req);
        return res.getBody();
    }
}
