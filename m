From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V6 4/8] drm/exynos: Move DP setup into commit()
Date: Sat, 26 Jul 2014 00:52:06 +0530
Message-ID: <1406316130-4744-5-git-send-email-ajaykumar.rs@samsung.com>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:44221 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751336AbaGYTZY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jul 2014 15:25:24 -0400
In-reply-to: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: inki.dae@samsung.com, thierry.reding@gmail.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>, Sean Paul <seanpaul@chromium.org>

This patch moves the DP training and video enable from the hotplug
handler into commit().

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_dp_core.c |   24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index 845d766..4b6ad95 100644
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
