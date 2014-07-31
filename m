From: Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 07/15] drm/exynos: dsi: Add support for panel prepare and
 unprepare routines
Date: Thu, 31 Jul 2014 23:12:06 +0530
Message-ID: <1406828534-10072-8-git-send-email-ajaykumar.rs@samsung.com>
References: <1406828534-10072-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1406828534-10072-1-git-send-email-ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, seanpaul-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, prashanth.g-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Modify exynos_dsi driver to support the new panel calls:
prepare and unprepare.

Signed-off-by: Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c |   12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index dc7c80b..4834932 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1351,7 +1351,7 @@ static int exynos_dsi_enable(struct exynos_dsi *dsi)
 	if (ret < 0)
 		return ret;
 
-	ret = drm_panel_enable(dsi->panel);
+	ret = drm_panel_prepare(dsi->panel);
 	if (ret < 0) {
 		exynos_dsi_poweroff(dsi);
 		return ret;
@@ -1360,6 +1360,13 @@ static int exynos_dsi_enable(struct exynos_dsi *dsi)
 	exynos_dsi_set_display_mode(dsi);
 	exynos_dsi_set_display_enable(dsi, true);
 
+	ret = drm_panel_enable(dsi->panel);
+	if (ret < 0) {
+		exynos_dsi_set_display_enable(dsi, false);
+		exynos_dsi_poweroff(dsi);
+		return ret;
+	}
+
 	dsi->state |= DSIM_STATE_ENABLED;
 
 	return 0;
@@ -1370,8 +1377,9 @@ static void exynos_dsi_disable(struct exynos_dsi *dsi)
 	if (!(dsi->state & DSIM_STATE_ENABLED))
 		return;
 
-	exynos_dsi_set_display_enable(dsi, false);
 	drm_panel_disable(dsi->panel);
+	exynos_dsi_set_display_enable(dsi, false);
+	drm_panel_unprepare(dsi->panel);
 	exynos_dsi_poweroff(dsi);
 
 	dsi->state &= ~DSIM_STATE_ENABLED;
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
