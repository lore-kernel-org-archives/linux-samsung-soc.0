From: Carlos Palminha <CARLOS.PALMINHA@synopsys.com>
Subject: [PATCH 13/17] drm/qxl: removed optional dummy encoder mode_fixup function.
Date: Fri, 12 Feb 2016 13:55:37 +0000
Message-ID: <1455285337-3356-1-git-send-email-palminha@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from us01smtprelay-2.synopsys.com ([198.182.47.9]:60159 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752601AbcBLNzr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Feb 2016 08:55:47 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: CARLOS.PALMINHA@synopsys.com, airlied@linux.ie, jingoohan1@gmail.com, kgene@kernel.org, k.kozlowski@samsung.com, patrik.r.jakobsson@gmail.com, p.zabel@pengutronix.de, mark.yao@rock-chips.com, heiko@sntech.de, benjamin.gaignard@linaro.org, vincent.abriou@st.com, kraxel@redhat.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, virtualization@lists.linux-foundation.org

---
 drivers/gpu/drm/qxl/qxl_display.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index 8627651..43e5f50 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -734,14 +734,6 @@ static void qxl_enc_dpms(struct drm_encoder *encoder, int mode)
 	DRM_DEBUG("\n");
 }
 
-static bool qxl_enc_mode_fixup(struct drm_encoder *encoder,
-			       const struct drm_display_mode *mode,
-			       struct drm_display_mode *adjusted_mode)
-{
-	DRM_DEBUG("\n");
-	return true;
-}
-
 static void qxl_enc_prepare(struct drm_encoder *encoder)
 {
 	DRM_DEBUG("\n");
@@ -864,7 +856,6 @@ static struct drm_encoder *qxl_best_encoder(struct drm_connector *connector)
 
 static const struct drm_encoder_helper_funcs qxl_enc_helper_funcs = {
 	.dpms = qxl_enc_dpms,
-	.mode_fixup = qxl_enc_mode_fixup,
 	.prepare = qxl_enc_prepare,
 	.mode_set = qxl_enc_mode_set,
 	.commit = qxl_enc_commit,
-- 
2.5.0
