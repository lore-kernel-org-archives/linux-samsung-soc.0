From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 3/3] drm/exynos: rotator: Clock control is unused if !PM
Date: Thu, 24 Sep 2015 12:14:15 +0200
Message-ID: <1443089655-15352-3-git-send-email-thierry.reding@gmail.com>
References: <1443089655-15352-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:36738 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754084AbbIXKO2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Sep 2015 06:14:28 -0400
Received: by pacgz1 with SMTP id gz1so2667123pac.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Sep 2015 03:14:28 -0700 (PDT)
In-Reply-To: <1443089655-15352-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Protect the rotator_clk_crtl() function with an #ifdef CONFIG_PM guard
to avoid "defined but not used" warnings.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/exynos/exynos_drm_rotator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_rotator.c b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
index 425e70625388..2f5c118f4c8e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
@@ -786,6 +786,7 @@ static int rotator_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_PM
 static int rotator_clk_crtl(struct rot_context *rot, bool enable)
 {
 	if (enable) {
@@ -822,7 +823,6 @@ static int rotator_resume(struct device *dev)
 }
 #endif
 
-#ifdef CONFIG_PM
 static int rotator_runtime_suspend(struct device *dev)
 {
 	struct rot_context *rot = dev_get_drvdata(dev);
-- 
2.5.0
