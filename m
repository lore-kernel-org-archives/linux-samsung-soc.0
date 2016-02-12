From: Carlos Palminha <CARLOS.PALMINHA@synopsys.com>
Subject: [PATCH 03/17] drm/exynos: removed optional dummy encoder mode_fixup function.
Date: Fri, 12 Feb 2016 13:50:55 +0000
Message-ID: <1455285069-2819-4-git-send-email-palminha@synopsys.com>
References: <daniel.vetter@ffwll.ch,>
 <1455285069-2819-1-git-send-email-palminha@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from us01smtprelay-2.synopsys.com ([198.182.60.111]:46060 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752598AbcBLNvk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Feb 2016 08:51:40 -0500
In-Reply-To: <1455285069-2819-1-git-send-email-palminha@synopsys.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: CARLOS.PALMINHA@synopsys.com, airlied@linux.ie, jingoohan1@gmail.com, kgene@kernel.org, k.kozlowski@samsung.com, patrik.r.jakobsson@gmail.com, p.zabel@pengutronix.de, mark.yao@rock-chips.com, heiko@sntech.de, benjamin.gaignard@linaro.org, vincent.abriou@st.com, kraxel@redhat.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, virtualization@lists.linux-foundation.org

---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index e977a81..736115c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1597,13 +1597,6 @@ static int exynos_dsi_create_connector(struct drm_encoder *encoder)
 	return 0;
 }
 
-static bool exynos_dsi_mode_fixup(struct drm_encoder *encoder,
-				  const struct drm_display_mode *mode,
-				  struct drm_display_mode *adjusted_mode)
-{
-	return true;
-}
-
 static void exynos_dsi_mode_set(struct drm_encoder *encoder,
 				struct drm_display_mode *mode,
 				struct drm_display_mode *adjusted_mode)
@@ -1623,7 +1616,6 @@ static void exynos_dsi_mode_set(struct drm_encoder *encoder,
 }
 
 static const struct drm_encoder_helper_funcs exynos_dsi_encoder_helper_funcs = {
-	.mode_fixup = exynos_dsi_mode_fixup,
 	.mode_set = exynos_dsi_mode_set,
 	.enable = exynos_dsi_enable,
 	.disable = exynos_dsi_disable,
-- 
2.5.0
