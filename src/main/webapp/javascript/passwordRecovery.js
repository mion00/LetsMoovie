var PasswordRecovery = {
    success: function (data) {
        saveNotification("success", "La password è stata correttamente modificata!");
        window.location.assign("/");

    },
    error: function (data) {
        //TODO:FINIRE LAVORO
        var error = data.responseJSON.errorCode;
        switch (error) {
            case 0:
            case 2:
            {
                alertify.error("Errore, riprova!");
            }
                break;
            case 11:
            {
                saveNotification("error", "Il token non è più valido!");
                window.location.assign("/login");
            }
                break;
        }

        var passwordField = this.find("input[type='password']");
        passwordField.val('');
    }

};

$(document).ready(function () {
    Forms.PostForm("setNewPassoword", PasswordRecovery.success, PasswordRecovery.error, true);
});