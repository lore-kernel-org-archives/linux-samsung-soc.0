From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v2 18/23] drm/exynos: remove extra call to hdmi_commit()
Date: Mon,  6 Jul 2015 11:20:19 -0300
Message-ID: <1436192424-18194-19-git-send-email-gustavo@padovan.org>
References: <1436192424-18194-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f172.google.com ([209.85.220.172]:34610 "EHLO
	mail-qk0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753145AbbGFOV3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Jul 2015 10:21:29 -0400
Received: by qkeo142 with SMTP id o142so117989902qke.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jul 2015 07:21:28 -0700 (PDT)
In-Reply-To: <1436192424-18194-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

hdmi_commit() was getting called twice by exynos encoder core, once inside
the .enable() call and another time by .commit() itself.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index a0443dc..1fc01fe 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -2019,20 +2019,6 @@ static void hdmi_mode_set(struct exynos_drm_encoder *encoder,
 		hdmi_v14_mode_set(hdata, mode);
 }
 
-static void hdmi_commit(struct exynos_drm_encoder *encoder)
-{
-	struct hdmi_context *hdata = encoder_to_hdmi(encoder);
-
-	mutex_lock(&hdata->hdmi_mutex);
-	if (!hdata->powered) {
-		mutex_unlock(&hdata->hdmi_mutex);
-		return;
-	}
-	mutex_unlock(&hdata->hdmi_mutex);
-
-	hdmi_conf_apply(hdata);
-}
-
 static void hdmi_enable(struct exynos_drm_encoder *encoder)
 {
 	struct hdmi_context *hdata = encoder_to_hdmi(encoder);
@@ -2061,7 +2047,7 @@ static void hdmi_enable(struct exynos_drm_encoder *encoder)
 	clk_prepare_enable(res->sclk_hdmi);
 
 	hdmiphy_poweron(hdata);
-	hdmi_commit(encoder);
+	hdmi_conf_apply(hdata);
 }
 
 static void hdmi_disable(struct exynos_drm_encoder *encoder)
@@ -2121,7 +2107,6 @@ static struct exynos_drm_encoder_ops hdmi_encoder_ops = {
 	.mode_set	= hdmi_mode_set,
 	.enable		= hdmi_enable,
 	.disable	= hdmi_disable,
-	.commit		= hdmi_commit,
 };
 
 static void hdmi_hotplug_work_func(struct work_struct *work)
-- 
2.1.0
