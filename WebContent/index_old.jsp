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
        <link href="css/mysite_index.css" rel="stylesheet">
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
                                out.print("&nbsp;" + Account + " 您好! " + "<a class='btn btn-success' style='color:#fff;' href='memberLogout.jsp' role='button'>(登出)</a>"
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
                            <li class="accordion__li"><a href="mei.jsp"><img class="accordion__img" src="images/menu/1.jpg" alt="Image Alt" /></a></li>
                            <li class="accordion__li"><a href="page/mei.html" class='iframe'><img class="accordion__img" src="images/menu/2.jpg" alt="Image Alt" /></a></li>
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


                                <a href="memberAdd.jsp" class='iframe'><img class="accordion__img" src="images/menu/5.jpg" alt="Image Alt" /></a></li>
                        </ul>
                    </div>
                </div>     
            </div>

            <div id="main">

            </div>












        </div>            

        <!-- This contains the hidden content for inline calls -->
        <div style='display:none'>
            <div id='inline_content' style='padding:10px; background:#fff;'>

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
 

        <!--<h1>Hello World!</h1> -->
        <% 
              
             TreeSet cart_prod_id_data = new TreeSet();
             
             TreeMap<Integer, Integer> cart_treeMap = new TreeMap<Integer,Integer>();
             int qty = 0;
             
             session.setAttribute("cart_id", cart_prod_id_data);
             session.setAttribute("cart_qty", qty);
             session.setAttribute("cart_map", cart_treeMap);
             
            

%>
    </body>
</html>
