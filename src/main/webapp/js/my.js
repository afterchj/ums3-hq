/**
 * Created by hongjian.chen on 2018/3/29.
 */
$(function () {
    function show(menuId) {
        var menu = document.getElementById(menuId);
        menu.style.display = 'block';
        var status = menu.style.display;
        if (status == 'none') {
            menu.style.display = 'block';
        } else {
            menu.style.display = 'none';
        }
    }
})