<%@ Page Title="" Language="C#" MasterPageFile="~/TimeLine.Master" AutoEventWireup="true" CodeBehind="TimeLine_Images.aspx.cs" Inherits="SocialNetProject.TimeLine_Images" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul class="photos">
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <li>
			        <a class="strip" href="<%# FixPath(Eval("img_src"))%>" title="<%# Eval("img_title") %>" data-strip-group="mygroup" data-strip-group-options="loop: false">
				    <img src="<%# FixPath(Eval("img_src")) %>" alt=""></a>
		        </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
</asp:Content>
