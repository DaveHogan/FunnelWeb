<%@ Page Title="" Language="C#" MasterPageFile="~/Content/Safe.Master" Inherits="System.Web.Mvc.ViewPage<FunnelWeb.Web.Features.Admin.Views.CommentsModel>" %>

<asp:Content ContentPlaceHolderID="TitleContent" runat="server">
	FunnelWeb Administration - Comments
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <h1>Comments</h1>	    
	  <p>
      FunnelWeb comments are automatically sent to <strong><a href="http://akismet.com">Akismet</a></strong> for spam filtering.
      You can also add your own blacklist of naughty words considered as spam on the <%= Html.ActionLink("general settings", "Settings", "Admin") %> page.
    </p>
          
    <p>
      <%= Html.ActionLink("Delete all Spam", "DeleteAllSpam", "Admin", null, null) %>
    </p>
    
    <% foreach (var comment in Model.Comments) { %>
    <table width="90%" style="margin: 5px;background:<%= comment.IsSpam ? "#fff0f0;" : "#f0f0f0;" %>">
      <tr>
          <td colspan="2" width="90%">
              <strong><%= Html.Encode(comment.Entry.Title) %></strong><br />
              <%= Html.DisplayFor(_ => comment.Body, new { Sanitize = true })%>
          </td>
      </tr>
      <tr>
          <td width="75%">
              <%= string.Join("<br />", new[] { "<strong>" + Html.Encode(comment.AuthorName) + "</strong>", Html.Encode(comment.AuthorEmail), Html.Encode(comment.AuthorUrl) }.Where(x => !string.IsNullOrEmpty(x)).ToArray() ) %>
          </td>
          <td width="25%">
              <%= Html.ActionLink("Delete", "DeleteComment", "Admin", new {comment = comment.Id}, null) %>
              <%= Html.ActionLink(comment.IsSpam ? "Unspam" : "Spam", "ToggleSpam", "Admin", new {comment = comment.Id}, null) %>
          </td>
      </tr>
    </table>
    <% } %>
    
<% Html.RequiresJs("/Views/Admin/Scripts/Admin.js", 2); %>

</asp:Content>
