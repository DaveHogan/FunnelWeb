﻿using System.Collections.Generic;
using FunnelWeb.Web.Model;

namespace FunnelWeb.Web.Features.Admin.Views
{
    public class CommentsModel
    {
        public CommentsModel(IEnumerable<Comment> comments)
        {
            Comments = comments;
        }

        public IEnumerable<Comment> Comments { get; set; }
    }
}