From: Carlos Palminha <CARLOS.PALMINHA@synopsys.com>
Subject: [PATCH v2 12/17] drm/mgag200: removed optional dummy encoder mode_fixup function.
Date: Mon, 15 Feb 2016 13:00:35 +0000
Message-ID: <c5852d59a8890c3570ce97d16c0714a71eb61651.1455540137.git.palminha@synopsys.com>
References: <cover.1455540137.git.palminha@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtprelay.synopsys.com ([198.182.60.111]:35682 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751114AbcBONAo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Feb 2016 08:00:44 -0500
In-Reply-To: <cover.1455540137.git.palminha@synopsys.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: CARLOS.PALMINHA@synopsys.com, airlied@linux.ie, jingoohan1@gmail.com, kgene@kernel.org, k.kozlowski@samsung.com, patrik.r.jakobsson@gmail.com, p.zabel@pengutronix.de, mark.yao@rock-chips.com, heiko@sntech.de, benjamin.gaignard@linaro.org, vincent.abriou@st.com, kraxel@redhat.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, virtualization@lists.linux-foundation.org

mode_fixup function for encoder drivers became optional with patch
http://patchwork.freedesktop.org/patch/msgid/1455106522-32307-1-git-send-email-palminha@synopsys.com

This patch set nukes all the dummy mode_fixup implementations.

(made on top of Daniel topic/drm-misc branch)

Signed-off-by: Carlos Palminha <palminha@synopsys.com>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index dc13c48..af8b4c1 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -1479,13 +1479,6 @@ void mga_crtc_fb_gamma_get(struct drm_crtc *crtc, u16 *red, u16 *green,
  * These functions are analagous to those in the CRTC code, but are intended
  * to handle any encoder-specific limitations
  */
-static bool mga_encoder_mode_fixup(struct drm_encoder *encoder,
-				   const struct drm_display_mode *mode,
-				   struct drm_display_mode *adjusted_mode)
-{
-	return true;
-}
-
 static void mga_encoder_mode_set(struct drm_encoder *encoder,
 				struct drm_display_mode *mode,
 				struct drm_display_mode *adjusted_mode)
@@ -1515,7 +1508,6 @@ static void mga_encoder_destroy(struct drm_encoder *encoder)
 
 static const struct drm_encoder_helper_funcs mga_encoder_helper_funcs = {
 	.dpms = mga_encoder_dpms,
-	.mode_fixup = mga_encoder_mode_fixup,
 	.mode_set = mga_encoder_mode_set,
 	.prepare = mga_encoder_prepare,
 	.commit = mga_encoder_commit,
-- 
2.5.0
