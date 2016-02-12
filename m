From: Carlos Palminha <CARLOS.PALMINHA@synopsys.com>
Subject: [PATCH 04/17] drm/amdgpu: removed optional dummy encoder mode_fixup function.
Date: Fri, 12 Feb 2016 13:50:56 +0000
Message-ID: <1455285069-2819-5-git-send-email-palminha@synopsys.com>
References: <daniel.vetter@ffwll.ch,>
 <1455285069-2819-1-git-send-email-palminha@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from us01smtprelay-2.synopsys.com ([198.182.47.9]:59999 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752598AbcBLNvn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Feb 2016 08:51:43 -0500
In-Reply-To: <1455285069-2819-1-git-send-email-palminha@synopsys.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: CARLOS.PALMINHA@synopsys.com, airlied@linux.ie, jingoohan1@gmail.com, kgene@kernel.org, k.kozlowski@samsung.com, patrik.r.jakobsson@gmail.com, p.zabel@pengutronix.de, mark.yao@rock-chips.com, heiko@sntech.de, benjamin.gaignard@linaro.org, vincent.abriou@st.com, kraxel@redhat.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, virtualization@lists.linux-foundation.org

---
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c | 8 --------
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c | 8 --------
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c  | 8 --------
 3 files changed, 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index 093599a..3483018 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -3624,16 +3624,8 @@ dce_v10_0_ext_dpms(struct drm_encoder *encoder, int mode)
 
 }
 
-static bool dce_v10_0_ext_mode_fixup(struct drm_encoder *encoder,
-				    const struct drm_display_mode *mode,
-				    struct drm_display_mode *adjusted_mode)
-{
-	return true;
-}
-
 static const struct drm_encoder_helper_funcs dce_v10_0_ext_helper_funcs = {
 	.dpms = dce_v10_0_ext_dpms,
-	.mode_fixup = dce_v10_0_ext_mode_fixup,
 	.prepare = dce_v10_0_ext_prepare,
 	.mode_set = dce_v10_0_ext_mode_set,
 	.commit = dce_v10_0_ext_commit,
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
index 8e67249..36deea1 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
@@ -3619,16 +3619,8 @@ dce_v11_0_ext_dpms(struct drm_encoder *encoder, int mode)
 
 }
 
-static bool dce_v11_0_ext_mode_fixup(struct drm_encoder *encoder,
-				    const struct drm_display_mode *mode,
-				    struct drm_display_mode *adjusted_mode)
-{
-	return true;
-}
-
 static const struct drm_encoder_helper_funcs dce_v11_0_ext_helper_funcs = {
 	.dpms = dce_v11_0_ext_dpms,
-	.mode_fixup = dce_v11_0_ext_mode_fixup,
 	.prepare = dce_v11_0_ext_prepare,
 	.mode_set = dce_v11_0_ext_mode_set,
 	.commit = dce_v11_0_ext_commit,
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index d0e128c..25dd8b6 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -3554,16 +3554,8 @@ dce_v8_0_ext_dpms(struct drm_encoder *encoder, int mode)
 
 }
 
-static bool dce_v8_0_ext_mode_fixup(struct drm_encoder *encoder,
-				    const struct drm_display_mode *mode,
-				    struct drm_display_mode *adjusted_mode)
-{
-	return true;
-}
-
 static const struct drm_encoder_helper_funcs dce_v8_0_ext_helper_funcs = {
 	.dpms = dce_v8_0_ext_dpms,
-	.mode_fixup = dce_v8_0_ext_mode_fixup,
 	.prepare = dce_v8_0_ext_prepare,
 	.mode_set = dce_v8_0_ext_mode_set,
 	.commit = dce_v8_0_ext_commit,
-- 
2.5.0
