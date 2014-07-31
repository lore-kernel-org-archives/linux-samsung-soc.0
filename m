From: Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 02/15] drm/panel: Add get_modes helper
Date: Thu, 31 Jul 2014 23:12:01 +0530
Message-ID: <1406828534-10072-3-git-send-email-ajaykumar.rs@samsung.com>
References: <1406828534-10072-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1406828534-10072-1-git-send-email-ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, seanpaul-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, prashanth.g-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Add a helper function drm_panel_get_modes to get modes from the panel.

Signed-off-by: Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 include/drm/drm_panel.h |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 9addc69..efc63cc 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -80,6 +80,14 @@ static inline int drm_panel_enable(struct drm_panel *panel)
 	return panel ? -ENOSYS : -EINVAL;
 }
 
+static inline int drm_panel_get_modes(struct drm_panel *panel)
+{
+	if (panel && panel->funcs && panel->funcs->get_modes)
+		return panel->funcs->get_modes(panel);
+
+	return 0;
+}
+
 void drm_panel_init(struct drm_panel *panel);
 
 int drm_panel_add(struct drm_panel *panel);
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
