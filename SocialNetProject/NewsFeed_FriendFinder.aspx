<%@ Page Title="" Language="C#" MasterPageFile="~/NewsFeed.Master" AutoEventWireup="true" CodeBehind="NewsFeed_FriendFinder.aspx.cs" Inherits="SocialNetProject.NewsFeed_FriendFinder" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul class="nearby-contct">
        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="ItemCommand">
            <ItemTemplate>
                <li>
                    <div class="nearly-pepls">
                        <figure>
                            <a href="">
                                <img style="width:60px;height:60px;" src="<%# Eval("user_profilepic") %>" alt="">
                            </a>
                        </figure>
                        <div class="pepl-info">
                            <h4><asp:LinkButton ID="LinkButton2" runat="server" CommandName="viewFriend"><%# Eval("full_name") %></asp:LinkButton></h4>
                            <asp:Label ID="Label1" runat="server" Visible="False" Text='<%# Eval("users_id") %>'></asp:Label>
                            <span><%# Eval("user_shortbio") %></span>
                            <em><i class="fa fa-map-marker"></i><%# Eval("user_city") %></em>
                            <asp:LinkButton ID="LinkButton1" class="add-butn" runat="server" CommandName="addFriend">add friend</asp:LinkButton>
                        </div>
                    </div>
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
</asp:Content>
