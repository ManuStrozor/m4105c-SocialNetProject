<%@ Page Title="" Language="C#" MasterPageFile="~/TimeLine.Master" AutoEventWireup="true" CodeBehind="TimeLine_Posts.aspx.cs" Inherits="SocialNetProject.TimeLine_Posts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<!-- Repeater Posts -->
    <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="ItemBound" OnItemCommand="ItemCommandPosts">
        <ItemTemplate>
            <div class="central-meta item">
			    <div class="user-post">
				    <div class="friend-info">
					    <figure>
						    <img src="<%# Eval("user_profilepic") %>" alt="">
					    </figure>
					    <div class="friend-name">
                            <ins><asp:LinkButton ID="LinkButton1" CommandName="viewFriend" CommandArgument='<%# Eval("users_id") %>' runat="server"><%# Eval("full_name") %></asp:LinkButton></ins>
						    <span>published: <%# FixDate(Eval("post_datetime")) %></span>
					    </div>
					    <div class="post-meta">
						    <img src="<%# FixPath(Eval("post_image")) %>" alt="">
						    <div class="we-video-info">
							    <ul>					
								    <li>
									    <span class="views" data-toggle="tooltip" title="views">
										    <i class="fa fa-eye"></i>
										    <ins>1.2k</ins>
									    </span>
								    </li>
								    <li>
									    <span class="comment" data-toggle="tooltip" title="Comments">
										    <i class="fa fa-comments-o"></i>
										    <ins><%# Eval("nb_comments") %></ins>
									    </span>
								    </li>
								    <li>
									    <span class="like" data-toggle="tooltip" title="like">
                                            <asp:LinkButton ID="LikeButton" CommandName="like" CommandArgument='<%# Eval("post_id") %>' runat="server"><i class="ti-heart"></i></asp:LinkButton>
										    <ins><%# Eval("post_likes") %></ins>
									    </span>
								    </li>
								    <li>
									    <span class="dislike" data-toggle="tooltip" title="dislike">
                                            <asp:LinkButton ID="DislikeButton" CommandName="dislike" CommandArgument='<%# Eval("post_id") %>' runat="server"><i class="ti-heart-broken"></i></asp:LinkButton>
										    <ins><%# Eval("post_dislikes") %></ins>
									    </span>
								    </li>
							    </ul>
						    </div>
						    <div class="description">
							    <p><%# Eval("post_desc") %></p>
						    </div>
					    </div>
				    </div>
				    <div class="coment-area">
					    <ul class="we-comet">
							<!-- Repeater Comments -->
                            <asp:Repeater ID="Repeater2" runat="server" OnItemCommand="ItemCommandComments">
								<ItemTemplate>
									<li>
										<div class="comet-avatar">
											<img src="<%# Eval("user_profilepic") %>" alt="">
										</div>
										<div class="we-comment">
											<div class="coment-head">
												<h5>
                                                    <asp:LinkButton ID="LinkButton2" CommandName="viewFriend" CommandArgument='<%# Eval("users_id") %>' runat="server"><%# Eval("full_name") %></asp:LinkButton>
												</h5>
												<span><%# FixDate(Eval("comment_datetime")) %></span>
												<a class="we-reply" href="#" title="Reply"><i class="fa fa-reply"></i></a>
											</div>
											<p><%# Eval("comment_text") %></p>
										</div>
									</li>
								</ItemTemplate>
                            </asp:Repeater>
							<!-- Repeater Comments -->
						    <li class="post-comment">
							    <div class="comet-avatar">
								    <img style="width:30px;height:30px;" src="<%= Session["profilepic"] %>" alt="">
							    </div>
							    <div class="post-comt-box">
                                    <asp:TextBox ID="TextBoxComment"  runat="server"></asp:TextBox>
                                    <asp:Button ID="Button1" runat="server" CommandName="send" CommandArgument='<%# Eval("post_id") %>' UseSubmitBehavior="false" style="width:20%; border-radius: 4px;padding: 4px 20px; background: #bbbbbb; border: medium none; color: #fff; font-size: 13px; font-weight: 500;" Text="Send" />
							    </div>
						    </li>
					    </ul>
				    </div>
			    </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
	<!-- Repeater Posts -->
</asp:Content>
