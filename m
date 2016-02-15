From: Carlos Palminha <CARLOS.PALMINHA@synopsys.com>
Subject: [PATCH v2 01/17] drm/virtio: removed optional dummy encoder mode_fixup function.
Date: Mon, 15 Feb 2016 12:57:38 +0000
Message-ID: <85230bc1356eb52257aaa1e1965adae2f00db5cd.1455540137.git.palminha@synopsys.com>
References: <cover.1455540137.git.palminha@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtprelay.synopsys.com ([198.182.60.111]:35606 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753212AbcBOM5u (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Feb 2016 07:57:50 -0500
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
