<!DOCTYPE html>
<html xmlns:itranswarp="http://www.itranswarp.com/" xmlns:wb="http://open.weibo.com/wb">
<!--

-->
<head>
    <meta charset="utf-8" />
    <title>赞助 - 廖雪峰的官方网站</title>
    <meta name="viewport" content="width=device-width" />
    <meta name="keywords" content="javascript,node,jquery,git,python,java,sql,linux,bitcoin,教程,软件,编程,开发,运维,云计算,网络,互联网,比特币,数字货币" />
    <meta name="description" content="研究互联网产品和技术，提供原创中文精品教程" />
    <meta property="x-nav" content="
    /webpage/donate"
    " />
    <link rel="alternate" href="/feed" title="廖雪峰的官方网站" type="application/rss+xml" />
    <!-- meta here -->

    <link rel="stylesheet" href="https://cdn.liaoxuefeng.com/cdn/static/themes/default/css/all.css?v=641f3f8" />

    <!--[if lt IE 9]>
    <link rel="stylesheet" href="/static/themes/default/css/ie.css?v=641f3f8" />
    <![endif]-->

    <script src="https://cdn.liaoxuefeng.com/cdn/static/themes/default/js/all.js?v=641f3f8"></script>

    <script id="tplComment" type="text/plain">
        <div class="uk-comment">
            <div class="uk-comment-header" style="margin-bottom:0">
                <a target="_blank" href="/user/{ user.id }"><img class="uk-comment-avatar uk-border-circle x-avatar" src="{ user.image_url }" width="50" height="50" alt=""></a>
                <h4 class="uk-comment-title"><a target="_blank" href="/discuss/{ board_id }/{ id }">{ name }</a></h4>
                <div class="uk-comment-meta"><a target="_blank" href="/user/{ user.id }">{ user.name }</a> created at { created_at.toSmartDate() }, Last updated at { updated_at.toSmartDate() }</div>
            </div>
            <div class="uk-comment-body x-auto-content">
                { content|safe }
            </div>
        </div>
    </script>

    <script id="tplCommentReply" type="text/plain">
        <div class="uk-comment x-display-deleted-{ deleted }">
            <div class="uk-comment-header" style="margin-bottom:0">
                <a target="_blank" href="/user/{ user.id }"><img class="uk-comment-avatar uk-border-circle x-avatar" src="{ user.image_url }" width="50" height="50" alt=""></a>
                <div class="uk-comment-meta"><a target="_blank" href="/user/{ user.id }">{ user.name }</a></div>
                <div class="uk-comment-meta">Created at { created_at.toSmartDate() }, Last updated at { updated_at.toSmartDate() }</div>
            </div>
            <div class="uk-comment-body x-auto-content">
                { content|safe }
            </div>
        </div>
    </script>

    <script id="tplCommentInfo" type="text/plain">
        <li>
            <div class="x-comment-info">
                <hr>
                <a target="_blank" class="uk-button uk-button-small" href="/discuss/{ board_id }/{ id }"><i class="uk-icon-list-ul"></i> 全部讨论</a>
                &nbsp;
                <a target="_blank" class="uk-button uk-button-small" href="/discuss/{ board_id }/{ id }#reply"><i class="uk-icon-reply"></i> 回复</a>
            </div>
        </li>
    </script>

    <script id="tplCommentArea" type="text/plain">
        <div class="x-display-if-signin">
            <p><button id="comment-make-button" type="button" class="uk-button uk-button-primary"><i class="uk-icon-comment"></i> 发表评论</button></p>
            <form id="comment-form" class="uk-form" style="display:none;">
                <fieldset>
                    <div class="uk-alert uk-alert-danger" style="display:none"></div>
                    <div class="uk-form-row">
                        <label>标题:</label>
                    </div>
                    <div class="uk-form-row">
                        <input type="text" name="name" maxlength="100" style="width:100%">
                    </div>
                    <div class="uk-form-row">
                        <label>内容:</label>
                    </div>
                    <div class="uk-form-row x-textarea">
                    </div>
                    <div class="uk-form-row">
                        <button type="submit" class="uk-button uk-button-primary"><i class="uk-icon-check"></i> 发布</button>
                        &nbsp;&nbsp;
                        <button type="button" class="uk-button x-cancel"><i class="uk-icon-close"></i> 取消</button>
                    </div>
                </fieldset>
            </form>
        </div>
    </script>

    <style id="x-doc-style">
        .x-display-deleted-true { display: none; }
        .x-display-none { display: none; }

        .x-display-if-signin { display: none; }

    </style>
    <script>
        // global variables:
        var g_time = parseFloat('1551675684960');
        var g_signins = JSON.parse('[{"id":"weibo","icon":"weibo","name":"Sign in with Weibo"}]');
        //
        var g_user = null;
        //
        var g_ads = JSON.parse(decodeURIComponent('%7B%22a%22%3A%7B%22name%22%3A%22A%22%2C%22width%22%3A336%2C%22height%22%3A280%2C%22auto_fill%22%3A%22%3Cins%20class%3D%5C%22adsbygoogle%5C%22%20style%3D%5C%22display%3Ainline-block%3Bwidth%3A336px%3Bheight%3A280px%5C%22%20data-ad-client%3D%5C%22ca-pub-6727358730461554%5C%22%20data-ad-slot%3D%5C%228492060710%5C%22%3E%3C%2Fins%3E%5Cn%3Cscript%3E%5Cn(adsbygoogle%20%3D%20window.adsbygoogle%20%7C%7C%20%5B%5D).push(%7B%7D)%3B%5Cn%3C%2Fscript%3E%22%2C%22num_auto_fill%22%3A2%2C%22adperiods%22%3A%5B%7B%22user%22%3A%22%E5%BC%80%E8%AF%BE%E5%90%A7%E5%AE%98%E6%96%B9%E5%BE%AE%E5%8D%9A%22%2C%22admaterials%22%3A%5B%7B%22image%22%3A%22%2Ffiles%2Fattachments%2F0015307792921604c694e6f52484b95a172330562ca5537000%2F0%22%2C%22weight%22%3A100%2C%22keywords%22%3A%22javascript%22%2C%22url%22%3A%22http%3A%2F%2Fpro.kaikeba.com%2Fcourse%2Fweb%3Fss%3Dfs3%22%7D%2C%7B%22image%22%3A%22%2Ffiles%2Fattachments%2F00153077933541301079ab48174446984cf31ed5502a66d000%2F0%22%2C%22weight%22%3A100%2C%22keywords%22%3A%22python%2Cgit%2Cindex%22%2C%22url%22%3A%22http%3A%2F%2Fpro.kaikeba.com%2Fcourse%2Fpython%3Fss%3Dfs1%22%7D%2C%7B%22image%22%3A%22%2Ffiles%2Fattachments%2F001530779368629a70e732648d14f34a70843db39c9a4c5000%2F0%22%2C%22weight%22%3A100%2C%22keywords%22%3A%22%22%2C%22url%22%3A%22http%3A%2F%2Fpro.kaikeba.com%2Fcourse%2Fpython%3Fss%3Dfs2%22%7D%5D%7D%2C%7B%22user%22%3A%22%E5%BC%80%E8%AF%BE%E5%90%A7%E5%AE%98%E6%96%B9%E5%BE%AE%E5%8D%9A%22%2C%22admaterials%22%3A%5B%7B%22image%22%3A%22%2Ffiles%2Fattachments%2F001530779306382ebf382b76d3846248dfbc35f192f35ac000%2F0%22%2C%22weight%22%3A100%2C%22keywords%22%3A%22javascript%22%2C%22url%22%3A%22http%3A%2F%2Fpro.kaikeba.com%2Fcourse%2Fpython%3Fss%3Dss3%22%7D%2C%7B%22image%22%3A%22%2Ffiles%2Fattachments%2F001530779486466f66c87e0fc794ca79d66bf59cd42a10f000%2F0%22%2C%22weight%22%3A100%2C%22keywords%22%3A%22python%2Cgit%2Cindex%22%2C%22url%22%3A%22http%3A%2F%2Fpro.kaikeba.com%2Fcourse%2Fweb%3Fss%3Dss1%22%7D%2C%7B%22image%22%3A%22%2Ffiles%2Fattachments%2F001530779955145513c19ad239446a683a912e3229f7740000%2F0%22%2C%22weight%22%3A100%2C%22keywords%22%3A%22%22%2C%22url%22%3A%22http%3A%2F%2Fpro.kaikeba.com%2Fcourse%2Fweb%3Fss%3Dss2%22%7D%2C%7B%22image%22%3A%22%2Ffiles%2Fattachments%2F001530780935500c4618c8be6cc48a69260dbb200325124000%2F0%22%2C%22weight%22%3A100%2C%22keywords%22%3A%22python%2Cgit%2Cindex%22%2C%22url%22%3A%22http%3A%2F%2Fpro.kaikeba.com%2Fcourse%2Fjava%3Fss%3Dss4%22%7D%5D%7D%5D%7D%2C%22b%22%3A%7B%22name%22%3A%22B%22%2C%22width%22%3A300%2C%22height%22%3A600%2C%22auto_fill%22%3A%22%3Cins%20class%3D%5C%22adsbygoogle%5C%22%20style%3D%5C%22display%3Ainline-block%3Bwidth%3A300px%3Bheight%3A600px%5C%22%20data-ad-client%3D%5C%22ca-pub-6727358730461554%5C%22%20data-ad-slot%3D%5C%224769867116%5C%22%3E%3C%2Fins%3E%5Cn%3Cscript%3E%5Cn(adsbygoogle%20%3D%20window.adsbygoogle%20%7C%7C%20%5B%5D).push(%7B%7D)%3B%5Cn%3C%2Fscript%3E%22%2C%22num_auto_fill%22%3A2%2C%22adperiods%22%3A%5B%7B%22user%22%3A%22%E5%BC%80%E8%AF%BE%E5%90%A7%E5%AE%98%E6%96%B9%E5%BE%AE%E5%8D%9A%22%2C%22admaterials%22%3A%5B%7B%22image%22%3A%22%2Ffiles%2Fattachments%2F0015307797110987f55c6b87fd54083bc390e8ff6b0d60c000%2F0%22%2C%22weight%22%3A100%2C%22keywords%22%3A%22python%2Cgit%2Cindex%22%2C%22url%22%3A%22http%3A%2F%2Fpro.kaikeba.com%2Fcourse%2Fpython%3Fss%3Dfbg1%22%7D%2C%7B%22image%22%3A%22%2Ffiles%2Fattachments%2F001530779800744e83fef4eebab401aab4bbe8699af6b51000%2F0%22%2C%22weight%22%3A100%2C%22keywords%22%3A%22javascript%22%2C%22url%22%3A%22http%3A%2F%2Fpro.kaikeba.com%2Fcourse%2Fweb%3Fss%3Dfbg3%22%7D%2C%7B%22image%22%3A%22%2Ffiles%2Fattachments%2F001530780197211282e93c0467f4b79b6e1be1a0efb414e000%2F0%22%2C%22weight%22%3A100%2C%22keywords%22%3A%22%22%2C%22url%22%3A%22http%3A%2F%2Fpro.kaikeba.com%2Fcourse%2Fpython%3Fss%3Dfbg2%22%7D%5D%7D%2C%7B%22user%22%3A%22%E5%BC%80%E8%AF%BE%E5%90%A7%E5%AE%98%E6%96%B9%E5%BE%AE%E5%8D%9A%22%2C%22admaterials%22%3A%5B%7B%22image%22%3A%22%2Ffiles%2Fattachments%2F001530167032294c342ce74629b41ffaebf0ba8528d5f37000%2F0%22%2C%22weight%22%3A100%2C%22keywords%22%3A%22python%2Cgit%2Cindex%22%2C%22url%22%3A%22http%3A%2F%2Fpro.kaikeba.com%2Fcourse%2Fjava%3Fss%3Dsbg1%22%7D%2C%7B%22image%22%3A%22%2Ffiles%2Fattachments%2F001530167057850ab00994c0e914e59a996b275fc1aac42000%2F0%22%2C%22weight%22%3A100%2C%22keywords%22%3A%22%22%2C%22url%22%3A%22http%3A%2F%2Fpro.kaikeba.com%2Fcourse%2Fjava%3Fss%3Dsbg2%22%7D%2C%7B%22image%22%3A%22%2Ffiles%2Fattachments%2F0015307798443236e70647769674722a45bf2635b31c045000%2F0%22%2C%22weight%22%3A100%2C%22keywords%22%3A%22javascript%22%2C%22url%22%3A%22http%3A%2F%2Fpro.kaikeba.com%2Fcourse%2Fpython%3Fss%3Dsbg3%22%7D%2C%7B%22image%22%3A%22%2Ffiles%2Fattachments%2F001530779942804e5a23ac1c027456499629baec954b7e0000%2F0%22%2C%22weight%22%3A100%2C%22keywords%22%3A%22%22%2C%22url%22%3A%22http%3A%2F%2Fpro.kaikeba.com%2Fcourse%2Fweb%3Fss%3Dsbg2%22%7D%2C%7B%22image%22%3A%22%2Ffiles%2Fattachments%2F001530780351101304e7e7655174965b2357ef3512940c4000%2F0%22%2C%22weight%22%3A100%2C%22keywords%22%3A%22python%2Cgit%2Cindex%22%2C%22url%22%3A%22http%3A%2F%2Fpro.kaikeba.com%2Fcourse%2Fweb%3Fss%3Dsbg1%22%7D%5D%7D%5D%7D%7D'));
        var meta_keywords = $('meta[property="og:tag"]').attr('content');
        if (meta_keywords) {
            meta_keywords = meta_keywords.toLowerCase().split(',');
            _.mapObject(g_ads, function (adslot, adkey) {
                _.map(adslot.adperiods, function (adp) {
                    var matched_adms = _.filter(adp.admaterials, function (adm) {
                        var ks = adm.keywords.toLowerCase().split(',');
                        // ad keywords = [a, b, c, d]
                        // meta keywords = [b, c]
                        var ms = _.filter(meta_keywords, function (mkey) {
                            return ks.indexOf(mkey) >= 0;
                        });
                        return ms.length > 0;
                    });
                    if (matched_adms.length > 0) {
                        adp.admaterials = matched_adms;
                    }
                });
            });
        }
        $(function () {
            var fnRandom = function (adms) {
                if (adms.length === 1) {
                    return adms[0];
                }
                var
                    weights = _.map(adms, function (m) {
                        return m.weight;
                    }),
                    total_weights = _.reduce(weights, function (ax, w) {
                        return ax + w;
                    }, 0),
                    rnd = Math.random(),
                    ws = 0,
                    i,
                    hit;
                for (i=0; i<weights.length; i++) {
                    ws = ws + weights[i];
                    if (rnd < ws / total_weights) {
                        return adms[i];
                    }
                }
                return adms[0];
            };
            _.mapObject(g_ads, function (ad, k) {
                _.map(ad.adperiods, function (adp) {
                    if (adp.admaterials.length === 0) {
                        add_sponsor('#x-sponsor-' + k, ad.width, ad.height, adp.user, 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIAAAAAkCAMAAAB2bcIBAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyNpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChNYWNpbnRvc2gpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjE0NDhCRDA3QTM3MjExRTc4QjI0RjRCQjQzOTgwRDc3IiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjE0NDhCRDA4QTM3MjExRTc4QjI0RjRCQjQzOTgwRDc3Ij4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6MTQ0OEJEMDVBMzcyMTFFNzhCMjRGNEJCNDM5ODBENzciIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6MTQ0OEJEMDZBMzcyMTFFNzhCMjRGNEJCNDM5ODBENzciLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz5Adyw0AAAADFBMVEXm5uazs7NdXV3///8WehxTAAAABHRSTlP///8AQCqp9AAAAaVJREFUeNrslsuWwyAMQyXy//88LX7JhEw7q9mQRQ8QEBcjO8X1zw8OwAE4AAdA2xzvh7Nj7eq/RuYQ+STl71PR1ayPlBt4AkCbUgBGgBwwySLjsoCLGheAwT0A7Hz0GZwdOxVCoPpXncUA2F+L2pTD6HobAAor8lwxzlgHV2yXhYoI6zXiIjiXse/zCFA7CgCK25sVzABw2dew8FrzbwAgNQJzqa6ydnOLATkw2XeZbwoATwDoFu8RUEE4AJluCQ+gbarAX0QgjEo2ALtDiiBmTN8/Qy+LS45cewA+mjAzOc+VTxe8IgJuh4DLRFVHRMS+SEOFYANQR8gVjLoe9FqGbQT2lUhMSGqIow6Q68UxI2DJNwHMueqZmweyDjxEoKCpgVUoNZgNTF2fri4XYPQswMdC5Dt0gF55x5W3TA8qxq1u1IZrIcJzGkbRvc/z/ICU4iCrNHQTsLISVco/Afxiu2vzcWofHbSvDe9q3xQiWYM7qOzAbplI7MxCbtQ6QHPXkoMMN2dD/y/IYCZNzUQmzU1tvlvnn79kB+AAHIADMJ8fAQYAbSgvpXjD4xEAAAAASUVORK5CYII=', '/');
                        return;
                    }
                    var hit = fnRandom(adp.admaterials);
                    add_sponsor('#x-sponsor-' + k, ad.width, ad.height, adp.user, 'https://cdn.liaoxuefeng.com/cdn'+ hit.image, hit.url);
                });
                var i;
                for (i=0; i<ad.num_auto_fill; i++) {
                    add_sponsor('#x-sponsor-' + k, ad.width, ad.height, ad.auto_fill);
                }
            });
        });
    </script>
    <script>
        (function () {
            eval(decodeURIComponent('%69f%28%21get%43%6F%6F%6B%69%65(%27%61tsp%27))%73%65%74C%6F%6F%6B%69%65(%27%61tsp%27%2C%20%271551675684960%5F%27%2Bnew%20Date%28%29.getTime%28%29%2C%20580%29%3B'));
        })();
    </script>



    <style>
        .x-webpage-visible {
            display: block;
        }
    </style>



    <style>
        .x-center {
            margin: 0;
        }




        .x-center {
            margin-right: 316px;
            padding-right: 15px;
        }


    </style>

    <!-- BEGIN custom_header -->
    <script src="https://tjs.sjs.sinajs.cn/open/api/js/wb.js" type="text/javascript" charset="utf-8"></script>
    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>

    <script>
        var CDN = 'https://cdn.liaoxuefeng.com/cdn';

        // add table class:
        $(function () {
            $('table').addClass('uk-table');
        });

        function shareToWeibo() {
            var url = 'http://service.weibo.com/share/share.php?type=button&ralateUid=1658384301&language=zh_cn&appkey=1391944217&searchPic=false&style=full';
            url = url + '&title=' + encodeURIComponent(document.title);
            url = url + '&url=' + encodeURIComponent(location.href);
            url = url + '&pic=' + encodeURIComponent($('meta[property="og:image"]').attr('content'));
            window.open(url, 'share_liaoxuefeng_com', 'top=200,left=400,width=600,height=380,directories=no,menubar=no,toolbar=no,resizable=no');
        }

        var SHARE_TO_WEIBO = '<p><a href="#0" onclick="shareToWeibo()" class="uk-button uk-button-danger"><i class="uk-icon-weibo"></i> 分享到微博</button></p>';
    </script>

    <script>
        // crypto:
        if (location.pathname.indexOf('/wiki/0015223693709562f80977e6c9549f0a1e17640a61433d6000') === 0) {
            $.ajax({ url: '/static/js/crypto.js?v1', dataType: 'script', cache: true });
        }
        // sql: import alasql
        if (location.pathname.indexOf('/wiki/001508284671805d39d23243d884b8b99f440bfae87b0f4000') === 0) {
            $.ajax({
                url: '//cdn.liaoxuefeng.com/static/js/alasql.js',
                dataType: 'script',
                cache: true,
                success: function () {
                    console.log('alasql loaded.');
                    alasql.options.joinstar = 'underscore';
                    var
                        i,
                        classes_data = [['一班'], ['二班'], ['三班'], ['四班']],
                        students_data = [[1, '小明', 'M', 90], [1, '小红', 'F', 95], [1, '小军', 'M', 88], [1, '小米', 'F', 73], [2, '小白', 'F', 81], [2, '小兵', 'M', 55], [2, '小林', 'M', 85], [3, '小新', 'F', 91], [3, '小王', 'M', 89], [3, '小丽', 'F', 88]];
                    alasql('CREATE TABLE classes (id BIGINT NOT NULL AUTO_INCREMENT, name VARCHAR(10) NOT NULL, PRIMARY KEY (id))');
                    alasql('CREATE TABLE students (id BIGINT NOT NULL AUTO_INCREMENT, class_id BIGINT NOT NULL, name VARCHAR(10) NOT NULL, gender CHAR(1) NOT NULL, score BIGINT NOT NULL, PRIMARY KEY (id))');
                    for (i=0; i<classes_data.length; i++) {
                        alasql('INSERT INTO classes (name) VALUES (?)', classes_data[i]);
                    }
                    for (i=0; i<students_data.length; i++) {
                        alasql('INSERT INTO students (class_id, name, gender, score) VALUES (?, ?, ?, ?)', students_data[i]);
                    }
                }
            });
        }
    </script>

    <script>
        $(function () {
            $('pre>code.lang-java-practice').each(function () {
                var
                    url, h, i, name,
                    $code = $(this),
                    $pre = $code.parent(),
                    ss = $.trim($code.text()).split('\n\n');
                if (ss.length > 0) {
                    url = $.trim(ss[0]).replace(/\n/g, '');
                    i = url.lastIndexOf('/');
                    name = url.substring(i+1);
                    if (url.indexOf('https://')===0 || url.indexOf('http://')===0) {
                        h = '';
                        for (i=1; i<ss.length; i++) {
                            if ($.trim(ss[i])!=='') {
                                h = h + '<p>' + encodeHtml(ss[i]) + '</p>';
                            }
                        }
                        h = h + '<p>下载练习：<a href="' + url + '">' + encodeHtml(name) + '</a> （推荐使用<a target="_blank" href="/wiki/001543970808338ad98bbeaa6fc405c8df49d6a015b6e67000/0015504045557000bc76e4d743f41e9a7ab4116f105ba24000">IDE练习插件</a>快速下载）</p>';
                        $pre.replaceWith(h);
                    }
                }
            });
        });
    </script>

    <script>
        // git: add app link:
        $(function () {
            if (location.pathname.indexOf('/wiki/0013739516305929606dd18361248578c67b8067c8c017b000')===0) {
                $('.x-wiki-info').parent().css('position', 'relative').append('<a href="/webpage/gitapp" target="_blank" style="display:block;width:135px;height:40px;position:absolute;right:10px;top:10px;"><img src="' + CDN + '/static/img/download-on-the-app-store.png" /></a>');
            }
        });
    </script>

    <script>
        // add new:
        $(function () {
            var img_new = '<img style="position:absolute;right:-10px;top:3px;z-index:999" src="' + CDN + '/files/attachments/001477919415261ebc91072244149e0ab69f60ae2abe39f000/l">';
            $('#ul-navbar a[href="/wiki/001508284671805d39d23243d884b8b99f440bfae87b0f4000"]').parent().append(img_new);
            $('#ul-navbar a[href="http://pro.kaikeba.com/course/java/?ss=topj"]').parent().append(img_new);
        });
    </script>

    <script>
        // python 2.7: add py3 link:
        $(function () {
            if (location.pathname.indexOf('/wiki/001374738125095c955c1e6d8bb493182103fac9270762a000')===0) {
                $('#main .x-container').prepend('<div class="uk-alert uk-alert-danger">您目前正在学习的2.7版本的Python教程已过期，请立刻前往最新的Python 3 教程：<a href="/wiki/0014316089557264a6b348958f449949df42a6d3a2e542c000" class="uk-button uk-button-success">我要学 Python 3</a></div>');
            }
        });
    </script>

    <script>
        // add share:
        $(function () {
            if (location.pathname.indexOf('/wiki/')===0) {
                $('.x-wiki-content').find('a[href^=http]').attr('target', '_blank');
                if (!window.hurry) {
                    $('.x-wiki-content').after('<h3>感觉本站内容不错，读后有收获？</h3><p><a target="_blank" href="/webpage/donate" class="uk-button uk-button-primary"><i class="uk-icon-cny"></i> 我要小额赞助，鼓励作者写出更好的教程</a></p><h3>还可以分享给朋友</h3>' + SHARE_TO_WEIBO);
                } else {
                    $('.x-wiki-content').after('<h3>等待时间太久？</h3><p><a target="_blank" href="/webpage/donate" class="uk-button uk-button-primary"><i class="uk-icon-cny"></i> 我要催促作者更新教程</a></p><h3>还可以分享给朋友</h3>' + SHARE_TO_WEIBO);
                }
            }
        });
    </script>

    <script>
        // article: add share:
        $(function () {
            if (location.pathname.indexOf('/article/')===0) {
                $('.x-article-content').find('a[href^=http]').attr('target', '_blank');
                $('.x-article-content').after('<h3>感觉本站内容不错，读后有收获？</h3><p><a target="_blank" href="/webpage/donate" class="uk-button uk-button-primary"><i class="uk-icon-cny"></i> 我要小额赞助，鼓励作者写出更好的文章</a></p><h3>还可以分享给朋友</h3>' + SHARE_TO_WEIBO);
            }
        });
    </script>

    <script>
        // footer:
        $(function() {
            $('.x-footer-copyright').find('p').append('<br>本网站运行在<a target="_blank" href="https://promotion.aliyun.com/ntms/yunparter/invite.html?userCode=cz36baxa">阿里云</a>上并使用<a target="_blank" href="https://promotion.aliyun.com/ntms/yunparter/invite.html?userCode=cz36baxa">阿里云CDN</a>加速。');
            $('.x-footer').append('<hr><div style="text-align:center"><p>友情链接: <a href="http://www.shi-ci.com" target="_blank">中华诗词</a> - <a href="https://promotion.aliyun.com/ntms/act/ambassador/sharetouser.html?userCode=cz36baxa&amp;utm_source=cz36baxa" target="_blank">阿里云</a> - <a href="https://bbs.ksyun.com" target="_blank">金山云</a> - <a href="http://mitpress.mit.edu/sites/default/files/sicp/full-text/book/book.html" target="_blank">SICP</a> - <a href="http://www.4clojure.com/" target="_blank">4clojure</a> - <a href="https://www.linuxprobe.com/" target="_blank">linuxprobe</a> </p></div>');
        });
    </script>

    <script>
        // tongji:
        var _hmt = _hmt || [];
        (function () {
            var hm = document.createElement("script");
            hm.src = "//hm.baidu.com/hm.js?2efddd14a5f2b304677462d06fb4f964";
            hm.async = "async";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>

    <!-- END custom_header -->
</head>

<body>
<div class="x-goto-top">
    <div class="x-arrow"></div>
    <div class="x-stick"></div>
</div>

<div id="header" class="uk-navbar uk-navbar-attached">
    <div class="uk-container x-container">
        <div id="navbar" class="uk-navbar uk-navbar-attached">

            <a id="brand" href="/" class="uk-navbar-brand uk-visible-large">廖雪峰的官方网站</a>
            <a id="brand-small" href="/" class="uk-navbar-brand uk-hidden-large"><i class="uk-icon-home"></i></a>
            <a class="uk-hidden" href="/blog/1551675684960">Blog</a>
            <ul id="ul-navbar" class="uk-navbar-nav uk-hidden-small">

                <li class="x-nav"><a href="/category/0013738748415562fee26e070fa4664ad926c8e30146c67000">编程</a></li>

                <li class="x-nav"><a href="/category/0013738748248885ddf38d8cd1b4803aa74bcda32f853fd000">读书</a></li>

                <li class="x-nav"><a href="https://www.feiyangedu.com/category/JavaSE">JavaSE课程</a></li>

                <li class="x-nav"><a href="http://pro.kaikeba.com/course/java/?ss=topj">JavaEE课程</a></li>

                <li class="x-nav"><a href="https://www.feiyangedu.com/category/CryptoCurrency">数字货币</a></li>

                <li class="x-nav"><a href="/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000">JavaScript教程</a></li>

                <li class="x-nav"><a href="/wiki/0014316089557264a6b348958f449949df42a6d3a2e542c000">Python教程</a></li>

                <li class="x-nav"><a href="/wiki/001508284671805d39d23243d884b8b99f440bfae87b0f4000">SQL教程</a></li>

                <li class="x-nav"><a href="/wiki/0013739516305929606dd18361248578c67b8067c8c017b000">Git教程</a></li>

                <li class="x-nav"><a href="/discuss">问答</a></li>

                <li class="x-nav"><a href="/webpage/donate">赞助</a></li>

                <li id="navbar-more" class="uk-parent" data-uk-dropdown style="display:none">
                    <a href="#0"><i class="uk-icon-chevron-down"></i> 更多</a>
                    <div class="uk-dropdown uk-dropdown-navbar">
                        <ul id="ul-navbar-more" class="uk-nav uk-nav-navbar">

                            <li class="x-nav"><a href="/category/0013738748415562fee26e070fa4664ad926c8e30146c67000">编程</a></li>

                            <li class="x-nav"><a href="/category/0013738748248885ddf38d8cd1b4803aa74bcda32f853fd000">读书</a></li>

                            <li class="x-nav"><a href="https://www.feiyangedu.com/category/JavaSE">JavaSE课程</a></li>

                            <li class="x-nav"><a href="http://pro.kaikeba.com/course/java/?ss=topj">JavaEE课程</a></li>

                            <li class="x-nav"><a href="https://www.feiyangedu.com/category/CryptoCurrency">数字货币</a></li>

                            <li class="x-nav"><a href="/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000">JavaScript教程</a></li>

                            <li class="x-nav"><a href="/wiki/0014316089557264a6b348958f449949df42a6d3a2e542c000">Python教程</a></li>

                            <li class="x-nav"><a href="/wiki/001508284671805d39d23243d884b8b99f440bfae87b0f4000">SQL教程</a></li>

                            <li class="x-nav"><a href="/wiki/0013739516305929606dd18361248578c67b8067c8c017b000">Git教程</a></li>

                            <li class="x-nav"><a href="/discuss">问答</a></li>

                            <li class="x-nav"><a href="/webpage/donate">赞助</a></li>

                        </ul>
                    </div>
                </li>
            </ul>

            <ul id="ul-navbar-small" class="uk-navbar-nav uk-visible-small">
                <li class="uk-parent" data-uk-dropdown>
                    <a href="#0"><i class="uk-icon-navicon"></i></a>
                    <div class="uk-dropdown uk-dropdown-navbar">
                        <ul class="uk-nav uk-nav-navbar">

                            <li><a href="/category/0013738748415562fee26e070fa4664ad926c8e30146c67000">编程</a></li>

                            <li><a href="/category/0013738748248885ddf38d8cd1b4803aa74bcda32f853fd000">读书</a></li>

                            <li><a href="https://www.feiyangedu.com/category/JavaSE">JavaSE课程</a></li>

                            <li><a href="http://pro.kaikeba.com/course/java/?ss=topj">JavaEE课程</a></li>

                            <li><a href="https://www.feiyangedu.com/category/CryptoCurrency">数字货币</a></li>

                            <li><a href="/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000">JavaScript教程</a></li>

                            <li><a href="/wiki/0014316089557264a6b348958f449949df42a6d3a2e542c000">Python教程</a></li>

                            <li><a href="/wiki/001508284671805d39d23243d884b8b99f440bfae87b0f4000">SQL教程</a></li>

                            <li><a href="/wiki/0013739516305929606dd18361248578c67b8067c8c017b000">Git教程</a></li>

                            <li><a href="/discuss">问答</a></li>

                            <li><a href="/webpage/donate">赞助</a></li>

                        </ul>
                    </div>
                </li>
            </ul>


            <!--
                            <div class="uk-navbar-content x-hidden-tiny">
                                <form id="form-search" class="uk-form uk-margin-remove uk-display-inline-block">
                                    <div class="uk-form-icon">
                                        <i class="uk-icon-search"></i>
                                        <input type="text" placeholder="Search">
                                    </div>
                                </form>
                            </div>
            -->

            <div id="navbar-user-info" class="uk-navbar-flip">
                <ul class="uk-navbar-nav">
                    <li class="uk-parent x-display-if-signin" data-uk-dropdown>
                        <a href="#0"><i class="uk-icon-user"></i><span class="x-hidden-tiny">&nbsp;</span><span class="x-user-name x-hidden-tiny"></span></a>
                        <div class="uk-dropdown uk-dropdown-navbar">
                            <ul class="uk-nav uk-nav-navbar">
                                <li><a target="_blank" href="/me/profile"><i class="uk-icon-cog"></i> 个人资料</a></li>
                                <li class="uk-nav-divider"></li>


                                <li><a href="/auth/signout"><i class="uk-icon-power-off"></i> 登出</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="x-display-if-not-signin uk-hidden-small"><a href="javascript:showSignin()"><i class="uk-icon-sign-in"></i> 登录</a></li>
                    <li class="x-display-if-not-signin uk-visible-small"><a href="javascript:showSignin()"><i class="uk-icon-sign-in"></i></a></li>
                </ul>
            </div>
        </div>
    </div>
</div><!-- // header -->

<div id="main">
    <div class="x-placeholder-50"><!-- placeholder --></div>
    <div class="x-placeholder"><!-- placeholder --></div>
    <div class="uk-container x-container">
        <div class="uk-grid">
            <div class="x-body-top uk-width-1-1">
                <!-- body_top -->
            </div>
            <div class="uk-width-1-1">


                <div class="x-sidebar-right">
                    <div class="x-sidebar-right-top">
                        <!-- __snippets__.sidebar_right_top --><!-- sidebar_right_top -->
                    </div>
                    <div class="x-sidebar-right-content">



                    </div>
                    <div class="x-sidebar-right-bottom">
                        <h3>关于作者</h3>
                        <iframe width="100%" height="90" class="share_self"  frameborder="0" scrolling="no" src="http://widget.weibo.com/weiboshow/index.php?language=&width=0&height=550&fansRow=2&ptype=1&speed=0&skin=5&isTitle=0&noborder=0&isWeibo=0&isFans=0&uid=1658384301&verifier=078cedea&colors=0593d3,ffffff,666666,0593d3,0477ab&dpc=1"></iframe>

                    </div>
                    <div id="x-sponsor-b" class="uk-clearfix"><!-- sponsor B --></div>
                </div>


                <div class="x-center">
                    <div class="x-content-top">
                        <!-- content_top -->
                    </div>
                    <div class="x-content" style="width:100%">

                        <h3>赞助</h3>
                        <div class="x-page-content x-content">
                            <script>
                                $(function() {
                                    $('#main-nav-bar a[href="/page/donate"]').parent().addClass('active');
                                });
                            </script>

                            <p>如果您认为本网站的教程质量不错，读后觉得收获很大，预期工资涨幅能超过30%，不妨小额赞助我一下，让我有动力继续写出高质量的教程。</p>
                            <hr>
                            <p><strong>赞助方式一共有3种</strong>：微信支付，支付宝支付，PayPal支付。</p>
                            <hr>
                            <h3><a name="#-E8-B5-9E-E5-8A-A9-E6-96-B9-E5-BC-8F-E4-B8-80"></a>赞助方式一</h3>
                            <p>绝对赤裸裸的金钱赞助：如果你有微信，请打开微信，使用“扫一扫”付款。</p>
                            <p>目前一共有19元、29元、39元、59元和“我是土豪”共5档。</p>
                            <p>请闭上眼睛随意选择：</p>
                            <ul class="uk-tab" data-uk-tab="{connect:'#weixin-content'}">
                                <li><a href="#donate-weixin-19">￥19</a></li>
                                <li><a href="#donate-weixin-29">￥29</a></li>
                                <li class="uk-active"><a href="#donate-weixin-39">￥39</a></li>
                                <li><a href="#donate-weixin-59">￥59</a></li>
                                <li><a href="#donate-weixin-99">我是土豪</a></li>
                            </ul>

                            <ul id="weixin-content" class="uk-switcher uk-margin">
                                <li><img src="/files/attachments/001455362545775168523bfca08443fad857f442a43e23e000"></li>
                                <li><img src="/files/attachments/00145536255565321566e698b084ea099e1e306929cb1bd000"></li>
                                <li class="uk-active"><img src="/files/attachments/001455362563103e558cdd172534b9fa78b1ac5d1805111000"></li>
                                <li><img src="/files/attachments/001455362570089b36aa7dcbba24f2fa32a95ffe7a2ae37000"></li>
                                <li><img src="/files/attachments/00145536257559045a5560a611f49da84ccba5957ff64d2000"></li>
                            </ul>

                            <hr>
                            <h3><a name="#-E8-B5-9E-E5-8A-A9-E6-96-B9-E5-BC-8F-E4-BA-8C"></a>赞助方式二</h3>
                            <p>也是赤裸裸的金钱赞助：如果你有手机支付宝，请打开支付宝App，使用“扫一扫”付款。</p>
                            <p>目前一共有19元、29元、39元、59元和“我是土豪”共5档。</p>
                            <p>请闭上眼睛随意选择：</p>
                            <ul class="uk-tab" data-uk-tab="{connect:'#alipay-content'}">
                                <li><a href="#donate-alipay-19">￥19</a></li>
                                <li><a href="#donate-alipay-29">￥29</a></li>
                                <li class="uk-active"><a href="#donate-alipay-39">￥39</a></li>
                                <li><a href="#donate-alipay-59">￥59</a></li>
                                <li><a href="#donate-alipay-99">我是土豪</a></li>
                            </ul>
                            <ul id="alipay-content" class="uk-switcher uk-margin">
                                <li><img src="/files/attachments/00145536267782624caf7f3bcb54916a3bccfe0df40ae9d000"></li>
                                <li><img src="/files/attachments/001455362683014dd5f55d5ee154e69b214499c61a91794000"></li>
                                <li class="uk-active"><img src="/files/attachments/00145536268837518d0c77e854d4070b01009a62b1ed487000"></li>
                                <li><img src="/files/attachments/001455362694500184f1607393c46cfbfef4f938f01acf3000"></li>
                                <li><img src="/files/attachments/00145536270011171df0508d7c3459abac15123434fb003000"></li>
                            </ul>

                            <hr>
                            <h3><a name="#-E8-B5-9E-E5-8A-A9-E6-96-B9-E5-BC-8F-E4-B8-89"></a>赞助方式三</h3>
                            <p>适合国际友人，无论有没有PayPal账户，都可以直接赞助USD：</p>
                            <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
                                <input type="hidden" name="cmd" value="_s-xclick">
                                <input type="hidden" name="hosted_button_id" value="G9JZ43U46JLJU">
                                <table>
                                    <tr><td><input type="hidden" name="on0" value="赞助额度">赞助额度</td></tr><tr><td><select name="os0">
                                    <option value="赞助5刀">赞助5刀 $ 5.00 USD</option>
                                    <option value="赞助10刀">赞助10刀 $ 10.00 USD</option>
                                    <option value="赞助25刀">赞助25刀 $ 25.00 USD</option>
                                    <option value="赞助50刀">赞助50刀 $ 50.00 USD</option>
                                    <option value="赞助100刀">赞助100刀 $ 100.00 USD</option>
                                </select></td></tr>
                                </table>
                                <input type="hidden" name="currency_code" value="USD">
                                <input type="image" src="https://www.paypalobjects.com/en_GB/i/btn/btn_paynow_LG.gif" border="0" name="submit" alt="PayPal – The safer, easier way to pay online.">
                                <img alt="" border="0" src="https://www.paypalobjects.com/zh_XC/i/scr/pixel.gif" width="1" height="1">
                            </form>

                            <div style="height: 40px"></div>
                        </div>

                    </div>
                    <div class="x-content-bottom">
                        <!-- content_bottom -->
                    </div>
                </div>
            </div>

            <div class="x-body-bottom uk-width-1-1">
                <!-- body_bottom -->
            </div>
        </div>
    </div>
</div>



<div id="footer">
    <div class="x-footer uk-container x-container">
        <hr>
        <div class="uk-grid">
            <div class="x-footer-copyright uk-width-small-1-2 uk-width-medium-1-3">
                <p>
                    <a href="/">廖雪峰的官方网站</a>&copy;2017 v641f3f8
                    <br>
                    Powered by <a href="https://github.com/michaelliao/itranswarp.js" target="_blank">iTranswarp.js</a>
                </p>
            </div>
            <div class="uk-width-small-1-2 uk-width-medium-1-3 x-hidden-tiny">
                <a href="/feed" target="_blank" class="uk-icon-button uk-icon-rss" data-uk-tooltip title="Subscribe the RSS"></a>
                <a href="https://github.com/michaelliao/itranswarp.js" target="_blank" class="uk-icon-button uk-icon-github" data-uk-tooltip title="View source code on GitHub"></a>
                <a href="https://twitter.com/liaoxuefeng" target="_blank" class="uk-icon-button uk-icon-twitter" data-uk-tooltip title="Follow author on Twitter"></a>
                <a href="https://www.weibo.com/liaoxuefeng" target="_blank" class="uk-icon-button uk-icon-weibo uk-visible-large uk-hidden-medium" data-uk-tooltip title="Follow author on Weibo"></a>
            </div>
            <div class="uk-width-medium-1-3 uk-hidden-small">
                <p>
                    <a href="https://github.com/michaelliao/itranswarp.js/issues" target="_blank">意见反馈</a>
                    <br>
                    <a href="https://github.com/michaelliao/itranswarp.js/blob/master/LICENSE" target="_blank">使用许可</a>
                </p>
            </div>
        </div>
    </div>
</div>

<div id="modal-signin" class="uk-modal">
    <div class="uk-modal-dialog">
        <a class="uk-modal-close uk-close"></a>
        <div class="uk-modal-header">
            <h2>Please Sign In</h2>
        </div>
        <p>You can sign in directly without register:</p>

        <h3><a href="/auth/from/weibo"><i class="uk-icon-weibo"></i> Sign in with Weibo</a></h3>

        <p>You need authorize to allow connect to your social passport for the first time.</p>
    </div>
</div>

<div id="oldBrowser">
    <div class="uk-alert uk-alert-danger" data-uk-alert>
        <a href="#0" class="uk-alert-close uk-close"></a>
        <p>
            WARNING: You are using an old browser that does not support HTML5.
            Please choose a modern browser (<a href="https://www.google.com/chrome" target="_blank">Chrome</a> / <a href="https://www.microsoft.com/windows/microsoft-edge" target="_blank">Microsoft Edge</a> / <a href="https://www.mozilla.org/firefox/" target="_blank">Firefox</a> / <a href="https://www.apple.com/safari/" target="_blank">Sarafi</a>) to get a good experience.
        </p>
    </div>
</div>
</body>
</html>
