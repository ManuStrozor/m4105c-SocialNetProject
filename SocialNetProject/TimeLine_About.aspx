<%@ Page Title="" Language="C#" MasterPageFile="~/TimeLine.Master" AutoEventWireup="true" CodeBehind="TimeLine_About.aspx.cs" Inherits="SocialNetProject.TimeLine_About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="about">
        <div class="personal">
            <h5 class="f-title"><i class="ti-info-alt"></i> Personal Info</h5>
            <p>
                <asp:Label ID="LabelAbout" runat="server" Text="Label"></asp:Label>
            </p>
        </div>
        <div class="d-flex flex-row mt-2">
            <ul class="nav nav-tabs nav-tabs--vertical nav-tabs--left" >
                <li class="nav-item">
                    <a href="#basic" class="nav-link active" data-toggle="tab" >Basic info</a>
                </li>
                <li class="nav-item">
                    <a href="#location" class="nav-link" data-toggle="tab" >location</a>
                </li>
                <li class="nav-item">
                    <a href="#work" class="nav-link" data-toggle="tab" >work and education</a>
                </li>
                <li class="nav-item">
                    <a href="#interest" class="nav-link" data-toggle="tab"  >interests</a>
                </li>
                <li class="nav-item">
                    <a href="#lang" class="nav-link" data-toggle="tab" >languages</a>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane fade show active" id="basic" >
                    <ul class="basics">
                        <li><i class="ti-user"></i><asp:Label ID="LabelName" runat="server" Text="Label"></asp:Label></li>
                        <li><i class="ti-map-alt"></i>Live in <asp:Label ID="LabelCity" runat="server" Text="Label"></asp:Label></li>
                        <li><i class="ti-mobile"></i><asp:Label ID="LabelPhone" runat="server" Text="Label"></asp:Label></li>
                        <li><i class="ti-email"></i><asp:Label ID="LabelEmail" runat="server" Text="Label"></asp:Label></li>
                        <li><i class="ti-world"></i><asp:Label ID="LabelLang" runat="server" Text="Label"></asp:Label></li>
                    </ul>
                </div>
                <div class="tab-pane fade" id="location" role="tabpanel">
                    <div>
                      
                    </div>
                </div>
                <div class="tab-pane fade" id="work" role="tabpanel">
                    <div>
                        
                        <a href="#" title="">Envato</a>
                        <p>work as autohr in envato themeforest from 2013</p>
                        <ul class="education">
                            <li><i class="ti-facebook"></i> BSCS from Oxford University</li>
                            <li><i class="ti-twitter"></i> MSCS from Harvard Unversity</li>
                        </ul>
                    </div>
                </div>
                <div class="tab-pane fade" id="interest" role="tabpanel">
                    <ul class="basics">
                        <li>Footbal</li>
                        <li>internet</li>
                        <li>photography</li>
                    </ul>
                </div>
                <div class="tab-pane fade" id="lang" role="tabpanel">
                    <ul class="basics">
                        <li>english</li>
                        <li>french</li>
                        <li>spanish</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <br />
    <div class="editing-interest">
		<h5 class="f-title"><i class="ti-medall-alt"></i>Educations </h5>
		<div class="notification-box">
			<ul>
                <!-- Repeater Educations -->
                <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="ItemCommand">
                    <ItemTemplate>
				        <li>
					        <div class="notifi-meta">
						        <p><%# Eval("edu_title") %></p>
						        <span><%# Eval("edu_start") %> - <%# Eval("edu_end") %> | <%# Eval("edu_city") %>, <%# Eval("edu_country") %></span>
					        </div>
                            <asp:LinkButton ID="LinkButton1" CommandName="delete" CommandArgument='<%# Eval("edu_id") %>' runat="server"><i class="del fa fa-close"></i></asp:LinkButton>
				        </li>
                    </ItemTemplate>
                </asp:Repeater>
                <!-- Repeater Educations -->
			</ul>
		</div>
	</div>
</asp:Content>
