From: Carlos Palminha <CARLOS.PALMINHA@synopsys.com>
Subject: [PATCH v2 06/17] drm/bochs: removed optional dummy encoder mode_fixup function.
Date: Mon, 15 Feb 2016 12:59:12 +0000
Message-ID: <d8b87edea28c8211e1711348143e4c355764a8c4.1455540137.git.palminha@synopsys.com>
References: <cover.1455540137.git.palminha@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtprelay2.synopsys.com ([198.182.60.111]:35729 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751114AbcBONBM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Feb 2016 08:01:12 -0500
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
 drivers/gpu/drm/bochs/bochs_kms.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
index 2849f1b..317c27f 100644
--- a/drivers/gpu/drm/bochs/bochs_kms.c
+++ b/drivers/gpu/drm/bochs/bochs_kms.c
@@ -152,13 +152,6 @@ static void bochs_crtc_init(struct drm_device *dev)
 	drm_crtc_helper_add(crtc, &bochs_helper_funcs);
 }
 
-static bool bochs_encoder_mode_fixup(struct drm_encoder *encoder,
-				     const struct drm_display_mode *mode,
-				     struct drm_display_mode *adjusted_mode)
-{
-	return true;
-}
-
 static void bochs_encoder_mode_set(struct drm_encoder *encoder,
 				   struct drm_display_mode *mode,
 				   struct drm_display_mode *adjusted_mode)
@@ -179,7 +172,6 @@ static void bochs_encoder_commit(struct drm_encoder *encoder)
 
 static const struct drm_encoder_helper_funcs bochs_encoder_helper_funcs = {
 	.dpms = bochs_encoder_dpms,
-	.mode_fixup = bochs_encoder_mode_fixup,
 	.mode_set = bochs_encoder_mode_set,
 	.prepare = bochs_encoder_prepare,
 	.commit = bochs_encoder_commit,
-- 
2.5.0
