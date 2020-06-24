<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css">
    <link rel="stylesheet" href="index.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="index.js"></script>
</head>
<body>
    <html lang="en">
        <div class="btn-background">

        </div>
    <!-- 데스크탑 탑바 -->
    <div class="top-bar visible-on-md-up">
        
        <div class="con"> <!-- 블로그 넓이 등 라이브러리 -->
            <nav class="menu-box-1">  <!-- 블로그 메뉴 -->
                <ul>
                    <li><a href="#">Home</a></li> 
                    <li><a href="#">Articles</a></li>
                    <li class="logo"><a href="#"><i class="fas fa-cannabis"></i></a></li>  <!-- 로고 -->
                    <li><a href="#">About Me</a></li>
                    <li><a href="#">SNS</a>  <!-- 1차메뉴  -->
                        <ul>
                            <li><a href="#">FaceBook</a></li> <!-- 2차 메뉴  -->
                            <li><a href="#">Instagram</a></li>
                            <li><a href="#">GitHub</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <div class="menu-icon">
                <a href="#" class ="icon"><i class="far fa-lightbulb"></i></a>
            </div>
            <div class="menu-icon2">
                <a href="#" class ="icon2"><i class="far fa-lightbulb"></i></a>
            </div>
        </div>
    </div>
    
    <!-- 모바일 메뉴 버튼과 상단 바 -->
    <div class="mobile-top-bar visible-on-sm-down">
            <a href="#" class="mobile-btn-toggle-side-bar">
                <div></div>
                <div></div>
                <div></div>
            </a>

         <a href="#" class="logo">
            <i class="fas fa-cannabis"></i>
         </a>        
    </div>

<!-- 버튼 클릭시 나오는 사이드 바 -->
    <div class="mobile-side-bar visible-on-sm-down">
        <div class="cover">
            <nav class="mobile-menu-box1">
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Articles</a></li>
                    <li><a href="#">About Me</a></li>
                    <li>
                        <a href="#">SNS</a>
                        <ul>
                            <li><a href="#">FaceBook</a></li>
                            <li><a href="#">Instagram</a></li>
                            <li><a href="#">GitHub</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
         </div>
    </div>



</html>
</body>
</html>