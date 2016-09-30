From: zain wang <wzz@rock-chips.com>
Subject: [PATCH v2 4/4] drm: bridge/analogix: switch Main-link and eDP PHY when enable/disable psr
Date: Fri, 30 Sep 2016 20:54:24 +0800
Message-ID: <1475240064-20515-1-git-send-email-wzz@rock-chips.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.139]:56988 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932707AbcI3Myl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 30 Sep 2016 08:54:41 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, David Airlie <airlied@linux.ie>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Mika Kahola <mika.kahola@intel.com>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, Tomasz Figa <tfiga@chromium.org>, dianders@chromium.org, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, zain wang <wzz@rock-chips.com>

turn off Main-link and power down eDP PHY when enable psr,
turn on Main-link and power up eDP PHY when disable psr.

Signed-off-by: zain wang <wzz@rock-chips.com>

---

Changes in v2:
- misc changes

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 124 ++++++++++++---------
 1 file changed, 70 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index bf87891..58fa1c1 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -120,57 +120,6 @@ static int analogix_dp_get_dpms_mode(struct analogix_dp_device *dp)
 	return mode;
 }
 
-
-int analogix_dp_enable_psr(struct device *dev)
-{
-	struct analogix_dp_device *dp = dev_get_drvdata(dev);
-	struct edp_vsc_psr psr_vsc;
-
-	if (!dp->psr_support)
-		return -EINVAL;
-
-	if (analogix_dp_get_dpms_mode(dp) != DRM_MODE_DPMS_ON)
-		return -EBUSY;
-
-	/* Prepare VSC packet as per EDP 1.4 spec, Table 6.9 */
-	memset(&psr_vsc, 0, sizeof(psr_vsc));
-	psr_vsc.sdp_header.HB0 = 0;
-	psr_vsc.sdp_header.HB1 = 0x7;
-	psr_vsc.sdp_header.HB2 = 0x2;
-	psr_vsc.sdp_header.HB3 = 0x8;
-
-	psr_vsc.DB0 = 0;
-	psr_vsc.DB1 = EDP_VSC_PSR_STATE_ACTIVE | EDP_VSC_PSR_CRC_VALUES_VALID;
-
-	return analogix_dp_send_psr_spd(dp, &psr_vsc);
-}
-EXPORT_SYMBOL_GPL(analogix_dp_enable_psr);
-
-int analogix_dp_disable_psr(struct device *dev)
-{
-	struct analogix_dp_device *dp = dev_get_drvdata(dev);
-	struct edp_vsc_psr psr_vsc;
-
-	if (!dp->psr_support)
-		return -EINVAL;
-
-	if (analogix_dp_get_dpms_mode(dp) != DRM_MODE_DPMS_ON)
-		return -EBUSY;
-
-	/* Prepare VSC packet as per EDP 1.4 spec, Table 6.9 */
-	memset(&psr_vsc, 0, sizeof(psr_vsc));
-	psr_vsc.sdp_header.HB0 = 0;
-	psr_vsc.sdp_header.HB1 = 0x7;
-	psr_vsc.sdp_header.HB2 = 0x2;
-	psr_vsc.sdp_header.HB3 = 0x8;
-
-	psr_vsc.DB0 = 0;
-	psr_vsc.DB1 = 0;
-
-	return analogix_dp_send_psr_spd(dp, &psr_vsc);
-}
-EXPORT_SYMBOL_GPL(analogix_dp_disable_psr);
-
 static bool analogix_dp_detect_sink_psr(struct analogix_dp_device *dp)
 {
 	unsigned char psr_version;
@@ -191,12 +140,11 @@ static void analogix_dp_enable_sink_psr(struct analogix_dp_device *dp)
 	drm_dp_dpcd_writeb(&dp->aux, DP_PSR_EN_CFG, psr_en);
 
 	/* Main-Link transmitter remains active during PSR active states */
-	psr_en = DP_PSR_MAIN_LINK_ACTIVE | DP_PSR_CRC_VERIFICATION;
+	psr_en = DP_PSR_CRC_VERIFICATION;
 	drm_dp_dpcd_writeb(&dp->aux, DP_PSR_EN_CFG, psr_en);
 
 	/* Enable psr function */
-	psr_en = DP_PSR_ENABLE | DP_PSR_MAIN_LINK_ACTIVE |
-		 DP_PSR_CRC_VERIFICATION;
+	psr_en = DP_PSR_ENABLE | DP_PSR_CRC_VERIFICATION;
 	drm_dp_dpcd_writeb(&dp->aux, DP_PSR_EN_CFG, psr_en);
 
 	analogix_dp_enable_psr_crc(dp);
@@ -899,6 +847,74 @@ static void analogix_dp_commit(struct analogix_dp_device *dp)
 		analogix_dp_enable_sink_psr(dp);
 }
 
