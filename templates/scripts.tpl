
<script type="text/javascript" src="js/jquery-1.12.3.min.js"></script> <!-- Jquery library -->
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script> <!--  -->
<script type="text/javascript" src="js/jquery.easing.1.3.js"></script> <!-- анимации -->
<script type="text/javascript" src="js/jquery.scrollTo.min.js"></script> <!-- для якорей -->
<script type="text/javascript" src="js/jquery.localScroll.min.js"></script> <!-- для якорей -->
<script type="text/javascript" src="swipebox/js/jquery.swipebox.js"></script> <!-- Для открытия изображений -->
<script type="text/javascript" src="material/js/material.min.js"></script>
<script type="text/javascript" src="material/js/ripples.min.js"></script> <!-- анимация (волны по клику) -->

<script type="text/javascript">
//нахождение ширины скролбара
var div = document.createElement('div');
div.style.overflowY = 'scroll';
div.style.width = '50px';
div.style.height = '50px';
div.style.visibility = 'hidden';
document.body.appendChild(div);
var scrollWidth = div.offsetWidth - div.clientWidth;
document.body.removeChild(div);
</script>

<script type="text/javascript">
// СКрипт для укорачивания ссылок
var elements = document.getElementsByClassName("linkin");
for (i=0; i < elements.length; i++) {
    content = elements[i].innerHTML;
    text = content;
    newtext = text.replace(/\s{2,}/g, ' ');
    length = newtext.length;
    if (length > 22) {
        crop = "..." + newtext.substr(Math.abs(length - 22));
        elements[i].innerHTML = crop;
    }
}
</script>

<!-- Анимации для настроек -->
<script type="text/javascript">
    var save = document.getElementById('save-btn');
    save.onclick = function() {
        $(".saved").slideDown(300);
        setTimeout(function(){$('.saved').slideUp(100)},1500);
    }
    var pay = document.getElementById('pay-btn');
    pay.onclick = function() {
        $(".pay").slideDown(300);
    }
</script>

<!-- Проверка введенных данных на сервере -->
<script type="text/javascript">
var exit = document.getElementsByClassName('exit_button');
exit.onclick = function() {
    document.location.href = "session_destroy.php";
}

var login = document.getElementById('login-btn');
var register = document.getElementById('register-btn');
function volidate() {
    user_email = $('#modalemail').val();
    user_password = $('#modalpassword').val();

    if (user_email == "") {
        var d = document.getElementById("modalemailform");
        d.className += " has-error";
        document.getElementById("modalemail").focus();
    }
    else if (user_password == ""){
        var d = document.getElementById("modalpasswordform");
        d.className += " has-error";
        document.getElementById("modalpassword").focus();
    }
    else  $.ajax({
        //url         : "http://almost.ddns.net/start_template2/authorization.php",
        url         : "authorization.php",
        type        : 'POST',
        data        : {email : user_email, password : user_password},
        success     : function(resp, data, textStatus){
            if(resp == 'ok'){
                document.location.href = "temp.php";
            }

            else if(resp == 'email_error') {
                var d = document.getElementById("modalemailform");
                d.className += " has-error";
                document.getElementById("modalemail").focus();
            }

            else if(resp == 'password_error') {
                var d = document.getElementById("modalpasswordform");
                d.className += " has-error";
                document.getElementById("modalpassword").focus();
            }

            else alert('Ошибка авторизации! ' + '!' + resp + '!' + data);
        },
        error :	function(xhr, textStatus, errorObj){
            alert('Произошла критическая ошибка!' + xhr + textStatus + errorObj);
        },
    });
}
login.onclick = function() {
    volidate();
}

function reg() {
    user_email = $('#modalemail').val();
    user_password = $('#modalpassword').val();

    if (user_email == "") {
        var d = document.getElementById("modalemailform");
        d.className += " has-error";
        document.getElementById("modalemail").focus();
    }
    else if (user_password == ""){
        var d = document.getElementById("modalpasswordform");
        d.className += " has-error";
        document.getElementById("modalpassword").focus();
    }
    else  $.ajax({
        //url         : "http://almost.ddns.net/start_template2/authorization.php",
        url         : "auth.php",
        type        : 'POST',
        data        : {email : user_email, password : user_password},
        success     : function(resp, data, textStatus){
            if(resp == 'ok'){
                document.location.href = "temp.php";
            }

            else if(resp == 'busy') {
                var d = document.getElementById("modalemailform");
                d.className += " has-error";
                document.getElementById("modalemail").focus();
            }

            else alert('Ошибка авторизации! ' + '!' + resp + '!' + data);
        },
        error :	function(xhr, textStatus, errorObj){
            alert('Произошла критическая ошибка!' + xhr + textStatus + errorObj);
        },
    });
}
register.onclick = function() {
    reg();
}
$("#modalemail").keyup(function(event){
    if(event.keyCode == 13){
        volidate();
    }
});
$("#modalpassword").keyup(function(event){
    if(event.keyCode == 13){
        volidate();
    }
});
</script>

<!-- Для открытия изображений -->
<script type="text/javascript">
$.material.init();
$('.swipebox').swipebox({hideBarsDelay: 0, hideCloseButtonOnMobile: true, useSVG: true, autoplayVideos: true})
</script>

<!-- Всплывающие подсказки -->
<script type="text/javascript">
$('[data-placement]').tooltip({'animation': false, 'trigger': 'hover'});

$('#homenav').localScroll({
    hash: false,
    offset: {
        top: 0
    },
    duration: 800,
    easing: 'easeInOutQuint'
})

$('.locallink').localScroll({
    hash: false,
    offset: {
        top: 0
    },
    duration: 800,
    easing: 'easeInOutQuint',
    onBefore: function (e, anchor, $target) {
        $('.navbar-collapse').collapse('hide');
    }
})
</script>

<script>
// Включение модала
var modal = document.getElementsByClassName("modal")[0];
var btn = document.getElementsByClassName("signin_button")[0];
var span = document.getElementsByClassName("close")[0];

if (btn) {
    btn.onclick = function() {
        modal.style.display = "block";
    }

    span.onclick = function() {
        modal.style.display = "none";
    }

    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
}

</script>

<script type="text/javascript">


$('img', '.svg').each(function (index) {
    var src = $(this).attr('src');
    $(this).parent().load(src)
});

</script>

</body>
</html>

