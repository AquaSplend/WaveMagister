<%@ page contentType="text/html;charset=UTF-8" %>
<div class="modal-overlay modal-overlay-wheel">
    <img alt="Wait wheel" class="wheel" src="resources/wheel.svg"/>
    <div class="waitWheelText">Wait</div>
</div>

<div class="notify bottom-right" data-notification-status="success"></div>
<div class="notify bottom-right" data-notification-status="error"></div>

<div class="modal-overlay modal-overlay-password">
    <div class="modal modal-password">
        <a class="close-modal">
            <svg viewBox="0 0 20 20">
                <path fill="#001755" d="M15.898,4.045c-0.271-0.272-0.713-0.272-0.986,0l-4.71,4.711L5.493,4.045c-0.272-0.272-0.714-0.272-0.986,0s-0.272,0.714,0,0.986l4.709,4.711l-4.71,4.711c-0.272,0.271-0.272,0.713,0,0.986c0.136,0.136,0.314,0.203,0.492,0.203c0.179,0,0.357-0.067,0.493-0.203l4.711-4.711l4.71,4.711c0.137,0.136,0.314,0.203,0.494,0.203c0.178,0,0.355-0.067,0.492-0.203c0.273-0.273,0.273-0.715,0-0.986l-4.711-4.711l4.711-4.711C16.172,4.759,16.172,4.317,15.898,4.045z"></path>
            </svg>
        </a>
        <div class="modal-content">
            <div class="mediumTitle">Add your new password</div>
            <div class="bg-text1">
                <form class="passwordChangeForm">
                    <div class="form-group">
                        <label for="password1">Enter your new password</label>
                        <input type="password" class="input form-control" id="password1" minlength="6" maxlength="16" placeholder="Password" required>
                    </div>
                    <div class="form-group">
                        <label for="password2">Repeat your new password</label>
                        <input type="password" class="input form-control" id="password2" minlength="6" maxlength="16" placeholder="Password" name="password" required>
                    </div>
                    <div class="passwordNotEquals hidden">The passwords you entered do not match. Try again.</div>
                    <div class="text-center">
                        <button type="submit" class="button afterForm passwordChangeButton">Change password</button>
                        <input class="button afterForm" type="reset" value="Reset">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
