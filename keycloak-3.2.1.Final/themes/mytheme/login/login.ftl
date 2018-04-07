<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "form">
        <div class="login-layout">
            <label class="login-label">${msg("login")}</label>
        </div>
        <#if realm.password>
            <form id="kc-form-login" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcInputWrapperClass!}">
                        <label for="username" class="username-email-label"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
                        <#if usernameEditDisabled??>
                            <input id="username" class="username-email-text-field" name="username" value="${(login.username!'')?html}" type="text" disabled />
                        <#else>
                            <input id="username" class="username-email-text-field" name="username" value="${(login.username!'')?html}" type="text" autofocus autocomplete="off" />
                        </#if>
                    </div>
                </div>
                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcInputWrapperClass!}">
                        <label for="password" class="login-password-label">${msg("password")}</label>
                        <div class="${properties.kcFormOptionsWrapperClass!} forget-password-span">
                            <#if realm.resetPasswordAllowed>
                                <span><a href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                            </#if>
                        </div>
                        <input id="password" class="login-password-text-field" name="password" type="password" autocomplete="off" />
                    </div>
                </div>
                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <div class="${properties.kcFormButtonsWrapperClass!}">
                        <input class="login-button" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                    </div>
                </div>
                <div class="${properties.kcFormGroupClass!}">
                    <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                        <#if realm.rememberMe && !usernameEditDisabled??>
                            <div class="checkbox">
                                <label>
                                    <#if login.rememberMe??>
                                        <input id="rememberMe" name="rememberMe" type="checkbox" tabindex="3" checked> ${msg("rememberMe")}
                                    <#else>
                                        <input id="rememberMe" name="rememberMe" type="checkbox" tabindex="3"> ${msg("rememberMe")}
                                    </#if>
                                </label>
                            </div>
                        </#if>
                    </div>
                </div>
            </form>
        </#if>
    <#elseif section = "info" >


        <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
            <div class="back-to-register-layout">
                <label class="noaccount-span">${msg("noAccount")}</label>
                <span><a class="back-to-register-button" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
            </div>
        </#if>
        <div class="hide-layout"></div>
        <#if realm.password && social.providers??>
            <div id="kc-social-providers">
                <ul>
                    <#list social.providers as p>
                        <li><a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId}"> <span class="text">${p.displayName}</span></a></li>
                    </#list>
                </ul>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout>
