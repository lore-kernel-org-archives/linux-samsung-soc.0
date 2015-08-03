From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 02/11] drm/exynos: remove wrappers for phy_power_{on,off}
Date: Mon,  3 Aug 2015 16:09:49 -0300
Message-ID: <1438628998-3435-3-git-send-email-gustavo@padovan.org>
References: <1438628998-3435-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f177.google.com ([209.85.160.177]:35143 "EHLO
	mail-yk0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754650AbbHCTKK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 3 Aug 2015 15:10:10 -0400
Received: by ykdu72 with SMTP id u72so118814948ykd.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Aug 2015 12:10:10 -0700 (PDT)
In-Reply-To: <1438628998-3435-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

phy_power_on() and phy_power_off() already checks for NULL pointer.
This patch removes the wrappers exynos_dp_phy_init() and
exynos_dp_phy_exit() since the only think they were doing was a check for
NULL phy.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_dp_core.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index f2cc8f1..fe38d6f 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -1054,18 +1054,6 @@ static int exynos_dp_create_connector(struct exynos_drm_display *display,
 	return ret;
 }
 
-static void exynos_dp_phy_init(struct exynos_dp_device *dp)
-{
-	if (dp->phy)
-		phy_power_on(dp->phy);
-}
-
-static void exynos_dp_phy_exit(struct exynos_dp_device *dp)
-{
-	if (dp->phy)
-		phy_power_off(dp->phy);
-}
-
 static void exynos_dp_enable(struct exynos_drm_display *display)
 {
 	struct exynos_dp_device *dp = display_to_dp(display);
@@ -1085,7 +1073,7 @@ static void exynos_dp_enable(struct exynos_drm_display *display)
 		crtc->ops->clock_enable(dp_to_crtc(dp), true);
 
 	clk_prepare_enable(dp->clock);
-	exynos_dp_phy_init(dp);
+	phy_power_on(dp->phy);
 	exynos_dp_init_dp(dp);
 	enable_irq(dp->irq);
 	exynos_dp_commit(&dp->display);
@@ -1105,7 +1093,7 @@ static void exynos_dp_disable(struct exynos_drm_display *display)
 
 	disable_irq(dp->irq);
 	flush_work(&dp->hotplug_work);
-	exynos_dp_phy_exit(dp);
+	phy_power_off(dp->phy);
 	clk_disable_unprepare(dp->clock);
 
 	if (crtc->ops->clock_enable)
@@ -1278,7 +1266,7 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 
 	INIT_WORK(&dp->hotplug_work, exynos_dp_hotplug);
 
-	exynos_dp_phy_init(dp);
+	phy_power_on(dp->phy);
 
 	exynos_dp_init_dp(dp);
 
-- 
2.1.0
