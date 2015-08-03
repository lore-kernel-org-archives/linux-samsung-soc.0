From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 06/11] drm/exynos: remove extra call to hdmi_commit()
Date: Mon,  3 Aug 2015 16:09:53 -0300
Message-ID: <1438628998-3435-7-git-send-email-gustavo@padovan.org>
References: <1438628998-3435-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f173.google.com ([209.85.160.173]:32922 "EHLO
	mail-yk0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754870AbbHCTKU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 3 Aug 2015 15:10:20 -0400
Received: by ykoo205 with SMTP id o205so28729059yko.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Aug 2015 12:10:19 -0700 (PDT)
In-Reply-To: <1438628998-3435-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

hdmi_commit() was getting called twice by exynos encoder core, once inside
the .enable() call and another time by .commit() itself.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 1aed7ea..11bac50 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1711,16 +1711,6 @@ static void hdmi_mode_set(struct exynos_drm_encoder *encoder,
 	hdata->cea_video_id = drm_match_cea_mode(mode);
 }
 
-static void hdmi_commit(struct exynos_drm_encoder *encoder)
-{
-	struct hdmi_context *hdata = encoder_to_hdmi(encoder);
-
-	if (!hdata->powered)
-		return;
-
-	hdmi_conf_apply(hdata);
-}
-
 static void hdmi_enable(struct exynos_drm_encoder *encoder)
 {
 	struct hdmi_context *hdata = encoder_to_hdmi(encoder);
@@ -1744,7 +1734,7 @@ static void hdmi_enable(struct exynos_drm_encoder *encoder)
 	clk_prepare_enable(res->sclk_hdmi);
 
 	hdmiphy_poweron(hdata);
-	hdmi_commit(encoder);
+	hdmi_conf_apply(hdata);
 }
 
 static void hdmi_disable(struct exynos_drm_encoder *encoder)
@@ -1798,7 +1788,6 @@ static struct exynos_drm_encoder_ops hdmi_encoder_ops = {
 	.mode_set	= hdmi_mode_set,
 	.enable		= hdmi_enable,
 	.disable	= hdmi_disable,
-	.commit		= hdmi_commit,
 };
 
 static void hdmi_hotplug_work_func(struct work_struct *work)
-- 
2.1.0
