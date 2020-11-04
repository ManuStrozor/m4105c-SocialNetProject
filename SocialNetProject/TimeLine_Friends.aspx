<%@ Page Title="" Language="C#" MasterPageFile="~/TimeLine.Master" AutoEventWireup="true" CodeBehind="TimeLine_Friends.aspx.cs" Inherits="SocialNetProject.TimeLine_Friends" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="frnds">
        <ul class="nav nav-tabs">
            <li class="nav-item"><a class="active" href="#frends" data-toggle="tab">My Friends</a><span><asp:Label ID="LabelNbFriends" runat="server" Text="0"></asp:Label></span></li>
            <li class="nav-item"><a class="" href="#frends-req" data-toggle="tab">Friend Requests</a><span><asp:Label ID="LabelNbRequests" runat="server" Text="0"></asp:Label></span></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active fade show " id="frends">
                <ul class="nearby-contct">
                    <!-- Repeater Friends -->
                    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="ItemCommandFriends">
                        <ItemTemplate>
                            <li>
                                <div class="nearly-pepls">
                                    <figure>
                                        <asp:LinkButton ID="LinkButton7" CommandName="viewFriend" runat="server">
                                            <img style="width: 60px; height: 60px;" src="<%# Eval("user_profilepic") %>" alt="">
                                        </asp:LinkButton>
                                    </figure>
                                    <div class="pepl-info">
                                        <h4>
                                            <asp:LinkButton ID="LinkButton4" runat="server" CommandName="viewFriend"><%# Eval("full_name") %></asp:LinkButton>
                                        </h4>
                                        <asp:Label ID="Label1" runat="server" Visible="false" Text='<%# Eval("users_id") %>'></asp:Label>
                                        <span><%# Eval("user_shortbio") %></span>
                                        <asp:LinkButton ID="LinkButton3" CommandName="block" class="add-butn more-action" runat="server">unfriend</asp:LinkButton>
                                    </div>
                                </div>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                    <!-- Repeater Friends -->
                </ul>
            </div>
            <div class="tab-pane fade" id="frends-req">
                <ul class="nearby-contct">
                    <!-- Repeater Requests -->
                    <asp:Repeater ID="Repeater2" runat="server" OnItemCommand="ItemCommandRequests">
                        <ItemTemplate>
                            <li>
                                <div class="nearly-pepls">
                                    <figure>
                                        <asp:LinkButton ID="LinkButton6" CommandName="viewFriend" runat="server">
                                            <img style="width: 60px; height: 60px;" src="<%# Eval("user_profilepic") %>" alt="">
                                        </asp:LinkButton>
                                    </figure>
                                    <div class="pepl-info">
                                        <h4>
                                            <asp:LinkButton ID="LinkButton5" runat="server" CommandName="viewFriend"><%# Eval("full_name") %></asp:LinkButton>
                                        </h4>
                                        <asp:Label ID="Label2" runat="server" Visible="false" Text='<%# Eval("users_id") %>'></asp:Label>
                                        <span><%# Eval("user_shortbio") %></span>
                                        <asp:LinkButton ID="LinkButton1" CommandName="delete" class="add-butn more-action" runat="server">delete Request</asp:LinkButton>
                                        <asp:LinkButton ID="LinkButton2" CommandName="confirm" class="add-butn" runat="server">Confirm</asp:LinkButton>
                                    </div>
                                </div>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                    <!-- Repeater Requests -->
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
