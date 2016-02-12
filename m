From: Carlos Palminha <CARLOS.PALMINHA@synopsys.com>
Subject: [PATCH 16/17] drm/sti: removed optional dummy encoder mode_fixup function.
Date: Fri, 12 Feb 2016 13:56:13 +0000
Message-ID: <1455285373-3497-1-git-send-email-palminha@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtprelay.synopsys.com ([198.182.60.111]:46219 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752446AbcBLN4W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Feb 2016 08:56:22 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: CARLOS.PALMINHA@synopsys.com, airlied@linux.ie, jingoohan1@gmail.com, kgene@kernel.org, k.kozlowski@samsung.com, patrik.r.jakobsson@gmail.com, p.zabel@pengutronix.de, mark.yao@rock-chips.com, heiko@sntech.de, benjamin.gaignard@linaro.org, vincent.abriou@st.com, kraxel@redhat.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, virtualization@lists.linux-foundation.org

---
 drivers/gpu/drm/sti/sti_tvout.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_tvout.c b/drivers/gpu/drm/sti/sti_tvout.c
index f2afcf5..24a3735 100644
--- a/drivers/gpu/drm/sti/sti_tvout.c
+++ b/drivers/gpu/drm/sti/sti_tvout.c
@@ -440,13 +440,6 @@ static void sti_tvout_encoder_dpms(struct drm_encoder *encoder, int mode)
 {
 }
 
-static bool sti_tvout_encoder_mode_fixup(struct drm_encoder *encoder,
-				       const struct drm_display_mode *mode,
-				       struct drm_display_mode *adjusted_mode)
-{
-	return true;
-}
-
 static void sti_tvout_encoder_mode_set(struct drm_encoder *encoder,
 				       struct drm_display_mode *mode,
 				       struct drm_display_mode *adjusted_mode)
@@ -486,7 +479,6 @@ static void sti_dvo_encoder_disable(struct drm_encoder *encoder)
 
 static const struct drm_encoder_helper_funcs sti_dvo_encoder_helper_funcs = {
 	.dpms = sti_tvout_encoder_dpms,
-	.mode_fixup = sti_tvout_encoder_mode_fixup,
 	.mode_set = sti_tvout_encoder_mode_set,
 	.prepare = sti_tvout_encoder_prepare,
 	.commit = sti_dvo_encoder_commit,
@@ -540,7 +532,6 @@ static void sti_hda_encoder_disable(struct drm_encoder *encoder)
 
 static const struct drm_encoder_helper_funcs sti_hda_encoder_helper_funcs = {
 	.dpms = sti_tvout_encoder_dpms,
-	.mode_fixup = sti_tvout_encoder_mode_fixup,
 	.mode_set = sti_tvout_encoder_mode_set,
 	.prepare = sti_tvout_encoder_prepare,
 	.commit = sti_hda_encoder_commit,
@@ -589,7 +580,6 @@ static void sti_hdmi_encoder_disable(struct drm_encoder *encoder)
 
 static const struct drm_encoder_helper_funcs sti_hdmi_encoder_helper_funcs = {
 	.dpms = sti_tvout_encoder_dpms,
-	.mode_fixup = sti_tvout_encoder_mode_fixup,
 	.mode_set = sti_tvout_encoder_mode_set,
 	.prepare = sti_tvout_encoder_prepare,
 	.commit = sti_hdmi_encoder_commit,
-- 
2.5.0
