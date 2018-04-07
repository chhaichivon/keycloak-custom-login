<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "form">
        <div class="create-layout">
            <label class="create-label">${msg("createAccount")}</label>
        </div>
        <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post">
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcInputWrapperClass!}">
                    <label for="email" class="email-label">${msg("email")}</label>
                    <input type="text" id="email" class="email-text-field" name="email" value="${(register.formData.email!'')?html}" />
                </div>
            </div>
            <#if !realm.registrationEmailAsUsername>
                <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)}">
                    <div class="${properties.kcInputWrapperClass!}">
                        <label for="username" class="username-label">${msg("username")}</label>
                        <input type="text" id="username" class="username-text-field" name="username" value="${(register.formData.username!'')?html}" />
                    </div>
                </div>
            </#if>
            <#if passwordRequired>
                <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password',properties.kcFormGroupErrorClass!)}">
                    <div class="${properties.kcInputWrapperClass!}">
                        <label for="password" class="password-label">${msg("password")}</label>
                        <input type="password" id="password" class="password-text-field" name="password" />
                    </div>
                </div>
                <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password-confirm',properties.kcFormGroupErrorClass!)}">
                    <div class="${properties.kcInputWrapperClass!}">
                        <label for="password-confirm" class="confirm-password-label">${msg("passwordConfirm")}</label>
                        <input type="password" id="password-confirm" class="confirm-password-text-field" name="password-confirm" />
                    </div>
                </div>
            </#if>
            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <input class="sign-up-button" type="submit" value="${msg("doRegister")}"/>
                </div>
            </div>
             <div class="back-to-register-layout">
                <label class="back-to-register-label">${msg("backToRegister")}</label>
                <span><a href="${url.loginUrl}" class="sign-in-span">${msg("backToLogin")}</a></span>
            </div>
            <#if recaptchaRequired??>
                <div class="form-group">
                    <div class="${properties.kcInputWrapperClass!}">
                        <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                    </div>
                </div>
            </#if>
        </form>
    </#if>
</@layout.registrationLayout>