From: Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 14/15] drm/exynos: Move DP setup into commit()
Date: Thu, 31 Jul 2014 23:12:13 +0530
Message-ID: <1406828534-10072-15-git-send-email-ajaykumar.rs@samsung.com>
References: <1406828534-10072-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1406828534-10072-1-git-send-email-ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, seanpaul-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, prashanth.g-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Add commit callback for exynos_dp, and move the DP link training,
video configuration code from the hotplug handler into commit().

Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/gpu/drm/exynos/exynos_dp_core.c |   24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index 31c3de9..347dec9 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -875,10 +875,18 @@ static irqreturn_t exynos_dp_irq_handler(int irq, void *arg)
 static void exynos_dp_hotplug(struct work_struct *work)
 {
 	struct exynos_dp_device *dp;
-	int ret;
 
 	dp = container_of(work, struct exynos_dp_device, hotplug_work);
 
+	if (dp->drm_dev)
+		drm_helper_hpd_irq_event(dp->drm_dev);
+}
+
+static void exynos_dp_commit(struct exynos_drm_display *display)
+{
+	struct exynos_dp_device *dp = display->ctx;
+	int ret;
+
 	ret = exynos_dp_detect_hpd(dp);
 	if (ret) {
 		/* Cable has been disconnected, we're done */
@@ -1050,8 +1058,10 @@ static void exynos_dp_phy_exit(struct exynos_dp_device *dp)
 	}
 }
 
-static void exynos_dp_poweron(struct exynos_dp_device *dp)
+static void exynos_dp_poweron(struct exynos_drm_display *display)
 {
+	struct exynos_dp_device *dp = display->ctx;
+
 	if (dp->dpms_mode == DRM_MODE_DPMS_ON)
 		return;
 
@@ -1059,10 +1069,13 @@ static void exynos_dp_poweron(struct exynos_dp_device *dp)
 	exynos_dp_phy_init(dp);
 	exynos_dp_init_dp(dp);
 	enable_irq(dp->irq);
+	exynos_dp_commit(display);
 }
 
-static void exynos_dp_poweroff(struct exynos_dp_device *dp)
+static void exynos_dp_poweroff(struct exynos_drm_display *display)
 {
+	struct exynos_dp_device *dp = display->ctx;
+
 	if (dp->dpms_mode != DRM_MODE_DPMS_ON)
 		return;
 
@@ -1078,12 +1091,12 @@ static void exynos_dp_dpms(struct exynos_drm_display *display, int mode)
 
 	switch (mode) {
 	case DRM_MODE_DPMS_ON:
-		exynos_dp_poweron(dp);
+		exynos_dp_poweron(display);
 		break;
 	case DRM_MODE_DPMS_STANDBY:
 	case DRM_MODE_DPMS_SUSPEND:
 	case DRM_MODE_DPMS_OFF:
-		exynos_dp_poweroff(dp);
+		exynos_dp_poweroff(display);
 		break;
 	default:
 		break;
@@ -1094,6 +1107,7 @@ static void exynos_dp_dpms(struct exynos_drm_display *display, int mode)
 static struct exynos_drm_display_ops exynos_dp_display_ops = {
 	.create_connector = exynos_dp_create_connector,
 	.dpms = exynos_dp_dpms,
+	.commit = exynos_dp_commit,
 };
 
 static struct exynos_drm_display exynos_dp_display = {
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
