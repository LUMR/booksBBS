/**
 * 脚本
 * Created by fsweb on 17-3-15.
 */
/**
 * 表单验证脚本
 * @returns {boolean}
 */
function registerCheck() {
    var username = document.getElementsByName("username")[0].value;
    var password = document.getElementsByName("password")[0].value;
    var password1 = document.getElementsByName("password1")[0].value;
    var sex = document.getElementsByName("sex")[0].value;
    var head = document.getElementsByName("head")[0].value;

    if (username == "" || password == "" || sex == "" || head == ""){
        alert("请填写完整信息,来自js脚本");
        return false;
    }

    if (password != password1){
        alert("两次密码不一致,来自js脚本");
        return false;
    }
}
/**
 * 删除回复确认
 * @returns {boolean}
 */
function replyDelete() {
    if (confirm("确定要删除该回复吗?"))
        window.location="reply_delete.jsp";
}