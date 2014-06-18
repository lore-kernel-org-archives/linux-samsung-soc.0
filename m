From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 1/5] drm/exynos: set power state variable after enabling clocks
 and power
Date: Wed, 18 Jun 2014 17:04:49 +0530
Message-ID: <1403091293-15058-2-git-send-email-rahul.sharma@samsung.com>
References: <1403091293-15058-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:25101 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966218AbaFRLhO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Jun 2014 07:37:14 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N7D00GQA4A1XC10@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 18 Jun 2014 20:37:13 +0900 (KST)
In-reply-to: <1403091293-15058-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, kgene.kim@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Power state variable holds the state of the mixer device.
Power on and power off functions are toggling these variable
at wrong place.

State variable should be changed to true only after Runtime
PM and clocks are enabled. Else it may result to a situation
where mixer registers are accessed with device power enabled.
Similar logic for poweroff sequence.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_mixer.c |   22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 4c5aed7..c00abbe 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1061,7 +1061,7 @@ static void mixer_poweron(struct exynos_drm_manager *mgr)
 		mutex_unlock(&ctx->mixer_mutex);
 		return;
 	}
-	ctx->powered = true;
+
 	mutex_unlock(&ctx->mixer_mutex);
 
 	pm_runtime_get_sync(ctx->dev);
@@ -1072,6 +1072,10 @@ static void mixer_poweron(struct exynos_drm_manager *mgr)
 		clk_prepare_enable(res->sclk_mixer);
 	}
 
+	mutex_lock(&ctx->mixer_mutex);
+	ctx->powered = true;
+	mutex_unlock(&ctx->mixer_mutex);
+
 	mixer_reg_write(res, MXR_INT_EN, ctx->int_en);
 	mixer_win_reset(ctx);
 
@@ -1084,14 +1088,20 @@ static void mixer_poweroff(struct exynos_drm_manager *mgr)
 	struct mixer_resources *res = &ctx->mixer_res;
 
 	mutex_lock(&ctx->mixer_mutex);
-	if (!ctx->powered)
-		goto out;
+	if (!ctx->powered) {
+		mutex_unlock(&ctx->mixer_mutex);
+		return;
+	}
 	mutex_unlock(&ctx->mixer_mutex);
 
 	mixer_window_suspend(mgr);
 
 	ctx->int_en = mixer_reg_read(res, MXR_INT_EN);
 
+	mutex_lock(&ctx->mixer_mutex);
+	ctx->powered = false;
+	mutex_unlock(&ctx->mixer_mutex);
+
 	clk_disable_unprepare(res->mixer);
 	if (ctx->vp_enabled) {
 		clk_disable_unprepare(res->vp);
@@ -1099,12 +1109,6 @@ static void mixer_poweroff(struct exynos_drm_manager *mgr)
 	}
 
 	pm_runtime_put_sync(ctx->dev);
-
-	mutex_lock(&ctx->mixer_mutex);
-	ctx->powered = false;
-
-out:
-	mutex_unlock(&ctx->mixer_mutex);
 }
 
 static void mixer_dpms(struct exynos_drm_manager *mgr, int mode)
-- 
1.7.9.5
