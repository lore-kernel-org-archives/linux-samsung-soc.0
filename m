From: Christoph Manszewski <c.manszewski@samsung.com>
Subject: [PATCH 2/2] drm/exynos: mixer: Use colorimetry helper function
Date: Fri, 30 Nov 2018 13:02:12 +0100
Message-ID: <1543579332-16609-3-git-send-email-c.manszewski@samsung.com>
References: <1543579332-16609-1-git-send-email-c.manszewski@samsung.com>
        <CGME20181130120230eucas1p28cfa1960874470828230d288830f6974@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543579332-16609-1-git-send-email-c.manszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Christoph Manszewski <c.manszewski@samsung.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Use drm_default_colorimetry helper function to determine the default
colorspace type (ITU-R BT.601 or ITU-R BT.709).

Signed-off-by: Christoph Manszewski <c.manszewski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 2a25822bd6a1..895c6268025d 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -384,9 +384,10 @@ static void mixer_cfg_scan(struct mixer_context *ctx, int width, int height)
 static void mixer_cfg_rgb_fmt(struct mixer_context *ctx, struct drm_display_mode *mode)
 {
 	enum hdmi_quantization_range range = drm_default_rgb_quant_range(mode);
+	enum hdmi_colorimetry format = drm_default_colorimetry(mode);
 	u32 val;
 
-	if (mode->vdisplay < 720) {
+	if (format == HDMI_COLORIMETRY_ITU_601) {
 		val = MXR_CFG_RGB601;
 	} else {
 		val = MXR_CFG_RGB709;
-- 
2.7.4
