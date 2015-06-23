From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 18/23] drm/exynos: remove extra call to hdmi_commit()
Date: Tue, 23 Jun 2015 18:35:31 -0300
Message-ID: <1435095336-6196-19-git-send-email-gustavo@padovan.org>
References: <1435095336-6196-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f170.google.com ([209.85.220.170]:32968 "EHLO
	mail-qk0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933407AbbFWVgi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Jun 2015 17:36:38 -0400
Received: by qkhu186 with SMTP id u186so12219562qkh.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jun 2015 14:36:37 -0700 (PDT)
In-Reply-To: <1435095336-6196-1-git-send-email-gustavo@padovan.org>
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
