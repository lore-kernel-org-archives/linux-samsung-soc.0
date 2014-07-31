From: Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 10/15] drm/panel: s6e8aa0: Add proper definition for prepare
 and unprepare
Date: Thu, 31 Jul 2014 23:12:09 +0530
Message-ID: <1406828534-10072-11-git-send-email-ajaykumar.rs@samsung.com>
References: <1406828534-10072-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1406828534-10072-1-git-send-email-ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, seanpaul-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, prashanth.g-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Move out code from enable and disable routines to prepare
and unprepare routines, so that functionality is properly
distributed across all the panel functions.

Signed-off-by: Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/gpu/drm/panel/panel-s6e8aa0.c |   22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-s6e8aa0.c b/drivers/gpu/drm/panel/panel-s6e8aa0.c
index 60694dd..cf4be7f 100644
--- a/drivers/gpu/drm/panel/panel-s6e8aa0.c
+++ b/drivers/gpu/drm/panel/panel-s6e8aa0.c
@@ -889,6 +889,11 @@ static int s6e8aa0_power_off(struct s6e8aa0 *ctx)
 
 static int s6e8aa0_disable(struct drm_panel *panel)
 {
+	return 0;
+}
+
+static int s6e8aa0_unprepare(struct drm_panel *panel)
+{
 	struct s6e8aa0 *ctx = panel_to_s6e8aa0(panel);
 
 	s6e8aa0_dcs_write_seq_static(ctx, MIPI_DCS_ENTER_SLEEP_MODE);
@@ -900,18 +905,8 @@ static int s6e8aa0_disable(struct drm_panel *panel)
 	return s6e8aa0_power_off(ctx);
 }
 
-static int s6e8aa0_unprepare(struct drm_panel *panel)
-{
-	return 0;
-}
-
 static int s6e8aa0_prepare(struct drm_panel *panel)
 {
-	return 0;
-}
-
-static int s6e8aa0_enable(struct drm_panel *panel)
-{
 	struct s6e8aa0 *ctx = panel_to_s6e8aa0(panel);
 	int ret;
 
@@ -923,11 +918,16 @@ static int s6e8aa0_enable(struct drm_panel *panel)
 	ret = ctx->error;
 
 	if (ret < 0)
-		s6e8aa0_disable(panel);
+		s6e8aa0_unprepare(panel);
 
 	return ret;
 }
 
+static int s6e8aa0_enable(struct drm_panel *panel)
+{
+	return 0;
+}
+
 static int s6e8aa0_get_modes(struct drm_panel *panel)
 {
 	struct drm_connector *connector = panel->connector;
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
