From: Carlos Palminha <CARLOS.PALMINHA@synopsys.com>
Subject: [PATCH 02/17] drm/udl: removed optional dummy encoder mode_fixup function.
Date: Fri, 12 Feb 2016 13:50:02 +0000
Message-ID: <1455285017-2771-3-git-send-email-palminha@synopsys.com>
References: <1455285017-2771-1-git-send-email-palminha@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtprelay.synopsys.com ([198.182.47.9]:59931 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752627AbcBLNuf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Feb 2016 08:50:35 -0500
In-Reply-To: <1455285017-2771-1-git-send-email-palminha@synopsys.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch, lars@metafoo.de, laurent.pinchart@ideasonboard.com
Cc: CARLOS.PALMINHA@synopsys.com, airlied@linux.ie, jingoohan1@gmail.com, kgene@kernel.org, k.kozlowski@samsung.com, patrik.r.jakobsson@gmail.com, p.zabel@pengutronix.de, mark.yao@rock-chips.com, heiko@sntech.de, benjamin.gaignard@linaro.org, vincent.abriou@st.com, kraxel@redhat.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, virtualization@lists.linux-foundation.org

---
 drivers/gpu/drm/udl/udl_encoder.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_encoder.c b/drivers/gpu/drm/udl/udl_encoder.c
index a181a64..59a4b34 100644
--- a/drivers/gpu/drm/udl/udl_encoder.c
+++ b/drivers/gpu/drm/udl/udl_encoder.c
@@ -26,13 +26,6 @@ static void udl_encoder_disable(struct drm_encoder *encoder)
 {
 }
 
-static bool udl_mode_fixup(struct drm_encoder *encoder,
-			   const struct drm_display_mode *mode,
-			   struct drm_display_mode *adjusted_mode)
-{
-	return true;
-}
-
 static void udl_encoder_prepare(struct drm_encoder *encoder)
 {
 }
@@ -54,7 +47,6 @@ udl_encoder_dpms(struct drm_encoder *encoder, int mode)
 
 static const struct drm_encoder_helper_funcs udl_helper_funcs = {
 	.dpms = udl_encoder_dpms,
-	.mode_fixup = udl_mode_fixup,
 	.prepare = udl_encoder_prepare,
 	.mode_set = udl_encoder_mode_set,
 	.commit = udl_encoder_commit,
-- 
2.5.0
