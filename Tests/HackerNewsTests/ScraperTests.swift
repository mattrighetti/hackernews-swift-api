//===----------------------------------------------------------------------===//
//
// This source file is part of the Hacker News API Swift open source project
//
// Copyright (c) 2021 Mattia Righetti. All rights reserved.
//
//===----------------------------------------------------------------------===//

import XCTest
import SwiftSoup
@testable import HackerNews

let table = """
<html lang="en" op="item">

<head>
<meta name="referrer" content="origin">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="news.css?E2teCQt1Hn4ZXtYjdp7S">
<link rel="shortcut icon" href="favicon.ico">
<title>Amazonian moths that drink the tears of sleeping birds | Hacker News</title>
</head>

<body>
<center>
<table id="hnmain" border="0" cellpadding="0" cellspacing="0" width="85%" bgcolor="#f6f6ef">
<tr>
    <td bgcolor="#ff6600">
        <table border="0" cellpadding="0" cellspacing="0" width="100%" style="padding:2px">
            <tr>
                <td style="width:18px;padding-right:4px"><a href="https://news.ycombinator.com"><img
                            src="y18.gif" width="18" height="18" style="border:1px white solid;"></a></td>
                <td style="line-height:12pt; height:10px;"><span class="pagetop"><b class="hnname"><a
                                href="news">Hacker News</a></b>
                        <a href="newest">new</a> | <a href="front">past</a> | <a
                            href="newcomments">comments</a> | <a href="ask">ask</a> | <a
                            href="show">show</a> | <a href="jobs">jobs</a> | <a href="submit">submit</a>
                    </span></td>
                <td style="text-align:right;padding-right:4px;"><span class="pagetop">
                        <a href="login?goto=item%3Fid%3D28016025">login</a>
                    </span></td>
            </tr>
        </table>
    </td>
</tr>
<tr id="pagespace" title="Amazonian moths that drink the tears of sleeping birds" style="height:10px"></tr>
<tr>
    <td>
        <table class="fatitem" border="0">
            <tr class='athing' id='28016025'>
                <td align="right" valign="top" class="title"><span class="rank"></span></td>
                <td valign="top" class="votelinks">
                    <center><a id='up_28016025'
                            href='vote?id=28016025&amp;how=up&amp;goto=item%3Fid%3D28016025'>
                            <div class='votearrow' title='upvote'></div>
                        </a></center>
                </td>
                <td class="title"><a
                        href="https://www.nationalgeographic.com/animals/article/moths-drink-birds-tears-amazon-animals"
                        class="storylink">Amazonian moths that drink the tears of sleeping birds</a><span
                        class="sitebit comhead"> (<a href="from?site=nationalgeographic.com"><span
                                class="sitestr">nationalgeographic.com</span></a>)</span></td>
            </tr>
            <tr>
                <td colspan="2"></td>
                <td class="subtext">
                    <span class="score" id="score_28016025">37 points</span> by <a href="user?id=dsr12"
                        class="hnuser">dsr12</a> <span class="age" title="2021-07-31T07:04:44"><a
                            href="item?id=28016025">2 hours ago</a></span> <span id="unv_28016025"></span> |
                    <a href="hide?id=28016025&amp;goto=item%3Fid%3D28016025">hide</a> | <a
                        href="https://hn.algolia.com/?query=Amazonian%20moths%20that%20drink%20the%20tears%20of%20sleeping%20birds&type=story&dateRange=all&sort=byDate&storyText=false&prefix&page=0"
                        class="hnpast">past</a> | <a
                        href="fave?id=28016025&amp;auth=8001d76ec87235592d199b27646079765690789c">favorite</a>
                    | <a href="item?id=28016025">9&nbsp;comments</a> </td>
            </tr>
            <tr style="height:10px"></tr>
            <tr>
                <td colspan="2"></td>
                <td>
                    <form method="post" action="comment"><input type="hidden" name="parent"
                            value="28016025"><input type="hidden" name="goto"
                            value="item?id=28016025"><input type="hidden" name="hmac"
                            value="94f07c0f950ed6a3047f88888e46f644a58b504f"><textarea name="text" rows="6"
                            cols="60"></textarea>
                        <br><br><input type="submit" value="add comment"></form>
                </td>
            </tr>
        </table><br><br>
        <table border="0" class='comment-tree'>
            <tr class='athing comtr' id='28020899'>
                <td>
                    <table border='0'>
                        <tr>
                            <td class='ind'><img src="s.gif" height="1" width="0"></td>
                            <td valign="top" class="votelinks">
                                <center><a id='up_28020899'
                                        href='vote?id=28020899&amp;how=up&amp;goto=item%3Fid%3D28016025'>
                                        <div class='votearrow' title='upvote'></div>
                                    </a></center>
                            </td>
                            <td class="default">
                                <div style="margin-top:2px; margin-bottom:-10px;"><span class="comhead">
                                        <a href="user?id=Pulcinella" class="hnuser">Pulcinella</a> <span
                                            class="age" title="2021-07-31T19:25:21"><a
                                                href="item?id=28020899">33 minutes ago</a></span> <span
                                            id="unv_28020899"></span><span class="par"></span> <a
                                            class="togg" n="1" href="javascript:void(0)"
                                            onclick="return toggle(event, 28020899)">[–]</a> <span
                                            class='storyon'></span>
                                    </span></div><br>
                                <div class="comment">
                                    <span class="commtext c00">See also puddling:<p><a
                                                href="https:&#x2F;&#x2F;en.wikipedia.org&#x2F;wiki&#x2F;Mud-puddling"
                                                rel="nofollow">https:&#x2F;&#x2F;en.wikipedia.org&#x2F;wiki&#x2F;Mud-puddling</a></span>
                                    <div class='reply'>
                                        <p>
                                            <font size="1">
                                                <u><a
                                                        href="reply?id=28020899&amp;goto=item%3Fid%3D28016025%2328020899">reply</a></u>
                                            </font>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr class='athing comtr' id='28020973'>
                <td>
                    <table border='0'>
                        <tr>
                            <td class='ind'><img src="s.gif" height="1" width="0"></td>
                            <td valign="top" class="votelinks">
                                <center><a id='up_28020973'
                                        href='vote?id=28020973&amp;how=up&amp;goto=item%3Fid%3D28016025'>
                                        <div class='votearrow' title='upvote'></div>
                                    </a></center>
                            </td>
                            <td class="default">
                                <div style="margin-top:2px; margin-bottom:-10px;"><span class="comhead">
                                        <a href="user?id=hyperluz" class="hnuser">hyperluz</a> <span
                                            class="age" title="2021-07-31T19:37:15"><a
                                                href="item?id=28020973">21 minutes ago</a></span> <span
                                            id="unv_28020973"></span><span class="par"></span> <a
                                            class="togg" n="5" href="javascript:void(0)"
                                            onclick="return toggle(event, 28020973)">[–]</a> <span
                                            class='storyon'></span>
                                    </span></div><br>
                                <div class="comment">
                                    <span class="commtext c00">Look at the photo with the bird sleeping: one
                                        moth drinking his tears and three mosquitoes trying to suck his
                                        blood.
                                        Nature is metal.</span>
                                    <div class='reply'>
                                        <p>
                                            <font size="1">
                                                <u><a
                                                        href="reply?id=28020973&amp;goto=item%3Fid%3D28016025%2328020973">reply</a></u>
                                            </font>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr class='athing comtr' id='28021079'>
                <td>
                    <table border='0'>
                        <tr>
                            <td class='ind'><img src="s.gif" height="1" width="40"></td>
                            <td valign="top" class="votelinks">
                                <center><a id='up_28021079'
                                        href='vote?id=28021079&amp;how=up&amp;goto=item%3Fid%3D28016025'>
                                        <div class='votearrow' title='upvote'></div>
                                    </a></center>
                            </td>
                            <td class="default">
                                <div style="margin-top:2px; margin-bottom:-10px;"><span class="comhead">
                                        <a href="user?id=chrisfinazzo" class="hnuser">chrisfinazzo</a> <span
                                            class="age" title="2021-07-31T19:54:45"><a
                                                href="item?id=28021079">3 minutes ago</a></span> <span
                                            id="unv_28021079"></span><span class="par"></span> <a
                                            class="togg" n="1" href="javascript:void(0)"
                                            onclick="return toggle(event, 28021079)">[–]</a> <span
                                            class='storyon'></span>
                                    </span></div><br>
                                <div class="comment">
                                    <span class="commtext c00"><a
                                            href="https:&#x2F;&#x2F;www.youtube.com&#x2F;watch?v=48H34ukFe8g"
                                            rel="nofollow">https:&#x2F;&#x2F;www.youtube.com&#x2F;watch?v=48H34ukFe8g</a></span>
                                    <div class='reply'>
                                        <p>
                                            <font size="1">
                                                <u><a
                                                        href="reply?id=28021079&amp;goto=item%3Fid%3D28016025%2328021079">reply</a></u>
                                            </font>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr class='athing comtr' id='28020992'>
                <td>
                    <table border='0'>
                        <tr>
                            <td class='ind'><img src="s.gif" height="1" width="40"></td>
                            <td valign="top" class="votelinks">
                                <center><a id='up_28020992'
                                        href='vote?id=28020992&amp;how=up&amp;goto=item%3Fid%3D28016025'>
                                        <div class='votearrow' title='upvote'></div>
                                    </a></center>
                            </td>
                            <td class="default">
                                <div style="margin-top:2px; margin-bottom:-10px;"><span class="comhead">
                                        <a href="user?id=scrame" class="hnuser">scrame</a> <span class="age"
                                            title="2021-07-31T19:40:19"><a href="item?id=28020992">18
                                                minutes ago</a></span> <span id="unv_28020992"></span><span
                                            class="par"></span> <a class="togg" n="2"
                                            href="javascript:void(0)"
                                            onclick="return toggle(event, 28020992)">[–]</a> <span
                                            class='storyon'></span>
                                    </span></div><br>
                                <div class="comment">
                                    <span class="commtext c00">Not to mention the fact that birds apparently
                                        cry in their sleep!</span>
                                    <div class='reply'>
                                        <p>
                                            <font size="1">
                                                <u><a
                                                        href="reply?id=28020992&amp;goto=item%3Fid%3D28016025%2328020992">reply</a></u>
                                            </font>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr class='athing comtr' id='28021028'>
                <td>
                    <table border='0'>
                        <tr>
                            <td class='ind'><img src="s.gif" height="1" width="80"></td>
                            <td valign="top" class="votelinks">
                                <center><a id='up_28021028'
                                        href='vote?id=28021028&amp;how=up&amp;goto=item%3Fid%3D28016025'>
                                        <div class='votearrow' title='upvote'></div>
                                    </a></center>
                            </td>
                            <td class="default">
                                <div style="margin-top:2px; margin-bottom:-10px;"><span class="comhead">
                                        <a href="user?id=goldenkey" class="hnuser">goldenkey</a> <span
                                            class="age" title="2021-07-31T19:46:13"><a
                                                href="item?id=28021028">12 minutes ago</a></span> <span
                                            id="unv_28021028"></span><span class="par"></span> <a
                                            class="togg" n="1" href="javascript:void(0)"
                                            onclick="return toggle(event, 28021028)">[–]</a> <span
                                            class='storyon'></span>
                                    </span></div><br>
                                <div class="comment">
                                    <span class="commtext c00">They don&#x27;t. All animals with lacrimal
                                        glands cry in response to irritation or physical contact of the eye
                                        though. These tears are known as &quot;reflex tears.&quot;</span>
                                    <div class='reply'>
                                        <p>
                                            <font size="1">
                                                <u><a
                                                        href="reply?id=28021028&amp;goto=item%3Fid%3D28016025%2328021028">reply</a></u>
                                            </font>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr class='athing comtr' id='28020995'>
                <td>
                    <table border='0'>
                        <tr>
                            <td class='ind'><img src="s.gif" height="1" width="40"></td>
                            <td valign="top" class="votelinks">
                                <center><a id='up_28020995'
                                        href='vote?id=28020995&amp;how=up&amp;goto=item%3Fid%3D28016025'>
                                        <div class='votearrow' title='upvote'></div>
                                    </a></center>
                            </td>
                            <td class="default">
                                <div style="margin-top:2px; margin-bottom:-10px;"><span class="comhead">
                                        <a href="user?id=goldenkey" class="hnuser">goldenkey</a> <span
                                            class="age" title="2021-07-31T19:41:20"><a
                                                href="item?id=28020995">17 minutes ago</a></span> <span
                                            id="unv_28020995"></span><span class="par"></span> <a
                                            class="togg" n="1" href="javascript:void(0)"
                                            onclick="return toggle(event, 28020995)">[–]</a> <span
                                            class='storyon'></span>
                                    </span></div><br>
                                <div class="comment">
                                    <span class="commtext c5a">Nature is abhorrent. Once we have enough
                                        sophistication to leave this planet, the only ethical action is to
                                        crater it. The amount of wild animal suffering is staggering and
                                        reaches many orders of magnitude. Moreso if you include ocean
                                        biomass, much of the deep sea we haven&#x27;t even studied.
                                        Particularly painful sources of suffering include parasites and
                                        disease.<p><a
                                                href="https:&#x2F;&#x2F;en.wikipedia.org&#x2F;wiki&#x2F;Wild_animal_suffering"
                                                rel="nofollow">https:&#x2F;&#x2F;en.wikipedia.org&#x2F;wiki&#x2F;Wild_animal_suffering</a>
                                            <a href="https:&#x2F;&#x2F;en.wikipedia.org&#x2F;wiki&#x2F;Antinatalism"
                                                rel="nofollow">https:&#x2F;&#x2F;en.wikipedia.org&#x2F;wiki&#x2F;Antinatalism</a></span>
                                    <div class='reply'>
                                        <p>
                                            <font size="1">
                                                <u><a
                                                        href="reply?id=28020995&amp;goto=item%3Fid%3D28016025%2328020995">reply</a></u>
                                            </font>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr class='athing comtr' id='28020752'>
                <td>
                    <table border='0'>
                        <tr>
                            <td class='ind'><img src="s.gif" height="1" width="0"></td>
                            <td valign="top" class="votelinks">
                                <center><a id='up_28020752'
                                        href='vote?id=28020752&amp;how=up&amp;goto=item%3Fid%3D28016025'>
                                        <div class='votearrow' title='upvote'></div>
                                    </a></center>
                            </td>
                            <td class="default">
                                <div style="margin-top:2px; margin-bottom:-10px;"><span class="comhead">
                                        <a href="user?id=aerovistae" class="hnuser">aerovistae</a> <span
                                            class="age" title="2021-07-31T19:03:32"><a
                                                href="item?id=28020752">55 minutes ago</a></span> <span
                                            id="unv_28020752"></span><span class="par"></span> <a
                                            class="togg" n="2" href="javascript:void(0)"
                                            onclick="return toggle(event, 28020752)">[–]</a> <span
                                            class='storyon'></span>
                                    </span></div><br>
                                <div class="comment">
                                    <span class="commtext c00">Anyone have a link bypassing the paywall? Or
                                        better yet, an explanation of where to find such links?<p>Also can
                                            we edit the title to specify there&#x27;s a paywall? I
                                            don&#x27;t remember if we have a policy for that around
                                            here.</span>
                                    <div class='reply'>
                                        <p>
                                            <font size="1">
                                                <u><a
                                                        href="reply?id=28020752&amp;goto=item%3Fid%3D28016025%2328020752">reply</a></u>
                                            </font>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr class='athing comtr' id='28020828'>
                <td>
                    <table border='0'>
                        <tr>
                            <td class='ind'><img src="s.gif" height="1" width="40"></td>
                            <td valign="top" class="votelinks">
                                <center><a id='up_28020828'
                                        href='vote?id=28020828&amp;how=up&amp;goto=item%3Fid%3D28016025'>
                                        <div class='votearrow' title='upvote'></div>
                                    </a></center>
                            </td>
                            <td class="default">
                                <div style="margin-top:2px; margin-bottom:-10px;"><span class="comhead">
                                        <a href="user?id=mormegil" class="hnuser">mormegil</a> <span
                                            class="age" title="2021-07-31T19:13:13"><a
                                                href="item?id=28020828">45 minutes ago</a></span> <span
                                            id="unv_28020828"></span><span class="par"></span> <a
                                            class="togg" n="1" href="javascript:void(0)"
                                            onclick="return toggle(event, 28020828)">[–]</a> <span
                                            class='storyon'></span>
                                    </span></div><br>
                                <div class="comment">
                                    <span class="commtext c00"><a
                                            href="https:&#x2F;&#x2F;archive.is&#x2F;qaq3p"
                                            rel="nofollow">https:&#x2F;&#x2F;archive.is&#x2F;qaq3p</a></span>
                                    <div class='reply'>
                                        <p>
                                            <font size="1">
                                                <u><a
                                                        href="reply?id=28020828&amp;goto=item%3Fid%3D28016025%2328020828">reply</a></u>
                                            </font>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr class='athing comtr' id='28020897'>
                <td>
                    <table border='0'>
                        <tr>
                            <td class='ind'><img src="s.gif" height="1" width="0"></td>
                            <td valign="top" class="votelinks">
                                <center><a id='up_28020897'
                                        href='vote?id=28020897&amp;how=up&amp;goto=item%3Fid%3D28016025'>
                                        <div class='votearrow' title='upvote'></div>
                                    </a></center>
                            </td>
                            <td class="default">
                                <div style="margin-top:2px; margin-bottom:-10px;"><span class="comhead">
                                        <a href="user?id=Symbiote" class="hnuser">Symbiote</a> <span
                                            class="age" title="2021-07-31T19:24:59"><a
                                                href="item?id=28020897">33 minutes ago</a></span> <span
                                            id="unv_28020897"></span><span class="par"></span> <a
                                            class="togg" n="1" href="javascript:void(0)"
                                            onclick="return toggle(event, 28020897)">[–]</a> <span
                                            class='storyon'></span>
                                    </span></div><br>
                                <div class="comment">
                                    <span class="commtext c5a">I didn&#x27;t see a paywall, but there was a
                                        video that autoplayed partway down the page.<p>(Interesting article
                                            though.)</span>
                                    <div class='reply'>
                                        <p>
                                            <font size="1">
                                                <u><a
                                                        href="reply?id=28020897&amp;goto=item%3Fid%3D28016025%2328020897">reply</a></u>
                                            </font>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <br><br>
    </td>
</tr>
<tr>
    <td><img src="s.gif" height="10" width="0">
        <table width="100%" cellspacing="0" cellpadding="1">
            <tr>
                <td bgcolor="#ff6600"></td>
            </tr>
        </table><br>
        <center><a href="https://www.ycombinator.com/apply/">
                Applications are open for YC Winter 2022
            </a></center><br>
        <center><span class="yclinks"><a href="newsguidelines.html">Guidelines</a>
                | <a href="newsfaq.html">FAQ</a>
                | <a href="lists">Lists</a>
                | <a href="https://github.com/HackerNews/API">API</a>
                | <a href="security.html">Security</a>
                | <a href="http://www.ycombinator.com/legal/">Legal</a>
                | <a href="http://www.ycombinator.com/apply/">Apply to YC</a>
                | <a href="mailto:hn@ycombinator.com">Contact</a></span><br><br>
            <form method="get" action="//hn.algolia.com/">Search:
                <input type="text" name="q" value="" size="17" autocorrect="off" spellcheck="false"
                    autocapitalize="off" autocomplete="false"></form>
        </center>
    </td>
</tr>
</table>
</center>
</body>
<script type='text/javascript' src='hn.js?E2teCQt1Hn4ZXtYjdp7S'></script>

</html>
"""

