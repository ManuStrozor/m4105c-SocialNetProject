<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SocialNetProject.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <title>Winku Social Network </title>
    <link rel="icon" href="images/fav.png" type="image/png" sizes="16x16"/>

    <link rel="stylesheet" href="css/main.min.css"/>
    <link rel="stylesheet" href="css/style.css"/>
    <link rel="stylesheet" href="css/color.css"/>
    <link rel="stylesheet" href="css/responsive.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div class="theme-layout">
            <div class="container-fluid pdng0">
                <div class="row merged">
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <div class="land-featurearea" style="background-color:#006bb7">
                            <div class="land-meta">
                                <h1>Winku</h1>
                                <p>
                                    Welcome Emmanuel !
                                </p>
                                <div class="friend-logo">
                                    <span>
                                        <img src="images/wink.png" alt=""/></span>
                                </div>
                                <a href="#" title="" class="folow-me">Follow Us on</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <div class="login-reg-bg">
                            <div class="log-reg-area sign">
                                <h2 class="log-title">Login</h2>

                                <div class="form-group">
                                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                                    <label class="control-label" for="email">Email</label><i class="mtrl-select"></i>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox5" Type="password" runat="server"></asp:TextBox>
                                    <label class="control-label" for="password">Password</label><i class="mtrl-select"></i>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" checked="checked" /><i class="check-box"></i>Always Remember Me.
                                    </label>
                                </div>
                                <a href="#" title="" class="forgot-pwd">Forgot Password?</a>
                                <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Wrong email or password !" Visible="False"></asp:Label>
                                <div class="submit-btns">
                                    <asp:Button ID="Button3" class="mtr-btn signin" runat="server" Text="Login" OnClick="Button2_Click1" />
                                    <button class="mtr-btn signup" type="button"><span>Register</span></button>
                                </div>

                            </div>
                            <div class="log-reg-area reg">
                                <h2 class="log-title">Register</h2>

                                <div class="form-group">
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                    <label class="control-label" for="fullname">First & Last Name</label><i class="mtrl-select"></i>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                    <label class="control-label" for="email">Email</label><i class="mtrl-select"></i>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox3" Type="password" runat="server" ></asp:TextBox>
                                    <label class="control-label" for="password">Password</label><i class="mtrl-select"></i>
                                </div>
                                <div class="form-radio">
                                    <div class="radio">
                                        <label>
                                            <asp:RadioButton ID="RadioButton1" Checked="True" runat="server" GroupName="grp1" />
                                            <i class="check-box"></i>Male
                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                            <asp:RadioButton ID="RadioButton2" runat="server" GroupName="grp1"/>
                                            <i class="check-box"></i>Female
                                        </label>
                                    </div>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" checked="checked" /><i class="check-box"></i>Accept Terms & Conditions ?
                                    </label>
                                </div>
                                <a href="#" title="" class="already-have" style="color: #088dcd; float: right; font-size: 14px;">Already have an account</a>
                                <div class="submit-btns">
                                    <asp:Button ID="Button1" class="mtr-btn signup" runat="server" Text="Register" OnClick="Button2_Click" />
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
    <script src="js/main.min.js"></script>
    <script src="js/script.js"></script>
</body>
</html>
