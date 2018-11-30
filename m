From: Christoph Manszewski <c.manszewski@samsung.com>
Subject: [PATCH 1/2] drm/edid: Add colorimetry helper function
Date: Fri, 30 Nov 2018 13:02:11 +0100
Message-ID: <1543579332-16609-2-git-send-email-c.manszewski@samsung.com>
References: <1543579332-16609-1-git-send-email-c.manszewski@samsung.com>
        <CGME20181130120228eucas1p17dd7e4da8adb8bb8c88f1e372fb0ebd9@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543579332-16609-1-git-send-email-c.manszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Christoph Manszewski <c.manszewski@samsung.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

In analogy to drm_default_rgb_quant_range, create
drm_default_colorimetry helper function to determine the default
colorimetry value based on drm_display_mode. Currently there isn't any
standarized way to determine the default color space format.

Signed-off-by: Christoph Manszewski <c.manszewski@samsung.com>
---
 drivers/gpu/drm/drm_edid.c | 12 ++++++++++++
 include/drm/drm_edid.h     |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index b506e3622b08..03ac833dcc3c 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4278,6 +4278,18 @@ drm_default_rgb_quant_range(const struct drm_display_mode *mode)
 }
 EXPORT_SYMBOL(drm_default_rgb_quant_range);
 
+enum hdmi_colorimetry
+drm_default_colorimetry(const struct drm_display_mode *mode)
+{
+	if (mode->vdisplay < 720)
+		return HDMI_COLORIMETRY_ITU_601;
+	else if (mode->vdisplay <= 1080)
+		return HDMI_COLORIMETRY_ITU_709;
+	else
+		return HDMI_COLORIMETRY_EXTENDED;
+}
+EXPORT_SYMBOL(drm_default_colorimetry);
+
 static void drm_parse_ycbcr420_deep_color_info(struct drm_connector *connector,
 					       const u8 *db)
 {
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index e3c404833115..da43a5d02f7f 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -474,6 +474,8 @@ bool drm_detect_monitor_audio(struct edid *edid);
 bool drm_rgb_quant_range_selectable(struct edid *edid);
 enum hdmi_quantization_range
 drm_default_rgb_quant_range(const struct drm_display_mode *mode);
+enum hdmi_colorimetry
+drm_default_colorimetry(const struct drm_display_mode *mode);
 int drm_add_modes_noedid(struct drm_connector *connector,
 			 int hdisplay, int vdisplay);
 void drm_set_preferred_mode(struct drm_connector *connector,
-- 
2.7.4
