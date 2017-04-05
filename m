From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH] drm/exynos/hdmi: fix pipeline disable order
Date: Wed, 05 Apr 2017 08:59:48 +0200
Message-ID: <1491375588-7092-1-git-send-email-a.hajda@samsung.com>
References: <CGME20170405065952eucas1p2592b14571d4e54eeb0aa58195172edb6@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:20900 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751121AbdDEG75 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Apr 2017 02:59:57 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0ONX00D3DCRU1N10@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 05 Apr 2017 07:59:54 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

Hardware require that MIXER(crtc) should be disabled prior to
HDMI(encoder). It was achieved by disabling crtc from encoder disable
callback, bypassing drm core. As a result drm core tried to call vblank
related routines on disabled crtc. The patch fixes it by simplifying
hdmi_disable routine - now it only cancels hotplug worker. Hardware will
be disabled in proper moment during pipe clock disable.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 5243840..b61fe87 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1481,8 +1481,6 @@ static void hdmi_enable(struct drm_encoder *encoder)
 static void hdmi_disable(struct drm_encoder *encoder)
 {
 	struct hdmi_context *hdata = encoder_to_hdmi(encoder);
-	struct drm_crtc *crtc = encoder->crtc;
-	const struct drm_crtc_helper_funcs *funcs = NULL;
 
 	if (!hdata->powered)
 		return;
@@ -1493,17 +1491,10 @@ static void hdmi_disable(struct drm_encoder *encoder)
 	 * to disable TV Subsystem should be as following,
 	 *	VP -> Mixer -> HDMI
 	 *
-	 * Below codes will try to disable Mixer and VP(if used)
-	 * prior to disabling HDMI.
+	 * To achieve such sequence HDMI is disabled together with HDMI PHY, via
+	 * pipe clock callback.
 	 */
-	if (crtc)
-		funcs = crtc->helper_private;
-	if (funcs && funcs->disable)
-		(*funcs->disable)(crtc);
-
 	cancel_delayed_work(&hdata->hotplug_work);
-
-	hdmiphy_disable(hdata);
 }
 
 static const struct drm_encoder_helper_funcs exynos_hdmi_encoder_helper_funcs = {
-- 
2.7.4
