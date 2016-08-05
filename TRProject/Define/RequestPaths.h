//
//  RequestPaths.h
//  BestGroup
//
//  Created by jiyingxin on 16/6/8.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#ifndef RequestPaths_h
#define RequestPaths_h

#define mBasePath @"http://api.dotaly.com"

#define mFirstPath @"/api/v1/authors?aid=dota&cv=2.6.3&iap=0&ident=2C24C20B-BDEA-4EBB-A4F5-D0855FCB6CB9&jb=0&lv=20160618&nc=1793821064&sc=1&tk=3948a65040d14335c8668304325ec655&ts=1467805895"

#define mSecondPath @"http://news.tianti.tv/list/dota?aid=dota&cv=2.6.3&from=0&iap=0&ident=2C24C20B-BDEA-4EBB-A4F5-D0855FCB6CB9&jb=0&lv=%ld&nc=1267899658&sc=1&tk=ff919e1365c3f22645cbf533305e49ac&ts=1467806030"

#define mFirstPushPath @"http://api.dotaly.com/api/v1/shipin/latest?aid=dota&author=all&cv=2.6.3&iap=0&ident=2C24C20B-BDEA-4EBB-A4F5-D0855FCB6CB9&jb=0&limit=50&lv=20160618&nc=3004103815&offset=0&sc=40&tk=14efa741ac0b107c9780ef76b66004db&ts=1468806727"
#define mFirstHeaderPth @"http://121.41.43.170:8181//YouKuServer/servlet/LatestVideoServlet?type=dota"

#define mSecondJieshuoPath @"http://121.41.43.170:8181//YouKuServer/servlet/SpaceList?type=dota"

#define mSecondjingjiPath @"http://121.41.43.170:8181//YouKuServer/servlet/PagedCollectionVideoServlet?curPage=%ld&type=dota"
#define mSecondBisaiPath @"http://121.41.43.170:8181//YouKuServer/servlet/PagedContestVideoServlet?curPage=%ld&type=dota"

#define mFJSPushPath @"http://121.41.43.170:8181//YouKuServer/servlet/VideoList?curPage=%ld&author=%@"

#endif /* RequestPaths_h */






