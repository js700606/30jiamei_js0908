<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="shopping.DAO.*,shopping.Class.*, java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>30岬梅舖 歡迎光臨!</title>
        <!--彈出視窗程式-->
        <style>            
            body{font:12px/1.2 Verdana, sans-serif; padding:0 10px;}
            a:link, a:visited{text-decoration:none; color:#416CE5; border-bottom:1px solid #416CE5;}
            h2{font-size:13px; margin:15px 0 0 0;}
        </style>
        <link rel="stylesheet" href="colorbox.css" />        
        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/jquery.colorbox.js"></script>                
        <script>
            $(document).ready(function() {
                //Examples of how to assign the Colorbox event to elements
                $(".group1").colorbox({rel: 'group1'});
                $(".group2").colorbox({rel: 'group2', transition: "fade"});
                $(".group3").colorbox({rel: 'group3', transition: "none", width: "75%", height: "75%"});
                $(".group4").colorbox({rel: 'group4', slideshow: true});
                $(".ajax").colorbox();
                $(".youtube").colorbox({iframe: true, innerWidth: 640, innerHeight: 390});
                $(".vimeo").colorbox({iframe: true, innerWidth: 500, innerHeight: 409});
                $(".iframe").colorbox({iframe: true, width: "80%", height: "80%"});
                $(".inline").colorbox({inline: true, width: "50%"});
                $(".callbacks").colorbox({
                    onOpen: function() {
                        alert('onOpen: colorbox is about to open');
                    },
                    onLoad: function() {
                        alert('onLoad: colorbox has started to load the targeted content');
                    },
                    onComplete: function() {
                        alert('onComplete: colorbox has displayed the loaded content');
                    },
                    onCleanup: function() {
                        alert('onCleanup: colorbox has begun the close process');
                    },
                    onClosed: function() {
                        alert('onClosed: colorbox has completely closed');
                    }
                });

                $('.non-retina').colorbox({rel: 'group5', transition: 'none'})
                $('.retina').colorbox({rel: 'group5', transition: 'none', retinaImage: true, retinaUrl: true});

                //Example of preserving a JavaScript event for inline calls.
                $("#click").click(function() {
                    $('#click').css({"background-color": "#ff0", "color": "#fff", "cursor": "inherit"}).text("Open this window again and this message will still be here.");
                    return false;
                });
            });
        </script>
        <!--彈出視窗程式結尾-->


        <link href="css/jquerysctipttop.css" rel="stylesheet" type="text/css">
        <link href="css/index.css" rel="stylesheet">


        <!-- 分頁 -->
        <link href="css/mysite_index_mei2.css" rel="stylesheet">
        <!-- 分頁尾 -->


        <!--BootStrap頭-->
        <!-- 新 Bootstrap 核心 CSS 文件 -->
        <link rel="stylesheet" href="css/bootstrap.min.css">

        <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
        <script src="js/bootstrap.min.js"></script>


        <!--Bootstrap尾-->  
        
    </head>
    <body>
        <div id="wrapper">
            <div id="header">
                <p>
                    <%
                        String LogIn = (String) session.getAttribute("LogIn");
                        String Account = (String) session.getAttribute("userAccount");
                        if (LogIn != null) {
                            if (LogIn.equals("yes")) {
                                out.print("&nbsp;"+ Account + " 您好! " + "<a class='btn btn-success' style='color:#fff;' href='memberLogout.jsp' role='button'>(登出)</a>"
                                        + " <a class='iframe' style='color:#fff;' href='memberInfo.jsp'><button class='btn btn-info' type='submit'>瀏覽會員資料</button></a>"
                                        + " <a class='iframe' style='color:#fff;' href='memberInfoUpdate.jsp'><button class='btn btn-info' type='submit'>修改會員資料</button></a>");
                            } else {
                                out.print("<a class='iframe' href='memberLogin.jsp'><button class='btn btn-info' type='submit'>會員登入</button></a>");
                                /*+ " <a class='iframe' href='memberAdd.jsp'>會員申請</a>");*/
                            }

                        } else {
                            out.print("<a class='iframe' href='memberLogin.jsp'><button class='btn btn-info' type='submit'>會員登入</button></a>");
                            /*+ " <a class='iframe' href='memberAdd.jsp'>會員申請</a>");*/
                        }
                    %>
                </p>
            </div>


            <div id="content">
                <div class="page" id="page">
                    <div class="accordion" id="zA7n">
                        <ul class="accordion__ul">
                            <li class="accordion__li"><a href="index.jsp"><img class="accordion__img" src="images/menu/2.jpg" alt="Image Alt" /></a></li>
                            <li class="accordion__li"><a href="mei.jsp" ><img class="accordion__img" src="images/menu/1.jpg" alt="Image Alt" /></a></li>
                            <li class="accordion__li"><a href="study.jsp"><img class="accordion__img" src="images/menu/3.jpg" alt="Image Alt" /></a></li>
                            <li class="accordion__li"><a href="ProductList_all.jsp" class='iframe'><img class="accordion__img" src="images/menu/4.jpg" alt="Image Alt" /></a></li>
                            <li class="accordion__li"><%
                                if (LogIn != null) {
                                    if (LogIn.equals("yes")) {
                                        out.print("<a class='iframe' href='memberInfo.jsp'><img class='accordion__img' src='images/menu/5.jpg' alt='Image Alt' />瀏覽會員資料</a>"
                                        );
                                    } else {
                                        out.print(" <a class='iframe' href='memberAdd.jsp'><img class='accordion__img' src='images/menu/5.jpg' alt='Image Alt' />會員申請</a>");
                                    }

                                } else {
                                    out.print(" <a class='iframe' href='memberAdd.jsp'><img class='accordion__img' src='images/menu/5.jpg' alt='Image Alt' />會員申請</a>");
                                }
                                %>
                                <a href="index.jsp" class='iframe'><img class="accordion__img" src="images/menu/5.jpg" alt="Image Alt" /></a></li>
                        </ul>
                    </div>
                </div>  
                                
            </div>

            <div id="main">
                <br>
                <br>
                <br>
                <br>
                <div id="mei2">
                    <img src="images/30jialogo.gif" width="100px" />
                    <pre><h1><font color="#E00000">關於三十岬梅舖</font></h1>梅舖是從父親年輕時代就開始種植青梅，我們擁有約7公頃的梅園，產品所需的青梅都來自自家梅園，因此能依產品所需採收適當熟度的青梅做為我們產品原料。而在青梅加工部份，
我們傳承媽媽30餘年的傳統醃漬經驗外，還有食品加工專業人員讓產品不但保留傳統古早味並不斷開發新產品，商品全部不含防腐劑、色素、人工甘味料，在創新與傳統中找一平衡點讓產品品質得以提昇，口味及製作方法也有大幅度改良，產品多樣化並建立自我品牌。</pre>

                    <p>&nbsp;</p>
<p>&nbsp;</p>
                    
              
                    <img src="images/mei.jpg" alt="mei.jpg" class="img-responsive" style="border-style:solid; border-width:3px; float:left;  margin:5px;" />
                    <br>
                    <pre>三十岬梅舖是由三姐妹所共同經營，二姐對青梅傳統醃漬方法經驗十足，四姐負責企劃及行銷而小妹所學是食品營養，所以從三姐妹青梅種植、商品研發到成品包裝全都自己來，期望能為已因泛人問津而掉滿地青梅找一線生機，於是我們擷取二姐對青梅傳統醃漬方法的經驗，結合小妹食品營養學的專長，以無防腐劑、無色素、人工甘味料的梅製品為梅舖目標建立三十岬梅舖，梅舖建立至今已7年餘，除了傳統梅製品以外更積極研發結合生鮮食材的梅製品，例如台灣薑及南投的鳳梨…等等，希望能建立自我牌，也希望讓消費者品嚐屬於台灣梅製品的甘甜原味。</pre>

                    <p>&nbsp;</p>
           

                    

                </div>

            </div>












        </div>            

        <!-- This contains the hidden content for inline calls -->
        <div style='display:none'>
            <div id='inline_content' style='padding:10px; background:#fff;'>
                <p><strong>This content comes from a hidden element on this page.</strong></p>
                <p>The inline option preserves bound JavaScript events and changes, and it puts the content back where it came from when it is closed.</p>
                <p><a id="click" href="#" style='padding:5px; background:#ccc;'>Click me, it will be preserved!</a></p>

                <p><strong>If you try to open a new Colorbox while it is already open, it will update itself with the new content.</strong></p>
                <p>Updating Content Example:<br />
                    <a class="ajax" href="../content/ajax.html">Click here to load new content</a></p>
            </div>
        </div>


        <!--<script src="js/jquerymin.js"></script>-->

        <script src="js/limit.js"></script>
        <script src="js/zA7n.js"></script>
        <script>
            $(window).load(function() {
                $('#zA7n').zA7n({});
            });
        </script><script type="text/javascript">

            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-36251023-1']);
            _gaq.push(['_setDomainName', 'jqueryscript.net']);
            _gaq.push(['_trackPageview']);

            (function() {
                var ga = document.createElement('script');
                ga.type = 'text/javascript';
                ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefore(ga, s);
            })();
        </script>

    </body>
</html>