+int analogix_dp_enable_psr(struct device *dev)
+{
+	struct analogix_dp_device *dp = dev_get_drvdata(dev);
+	struct edp_vsc_psr psr_vsc;
+
+	if (!dp->psr_support)
+		return -EINVAL;
+
+	if (analogix_dp_get_dpms_mode(dp) != DRM_MODE_DPMS_ON)
+		return -EBUSY;
+
+	/* Prepare VSC packet as per EDP 1.4 spec, Table 6.9 */
+	memset(&psr_vsc, 0, sizeof(psr_vsc));
+	psr_vsc.sdp_header.HB0 = 0;
+	psr_vsc.sdp_header.HB1 = 0x7;
+	psr_vsc.sdp_header.HB2 = 0x2;
+	psr_vsc.sdp_header.HB3 = 0x8;
+
+	psr_vsc.DB0 = 0;
+	psr_vsc.DB1 = EDP_VSC_PSR_STATE_ACTIVE | EDP_VSC_PSR_CRC_VALUES_VALID;
+
+	analogix_dp_send_psr_spd(dp, &psr_vsc);
+
+	/* Power down the eDP PHY */
+	analogix_dp_set_analog_power_down(dp, POWER_ALL, true);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(analogix_dp_enable_psr);
+
+int analogix_dp_disable_psr(struct device *dev)
+{
+	struct analogix_dp_device *dp = dev_get_drvdata(dev);
+	struct edp_vsc_psr psr_vsc;
+	int ret;
+
+	if (!dp->psr_support)
+		return -EINVAL;
+
+	if (analogix_dp_get_dpms_mode(dp) != DRM_MODE_DPMS_ON)
+		return -EBUSY;
+
+	/* Power up the eDP PHY */
+	analogix_dp_set_analog_power_down(dp, POWER_ALL, false);
+
+	ret = drm_dp_dpcd_writeb(&dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
+	if (ret < 0) {
+		dev_err(dp->dev, "Failed to set DP Power0\n");
+	}
+
+	analogix_dp_set_link_train(dp, dp->video_info.max_lane_count,
+				   dp->video_info.max_link_rate);
+
+	/* Prepare VSC packet as per EDP 1.4 spec, Table 6.9 */
+	memset(&psr_vsc, 0, sizeof(psr_vsc));
+	psr_vsc.sdp_header.HB0 = 0;
+	psr_vsc.sdp_header.HB1 = 0x7;
+	psr_vsc.sdp_header.HB2 = 0x2;
+	psr_vsc.sdp_header.HB3 = 0x8;
+
+	psr_vsc.DB0 = 0;
+	psr_vsc.DB1 = 0;
+
+	analogix_dp_send_psr_spd(dp, &psr_vsc);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(analogix_dp_disable_psr);
+
 /*
  * This function is a bit of a catch-all for panel preparation, hopefully
  * simplifying the logic of functions that need to prepare/unprepare the panel
-- 
1.9.1
