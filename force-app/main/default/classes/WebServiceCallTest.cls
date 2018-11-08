@isTest
public with sharing class WebServiceCallTest {
    private static final String REMOTE_URL = 'https://api.github.com/users/xixiao007';
    private static final String MOCK_RESPONSE_JSON = '{ "login": "Xixiao007", "id": 13655323, "node_id": "MDQ6VXNlcjEzNjU1MzIz", "avatar_url": "https://avatars0.githubusercontent.com/u/13655323?v=4", "gravatar_id": "", "url": "https://api.github.com/users/Xixiao007", "html_url": "https://github.com/Xixiao007", "followers_url": "https://api.github.com/users/Xixiao007/followers", "following_url": "https://api.github.com/users/Xixiao007/following{/other_user}", "gists_url": "https://api.github.com/users/Xixiao007/gists{/gist_id}", "starred_url": "https://api.github.com/users/Xixiao007/starred{/owner}{/repo}", "subscriptions_url": "https://api.github.com/users/Xixiao007/subscriptions", "organizations_url": "https://api.github.com/users/Xixiao007/orgs", "repos_url": "https://api.github.com/users/Xixiao007/repos", "events_url": "https://api.github.com/users/Xixiao007/events{/privacy}", "received_events_url": "https://api.github.com/users/Xixiao007/received_events", "type": "User", "site_admin": false, "name": "Xi Xiao", "company": null, "blog": "http://xixiao.info", "location": "Finland", "email": null, "hireable": null, "bio": null, "public_repos": 54, "public_gists": 9, "followers": 1, "following": 0, "created_at": "2015-08-05T06:39:13Z", "updated_at": "2018-11-06T07:52:08Z" }';
    
    @isTest
    public static void testSuccessResponseBody(){
        Test.setMock(HttpCalloutMock.class, new MockGithubWebServiceCaller());

        Test.startTest();
        String res = GithubWebServiceCaller.getXiXiaoUserInfo();
        Test.stopTest();

        String actualValue = res;
        String expectedValue = MOCK_RESPONSE_JSON;

        System.assertEquals(actualValue, expectedValue);
    }

    private class MockGithubWebServiceCaller implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
        System.assertEquals(REMOTE_URL, req.getEndpoint());
        System.assertEquals('GET', req.getMethod());

        HTTPResponse res = new HTTPResponse();
        res.setBody(MOCK_RESPONSE_JSON);
        res.setStatusCode(200);
        return res;
        }
    }
}
