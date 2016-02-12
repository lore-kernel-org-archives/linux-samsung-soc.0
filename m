From: Carlos Palminha <CARLOS.PALMINHA@synopsys.com>
Subject: [PATCH 01/17] drm/virtio: removed optional dummy encoder mode_fixup function.
Date: Fri, 12 Feb 2016 13:50:53 +0000
Message-ID: <1455285069-2819-2-git-send-email-palminha@synopsys.com>
References: <daniel.vetter@ffwll.ch,>
 <1455285069-2819-1-git-send-email-palminha@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from us01smtprelay-2.synopsys.com ([198.182.47.9]:59971 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752598AbcBLNvc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Feb 2016 08:51:32 -0500
In-Reply-To: <1455285069-2819-1-git-send-email-palminha@synopsys.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: CARLOS.PALMINHA@synopsys.com, airlied@linux.ie, jingoohan1@gmail.com, kgene@kernel.org, k.kozlowski@samsung.com, patrik.r.jakobsson@gmail.com, p.zabel@pengutronix.de, mark.yao@rock-chips.com, heiko@sntech.de, benjamin.gaignard@linaro.org, vincent.abriou@st.com, kraxel@redhat.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, virtualization@lists.linux-foundation.org

---
 drivers/gpu/drm/virtio/virtgpu_display.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index a165f03..429aa31 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -282,13 +282,6 @@ static const struct drm_crtc_helper_funcs virtio_gpu_crtc_helper_funcs = {
 	.atomic_check  = virtio_gpu_crtc_atomic_check,
 };
 
-static bool virtio_gpu_enc_mode_fixup(struct drm_encoder *encoder,
-				      const struct drm_display_mode *mode,
-				      struct drm_display_mode *adjusted_mode)
-{
-	return true;
-}
-
 static void virtio_gpu_enc_mode_set(struct drm_encoder *encoder,
 				    struct drm_display_mode *mode,
 				    struct drm_display_mode *adjusted_mode)
@@ -362,7 +355,6 @@ virtio_gpu_best_encoder(struct drm_connector *connector)
 }
 
 static const struct drm_encoder_helper_funcs virtio_gpu_enc_helper_funcs = {
-	.mode_fixup = virtio_gpu_enc_mode_fixup,
 	.mode_set   = virtio_gpu_enc_mode_set,
 	.enable     = virtio_gpu_enc_enable,
 	.disable    = virtio_gpu_enc_disable,
-- 
2.5.0
