From: Zain Wang <wzz@rock-chips.com>
Subject: [PATCH v3 4/6] drm: bridge/analogix: switch Main-link and eDP PHY when enable/disable psr
Date: Tue, 18 Oct 2016 14:21:59 +0800
Message-ID: <1476771719-11941-1-git-send-email-wzz@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, David Airlie <airlied@linux.ie>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Mika Kahola <mika.kahola@intel.com>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, Tomasz Figa <tfiga@chromium.org>, dianders@chromium.org, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, zain wang <wzz@rock-chips.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: zain wang <wzz@rock-chips.com>

turn off Main-link and power down eDP PHY when enable psr,
turn on Main-link and power up eDP PHY when disable psr.

Signed-off-by: zain wang <wzz@rock-chips.com>
---

Changes in v3:
- detecting PSR state at enable/disable_psr() avoid to make link training
  when sink in not PSR State.

Changes in v2:
- misc changes

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 123 +++++++++++++--------
 1 file changed, 76 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index c4f139a..c662e5d 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -98,50 +98,6 @@ static int analogix_dp_detect_hpd(struct analogix_dp_device *dp)
 	return 0;
 }
 
-int analogix_dp_enable_psr(struct device *dev)
-{
-	struct analogix_dp_device *dp = dev_get_drvdata(dev);
-	struct edp_vsc_psr psr_vsc;
-
-	if (!dp->psr_support)
-		return -EINVAL;
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
@@ -162,12 +118,11 @@ static void analogix_dp_enable_sink_psr(struct analogix_dp_device *dp)
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
@@ -870,6 +825,80 @@ static void analogix_dp_commit(struct analogix_dp_device *dp)
 		analogix_dp_enable_sink_psr(dp);
 }
 
+int analogix_dp_enable_psr(struct device *dev)
+{
+	struct analogix_dp_device *dp = dev_get_drvdata(dev);
+	struct edp_vsc_psr psr_vsc;
+	int retval;
+	u8 sink;
+
+	if (!dp->psr_support)
+		return -EINVAL;
+
+	drm_dp_dpcd_readb(&dp->aux, DP_PSR_STATUS, &sink);
+	if (sink == DP_PSR_SINK_ACTIVE_RFB)
+		return 0;
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
+	retval = analogix_dp_send_psr_spd(dp, &psr_vsc);
+
+	if (!retval) {
+		/* Power down the eDP PHY */
+		analogix_dp_set_analog_power_down(dp, POWER_ALL, true);
+	}
+
+	return retval;
+}
+EXPORT_SYMBOL_GPL(analogix_dp_enable_psr);
+
+int analogix_dp_disable_psr(struct device *dev)
+{
+	struct analogix_dp_device *dp = dev_get_drvdata(dev);
+	struct edp_vsc_psr psr_vsc;
+	int ret;
+	u8 sink;
+
+	if (!dp->psr_support)
+		return -EINVAL;
+
+	/* Power up the eDP PHY */
+	analogix_dp_set_analog_power_down(dp, POWER_ALL, false);
+
+	drm_dp_dpcd_readb(&dp->aux, DP_PSR_STATUS, &sink);
+	if (sink == DP_PSR_SINK_INACTIVE)
+		return 0;
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
+	return analogix_dp_send_psr_spd(dp, &psr_vsc);
+}
+EXPORT_SYMBOL_GPL(analogix_dp_disable_psr);
+
 /*
  * This function is a bit of a catch-all for panel preparation, hopefully
  * simplifying the logic of functions that need to prepare/unprepare the panel
-- 
1.9.1
