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
                <div id="mei2">
                    <h1><font color="#E00000">關於台灣青梅：</font></h1>

               

                    <pre>由於梅子含有豐富的鉀、鎂、磷、鐵等鹼性礦物質，此對於喜愛攝食酸性食物的現代人來說，它的確有幫助平衡酸鹼 值，可幫助人體處於健康的弱鹼性狀態的功效。</pre>

                    <p>&nbsp;</p>

                    
              
                    <img src="images/mei2.jpg" alt="mei.jpg" class="img-responsive" style="border-style:solid; border-width:3px; float:right; height:300px; margin:5px; width:300px" />
                    <pre>梅子是一種奇怪的果實它的熟度越高，醃漬後就越酸梅子香味也越濃，但未經醃漬時熟度越高梅果本身越甜，所以我們是以梅子的熟度來區分，分類產品醃漬時間，例如脆梅是用6分熟的青梅，因為青梅只有6分熟吃起才有脆脆的口感，相對的也沒有酸度，所以脆梅吃起是脆脆甜甜的，梅果類 (我們稱Q梅.紫蘇梅.茶梅等可直接拿來食用零食類為梅果類)&nbsp;是用8分熟青梅醃漬，因為8分熟青梅已有酸度又不會過熟，醃漬之梅果酸酸的肉質又QQ的也適合搭配其他食材做醃漬上的變化，再來就是9-10分熟的青 梅， 此時的青梅最酸也最香，適合醃漬梅醋.美味梅等等，鮮梅果泥也是這時候粹取的 。</pre>

                    <p>&nbsp;</p>
           

                    <h1><font color="#E00000">品種：</font></h1>

                    <pre>台灣所栽培的梅大半都是由實生苗而生，梅農常以果色、果形、大小、成熟期、葉片大小、枝梢軟硬或人名為特徵來稱呼品種。梅果變異性大，地域限制很強，在當地表現極為優異的品種，移到別地表現就不一定理想，而常見的梅子品種之果實特性如表：</pre>

                    <table  align="center" border="1" bordercolor="#ccc" cellpadding="5" cellspacing="0" style="border-collapse:collapse">
                        <caption style="background-color:rgb(0, 0, 0); text-align:center;" ><font color="#E0e000">六種果梅栽培果實品質分析</font></caption>
                        <thead>
                            <tr>
                                <th scope="col" style="background-color:rgb(0, 255, 0); text-align:center">栽培種</th>
                                <th scope="col" style="background-color:rgb(0, 255, 0); text-align:center">平均果種</th>
                                <th scope="col" style="background-color:rgb(0, 255, 0); text-align:center">果肉率</th>
                                <th scope="col" style="background-color:rgb(0, 255, 0); text-align:center">糖度</th>
                                <th scope="col" style="background-color:rgb(0, 255, 0); text-align:center">酸度</th>
                            </tr>
                        </thead>
                        <tbody >
                            <tr>
                                <th style="background-color:rgb(249, 223, 102); text-align:center">大 青</th>
                                <th style="text-align:center">13.6</th>
                                <th style="text-align:center">84.6</th>
                                <th style="text-align:center">7.0</th>
                                <th style="text-align:center">5.2</th>
                            </tr>
                            <tr>
                                <th style="background-color:rgb(249, 223, 102); text-align:center">山 連</th>
                                <th style="text-align:center"><strong>7.4</strong></th>
                                <th style="text-align:center"><strong>83.0</strong></th>
                                <th style="text-align:center"><strong>7.9</strong></th>
                                <th style="text-align:center"><strong>5.6</strong></th>
                            </tr>
                            <tr>
                                <th style="background-color:rgb(249, 223, 102); text-align:center">長 藤</th>
                                <th style="text-align:center">17.5</th>
                                <th style="text-align:center">87.1</th>
                                <th style="text-align:center">8.4</th>
                                <th style="text-align:center">6.5</th>
                            </tr>
                            <tr>
                                <th style="background-color:rgb(249, 223, 102); text-align:center">桃形梅</th>
                                <th style="text-align:center">12.9</th>
                                <th style="text-align:center">84.4</th>
                                <th style="text-align:center">7.3</th>
                                <th style="text-align:center">4.8</th>
                            </tr>
                            <tr>
                                <th style="background-color:rgb(249, 223, 102); text-align:center">胭脂梅</th>
                                <th style="text-align:center">13.5</th>
                                <th style="text-align:center">88.3</th>
                                <th style="text-align:center">7.4</th>
                                <th style="text-align:center">5.2</th>
                            </tr>
                            <tr>
                                <th style="background-color:rgb(249, 223, 102); text-align:center">萬 山</th>
                                <th style="text-align:center">11.6</th>
                                <th style="text-align:center">83.5</th>
                                <th style="text-align:center">6.9</th>
                                <th style="text-align:center">4.6</th>
                            </tr>
                        </tbody>
                    </table>

                    <pre>
                  (資料來源：農試所農化系劉慧英研究員提供酸度以檸檬酸（Cirtric Acid）</pre>

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
