From: Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 06/15] drm/exynos: dpi: Add support for panel prepare and
 unprepare routines
Date: Thu, 31 Jul 2014 23:12:05 +0530
Message-ID: <1406828534-10072-7-git-send-email-ajaykumar.rs@samsung.com>
References: <1406828534-10072-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1406828534-10072-1-git-send-email-ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, seanpaul-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, prashanth.g-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Modify exynos_dpi driver to support the new panel calls:
prepare and unprepare.

Signed-off-by: Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/gpu/drm/exynos/exynos_drm_dpi.c |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 3aa1c7e..fa08f05 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -125,14 +125,18 @@ static int exynos_dpi_create_connector(struct exynos_drm_display *display,
 
 static void exynos_dpi_poweron(struct exynos_dpi *ctx)
 {
-	if (ctx->panel)
+	if (ctx->panel) {
+		drm_panel_prepare(ctx->panel);
 		drm_panel_enable(ctx->panel);
+	}
 }
 
 static void exynos_dpi_poweroff(struct exynos_dpi *ctx)
 {
-	if (ctx->panel)
+	if (ctx->panel) {
 		drm_panel_disable(ctx->panel);
+		drm_panel_unprepare(ctx->panel);
+	}
 }
 
 static void exynos_dpi_dpms(struct exynos_drm_display *display, int mode)
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
