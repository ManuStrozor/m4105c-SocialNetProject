<%@ Page Title="" Language="C#" MasterPageFile="~/TimeLine.Master" AutoEventWireup="true" CodeBehind="TimeLine_EditPosts.aspx.cs" Inherits="SocialNetProject.TimeLine_EditPosts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="editing-info">
        <h5 class="f-title"><i class="ti-notepad"></i> Edit Posts</h5>

        <div class="form-group">
            <asp:TextBox ID="TextBox1" runat="server" TextMode="multiline" Columns="50" Rows="5"></asp:TextBox>
            <label class="control-label" for="textarea">Content</label><i class="mtrl-select"></i>
        </div>

        <div class="form-group">
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Image ID="Image1" width="150px" height="150px" runat="server" /><br />
            <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="No File Has Been Selected"></asp:Label>
        </div>

        <div class="submit-btns">
            <asp:Button ID="Button2" class="mtr-btn" runat="server" Text="Upload" OnClick="Button2_Click" />
            <asp:Button ID="Button1" class="mtr-btn" runat="server" Text="Post it" OnClick="Button1_Click" />
        </div>
    </div>
</asp:Content>
