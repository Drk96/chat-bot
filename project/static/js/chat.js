// Collapsible
var coll = document.getElementsByClassName("collapsible");

for (let i = 0; i < coll.length; i++) {
    coll[i].addEventListener("click", function () {
        this.classList.toggle("active");

        var content = this.nextElementSibling;

        if (content.style.maxHeight) {
            content.style.maxHeight = null;
        } else {
            content.style.maxHeight = content.scrollHeight + "px";
        }

    });
}

function sendButton() {
    getResponse();
}

function heartButton() {
    $("#textInput").val("❤");
    getResponse();
}

$("#textInput").keypress(function (e) {
    if (e.which === 13) {
        getResponse();
    }
});

function getResponse() {
    let userText = $("#textInput").val();
    if (userText !== "") {


        let userHtml = '<p class="userText"><span>' + userText + '</span></p>';
        if (userText === "❤"){
            userText = "heartemojiininput";
        }
        $("#textInput").val("");
        $("#chatbox").append(userHtml);
        document.getElementById('chat-bar-bottom').scrollIntoView(true);

        setTimeout(() => {
            $.ajax({
                type: "POST",
                url: "chatbot/chat_request/",
                data: {
                    msg: userText,
                    csrfmiddlewaretoken: $('input[name=csrfmiddlewaretoken]').val()

                },
                success: function (result) {
                    console.log(result)
                    let botHtml = '<p class="botText"><span>' + result  + '</span></p>';
                    $("#chatbox").append(botHtml);
                    document.getElementById('chat-bar-bottom').scrollIntoView(true);
                },
                error: function (result) {
                    alert('error');
                }
            });
        }, 500)
    }

}