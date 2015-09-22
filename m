From: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v5 17/17] drm: bridge: analogix/dp: add edid modes parse in
 get_modes method
Date: Tue, 22 Sep 2015 16:07:40 +0800
Message-ID: <1442909260-7521-1-git-send-email-ykk@rock-chips.com>
References: <1442906428-2609-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1442906428-2609-1-git-send-email-ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Display Port monitor could support kinds of mode which indicate
in monitor edid, not just one single display resolution which
defined in panel or devivetree property display timing.

Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
Changes in v5: None
Changes in v4:
- Call drm_panel_prepare() in .get_modes function, ensure panel should
  power on before driver try to read edid message.

Changes in v3:
- Add edid modes parse support

Changes in v2: None

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 24 +++++++----
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h | 46 +++++++++++-----------
 2 files changed, 40 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 90c4fda..5f8fc11 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -107,7 +107,7 @@ static unsigned char analogix_dp_calc_edid_check_sum(unsigned char *edid_data)
 
 static int analogix_dp_read_edid(struct analogix_dp_device *dp)
 {
-	unsigned char edid[EDID_BLOCK_LENGTH * 2];
+	unsigned char *edid = dp->edid;
 	unsigned int extend_block = 0;
 	unsigned char sum;
 	unsigned char test_vector;
@@ -901,12 +901,6 @@ static void analogix_dp_commit(struct analogix_dp_device *dp)
 			DRM_ERROR("failed to disable the panel\n");
 	}
 
-	ret = analogix_dp_handle_edid(dp);
-	if (ret) {
-		dev_err(dp->dev, "unable to handle edid\n");
-		return;
-	}
-
 	ret = analogix_dp_set_link_train(dp, dp->video_info.max_lane_count,
 					 dp->video_info.max_link_rate);
 	if (ret) {
@@ -947,8 +941,24 @@ EXPORT_SYMBOL_GPL(analogix_dp_detect);
 int analogix_dp_get_modes(struct device *dev)
 {
 	struct analogix_dp_device *dp = dev_get_drvdata(dev);
+	struct edid *edid = (struct edid *)dp->edid;
 	int num_modes = 0;
 
+	if (dp->plat_data && dp->plat_data->panel) {
+		if (drm_panel_prepare(dp->plat_data->panel)) {
+			DRM_ERROR("failed to setup the panel\n");
+			return -EINVAL;
+		}
+	}
+
+	if (analogix_dp_handle_edid(dp)) {
+		dev_err(dp->dev, "unable to handle edid\n");
+		return -EINVAL;
+	}
+
+	drm_mode_connector_update_edid_property(dp->connector, edid);
+	num_modes += drm_add_edid_modes(dp->connector, edid);
+
 	if (dp->plat_data->panel)
 		num_modes += drm_panel_get_modes(dp->plat_data->panel);
 
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index 3a136b8..089489d 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -20,6 +20,28 @@
 #define MAX_CR_LOOP 5
 #define MAX_EQ_LOOP 5
 
+/* I2C EDID Chip ID, Slave Address */
+#define I2C_EDID_DEVICE_ADDR			0x50
+#define I2C_E_EDID_DEVICE_ADDR			0x30
+
+#define EDID_BLOCK_LENGTH			0x80
+#define EDID_HEADER_PATTERN			0x00
+#define EDID_EXTENSION_FLAG			0x7e
+#define EDID_CHECKSUM				0x7f
+
+/* DP_MAX_LANE_COUNT */
+#define DPCD_ENHANCED_FRAME_CAP(x)		(((x) >> 7) & 0x1)
+#define DPCD_MAX_LANE_COUNT(x)			((x) & 0x1f)
+
+/* DP_LANE_COUNT_SET */
+#define DPCD_LANE_COUNT_SET(x)			((x) & 0x1f)
+
+/* DP_TRAINING_LANE0_SET */
+#define DPCD_PRE_EMPHASIS_SET(x)		(((x) & 0x3) << 3)
+#define DPCD_PRE_EMPHASIS_GET(x)		(((x) >> 3) & 0x3)
+#define DPCD_VOLTAGE_SWING_SET(x)		(((x) & 0x3) << 0)
+#define DPCD_VOLTAGE_SWING_GET(x)		(((x) >> 0) & 0x3)
+
 enum link_rate_type {
 	LINK_RATE_1_62GBPS = DP_LINK_BW_1_62,
 	LINK_RATE_2_70GBPS = DP_LINK_BW_2_7,
@@ -161,6 +183,7 @@ struct analogix_dp_device {
 	int			dpms_mode;
 	int			hpd_gpio;
 	bool                    need_force_hpd;
+	unsigned char           edid[EDID_BLOCK_LENGTH * 2];
 
 	struct analogix_dp_plat_data *plat_data;
 };
@@ -260,27 +283,4 @@ int analogix_dp_is_video_stream_on(struct analogix_dp_device *dp);
 void analogix_dp_config_video_slave_mode(struct analogix_dp_device *dp);
 void analogix_dp_enable_scrambling(struct analogix_dp_device *dp);
 void analogix_dp_disable_scrambling(struct analogix_dp_device *dp);
-
-/* I2C EDID Chip ID, Slave Address */
-#define I2C_EDID_DEVICE_ADDR			0x50
-#define I2C_E_EDID_DEVICE_ADDR			0x30
-
-#define EDID_BLOCK_LENGTH			0x80
-#define EDID_HEADER_PATTERN			0x00
-#define EDID_EXTENSION_FLAG			0x7e
-#define EDID_CHECKSUM				0x7f
-
-/* DP_MAX_LANE_COUNT */
-#define DPCD_ENHANCED_FRAME_CAP(x)		(((x) >> 7) & 0x1)
-#define DPCD_MAX_LANE_COUNT(x)			((x) & 0x1f)
-
-/* DP_LANE_COUNT_SET */
-#define DPCD_LANE_COUNT_SET(x)			((x) & 0x1f)
-
-/* DP_TRAINING_LANE0_SET */
-#define DPCD_PRE_EMPHASIS_SET(x)		(((x) & 0x3) << 3)
-#define DPCD_PRE_EMPHASIS_GET(x)		(((x) >> 3) & 0x3)
-#define DPCD_VOLTAGE_SWING_SET(x)		(((x) & 0x3) << 0)
-#define DPCD_VOLTAGE_SWING_GET(x)		(((x) >> 0) & 0x3)
-
 #endif /* _ANALOGIX_DP_CORE_H */
-- 
1.9.1