final class ScraperTests: XCTestCase {
    func testTableParse() throws {
        let document = try! SwiftSoup.parse(table)
        let tableElements = try! document.getElementsByClass("athing comtr")
        let hasMore = try! document.getElementsByClass("morelink").first() != nil ? true : false
        let comments = parseCommentsTable(tableElements)
        let indexes = comments.map { $0.indentLevel }
        let ids = comments.map { $0.id }
        let users = comments.map { $0.by }
        let times = comments.map { $0.time }
        XCTAssertNotNil(comments)
        XCTAssertFalse(hasMore)
        XCTAssertEqual(comments.count, 9)
        XCTAssertEqual(indexes, [0, 0, 1, 1, 2, 1, 0, 1, 0])
        XCTAssertEqual(ids, [28020899, 28020973, 28021079, 28020992, 28021028, 28020995, 28020752, 28020828, 28020897])
        XCTAssertEqual(users, ["Pulcinella", "hyperluz", "chrisfinazzo", "scrame", "goldenkey", "goldenkey", "aerovistae", "mormegil", "Symbiote"])
        XCTAssertEqual(times, [
            "33 minutes ago",
            "21 minutes ago",
            "3 minutes ago",
            "18 minutes ago",
            "12 minutes ago",
            "17 minutes ago",
            "55 minutes ago",
            "45 minutes ago",
            "33 minutes ago"
        ])
    }
    
    func testGetURL() throws {
        var url = HackerNews.WebsiteURL.item(123412, 2).url
        XCTAssertEqual(url.absoluteString, "https://news.ycombinator.com/item?id=123412&p=2")
        url = HackerNews.WebsiteURL.item(12444, 0).url
        XCTAssertEqual(url.absoluteString, "https://news.ycombinator.com/item?id=12444")
        url = HackerNews.WebsiteURL.item(12444, 1).url
        XCTAssertEqual(url.absoluteString, "https://news.ycombinator.com/item?id=12444")
        url = HackerNews.WebsiteURL.threads("mattrighetti").url
        XCTAssertEqual(url.absoluteString, "https://news.ycombinator.com/threads?id=mattrighetti")
    }
}
