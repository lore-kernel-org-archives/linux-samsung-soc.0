From: Carlos Palminha <CARLOS.PALMINHA@synopsys.com>
Subject: [PATCH 07/17] drm/cirrus: removed optional dummy encoder mode_fixup function.
Date: Fri, 12 Feb 2016 13:54:23 +0000
Message-ID: <1455285263-3070-1-git-send-email-palminha@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from us01smtprelay-2.synopsys.com ([198.182.47.9]:60069 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752730AbcBLNyc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Feb 2016 08:54:32 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: CARLOS.PALMINHA@synopsys.com, airlied@linux.ie, jingoohan1@gmail.com, kgene@kernel.org, k.kozlowski@samsung.com, patrik.r.jakobsson@gmail.com, p.zabel@pengutronix.de, mark.yao@rock-chips.com, heiko@sntech.de, benjamin.gaignard@linaro.org, vincent.abriou@st.com, kraxel@redhat.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, virtualization@lists.linux-foundation.org

---
 drivers/gpu/drm/cirrus/cirrus_mode.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/cirrus/cirrus_mode.c b/drivers/gpu/drm/cirrus/cirrus_mode.c
index 4a02854..432ce94 100644
--- a/drivers/gpu/drm/cirrus/cirrus_mode.c
+++ b/drivers/gpu/drm/cirrus/cirrus_mode.c
@@ -430,14 +430,6 @@ void cirrus_crtc_fb_gamma_get(struct drm_crtc *crtc, u16 *red, u16 *green,
 	*blue = cirrus_crtc->lut_b[regno];
 }
 
-
-static bool cirrus_encoder_mode_fixup(struct drm_encoder *encoder,
-				      const struct drm_display_mode *mode,
-				      struct drm_display_mode *adjusted_mode)
-{
-	return true;
-}
-
 static void cirrus_encoder_mode_set(struct drm_encoder *encoder,
 				struct drm_display_mode *mode,
 				struct drm_display_mode *adjusted_mode)
@@ -466,7 +458,6 @@ static void cirrus_encoder_destroy(struct drm_encoder *encoder)
 
 static const struct drm_encoder_helper_funcs cirrus_encoder_helper_funcs = {
 	.dpms = cirrus_encoder_dpms,
-	.mode_fixup = cirrus_encoder_mode_fixup,
 	.mode_set = cirrus_encoder_mode_set,
 	.prepare = cirrus_encoder_prepare,
 	.commit = cirrus_encoder_commit,
-- 
2.5.0
