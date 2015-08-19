From: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v3 03/14] drm: bridge: analogix_dp: split exynos dp driver to bridge dir
Date: Wed, 19 Aug 2015 09:50:02 -0500
Message-ID: <1439995802-18210-1-git-send-email-ykk@rock-chips.com>
References: <1439995728-18046-1-git-send-email-ykk@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439995728-18046-1-git-send-email-ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: djkurtz-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, seanpaul-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>, ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Split the dp core driver from exynos directory to bridge
directory, and rename the core driver to analogix_dp_*,
leave the platform code to analogix_dp-exynos.

Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
Changes in v3:
- Take Thierry Reding suggest, move exynos's video_timing code
  to analogix_dp-exynos platform driver, add get_modes method
  to struct analogix_dp_plat_data.
- Take Heiko suggest, rename some "samsung*" dts propery to "analogix*".

Changes in v2:
- Take Jingoo Han suggest, remove new copyright
- Fix compiled failed dut to analogix_dp_device misspell

 drivers/gpu/drm/bridge/Kconfig                     |    5 +
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 .../exynos_dp_core.c => bridge/analogix_dp_core.c} |  816 ++++++-------
 drivers/gpu/drm/bridge/analogix_dp_core.h          |  282 +++++
 drivers/gpu/drm/bridge/analogix_dp_reg.c           | 1265 ++++++++++++++++++++
 .../exynos_dp_reg.h => bridge/analogix_dp_reg.h}   |  258 ++--
 drivers/gpu/drm/exynos/Kconfig                     |    5 +-
 drivers/gpu/drm/exynos/Makefile                    |    2 +-
 drivers/gpu/drm/exynos/analogix_dp-exynos.c        |  291 +++++
 drivers/gpu/drm/exynos/exynos_dp_core.h            |  282 -----
 drivers/gpu/drm/exynos/exynos_dp_reg.c             | 1259 -------------------
 include/drm/bridge/analogix_dp.h                   |   24 +
 12 files changed, 2350 insertions(+), 2140 deletions(-)
 rename drivers/gpu/drm/{exynos/exynos_dp_core.c => bridge/analogix_dp_core.c} (50%)
 create mode 100644 drivers/gpu/drm/bridge/analogix_dp_core.h
 create mode 100644 drivers/gpu/drm/bridge/analogix_dp_reg.c
 rename drivers/gpu/drm/{exynos/exynos_dp_reg.h => bridge/analogix_dp_reg.h} (64%)
 create mode 100644 drivers/gpu/drm/exynos/analogix_dp-exynos.c
 delete mode 100644 drivers/gpu/drm/exynos/exynos_dp_core.h
 delete mode 100644 drivers/gpu/drm/exynos/exynos_dp_reg.c
 create mode 100644 include/drm/bridge/analogix_dp.h

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index acef322..c7638b5 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -3,6 +3,11 @@ config DRM_DW_HDMI
 	depends on DRM
 	select DRM_KMS_HELPER
 
+config DRM_ANALOGIX_DP
+	tristate
+	depends on DRM
+	select DRM_KMS_HELPER
+
 config DRM_PTN3460
 	tristate "PTN3460 DP/LVDS bridge"
 	depends on DRM
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 8dfebd9..a7ee559 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -3,3 +3,4 @@ ccflags-y := -Iinclude/drm
 obj-$(CONFIG_DRM_PS8622) += ps8622.o
 obj-$(CONFIG_DRM_PTN3460) += ptn3460.o
 obj-$(CONFIG_DRM_DW_HDMI) += dw_hdmi.o
+obj-$(CONFIG_DRM_ANALOGIX_DP) += analogix_dp_core.o analogix_dp_reg.o
diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/bridge/analogix_dp_core.c
similarity index 50%
rename from drivers/gpu/drm/exynos/exynos_dp_core.c
rename to drivers/gpu/drm/bridge/analogix_dp_core.c
index 2b87406..6c15e20 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix_dp_core.c
@@ -1,5 +1,5 @@
 /*
- * Samsung SoC DP (Display Port) interface driver.
+ * Analogix Core DP (Display Port) interface driver.
  *
  * Copyright (C) 2012 Samsung Electronics Co., Ltd.
  * Author: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
@@ -18,12 +18,9 @@
 #include <linux/interrupt.h>
 #include <linux/of.h>
 #include <linux/of_gpio.h>
-#include <linux/of_graph.h>
 #include <linux/gpio.h>
 #include <linux/component.h>
 #include <linux/phy/phy.h>
-#include <video/of_display_timing.h>
-#include <video/of_videomode.h>
 
 #include <drm/drmP.h>
 #include <drm/drm_crtc.h>
@@ -31,51 +28,42 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_panel.h>
 
-#include "exynos_dp_core.h"
+#include <drm/bridge/analogix_dp.h>
 
-#define ctx_from_connector(c)	container_of(c, struct exynos_dp_device, \
-					connector)
+#include "analogix_dp_core.h"
 
-static inline struct exynos_drm_crtc *dp_to_crtc(struct exynos_dp_device *dp)
-{
-	return to_exynos_crtc(dp->encoder->crtc);
-}
-
-static inline struct exynos_dp_device *
-display_to_dp(struct exynos_drm_display *d)
-{
-	return container_of(d, struct exynos_dp_device, display);
-}
+#define connector_to_dp(c) \
+	container_of(c, struct analogix_dp_device, connector)
 
 struct bridge_init {
 	struct i2c_client *client;
 	struct device_node *node;
 };
 
-static void exynos_dp_init_dp(struct exynos_dp_device *dp)
+static void analogix_dp_init_dp(struct analogix_dp_device *dp)
 {
-	exynos_dp_reset(dp);
+	analogix_dp_reset(dp);
 
-	exynos_dp_swreset(dp);
+	analogix_dp_swreset(dp);
 
-	exynos_dp_init_analog_param(dp);
-	exynos_dp_init_interrupt(dp);
+	analogix_dp_init_analog_param(dp);
+	analogix_dp_init_interrupt(dp);
 
 	/* SW defined function Normal operation */
-	exynos_dp_enable_sw_function(dp);
+	analogix_dp_enable_sw_function(dp);
 
-	exynos_dp_config_interrupt(dp);
-	exynos_dp_init_analog_func(dp);
+	analogix_dp_config_interrupt(dp);
+	analogix_dp_init_analog_func(dp);
 
-	exynos_dp_init_hpd(dp);
-	exynos_dp_init_aux(dp);
+	analogix_dp_init_hpd(dp);
+	analogix_dp_init_aux(dp);
 }
 
-static int exynos_dp_detect_hpd(struct exynos_dp_device *dp)
+static int analogix_dp_detect_hpd(struct analogix_dp_device *dp)
 {
 	int timeout_loop = 0;
 
-	while (exynos_dp_get_plug_in_status(dp) != 0) {
+	while (analogix_dp_get_plug_in_status(dp) != 0) {
 		timeout_loop++;
 		if (DP_TIMEOUT_LOOP_COUNT < timeout_loop) {
 			dev_err(dp->dev, "failed to get hpd plug status\n");
@@ -87,7 +75,7 @@ static int exynos_dp_detect_hpd(struct exynos_dp_device *dp)
 	return 0;
 }
 
-static unsigned char exynos_dp_calc_edid_check_sum(unsigned char *edid_data)
+static unsigned char analogix_dp_calc_edid_check_sum(unsigned char *edid_data)
 {
 	int i;
 	unsigned char sum = 0;
@@ -98,7 +86,7 @@ static unsigned char exynos_dp_calc_edid_check_sum(unsigned char *edid_data)
 	return sum;
 }
 
-static int exynos_dp_read_edid(struct exynos_dp_device *dp)
+static int analogix_dp_read_edid(struct analogix_dp_device *dp)
 {
 	unsigned char edid[EDID_BLOCK_LENGTH * 2];
 	unsigned int extend_block = 0;
@@ -113,9 +101,9 @@ static int exynos_dp_read_edid(struct exynos_dp_device *dp)
 	 */
 
 	/* Read Extension Flag, Number of 128-byte EDID extension blocks */
-	retval = exynos_dp_read_byte_from_i2c(dp, I2C_EDID_DEVICE_ADDR,
-					      EDID_EXTENSION_FLAG,
-					      &extend_block);
+	retval = analogix_dp_read_byte_from_i2c(dp, I2C_EDID_DEVICE_ADDR,
+						EDID_EXTENSION_FLAG,
+						&extend_block);
 	if (retval)
 		return retval;
 
@@ -123,44 +111,44 @@ static int exynos_dp_read_edid(struct exynos_dp_device *dp)
 		dev_dbg(dp->dev, "EDID data includes a single extension!\n");
 
 		/* Read EDID data */
-		retval = exynos_dp_read_bytes_from_i2c(
-					dp, I2C_EDID_DEVICE_ADDR,
-					EDID_HEADER_PATTERN,
-					EDID_BLOCK_LENGTH,
-					&edid[EDID_HEADER_PATTERN]);
+		retval = analogix_dp_read_bytes_from_i2c(
+						dp, I2C_EDID_DEVICE_ADDR,
+						EDID_HEADER_PATTERN,
+						EDID_BLOCK_LENGTH,
+						&edid[EDID_HEADER_PATTERN]);
 		if (retval != 0) {
 			dev_err(dp->dev, "EDID Read failed!\n");
 			return -EIO;
 		}
-		sum = exynos_dp_calc_edid_check_sum(edid);
+		sum = analogix_dp_calc_edid_check_sum(edid);
 		if (sum != 0) {
 			dev_err(dp->dev, "EDID bad checksum!\n");
 			return -EIO;
 		}
 
 		/* Read additional EDID data */
-		retval = exynos_dp_read_bytes_from_i2c(
-					dp, I2C_EDID_DEVICE_ADDR,
-					EDID_BLOCK_LENGTH,
-					EDID_BLOCK_LENGTH,
-					&edid[EDID_BLOCK_LENGTH]);
+		retval = analogix_dp_read_bytes_from_i2c(
+						dp, I2C_EDID_DEVICE_ADDR,
+						EDID_BLOCK_LENGTH,
+						EDID_BLOCK_LENGTH,
+						&edid[EDID_BLOCK_LENGTH]);
 		if (retval != 0) {
 			dev_err(dp->dev, "EDID Read failed!\n");
 			return -EIO;
 		}
-		sum = exynos_dp_calc_edid_check_sum(&edid[EDID_BLOCK_LENGTH]);
+		sum = analogix_dp_calc_edid_check_sum(&edid[EDID_BLOCK_LENGTH]);
 		if (sum != 0) {
 			dev_err(dp->dev, "EDID bad checksum!\n");
 			return -EIO;
 		}
 
-		exynos_dp_read_byte_from_dpcd(dp, DP_TEST_REQUEST,
-					      &test_vector);
+		analogix_dp_read_byte_from_dpcd(dp, DP_TEST_REQUEST,
+						&test_vector);
 		if (test_vector & DP_TEST_LINK_EDID_READ) {
-			exynos_dp_write_byte_to_dpcd(
+			analogix_dp_write_byte_to_dpcd(
 				dp, DP_TEST_EDID_CHECKSUM,
 				edid[EDID_BLOCK_LENGTH + EDID_CHECKSUM]);
-			exynos_dp_write_byte_to_dpcd(
+			analogix_dp_write_byte_to_dpcd(
 				dp, DP_TEST_RESPONSE,
 				DP_TEST_EDID_CHECKSUM_WRITE);
 		}
@@ -168,26 +156,28 @@ static int exynos_dp_read_edid(struct exynos_dp_device *dp)
 		dev_info(dp->dev, "EDID data does not include any extensions.\n");
 
 		/* Read EDID data */
-		retval = exynos_dp_read_bytes_from_i2c(
-				dp, I2C_EDID_DEVICE_ADDR, EDID_HEADER_PATTERN,
-				EDID_BLOCK_LENGTH, &edid[EDID_HEADER_PATTERN]);
+		retval = analogix_dp_read_bytes_from_i2c(
+						dp, I2C_EDID_DEVICE_ADDR,
+						EDID_HEADER_PATTERN,
+						EDID_BLOCK_LENGTH,
+						&edid[EDID_HEADER_PATTERN]);
 		if (retval != 0) {
 			dev_err(dp->dev, "EDID Read failed!\n");
 			return -EIO;
 		}
-		sum = exynos_dp_calc_edid_check_sum(edid);
+		sum = analogix_dp_calc_edid_check_sum(edid);
 		if (sum != 0) {
 			dev_err(dp->dev, "EDID bad checksum!\n");
 			return -EIO;
 		}
 
-		exynos_dp_read_byte_from_dpcd(dp, DP_TEST_REQUEST,
-					      &test_vector);
+		analogix_dp_read_byte_from_dpcd(dp, DP_TEST_REQUEST,
+						&test_vector);
 		if (test_vector & DP_TEST_LINK_EDID_READ) {
-			exynos_dp_write_byte_to_dpcd(
+			analogix_dp_write_byte_to_dpcd(
 					dp, DP_TEST_EDID_CHECKSUM,
 					edid[EDID_CHECKSUM]);
-			exynos_dp_write_byte_to_dpcd(
+			analogix_dp_write_byte_to_dpcd(
 					dp, DP_TEST_RESPONSE,
 					DP_TEST_EDID_CHECKSUM_WRITE);
 		}
@@ -197,20 +187,20 @@ static int exynos_dp_read_edid(struct exynos_dp_device *dp)
 	return 0;
 }
 
-static int exynos_dp_handle_edid(struct exynos_dp_device *dp)
+static int analogix_dp_handle_edid(struct analogix_dp_device *dp)
 {
 	u8 buf[12];
 	int i;
 	int retval;
 
 	/* Read DPCD DP_DPCD_REV~RECEIVE_PORT1_CAP_1 */
-	retval = exynos_dp_read_bytes_from_dpcd(dp, DP_DPCD_REV, 12, buf);
+	retval = analogix_dp_read_bytes_from_dpcd(dp, DP_DPCD_REV, 12, buf);
 	if (retval)
 		return retval;
 
 	/* Read EDID */
 	for (i = 0; i < 3; i++) {
-		retval = exynos_dp_read_edid(dp);
+		retval = analogix_dp_read_edid(dp);
 		if (!retval)
 			break;
 	}
@@ -218,74 +208,76 @@ static int exynos_dp_handle_edid(struct exynos_dp_device *dp)
 	return retval;
 }
 
-static void exynos_dp_enable_rx_to_enhanced_mode(struct exynos_dp_device *dp,
-						 bool enable)
+static void
+analogix_dp_enable_rx_to_enhanced_mode(struct analogix_dp_device *dp,
+				       bool enable)
 {
 	u8 data;
 
-	exynos_dp_read_byte_from_dpcd(dp, DP_LANE_COUNT_SET, &data);
+	analogix_dp_read_byte_from_dpcd(dp, DP_LANE_COUNT_SET, &data);
 
 	if (enable)
-		exynos_dp_write_byte_to_dpcd(
+		analogix_dp_write_byte_to_dpcd(
 					dp, DP_LANE_COUNT_SET,
 					DP_LANE_COUNT_ENHANCED_FRAME_EN |
 					DPCD_LANE_COUNT_SET(data));
 	else
-		exynos_dp_write_byte_to_dpcd(
+		analogix_dp_write_byte_to_dpcd(
 					dp, DP_LANE_COUNT_SET,
 					DPCD_LANE_COUNT_SET(data));
 }
 
-static int exynos_dp_is_enhanced_mode_available(struct exynos_dp_device *dp)
+static int analogix_dp_is_enhanced_mode_available(struct analogix_dp_device *dp)
 {
 	u8 data;
 	int retval;
 
-	exynos_dp_read_byte_from_dpcd(dp, DP_MAX_LANE_COUNT, &data);
+	analogix_dp_read_byte_from_dpcd(dp, DP_MAX_LANE_COUNT, &data);
 	retval = DPCD_ENHANCED_FRAME_CAP(data);
 
 	return retval;
 }
 
-static void exynos_dp_set_enhanced_mode(struct exynos_dp_device *dp)
+static void analogix_dp_set_enhanced_mode(struct analogix_dp_device *dp)
 {
 	u8 data;
 
-	data = exynos_dp_is_enhanced_mode_available(dp);
-	exynos_dp_enable_rx_to_enhanced_mode(dp, data);
-	exynos_dp_enable_enhanced_mode(dp, data);
+	data = analogix_dp_is_enhanced_mode_available(dp);
+	analogix_dp_enable_rx_to_enhanced_mode(dp, data);
+	analogix_dp_enable_enhanced_mode(dp, data);
 }
 
-static void exynos_dp_training_pattern_dis(struct exynos_dp_device *dp)
+static void analogix_dp_training_pattern_dis(struct analogix_dp_device *dp)
 {
-	exynos_dp_set_training_pattern(dp, DP_NONE);
+	analogix_dp_set_training_pattern(dp, DP_NONE);
 
-	exynos_dp_write_byte_to_dpcd(dp, DP_TRAINING_PATTERN_SET,
-				     DP_TRAINING_PATTERN_DISABLE);
+	analogix_dp_write_byte_to_dpcd(dp, DP_TRAINING_PATTERN_SET,
+				       DP_TRAINING_PATTERN_DISABLE);
 }
 
-static void exynos_dp_set_lane_lane_pre_emphasis(struct exynos_dp_device *dp,
-						 int pre_emphasis, int lane)
+static void
+analogix_dp_set_lane_lane_pre_emphasis(struct analogix_dp_device *dp,
+				       int pre_emphasis, int lane)
 {
 	switch (lane) {
 	case 0:
-		exynos_dp_set_lane0_pre_emphasis(dp, pre_emphasis);
+		analogix_dp_set_lane0_pre_emphasis(dp, pre_emphasis);
 		break;
 	case 1:
-		exynos_dp_set_lane1_pre_emphasis(dp, pre_emphasis);
+		analogix_dp_set_lane1_pre_emphasis(dp, pre_emphasis);
 		break;
 
 	case 2:
-		exynos_dp_set_lane2_pre_emphasis(dp, pre_emphasis);
+		analogix_dp_set_lane2_pre_emphasis(dp, pre_emphasis);
 		break;
 
 	case 3:
-		exynos_dp_set_lane3_pre_emphasis(dp, pre_emphasis);
+		analogix_dp_set_lane3_pre_emphasis(dp, pre_emphasis);
 		break;
 	}
 }
 
-static int exynos_dp_link_start(struct exynos_dp_device *dp)
+static int analogix_dp_link_start(struct analogix_dp_device *dp)
 {
 	u8 buf[4];
 	int lane, lane_count, pll_tries, retval;
@@ -299,24 +291,24 @@ static int exynos_dp_link_start(struct exynos_dp_device *dp)
 		dp->link_train.cr_loop[lane] = 0;
 
 	/* Set link rate and count as you want to establish*/
-	exynos_dp_set_link_bandwidth(dp, dp->link_train.link_rate);
-	exynos_dp_set_lane_count(dp, dp->link_train.lane_count);
+	analogix_dp_set_link_bandwidth(dp, dp->link_train.link_rate);
+	analogix_dp_set_lane_count(dp, dp->link_train.lane_count);
 
 	/* Setup RX configuration */
 	buf[0] = dp->link_train.link_rate;
 	buf[1] = dp->link_train.lane_count;
-	retval = exynos_dp_write_bytes_to_dpcd(dp, DP_LINK_BW_SET, 2, buf);
+	retval = analogix_dp_write_bytes_to_dpcd(dp, DP_LINK_BW_SET, 2, buf);
 	if (retval)
 		return retval;
 
 	/* Set TX pre-emphasis to minimum */
 	for (lane = 0; lane < lane_count; lane++)
-		exynos_dp_set_lane_lane_pre_emphasis(dp, PRE_EMPHASIS_LEVEL_0,
-						     lane);
+		analogix_dp_set_lane_lane_pre_emphasis(
+					dp, PRE_EMPHASIS_LEVEL_0, lane);
 
 	/* Wait for PLL lock */
 	pll_tries = 0;
-	while (exynos_dp_get_pll_lock_status(dp) == PLL_UNLOCKED) {
+	while (analogix_dp_get_pll_lock_status(dp) == PLL_UNLOCKED) {
 		if (pll_tries == DP_TIMEOUT_LOOP_COUNT) {
 			dev_err(dp->dev, "Wait for PLL lock timed out\n");
 			return -ETIMEDOUT;
@@ -327,12 +319,12 @@ static int exynos_dp_link_start(struct exynos_dp_device *dp)
 	}
 
 	/* Set training pattern 1 */
-	exynos_dp_set_training_pattern(dp, TRAINING_PTN1);
+	analogix_dp_set_training_pattern(dp, TRAINING_PTN1);
 
 	/* Set RX training pattern */
-	retval = exynos_dp_write_byte_to_dpcd(dp, DP_TRAINING_PATTERN_SET,
-					      DP_LINK_SCRAMBLING_DISABLE |
-					      DP_TRAINING_PATTERN_1);
+	retval = analogix_dp_write_byte_to_dpcd(dp, DP_TRAINING_PATTERN_SET,
+						DP_LINK_SCRAMBLING_DISABLE |
+						DP_TRAINING_PATTERN_1);
 	if (retval)
 		return retval;
 
@@ -340,13 +332,13 @@ static int exynos_dp_link_start(struct exynos_dp_device *dp)
 		buf[lane] = DP_TRAIN_PRE_EMPH_LEVEL_0 |
 			    DP_TRAIN_VOLTAGE_SWING_LEVEL_0;
 
-	retval = exynos_dp_write_bytes_to_dpcd(dp, DP_TRAINING_LANE0_SET,
-					       lane_count, buf);
+	retval = analogix_dp_write_bytes_to_dpcd(dp, DP_TRAINING_LANE0_SET,
+						 lane_count, buf);
 
 	return retval;
 }
 
-static unsigned char exynos_dp_get_lane_status(u8 link_status[2], int lane)
+static unsigned char analogix_dp_get_lane_status(u8 link_status[2], int lane)
 {
 	int shift = (lane & 1) * 4;
 	u8 link_value = link_status[lane >> 1];
@@ -354,21 +346,21 @@ static unsigned char exynos_dp_get_lane_status(u8 link_status[2], int lane)
 	return (link_value >> shift) & 0xf;
 }
 
-static int exynos_dp_clock_recovery_ok(u8 link_status[2], int lane_count)
+static int analogix_dp_clock_recovery_ok(u8 link_status[2], int lane_count)
 {
 	int lane;
 	u8 lane_status;
 
 	for (lane = 0; lane < lane_count; lane++) {
-		lane_status = exynos_dp_get_lane_status(link_status, lane);
+		lane_status = analogix_dp_get_lane_status(link_status, lane);
 		if ((lane_status & DP_LANE_CR_DONE) == 0)
 			return -EINVAL;
 	}
 	return 0;
 }
 
-static int exynos_dp_channel_eq_ok(u8 link_status[2], u8 link_align,
-				   int lane_count)
+static int analogix_dp_channel_eq_ok(u8 link_status[2], u8 link_align,
+				     int lane_count)
 {
 	int lane;
 	u8 lane_status;
@@ -377,7 +369,7 @@ static int exynos_dp_channel_eq_ok(u8 link_status[2], u8 link_align,
 		return -EINVAL;
 
 	for (lane = 0; lane < lane_count; lane++) {
-		lane_status = exynos_dp_get_lane_status(link_status, lane);
+		lane_status = analogix_dp_get_lane_status(link_status, lane);
 		lane_status &= DP_CHANNEL_EQ_BITS;
 		if (lane_status != DP_CHANNEL_EQ_BITS)
 			return -EINVAL;
@@ -386,8 +378,8 @@ static int exynos_dp_channel_eq_ok(u8 link_status[2], u8 link_align,
 	return 0;
 }
 
-static unsigned char exynos_dp_get_adjust_request_voltage(u8 adjust_request[2],
-							  int lane)
+static unsigned char
+analogix_dp_get_adjust_request_voltage(u8 adjust_request[2], int lane)
 {
 	int shift = (lane & 1) * 4;
 	u8 link_value = adjust_request[lane >> 1];
@@ -395,7 +387,7 @@ static unsigned char exynos_dp_get_adjust_request_voltage(u8 adjust_request[2],
 	return (link_value >> shift) & 0x3;
 }
 
-static unsigned char exynos_dp_get_adjust_request_pre_emphasis(
+static unsigned char analogix_dp_get_adjust_request_pre_emphasis(
 					u8 adjust_request[2],
 					int lane)
 {
@@ -405,45 +397,45 @@ static unsigned char exynos_dp_get_adjust_request_pre_emphasis(
 	return ((link_value >> shift) & 0xc) >> 2;
 }
 
-static void exynos_dp_set_lane_link_training(struct exynos_dp_device *dp,
-					     u8 training_lane_set, int lane)
+static void analogix_dp_set_lane_link_training(struct analogix_dp_device *dp,
+					       u8 training_lane_set, int lane)
 {
 	switch (lane) {
 	case 0:
-		exynos_dp_set_lane0_link_training(dp, training_lane_set);
+		analogix_dp_set_lane0_link_training(dp, training_lane_set);
 		break;
 	case 1:
-		exynos_dp_set_lane1_link_training(dp, training_lane_set);
+		analogix_dp_set_lane1_link_training(dp, training_lane_set);
 		break;
 
 	case 2:
-		exynos_dp_set_lane2_link_training(dp, training_lane_set);
+		analogix_dp_set_lane2_link_training(dp, training_lane_set);
 		break;
 
 	case 3:
-		exynos_dp_set_lane3_link_training(dp, training_lane_set);
+		analogix_dp_set_lane3_link_training(dp, training_lane_set);
 		break;
 	}
 }
 
-static unsigned int exynos_dp_get_lane_link_training(
-				struct exynos_dp_device *dp,
+static unsigned int analogix_dp_get_lane_link_training(
+				struct analogix_dp_device *dp,
 				int lane)
 {
 	u32 reg;
 
 	switch (lane) {
 	case 0:
-		reg = exynos_dp_get_lane0_link_training(dp);
+		reg = analogix_dp_get_lane0_link_training(dp);
 		break;
 	case 1:
-		reg = exynos_dp_get_lane1_link_training(dp);
+		reg = analogix_dp_get_lane1_link_training(dp);
 		break;
 	case 2:
-		reg = exynos_dp_get_lane2_link_training(dp);
+		reg = analogix_dp_get_lane2_link_training(dp);
 		break;
 	case 3:
-		reg = exynos_dp_get_lane3_link_training(dp);
+		reg = analogix_dp_get_lane3_link_training(dp);
 		break;
 	default:
 		WARN_ON(1);
@@ -453,25 +445,25 @@ static unsigned int exynos_dp_get_lane_link_training(
 	return reg;
 }
 
-static void exynos_dp_reduce_link_rate(struct exynos_dp_device *dp)
+static void analogix_dp_reduce_link_rate(struct analogix_dp_device *dp)
 {
-	exynos_dp_training_pattern_dis(dp);
-	exynos_dp_set_enhanced_mode(dp);
+	analogix_dp_training_pattern_dis(dp);
+	analogix_dp_set_enhanced_mode(dp);
 
 	dp->link_train.lt_state = FAILED;
 }
 
-static void exynos_dp_get_adjust_training_lane(struct exynos_dp_device *dp,
-					       u8 adjust_request[2])
+static void analogix_dp_get_adjust_training_lane(struct analogix_dp_device *dp,
+						 u8 adjust_request[2])
 {
 	int lane, lane_count;
 	u8 voltage_swing, pre_emphasis, training_lane;
 
 	lane_count = dp->link_train.lane_count;
 	for (lane = 0; lane < lane_count; lane++) {
-		voltage_swing = exynos_dp_get_adjust_request_voltage(
+		voltage_swing = analogix_dp_get_adjust_request_voltage(
 						adjust_request, lane);
-		pre_emphasis = exynos_dp_get_adjust_request_pre_emphasis(
+		pre_emphasis = analogix_dp_get_adjust_request_pre_emphasis(
 						adjust_request, lane);
 		training_lane = DPCD_VOLTAGE_SWING_SET(voltage_swing) |
 				DPCD_PRE_EMPHASIS_SET(pre_emphasis);
@@ -485,7 +477,7 @@ static void exynos_dp_get_adjust_training_lane(struct exynos_dp_device *dp,
 	}
 }
 
-static int exynos_dp_process_clock_recovery(struct exynos_dp_device *dp)
+static int analogix_dp_process_clock_recovery(struct analogix_dp_device *dp)
 {
 	int lane, lane_count, retval;
 	u8 voltage_swing, pre_emphasis, training_lane;
@@ -495,24 +487,24 @@ static int exynos_dp_process_clock_recovery(struct exynos_dp_device *dp)
 
 	lane_count = dp->link_train.lane_count;
 
-	retval = exynos_dp_read_bytes_from_dpcd(dp, DP_LANE0_1_STATUS,
-						2, link_status);
+	retval = analogix_dp_read_bytes_from_dpcd(
+			dp, DP_LANE0_1_STATUS, 2, link_status);
 	if (retval)
 		return retval;
 
-	retval = exynos_dp_read_bytes_from_dpcd(dp, DP_ADJUST_REQUEST_LANE0_1,
-						2, adjust_request);
+	retval = analogix_dp_read_bytes_from_dpcd(
+			dp, DP_ADJUST_REQUEST_LANE0_1, 2, adjust_request);
 	if (retval)
 		return retval;
 
-	if (exynos_dp_clock_recovery_ok(link_status, lane_count) == 0) {
+	if (analogix_dp_clock_recovery_ok(link_status, lane_count) == 0) {
 		/* set training pattern 2 for EQ */
-		exynos_dp_set_training_pattern(dp, TRAINING_PTN2);
+		analogix_dp_set_training_pattern(dp, TRAINING_PTN2);
 
-		retval = exynos_dp_write_byte_to_dpcd(
-				dp, DP_TRAINING_PATTERN_SET,
-				DP_LINK_SCRAMBLING_DISABLE |
-				DP_TRAINING_PATTERN_2);
+		retval = analogix_dp_write_byte_to_dpcd(
+						dp, DP_TRAINING_PATTERN_SET,
+						DP_LINK_SCRAMBLING_DISABLE |
+						DP_TRAINING_PATTERN_2);
 		if (retval)
 			return retval;
 
@@ -520,12 +512,12 @@ static int exynos_dp_process_clock_recovery(struct exynos_dp_device *dp)
 		dp->link_train.lt_state = EQUALIZER_TRAINING;
 	} else {
 		for (lane = 0; lane < lane_count; lane++) {
-			training_lane = exynos_dp_get_lane_link_training(
+			training_lane = analogix_dp_get_lane_link_training(
 							dp, lane);
-			voltage_swing = exynos_dp_get_adjust_request_voltage(
-							adjust_request, lane);
-			pre_emphasis = exynos_dp_get_adjust_request_pre_emphasis(
+			voltage_swing = analogix_dp_get_adjust_request_voltage(
 							adjust_request, lane);
+			pre_emphasis = analogix_dp_get_adjust_request_pre_emphasis(
+						adjust_request, lane);
 
 			if (DPCD_VOLTAGE_SWING_GET(training_lane) ==
 					voltage_swing &&
@@ -539,19 +531,19 @@ static int exynos_dp_process_clock_recovery(struct exynos_dp_device *dp)
 				dev_err(dp->dev, "CR Max reached (%d,%d,%d)\n",
 					dp->link_train.cr_loop[lane],
 					voltage_swing, pre_emphasis);
-				exynos_dp_reduce_link_rate(dp);
+				analogix_dp_reduce_link_rate(dp);
 				return -EIO;
 			}
 		}
 	}
 
-	exynos_dp_get_adjust_training_lane(dp, adjust_request);
+	analogix_dp_get_adjust_training_lane(dp, adjust_request);
 
 	for (lane = 0; lane < lane_count; lane++)
-		exynos_dp_set_lane_link_training(
+		analogix_dp_set_lane_link_training(
 				dp, dp->link_train.training_lane[lane], lane);
 
-	retval = exynos_dp_write_bytes_to_dpcd(
+	retval = analogix_dp_write_bytes_to_dpcd(
 			dp, DP_TRAINING_LANE0_SET, lane_count,
 			dp->link_train.training_lane);
 	if (retval)
@@ -560,7 +552,7 @@ static int exynos_dp_process_clock_recovery(struct exynos_dp_device *dp)
 	return retval;
 }
 
-static int exynos_dp_process_equalizer_training(struct exynos_dp_device *dp)
+static int analogix_dp_process_equalizer_training(struct analogix_dp_device *dp)
 {
 	int lane, lane_count, retval;
 	u32 reg;
@@ -570,46 +562,46 @@ static int exynos_dp_process_equalizer_training(struct exynos_dp_device *dp)
 
 	lane_count = dp->link_train.lane_count;
 
-	retval = exynos_dp_read_bytes_from_dpcd(dp, DP_LANE0_1_STATUS,
-						2, link_status);
+	retval = analogix_dp_read_bytes_from_dpcd(dp, DP_LANE0_1_STATUS,
+						  2, link_status);
 	if (retval)
 		return retval;
 
-	if (exynos_dp_clock_recovery_ok(link_status, lane_count)) {
-		exynos_dp_reduce_link_rate(dp);
+	if (analogix_dp_clock_recovery_ok(link_status, lane_count)) {
+		analogix_dp_reduce_link_rate(dp);
 		return -EIO;
 	}
 
-	retval = exynos_dp_read_bytes_from_dpcd(dp, DP_ADJUST_REQUEST_LANE0_1,
-						2, adjust_request);
+	retval = analogix_dp_read_bytes_from_dpcd(dp, DP_ADJUST_REQUEST_LANE0_1,
+						  2, adjust_request);
 	if (retval)
 		return retval;
 
-	retval = exynos_dp_read_byte_from_dpcd(
+	retval = analogix_dp_read_byte_from_dpcd(
 			dp, DP_LANE_ALIGN_STATUS_UPDATED, &link_align);
 	if (retval)
 		return retval;
 
-	exynos_dp_get_adjust_training_lane(dp, adjust_request);
+	analogix_dp_get_adjust_training_lane(dp, adjust_request);
 
-	if (!exynos_dp_channel_eq_ok(link_status, link_align, lane_count)) {
+	if (!analogix_dp_channel_eq_ok(link_status, link_align, lane_count)) {
 		/* traing pattern Set to Normal */
-		exynos_dp_training_pattern_dis(dp);
+		analogix_dp_training_pattern_dis(dp);
 
 		dev_info(dp->dev, "Link Training success!\n");
 
-		exynos_dp_get_link_bandwidth(dp, &reg);
+		analogix_dp_get_link_bandwidth(dp, &reg);
 		dp->link_train.link_rate = reg;
 		dev_dbg(dp->dev, "final bandwidth = %.2x\n",
 			dp->link_train.link_rate);
 
-		exynos_dp_get_lane_count(dp, &reg);
+		analogix_dp_get_lane_count(dp, &reg);
 		dp->link_train.lane_count = reg;
 		dev_dbg(dp->dev, "final lane count = %.2x\n",
 			dp->link_train.lane_count);
 
 		/* set enhanced mode if available */
-		exynos_dp_set_enhanced_mode(dp);
+		analogix_dp_set_enhanced_mode(dp);
 		dp->link_train.lt_state = FINISHED;
 
 		return 0;
@@ -620,23 +612,23 @@ static int exynos_dp_process_equalizer_training(struct exynos_dp_device *dp)
 
 	if (dp->link_train.eq_loop > MAX_EQ_LOOP) {
 		dev_err(dp->dev, "EQ Max loop\n");
-		exynos_dp_reduce_link_rate(dp);
+		analogix_dp_reduce_link_rate(dp);
 		return -EIO;
 	}
 
 	for (lane = 0; lane < lane_count; lane++)
-		exynos_dp_set_lane_link_training(
+		analogix_dp_set_lane_link_training(
 				dp, dp->link_train.training_lane[lane], lane);
 
-	retval = exynos_dp_write_bytes_to_dpcd(dp, DP_TRAINING_LANE0_SET,
-					       lane_count,
-					       dp->link_train.training_lane);
+	retval = analogix_dp_write_bytes_to_dpcd(dp, DP_TRAINING_LANE0_SET,
+						 lane_count,
+						 dp->link_train.training_lane);
 
 	return retval;
 }
 
-static void exynos_dp_get_max_rx_bandwidth(struct exynos_dp_device *dp,
-					   u8 *bandwidth)
+static void analogix_dp_get_max_rx_bandwidth(struct analogix_dp_device *dp,
+					     u8 *bandwidth)
 {
 	u8 data;
 
@@ -644,12 +636,12 @@ static void exynos_dp_get_max_rx_bandwidth(struct exynos_dp_device *dp,
 	 * For DP rev.1.1, Maximum link rate of Main Link lanes
 	 * 0x06 = 1.62 Gbps, 0x0a = 2.7 Gbps
 	 */
-	exynos_dp_read_byte_from_dpcd(dp, DP_MAX_LINK_RATE, &data);
+	analogix_dp_read_byte_from_dpcd(dp, DP_MAX_LINK_RATE, &data);
 	*bandwidth = data;
 }
 
-static void exynos_dp_get_max_rx_lane_count(struct exynos_dp_device *dp,
-					    u8 *lane_count)
+static void analogix_dp_get_max_rx_lane_count(struct analogix_dp_device *dp,
+					      u8 *lane_count)
 {
 	u8 data;
 
@@ -657,23 +649,23 @@ static void exynos_dp_get_max_rx_lane_count(struct exynos_dp_device *dp,
 	 * For DP rev.1.1, Maximum number of Main Link lanes
 	 * 0x01 = 1 lane, 0x02 = 2 lanes, 0x04 = 4 lanes
 	 */
-	exynos_dp_read_byte_from_dpcd(dp, DP_MAX_LANE_COUNT, &data);
+	analogix_dp_read_byte_from_dpcd(dp, DP_MAX_LANE_COUNT, &data);
 	*lane_count = DPCD_MAX_LANE_COUNT(data);
 }
 
-static void exynos_dp_init_training(struct exynos_dp_device *dp,
-				    enum link_lane_count_type max_lane,
-				    enum link_rate_type max_rate)
+static void analogix_dp_init_training(struct analogix_dp_device *dp,
+				      enum link_lane_count_type max_lane,
+				      enum link_rate_type max_rate)
 {
 	/*
 	 * MACRO_RST must be applied after the PLL_LOCK to avoid
 	 * the DP inter pair skew issue for at least 10 us
 	 */
-	exynos_dp_reset_macro(dp);
+	analogix_dp_reset_macro(dp);
 
 	/* Initialize by reading RX's DPCD */
-	exynos_dp_get_max_rx_bandwidth(dp, &dp->link_train.link_rate);
-	exynos_dp_get_max_rx_lane_count(dp, &dp->link_train.lane_count);
+	analogix_dp_get_max_rx_bandwidth(dp, &dp->link_train.link_rate);
+	analogix_dp_get_max_rx_lane_count(dp, &dp->link_train.lane_count);
 
 	if ((dp->link_train.link_rate != LINK_RATE_1_62GBPS) &&
 	    (dp->link_train.link_rate != LINK_RATE_2_70GBPS)) {
@@ -695,10 +687,10 @@ static void exynos_dp_init_training(struct exynos_dp_device *dp,
 		dp->link_train.link_rate = max_rate;
 
 	/* All DP analog module power up */
-	exynos_dp_set_analog_power_down(dp, POWER_ALL, 0);
+	analogix_dp_set_analog_power_down(dp, POWER_ALL, 0);
 }
 
-static int exynos_dp_sw_link_training(struct exynos_dp_device *dp)
+static int analogix_dp_sw_link_training(struct analogix_dp_device *dp)
 {
 	int retval = 0, training_finished = 0;
 
@@ -708,17 +700,17 @@ static int exynos_dp_sw_link_training(struct exynos_dp_device *dp)
 	while (!retval && !training_finished) {
 		switch (dp->link_train.lt_state) {
 		case START:
-			retval = exynos_dp_link_start(dp);
+			retval = analogix_dp_link_start(dp);
 			if (retval)
 				dev_err(dp->dev, "LT link start failed!\n");
 			break;
 		case CLOCK_RECOVERY:
-			retval = exynos_dp_process_clock_recovery(dp);
+			retval = analogix_dp_process_clock_recovery(dp);
 			if (retval)
 				dev_err(dp->dev, "LT CR failed!\n");
 			break;
 		case EQUALIZER_TRAINING:
-			retval = exynos_dp_process_equalizer_training(dp);
+			retval = analogix_dp_process_equalizer_training(dp);
 			if (retval)
 				dev_err(dp->dev, "LT EQ failed!\n");
 			break;
@@ -735,15 +727,15 @@ static int exynos_dp_sw_link_training(struct exynos_dp_device *dp)
 	return retval;
 }
 
-static int exynos_dp_set_link_train(struct exynos_dp_device *dp,
-				    u32 count, u32 bwtype)
+static int analogix_dp_set_link_train(struct analogix_dp_device *dp,
+				      u32 count, u32 bwtype)
 {
 	int i;
 	int retval;
 
 	for (i = 0; i < DP_TIMEOUT_LOOP_COUNT; i++) {
-		exynos_dp_init_training(dp, count, bwtype);
-		retval = exynos_dp_sw_link_training(dp);
+		analogix_dp_init_training(dp, count, bwtype);
+		retval = analogix_dp_sw_link_training(dp);
 		if (retval == 0)
 			break;
 
@@ -753,24 +745,24 @@ static int exynos_dp_set_link_train(struct exynos_dp_device *dp,
 	return retval;
 }
 
-static int exynos_dp_config_video(struct exynos_dp_device *dp)
+static int analogix_dp_config_video(struct analogix_dp_device *dp)
 {
 	int retval = 0;
 	int timeout_loop = 0;
 	int done_count = 0;
 
-	exynos_dp_config_video_slave_mode(dp);
+	analogix_dp_config_video_slave_mode(dp);
 
-	exynos_dp_set_video_color_format(dp);
+	analogix_dp_set_video_color_format(dp);
 
-	if (exynos_dp_get_pll_lock_status(dp) == PLL_UNLOCKED) {
+	if (analogix_dp_get_pll_lock_status(dp) == PLL_UNLOCKED) {
 		dev_err(dp->dev, "PLL is not locked yet.\n");
 		return -EINVAL;
 	}
 
 	for (;;) {
 		timeout_loop++;
-		if (exynos_dp_is_slave_video_stream_clock_on(dp) == 0)
+		if (analogix_dp_is_slave_video_stream_clock_on(dp) == 0)
 			break;
 		if (DP_TIMEOUT_LOOP_COUNT < timeout_loop) {
 			dev_err(dp->dev, "Timeout of video streamclk ok\n");
@@ -781,25 +773,25 @@ static int exynos_dp_config_video(struct exynos_dp_device *dp)
 	}
 
 	/* Set to use the register calculated M/N video */
-	exynos_dp_set_video_cr_mn(dp, CALCULATED_M, 0, 0);
+	analogix_dp_set_video_cr_mn(dp, CALCULATED_M, 0, 0);
 
 	/* For video bist, Video timing must be generated by register */
-	exynos_dp_set_video_timing_mode(dp, VIDEO_TIMING_FROM_CAPTURE);
+	analogix_dp_set_video_timing_mode(dp, VIDEO_TIMING_FROM_CAPTURE);
 
 	/* Disable video mute */
-	exynos_dp_enable_video_mute(dp, 0);
+	analogix_dp_enable_video_mute(dp, 0);
 
 	/* Configure video slave mode */
-	exynos_dp_enable_video_master(dp, 0);
+	analogix_dp_enable_video_master(dp, 0);
 
 	/* Enable video */
-	exynos_dp_start_video(dp);
+	analogix_dp_start_video(dp);
 
 	timeout_loop = 0;
 
 	for (;;) {
 		timeout_loop++;
-		if (exynos_dp_is_video_stream_on(dp) == 0) {
+		if (analogix_dp_is_video_stream_on(dp) == 0) {
 			done_count++;
 			if (done_count > 10)
 				break;
@@ -820,45 +812,46 @@ static int exynos_dp_config_video(struct exynos_dp_device *dp)
 	return retval;
 }
 
-static void exynos_dp_enable_scramble(struct exynos_dp_device *dp, bool enable)
+static void analogix_dp_enable_scramble(struct analogix_dp_device *dp,
+					bool enable)
 {
 	u8 data;
 
 	if (enable) {
-		exynos_dp_enable_scrambling(dp);
+		analogix_dp_enable_scrambling(dp);
 
-		exynos_dp_read_byte_from_dpcd(dp, DP_TRAINING_PATTERN_SET,
-					      &data);
-		exynos_dp_write_byte_to_dpcd(
-			dp, DP_TRAINING_PATTERN_SET,
-			(u8)(data & ~DP_LINK_SCRAMBLING_DISABLE));
+		analogix_dp_read_byte_from_dpcd(
+				dp, DP_TRAINING_PATTERN_SET, &data);
+		analogix_dp_write_byte_to_dpcd(
+				dp, DP_TRAINING_PATTERN_SET,
+				(u8)(data & ~DP_LINK_SCRAMBLING_DISABLE));
 	} else {
-		exynos_dp_disable_scrambling(dp);
+		analogix_dp_disable_scrambling(dp);
 
-		exynos_dp_read_byte_from_dpcd(dp, DP_TRAINING_PATTERN_SET,
-					      &data);
-		exynos_dp_write_byte_to_dpcd(
+		analogix_dp_read_byte_from_dpcd(dp, DP_TRAINING_PATTERN_SET,
+						&data);
+		analogix_dp_write_byte_to_dpcd(
 				dp, DP_TRAINING_PATTERN_SET,
 				(u8)(data | DP_LINK_SCRAMBLING_DISABLE));
 	}
 }
 
-static irqreturn_t exynos_dp_irq_handler(int irq, void *arg)
+static irqreturn_t analogix_dp_irq_handler(int irq, void *arg)
 {
-	struct exynos_dp_device *dp = arg;
+	struct analogix_dp_device *dp = arg;
 
 	enum dp_irq_type irq_type;
 
-	irq_type = exynos_dp_get_irq_type(dp);
+	irq_type = analogix_dp_get_irq_type(dp);
 	switch (irq_type) {
 	case DP_IRQ_TYPE_HP_CABLE_IN:
 		dev_dbg(dp->dev, "Received irq - cable in\n");
 		schedule_work(&dp->hotplug_work);
-		exynos_dp_clear_hotplug_interrupts(dp);
+		analogix_dp_clear_hotplug_interrupts(dp);
 		break;
 	case DP_IRQ_TYPE_HP_CABLE_OUT:
 		dev_dbg(dp->dev, "Received irq - cable out\n");
-		exynos_dp_clear_hotplug_interrupts(dp);
+		analogix_dp_clear_hotplug_interrupts(dp);
 		break;
 	case DP_IRQ_TYPE_HP_CHANGE:
 		/*
@@ -867,7 +860,7 @@ static irqreturn_t exynos_dp_irq_handler(int irq, void *arg)
 		 * only handle cable changes.
 		 */
 		dev_dbg(dp->dev, "Received irq - hotplug change; ignoring.\n");
-		exynos_dp_clear_hotplug_interrupts(dp);
+		analogix_dp_clear_hotplug_interrupts(dp);
 		break;
 	default:
 		dev_err(dp->dev, "Received irq - unknown type!\n");
@@ -876,172 +869,155 @@ static irqreturn_t exynos_dp_irq_handler(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
-static void exynos_dp_hotplug(struct work_struct *work)
+static void analogix_dp_hotplug(struct work_struct *work)
 {
-	struct exynos_dp_device *dp;
+	struct analogix_dp_device *dp;
 
-	dp = container_of(work, struct exynos_dp_device, hotplug_work);
+	dp = container_of(work, struct analogix_dp_device, hotplug_work);
 
 	if (dp->drm_dev)
 		drm_helper_hpd_irq_event(dp->drm_dev);
 }
 
-static void exynos_dp_commit(struct exynos_drm_display *display)
+static void analogix_dp_commit(struct analogix_dp_device *dp)
 {
-	struct exynos_dp_device *dp = display_to_dp(display);
 	int ret;
 
 	/* Keep the panel disabled while we configure video */
-	if (dp->panel) {
-		if (drm_panel_disable(dp->panel))
+	if (dp->plat_data && dp->plat_data->panel) {
+		if (drm_panel_disable(dp->plat_data->panel))
 			DRM_ERROR("failed to disable the panel\n");
 	}
 
-	ret = exynos_dp_detect_hpd(dp);
+	ret = analogix_dp_detect_hpd(dp);
 	if (ret) {
 		/* Cable has been disconnected, we're done */
 		return;
 	}
 
-	ret = exynos_dp_handle_edid(dp);
+	ret = analogix_dp_handle_edid(dp);
 	if (ret) {
 		dev_err(dp->dev, "unable to handle edid\n");
 		return;
 	}
 
-	ret = exynos_dp_set_link_train(dp, dp->video_info->lane_count,
-				       dp->video_info->link_rate);
+	ret = analogix_dp_set_link_train(dp, dp->video_info->lane_count,
+					 dp->video_info->link_rate);
 	if (ret) {
 		dev_err(dp->dev, "unable to do link train\n");
 		return;
 	}
 
-	exynos_dp_enable_scramble(dp, 1);
-	exynos_dp_enable_rx_to_enhanced_mode(dp, 1);
-	exynos_dp_enable_enhanced_mode(dp, 1);
+	analogix_dp_enable_scramble(dp, 1);
+	analogix_dp_enable_rx_to_enhanced_mode(dp, 1);
+	analogix_dp_enable_enhanced_mode(dp, 1);
 
-	exynos_dp_set_lane_count(dp, dp->video_info->lane_count);
-	exynos_dp_set_link_bandwidth(dp, dp->video_info->link_rate);
+	analogix_dp_set_lane_count(dp, dp->video_info->lane_count);
+	analogix_dp_set_link_bandwidth(dp, dp->video_info->link_rate);
 
-	exynos_dp_init_video(dp);
-	ret = exynos_dp_config_video(dp);
+	analogix_dp_init_video(dp);
+	ret = analogix_dp_config_video(dp);
 	if (ret)
 		dev_err(dp->dev, "unable to config video\n");
 
 	/* Safe to enable the panel now */
-	if (dp->panel) {
-		if (drm_panel_enable(dp->panel))
+	if (dp->plat_data && dp->plat_data->panel) {
+		if (drm_panel_enable(dp->plat_data->panel))
 			DRM_ERROR("failed to enable the panel\n");
 	}
 }
 
-static enum drm_connector_status exynos_dp_detect(
+static enum drm_connector_status analogix_dp_detect(
 				struct drm_connector *connector, bool force)
 {
 	return connector_status_connected;
 }
 
-static void exynos_dp_connector_destroy(struct drm_connector *connector)
+static void analogix_dp_connector_destroy(struct drm_connector *connector)
 {
 	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
 }
 
-static struct drm_connector_funcs exynos_dp_connector_funcs = {
+static struct drm_connector_funcs analogix_dp_connector_funcs = {
 	.dpms = drm_atomic_helper_connector_dpms,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.detect = exynos_dp_detect,
-	.destroy = exynos_dp_connector_destroy,
+	.detect = analogix_dp_detect,
+	.destroy = analogix_dp_connector_destroy,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static int exynos_dp_get_modes(struct drm_connector *connector)
+static int analogix_dp_get_modes(struct drm_connector *connector)
 {
-	struct exynos_dp_device *dp = ctx_from_connector(connector);
-	struct drm_display_mode *mode;
+	struct analogix_dp_device *dp = connector_to_dp(connector);
+	struct analogix_dp_plat_data *plat_data = dp->plat_data;
+	int num_modes = 0;
 
-	if (dp->panel)
-		return drm_panel_get_modes(dp->panel);
-
-	mode = drm_mode_create(connector->dev);
-	if (!mode) {
-		DRM_ERROR("failed to create a new display mode.\n");
-		return 0;
-	}
+	if (plat_data && plat_data->panel)
+		num_modes += drm_panel_get_modes(plat_data->panel);
 
-	drm_display_mode_from_videomode(&dp->priv.vm, mode);
-	mode->width_mm = dp->priv.width_mm;
-	mode->height_mm = dp->priv.height_mm;
-	connector->display_info.width_mm = mode->width_mm;
-	connector->display_info.height_mm = mode->height_mm;
+	if (plat_data && plat_data->get_modes)
+		 num_modes += plat_data->get_modes(plat_data, connector);
 
-	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
-	drm_mode_set_name(mode);
-	drm_mode_probed_add(connector, mode);
-
-	return 1;
+	return num_modes;
 }
 
-static struct drm_encoder *exynos_dp_best_encoder(
+static struct drm_encoder *analogix_dp_best_encoder(
 			struct drm_connector *connector)
 {
-	struct exynos_dp_device *dp = ctx_from_connector(connector);
+	struct analogix_dp_device *dp = connector_to_dp(connector);
 
 	return dp->encoder;
 }
 
-static struct drm_connector_helper_funcs exynos_dp_connector_helper_funcs = {
-	.get_modes = exynos_dp_get_modes,
-	.best_encoder = exynos_dp_best_encoder,
+static struct drm_connector_helper_funcs analogix_dp_connector_helper_funcs = {
+	.get_modes = analogix_dp_get_modes,
+	.best_encoder = analogix_dp_best_encoder,
 };
 
-static void exynos_dp_phy_init(struct exynos_dp_device *dp)
+static void analogix_dp_phy_init(struct analogix_dp_device *dp)
 {
 	if (dp->phy)
 		phy_power_on(dp->phy);
 }
 
-static void exynos_dp_phy_exit(struct exynos_dp_device *dp)
+static void analogix_dp_phy_exit(struct analogix_dp_device *dp)
 {
 	if (dp->phy)
 		phy_power_off(dp->phy);
 }
 
-static void exynos_dp_poweron(struct exynos_dp_device *dp)
+static void analogix_dp_poweron(struct analogix_dp_device *dp)
 {
-	struct exynos_drm_crtc *crtc = dp_to_crtc(dp);
-
 	if (dp->dpms_mode == DRM_MODE_DPMS_ON)
 		return;
 
-	if (dp->panel) {
-		if (drm_panel_prepare(dp->panel)) {
+	if (dp->plat_data && dp->plat_data->panel) {
+		if (drm_panel_prepare(dp->plat_data->panel)) {
 			DRM_ERROR("failed to setup the panel\n");
 			return;
 		}
 	}
 
-	if (crtc->ops->clock_enable)
-		crtc->ops->clock_enable(dp_to_crtc(dp), true);
+	if (dp->plat_data && dp->plat_data->power_on)
+		dp->plat_data->power_on(dp->plat_data);
 
 	clk_prepare_enable(dp->clock);
-	exynos_dp_phy_init(dp);
-	exynos_dp_init_dp(dp);
+	analogix_dp_phy_init(dp);
+	analogix_dp_init_dp(dp);
 	enable_irq(dp->irq);
-	exynos_dp_commit(&dp->display);
+	analogix_dp_commit(dp);
 }
 
-static void exynos_dp_poweroff(struct exynos_dp_device *dp)
+static void analogix_dp_poweroff(struct analogix_dp_device *dp)
 {
-	struct exynos_drm_crtc *crtc = dp_to_crtc(dp);
-
 	if (dp->dpms_mode != DRM_MODE_DPMS_ON)
 		return;
 
-	if (dp->panel) {
-		if (drm_panel_disable(dp->panel)) {
+	if (dp->plat_data && dp->plat_data->panel) {
+		if (drm_panel_disable(dp->plat_data->panel)) {
 			DRM_ERROR("failed to disable the panel\n");
 			return;
 		}
@@ -1049,39 +1025,21 @@ static void exynos_dp_poweroff(struct exynos_dp_device *dp)
 
 	disable_irq(dp->irq);
 	flush_work(&dp->hotplug_work);
-	exynos_dp_phy_exit(dp);
+	analogix_dp_phy_exit(dp);
 	clk_disable_unprepare(dp->clock);
 
-	if (crtc->ops->clock_enable)
-		crtc->ops->clock_enable(dp_to_crtc(dp), false);
+	if (dp->plat_data && dp->plat_data->power_off)
+		dp->plat_data->power_off(dp->plat_data);
 
-	if (dp->panel) {
-		if (drm_panel_unprepare(dp->panel))
+	if (dp->plat_data && dp->plat_data->panel) {
+		if (drm_panel_unprepare(dp->plat_data->panel))
 			DRM_ERROR("failed to turnoff the panel\n");
 	}
 }
 
-/* returns the number of bridges attached */
-static int exynos_drm_attach_lcd_bridge(struct exynos_dp_device *dp,
-		struct drm_encoder *encoder)
+static int analogix_dp_bridge_attach(struct drm_bridge *bridge)
 {
-	int ret;
-
-	dp->bridge->next = dp->ptn_bridge;
-	dp->bridge->encoder = encoder;
-	ret = drm_bridge_attach(encoder->dev, dp->bridge);
-	if (ret) {
-		DRM_ERROR("Failed to attach ptn bridge to drm\n");
-		return ret;
-	}
-
-	return 0;
-}
-
-static int exynos_dp_bridge_attach(struct drm_bridge *bridge)
-{
-
-	struct exynos_dp_device *dp = bridge->driver_private;
+	struct analogix_dp_device *dp = bridge->driver_private;
 	struct drm_encoder *encoder = dp->encoder;
 	struct drm_connector *connector = &dp->connector;
 	int ret;
@@ -1093,66 +1051,77 @@ static int exynos_dp_bridge_attach(struct drm_bridge *bridge)
 
 	encoder->bridge = bridge;
 
-	/* Pre-empt DP connector creation if there's a bridge */
-	if (dp->ptn_bridge) {
-		ret = exynos_drm_attach_lcd_bridge(dp, encoder);
-		if (ret)
-			return -ENODEV;
-	}
-
 	connector->polled = DRM_CONNECTOR_POLL_HPD;
 
 	ret = drm_connector_init(dp->drm_dev, connector,
-			&exynos_dp_connector_funcs, DRM_MODE_CONNECTOR_eDP);
+				 &analogix_dp_connector_funcs,
+				 DRM_MODE_CONNECTOR_eDP);
 	if (ret) {
 		DRM_ERROR("Failed to initialize connector with drm\n");
 		return ret;
 	}
 
-	drm_connector_helper_add(connector, &exynos_dp_connector_helper_funcs);
+	drm_connector_helper_add(connector,
+				 &analogix_dp_connector_helper_funcs);
 	drm_connector_register(connector);
 	drm_mode_connector_attach_encoder(connector, encoder);
 
-	if (dp->panel)
-		ret = drm_panel_attach(dp->panel, &dp->connector);
+	if (dp->plat_data && dp->plat_data->panel) {
+		ret = drm_panel_attach(dp->plat_data->panel, &dp->connector);
+		if (ret) {
+			DRM_ERROR("Failed to attach panel\n");
+			return ret;
+		}
+	}
+
+	/*
+	 * This should be the end of attach function, caused
+	 * we should ensure dp bridge could attach first.
+	 */
+	 if (dp->plat_data && dp->plat_data->attach) {
+		 ret = dp->plat_data->attach(dp->plat_data, bridge);
+		 if (ret) {
+			 DRM_ERROR("Failed at platform attch func\n");
+			 return ret;
+		 }
+	 }
 
-	return ret;
+	return 0;
 }
 
-static void exynos_dp_bridge_nop(struct drm_bridge *bridge)
+static void analogix_dp_bridge_nop(struct drm_bridge *bridge)
 {
 	/* do nothing */
 }
 
-static void exynos_dp_bridge_enable(struct drm_bridge *bridge)
+static void analogix_dp_bridge_enable(struct drm_bridge *bridge)
 {
-	struct exynos_dp_device *dp = bridge->driver_private;
+	struct analogix_dp_device *dp = bridge->driver_private;
 
-	exynos_dp_poweron(dp);
+	analogix_dp_poweron(dp);
 	dp->dpms_mode = DRM_MODE_DPMS_ON;
 }
 
-static void exynos_dp_bridge_disable(struct drm_bridge *bridge)
+static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
 {
-	struct exynos_dp_device *dp = bridge->driver_private;
+	struct analogix_dp_device *dp = bridge->driver_private;
 
-	exynos_dp_poweroff(dp);
+	analogix_dp_poweroff(dp);
 	dp->dpms_mode = DRM_MODE_DPMS_OFF;
 }
 
-static const struct drm_bridge_funcs exynos_dp_bridge_funcs = {
-	.enable = exynos_dp_bridge_enable,
-	.disable = exynos_dp_bridge_disable,
-	.pre_enable = exynos_dp_bridge_nop,
-	.post_disable = exynos_dp_bridge_nop,
-	.attach = exynos_dp_bridge_attach,
+static const struct drm_bridge_funcs analogix_dp_bridge_funcs = {
+	.enable = analogix_dp_bridge_enable,
+	.disable = analogix_dp_bridge_disable,
+	.pre_enable = analogix_dp_bridge_nop,
+	.post_disable = analogix_dp_bridge_nop,
+	.attach = analogix_dp_bridge_attach,
 };
 
-static int exynos_dp_create_connector(struct exynos_drm_display *display,
-				struct drm_encoder *encoder)
+static int analogix_dp_bridge_register(struct drm_device *drm_dev,
+				       struct analogix_dp_device *dp)
+
 {
-	struct exynos_dp_device *dp = display_to_dp(display);
-	struct drm_device *drm_dev = dp->drm_dev;
 	struct drm_bridge *bridge;
 	int ret;
 
@@ -1163,11 +1132,10 @@ static int exynos_dp_create_connector(struct exynos_drm_display *display,
 	}
 
 	dp->bridge = bridge;
-	dp->encoder = encoder;
 
 	bridge->driver_private = dp;
 	bridge->encoder = dp->encoder;
-	bridge->funcs = &exynos_dp_bridge_funcs;
+	bridge->funcs = &analogix_dp_bridge_funcs;
 
 	ret = drm_bridge_attach(drm_dev, bridge);
 	if (ret) {
@@ -1178,18 +1146,7 @@ static int exynos_dp_create_connector(struct exynos_drm_display *display,
 	return 0;
 }
 
-static void exynos_dp_dpms(struct exynos_drm_display *display, int mode)
-{
-	/* do nothing */
-}
-
-static struct exynos_drm_display_ops exynos_dp_display_ops = {
-	.create_connector = exynos_dp_create_connector,
-	.dpms = exynos_dp_dpms,
-	.commit = exynos_dp_commit,
-};
-
-static struct video_info *exynos_dp_dt_parse_pdata(struct device *dev)
+static struct video_info *analogix_dp_dt_parse_pdata(struct device *dev)
 {
 	struct device_node *dp_node = dev->of_node;
 	struct video_info *dp_video_config;
@@ -1208,37 +1165,37 @@ static struct video_info *exynos_dp_dt_parse_pdata(struct device *dev)
 	dp_video_config->interlaced =
 		of_property_read_bool(dp_node, "interlaced");
 
-	if (of_property_read_u32(dp_node, "samsung,color-space",
+	if (of_property_read_u32(dp_node, "analogix,color-space",
 				 &dp_video_config->color_space)) {
 		dev_err(dev, "failed to get color-space\n");
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (of_property_read_u32(dp_node, "samsung,dynamic-range",
+	if (of_property_read_u32(dp_node, "analogix,dynamic-range",
 				 &dp_video_config->dynamic_range)) {
 		dev_err(dev, "failed to get dynamic-range\n");
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (of_property_read_u32(dp_node, "samsung,ycbcr-coeff",
+	if (of_property_read_u32(dp_node, "analogix,ycbcr-coeff",
 				 &dp_video_config->ycbcr_coeff)) {
 		dev_err(dev, "failed to get ycbcr-coeff\n");
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (of_property_read_u32(dp_node, "samsung,color-depth",
+	if (of_property_read_u32(dp_node, "analogix,color-depth",
 				 &dp_video_config->color_depth)) {
 		dev_err(dev, "failed to get color-depth\n");
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (of_property_read_u32(dp_node, "samsung,link-rate",
+	if (of_property_read_u32(dp_node, "analogix,link-rate",
 				 &dp_video_config->link_rate)) {
 		dev_err(dev, "failed to get link-rate\n");
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (of_property_read_u32(dp_node, "samsung,lane-count",
+	if (of_property_read_u32(dp_node, "analogix,lane-count",
 				 &dp_video_config->lane_count)) {
 		dev_err(dev, "failed to get lane-count\n");
 		return ERR_PTR(-EINVAL);
@@ -1247,32 +1204,33 @@ static struct video_info *exynos_dp_dt_parse_pdata(struct device *dev)
 	return dp_video_config;
 }
 
-static int exynos_dp_dt_parse_panel(struct exynos_dp_device *dp)
+int analogix_dp_bind(struct device *dev, struct drm_device *drm_dev,
+		     struct drm_encoder *encoder,
+		     struct analogix_dp_plat_data *plat_data)
 {
-	int ret;
-
-	ret = of_get_videomode(dp->dev->of_node, &dp->priv.vm,
-			       OF_USE_NATIVE_MODE);
-	if (ret) {
-		DRM_ERROR("failed: of_get_videomode() : %d\n", ret);
-		return ret;
-	}
-	return 0;
-}
-
-static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
-{
-	struct exynos_dp_device *dp = dev_get_drvdata(dev);
 	struct platform_device *pdev = to_platform_device(dev);
-	struct drm_device *drm_dev = data;
+	struct analogix_dp_device *dp;
 	struct resource *res;
 	unsigned int irq_flags;
 	int ret = 0;
 
+	dp = devm_kzalloc(dev, sizeof(struct analogix_dp_device), GFP_KERNEL);
+	if (!dp)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, dp);
+
 	dp->dev = &pdev->dev;
 	dp->dpms_mode = DRM_MODE_DPMS_OFF;
 
-	dp->video_info = exynos_dp_dt_parse_pdata(&pdev->dev);
+	/*
+	 * platform dp driver need containor_of the plat_data to get
+	 * the driver private data, so we need to store the point of
+	 * plat_data, not the context of plat_data.
+	 */
+	dp->plat_data = plat_data;
+
+	dp->video_info = analogix_dp_dt_parse_pdata(&pdev->dev);
 	if (IS_ERR(dp->video_info))
 		return PTR_ERR(dp->video_info);
 
@@ -1292,12 +1250,6 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 		}
 	}
 
-	if (!dp->panel && !dp->ptn_bridge) {
-		ret = exynos_dp_dt_parse_panel(dp);
-		if (ret)
-			return ret;
-	}
-
 	dp->clock = devm_clk_get(&pdev->dev, "dp");
 	if (IS_ERR(dp->clock)) {
 		dev_err(&pdev->dev, "failed to get clock\n");
@@ -1312,7 +1264,7 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 	if (IS_ERR(dp->reg_base))
 		return PTR_ERR(dp->reg_base);
 
-	dp->hpd_gpio = of_get_named_gpio(dev->of_node, "samsung,hpd-gpio", 0);
+	dp->hpd_gpio = of_get_named_gpio(dev->of_node, "analogix,hpd-gpio", 0);
 
 	if (gpio_is_valid(dp->hpd_gpio)) {
 		/*
@@ -1341,14 +1293,14 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 		return -ENODEV;
 	}
 
-	INIT_WORK(&dp->hotplug_work, exynos_dp_hotplug);
+	INIT_WORK(&dp->hotplug_work, analogix_dp_hotplug);
 
-	exynos_dp_phy_init(dp);
+	analogix_dp_phy_init(dp);
 
-	exynos_dp_init_dp(dp);
+	analogix_dp_init_dp(dp);
 
-	ret = devm_request_irq(&pdev->dev, dp->irq, exynos_dp_irq_handler,
-			       irq_flags, "exynos-dp", dp);
+	ret = devm_request_irq(&pdev->dev, dp->irq, analogix_dp_irq_handler,
+			       irq_flags, "analogix-dp", dp);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to request irq\n");
 		return ret;
@@ -1356,108 +1308,38 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 	disable_irq(dp->irq);
 
 	dp->drm_dev = drm_dev;
+	dp->encoder = encoder;
 
-	return exynos_drm_create_enc_conn(drm_dev, &dp->display);
-}
-
-static void exynos_dp_unbind(struct device *dev, struct device *master,
-			     void *data)
-{
-	struct exynos_dp_device *dp = dev_get_drvdata(dev);
-
-	exynos_dp_bridge_disable(dp->bridge);
-}
-
-static const struct component_ops exynos_dp_ops = {
-	.bind	= exynos_dp_bind,
-	.unbind	= exynos_dp_unbind,
-};
-
-static int exynos_dp_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct device_node *panel_node, *bridge_node, *endpoint;
-	struct exynos_dp_device *dp;
-
-	dp = devm_kzalloc(&pdev->dev, sizeof(struct exynos_dp_device),
-			  GFP_KERNEL);
-	if (!dp)
-		return -ENOMEM;
-
-	dp->display.type = EXYNOS_DISPLAY_TYPE_LCD;
-	dp->display.ops = &exynos_dp_display_ops;
-	platform_set_drvdata(pdev, dp);
-
-	panel_node = of_parse_phandle(dev->of_node, "panel", 0);
-	if (panel_node) {
-		dp->panel = of_drm_find_panel(panel_node);
-		of_node_put(panel_node);
-		if (!dp->panel)
-			return -EPROBE_DEFER;
-	}
-
-	endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
-	if (endpoint) {
-		bridge_node = of_graph_get_remote_port_parent(endpoint);
-		if (bridge_node) {
-			dp->ptn_bridge = of_drm_find_bridge(bridge_node);
-			of_node_put(bridge_node);
-			if (!dp->ptn_bridge)
-				return -EPROBE_DEFER;
-		} else {
-			return -EPROBE_DEFER;
-		}
-	}
-
-	return component_add(&pdev->dev, &exynos_dp_ops);
+	return analogix_dp_bridge_register(drm_dev, dp);
 }
+EXPORT_SYMBOL_GPL(analogix_dp_bind);
 
-static int exynos_dp_remove(struct platform_device *pdev)
+void analogix_dp_unbind(struct device *dev, struct device *master, void *data)
 {
-	component_del(&pdev->dev, &exynos_dp_ops);
+	struct analogix_dp_device *dp = dev_get_drvdata(dev);
 
-	return 0;
+	analogix_dp_bridge_disable(dp->bridge);
 }
+EXPORT_SYMBOL_GPL(analogix_dp_unbind);
 
-#ifdef CONFIG_PM_SLEEP
-static int exynos_dp_suspend(struct device *dev)
+int analogix_dp_suspend(struct device *dev)
 {
-	struct exynos_dp_device *dp = dev_get_drvdata(dev);
+	struct analogix_dp_device *dp = dev_get_drvdata(dev);
 
-	exynos_dp_bridge_disable(dp->bridge);
+	analogix_dp_bridge_disable(dp->bridge);
 	return 0;
 }
+EXPORT_SYMBOL_GPL(analogix_dp_suspend);
 
-static int exynos_dp_resume(struct device *dev)
+int analogix_dp_resume(struct device *dev)
 {
-	struct exynos_dp_device *dp = dev_get_drvdata(dev);
+	struct analogix_dp_device *dp = dev_get_drvdata(dev);
 
-	exynos_dp_bridge_enable(dp->bridge);
+	analogix_dp_bridge_enable(dp->bridge);
 	return 0;
 }
-#endif
-
-static const struct dev_pm_ops exynos_dp_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(exynos_dp_suspend, exynos_dp_resume)
-};
-
-static const struct of_device_id exynos_dp_match[] = {
-	{ .compatible = "samsung,exynos5-dp" },
-	{},
-};
-MODULE_DEVICE_TABLE(of, exynos_dp_match);
-
-struct platform_driver dp_driver = {
-	.probe		= exynos_dp_probe,
-	.remove		= exynos_dp_remove,
-	.driver		= {
-		.name	= "exynos-dp",
-		.owner	= THIS_MODULE,
-		.pm	= &exynos_dp_pm_ops,
-		.of_match_table = exynos_dp_match,
-	},
-};
+EXPORT_SYMBOL_GPL(analogix_dp_resume);
 
 MODULE_AUTHOR("Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>");
-MODULE_DESCRIPTION("Samsung SoC DP Driver");
+MODULE_DESCRIPTION("Analogix Core DP Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/bridge/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix_dp_core.h
new file mode 100644
index 0000000..2cefde9
--- /dev/null
+++ b/drivers/gpu/drm/bridge/analogix_dp_core.h
@@ -0,0 +1,282 @@
+/*
+ * Header file for Samsung DP (Display Port) interface driver.
+ *
+ * Copyright (C) 2012 Samsung Electronics Co., Ltd.
+ * Author: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or (at your
+ * option) any later version.
+ */
+
+#ifndef _ANALOGIX_DP_CORE_H
+#define _ANALOGIX_DP_CORE_H
+
+#include <drm/drm_crtc.h>
+#include <drm/drm_dp_helper.h>
+
+#define DP_TIMEOUT_LOOP_COUNT 100
+#define MAX_CR_LOOP 5
+#define MAX_EQ_LOOP 5
+
+enum link_rate_type {
+	LINK_RATE_1_62GBPS = 0x06,
+	LINK_RATE_2_70GBPS = 0x0a
+};
+
+enum link_lane_count_type {
+	LANE_COUNT1 = 1,
+	LANE_COUNT2 = 2,
+	LANE_COUNT4 = 4
+};
+
+enum link_training_state {
+	START,
+	CLOCK_RECOVERY,
+	EQUALIZER_TRAINING,
+	FINISHED,
+	FAILED
+};
+
+enum voltage_swing_level {
+	VOLTAGE_LEVEL_0,
+	VOLTAGE_LEVEL_1,
+	VOLTAGE_LEVEL_2,
+	VOLTAGE_LEVEL_3,
+};
+
+enum pre_emphasis_level {
+	PRE_EMPHASIS_LEVEL_0,
+	PRE_EMPHASIS_LEVEL_1,
+	PRE_EMPHASIS_LEVEL_2,
+	PRE_EMPHASIS_LEVEL_3,
+};
+
+enum pattern_set {
+	PRBS7,
+	D10_2,
+	TRAINING_PTN1,
+	TRAINING_PTN2,
+	DP_NONE
+};
+
+enum color_space {
+	COLOR_RGB,
+	COLOR_YCBCR422,
+	COLOR_YCBCR444
+};
+
+enum color_depth {
+	COLOR_6,
+	COLOR_8,
+	COLOR_10,
+	COLOR_12
+};
+
+enum color_coefficient {
+	COLOR_YCBCR601,
+	COLOR_YCBCR709
+};
+
+enum dynamic_range {
+	VESA,
+	CEA
+};
+
+enum pll_status {
+	PLL_UNLOCKED,
+	PLL_LOCKED
+};
+
+enum clock_recovery_m_value_type {
+	CALCULATED_M,
+	REGISTER_M
+};
+
+enum video_timing_recognition_type {
+	VIDEO_TIMING_FROM_CAPTURE,
+	VIDEO_TIMING_FROM_REGISTER
+};
+
+enum analog_power_block {
+	AUX_BLOCK,
+	CH0_BLOCK,
+	CH1_BLOCK,
+	CH2_BLOCK,
+	CH3_BLOCK,
+	ANALOG_TOTAL,
+	POWER_ALL
+};
+
+enum dp_irq_type {
+	DP_IRQ_TYPE_HP_CABLE_IN,
+	DP_IRQ_TYPE_HP_CABLE_OUT,
+	DP_IRQ_TYPE_HP_CHANGE,
+	DP_IRQ_TYPE_UNKNOWN,
+};
+
+struct video_info {
+	char *name;
+
+	bool h_sync_polarity;
+	bool v_sync_polarity;
+	bool interlaced;
+
+	enum color_space color_space;
+	enum dynamic_range dynamic_range;
+	enum color_coefficient ycbcr_coeff;
+	enum color_depth color_depth;
+
+	enum link_rate_type link_rate;
+	enum link_lane_count_type lane_count;
+};
+
+struct link_train {
+	int eq_loop;
+	int cr_loop[4];
+
+	u8 link_rate;
+	u8 lane_count;
+	u8 training_lane[4];
+
+	enum link_training_state lt_state;
+};
+
+struct analogix_dp_device {
+	struct device		*dev;
+	struct drm_device	*drm_dev;
+	struct drm_connector	connector;
+	struct drm_encoder	*encoder;
+	struct drm_bridge	*bridge;
+	struct clk		*clock;
+	unsigned int		irq;
+	void __iomem		*reg_base;
+
+	struct video_info	*video_info;
+	struct link_train	link_train;
+	struct work_struct	hotplug_work;
+	struct phy		*phy;
+	int			dpms_mode;
+	int			hpd_gpio;
+
+	struct analogix_dp_plat_data *plat_data;
+};
+
+/* analogix_dp_reg.c */
+void analogix_dp_enable_video_mute(struct analogix_dp_device *dp, bool enable);
+void analogix_dp_stop_video(struct analogix_dp_device *dp);
+void analogix_dp_lane_swap(struct analogix_dp_device *dp, bool enable);
+void analogix_dp_init_analog_param(struct analogix_dp_device *dp);
+void analogix_dp_init_interrupt(struct analogix_dp_device *dp);
+void analogix_dp_reset(struct analogix_dp_device *dp);
+void analogix_dp_swreset(struct analogix_dp_device *dp);
+void analogix_dp_config_interrupt(struct analogix_dp_device *dp);
+enum pll_status analogix_dp_get_pll_lock_status(struct analogix_dp_device *dp);
+void analogix_dp_set_pll_power_down(struct analogix_dp_device *dp, bool enable);
+void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
+				       enum analog_power_block block,
+				       bool enable);
+void analogix_dp_init_analog_func(struct analogix_dp_device *dp);
+void analogix_dp_init_hpd(struct analogix_dp_device *dp);
+enum dp_irq_type analogix_dp_get_irq_type(struct analogix_dp_device *dp);
+void analogix_dp_clear_hotplug_interrupts(struct analogix_dp_device *dp);
+void analogix_dp_reset_aux(struct analogix_dp_device *dp);
+void analogix_dp_init_aux(struct analogix_dp_device *dp);
+int analogix_dp_get_plug_in_status(struct analogix_dp_device *dp);
+void analogix_dp_enable_sw_function(struct analogix_dp_device *dp);
+int analogix_dp_start_aux_transaction(struct analogix_dp_device *dp);
+int analogix_dp_write_byte_to_dpcd(struct analogix_dp_device *dp,
+				   unsigned int reg_addr,
+				   unsigned char data);
+int analogix_dp_read_byte_from_dpcd(struct analogix_dp_device *dp,
+				    unsigned int reg_addr,
+				    unsigned char *data);
+int analogix_dp_write_bytes_to_dpcd(struct analogix_dp_device *dp,
+				    unsigned int reg_addr,
+				    unsigned int count,
+				    unsigned char data[]);
+int analogix_dp_read_bytes_from_dpcd(struct analogix_dp_device *dp,
+				     unsigned int reg_addr,
+				     unsigned int count,
+				     unsigned char data[]);
+int analogix_dp_select_i2c_device(struct analogix_dp_device *dp,
+				  unsigned int device_addr,
+				  unsigned int reg_addr);
+int analogix_dp_read_byte_from_i2c(struct analogix_dp_device *dp,
+				   unsigned int device_addr,
+				   unsigned int reg_addr,
+				   unsigned int *data);
+int analogix_dp_read_bytes_from_i2c(struct analogix_dp_device *dp,
+				    unsigned int device_addr,
+				    unsigned int reg_addr,
+				    unsigned int count,
+				    unsigned char edid[]);
+void analogix_dp_set_link_bandwidth(struct analogix_dp_device *dp, u32 bwtype);
+void analogix_dp_get_link_bandwidth(struct analogix_dp_device *dp, u32 *bwtype);
+void analogix_dp_set_lane_count(struct analogix_dp_device *dp, u32 count);
+void analogix_dp_get_lane_count(struct analogix_dp_device *dp, u32 *count);
+void analogix_dp_enable_enhanced_mode(struct analogix_dp_device *dp,
+				      bool enable);
+void analogix_dp_set_training_pattern(struct analogix_dp_device *dp,
+				      enum pattern_set pattern);
+void analogix_dp_set_lane0_pre_emphasis(struct analogix_dp_device *dp,
+					u32 level);
+void analogix_dp_set_lane1_pre_emphasis(struct analogix_dp_device *dp,
+					u32 level);
+void analogix_dp_set_lane2_pre_emphasis(struct analogix_dp_device *dp,
+					u32 level);
+void analogix_dp_set_lane3_pre_emphasis(struct analogix_dp_device *dp,
+					u32 level);
+void analogix_dp_set_lane0_link_training(struct analogix_dp_device *dp,
+					 u32 training_lane);
+void analogix_dp_set_lane1_link_training(struct analogix_dp_device *dp,
+					 u32 training_lane);
+void analogix_dp_set_lane2_link_training(struct analogix_dp_device *dp,
+					 u32 training_lane);
+void analogix_dp_set_lane3_link_training(struct analogix_dp_device *dp,
+					 u32 training_lane);
+u32 analogix_dp_get_lane0_link_training(struct analogix_dp_device *dp);
+u32 analogix_dp_get_lane1_link_training(struct analogix_dp_device *dp);
+u32 analogix_dp_get_lane2_link_training(struct analogix_dp_device *dp);
+u32 analogix_dp_get_lane3_link_training(struct analogix_dp_device *dp);
+void analogix_dp_reset_macro(struct analogix_dp_device *dp);
+void analogix_dp_init_video(struct analogix_dp_device *dp);
+
+void analogix_dp_set_video_color_format(struct analogix_dp_device *dp);
+int analogix_dp_is_slave_video_stream_clock_on(struct analogix_dp_device *dp);
+void analogix_dp_set_video_cr_mn(struct analogix_dp_device *dp,
+				 enum clock_recovery_m_value_type type,
+				 u32 m_value, u32 n_value);
+void analogix_dp_set_video_timing_mode(struct analogix_dp_device *dp, u32 type);
+void analogix_dp_enable_video_master(struct analogix_dp_device *dp,
+				     bool enable);
+void analogix_dp_start_video(struct analogix_dp_device *dp);
+int analogix_dp_is_video_stream_on(struct analogix_dp_device *dp);
+void analogix_dp_config_video_slave_mode(struct analogix_dp_device *dp);
+void analogix_dp_enable_scrambling(struct analogix_dp_device *dp);
+void analogix_dp_disable_scrambling(struct analogix_dp_device *dp);
+
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
+#endif /* _ANALOGIX_DP_CORE_H */
diff --git a/drivers/gpu/drm/bridge/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix_dp_reg.c
new file mode 100644
index 0000000..cc5cdbf
--- /dev/null
+++ b/drivers/gpu/drm/bridge/analogix_dp_reg.c
@@ -0,0 +1,1265 @@
+/*
+ * Samsung DP (Display port) register interface driver.
+ *
+ * Copyright (C) 2012 Samsung Electronics Co., Ltd.
+ * Author: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or (at your
+ * option) any later version.
+ */
+
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/delay.h>
+#include <linux/gpio.h>
+
+#include "analogix_dp_core.h"
+#include "analogix_dp_reg.h"
+
+#define COMMON_INT_MASK_1	0
+#define COMMON_INT_MASK_2	0
+#define COMMON_INT_MASK_3	0
+#define COMMON_INT_MASK_4	(HOTPLUG_CHG | HPD_LOST | PLUG)
+#define INT_STA_MASK		INT_HPD
+
+void analogix_dp_enable_video_mute(struct analogix_dp_device *dp, bool enable)
+{
+	u32 reg;
+
+	if (enable) {
+		reg = readl(dp->reg_base + ANALOGIX_DP_VIDEO_CTL_1);
+		reg |= HDCP_VIDEO_MUTE;
+		writel(reg, dp->reg_base + ANALOGIX_DP_VIDEO_CTL_1);
+	} else {
+		reg = readl(dp->reg_base + ANALOGIX_DP_VIDEO_CTL_1);
+		reg &= ~HDCP_VIDEO_MUTE;
+		writel(reg, dp->reg_base + ANALOGIX_DP_VIDEO_CTL_1);
+	}
+}
+
+void analogix_dp_stop_video(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + ANALOGIX_DP_VIDEO_CTL_1);
+	reg &= ~VIDEO_EN;
+	writel(reg, dp->reg_base + ANALOGIX_DP_VIDEO_CTL_1);
+}
+
+void analogix_dp_lane_swap(struct analogix_dp_device *dp, bool enable)
+{
+	u32 reg;
+
+	if (enable)
+		reg = LANE3_MAP_LOGIC_LANE_0 | LANE2_MAP_LOGIC_LANE_1 |
+			LANE1_MAP_LOGIC_LANE_2 | LANE0_MAP_LOGIC_LANE_3;
+	else
+		reg = LANE3_MAP_LOGIC_LANE_3 | LANE2_MAP_LOGIC_LANE_2 |
+			LANE1_MAP_LOGIC_LANE_1 | LANE0_MAP_LOGIC_LANE_0;
+
+	writel(reg, dp->reg_base + ANALOGIX_DP_LANE_MAP);
+}
+
+void analogix_dp_init_analog_param(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	reg = TX_TERMINAL_CTRL_50_OHM;
+	writel(reg, dp->reg_base + ANALOGIX_DP_ANALOG_CTL_1);
+
+	reg = SEL_24M | TX_DVDD_BIT_1_0625V;
+	writel(reg, dp->reg_base + ANALOGIX_DP_ANALOG_CTL_2);
+
+	reg = DRIVE_DVDD_BIT_1_0625V | VCO_BIT_600_MICRO;
+	writel(reg, dp->reg_base + ANALOGIX_DP_ANALOG_CTL_3);
+
+	reg = PD_RING_OSC | AUX_TERMINAL_CTRL_50_OHM |
+		TX_CUR1_2X | TX_CUR_16_MA;
+	writel(reg, dp->reg_base + ANALOGIX_DP_PLL_FILTER_CTL_1);
+
+	reg = CH3_AMP_400_MV | CH2_AMP_400_MV |
+		CH1_AMP_400_MV | CH0_AMP_400_MV;
+	writel(reg, dp->reg_base + ANALOGIX_DP_TX_AMP_TUNING_CTL);
+}
+
+void analogix_dp_init_interrupt(struct analogix_dp_device *dp)
+{
+	/* Set interrupt pin assertion polarity as high */
+	writel(INT_POL1 | INT_POL0, dp->reg_base + ANALOGIX_DP_INT_CTL);
+
+	/* Clear pending regisers */
+	writel(0xff, dp->reg_base + ANALOGIX_DP_COMMON_INT_STA_1);
+	writel(0x4f, dp->reg_base + ANALOGIX_DP_COMMON_INT_STA_2);
+	writel(0xe0, dp->reg_base + ANALOGIX_DP_COMMON_INT_STA_3);
+	writel(0xe7, dp->reg_base + ANALOGIX_DP_COMMON_INT_STA_4);
+	writel(0x63, dp->reg_base + ANALOGIX_DP_INT_STA);
+
+	/* 0:mask,1: unmask */
+	writel(0x00, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_1);
+	writel(0x00, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_2);
+	writel(0x00, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_3);
+	writel(0x00, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_4);
+	writel(0x00, dp->reg_base + ANALOGIX_DP_INT_STA_MASK);
+}
+
+void analogix_dp_reset(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	analogix_dp_stop_video(dp);
+	analogix_dp_enable_video_mute(dp, 0);
+
+	reg = MASTER_VID_FUNC_EN_N | SLAVE_VID_FUNC_EN_N |
+		AUD_FIFO_FUNC_EN_N | AUD_FUNC_EN_N |
+		HDCP_FUNC_EN_N | SW_FUNC_EN_N;
+	writel(reg, dp->reg_base + ANALOGIX_DP_FUNC_EN_1);
+
+	reg = SSC_FUNC_EN_N | AUX_FUNC_EN_N |
+		SERDES_FIFO_FUNC_EN_N |
+		LS_CLK_DOMAIN_FUNC_EN_N;
+	writel(reg, dp->reg_base + ANALOGIX_DP_FUNC_EN_2);
+
+	usleep_range(20, 30);
+
+	analogix_dp_lane_swap(dp, 0);
+
+	writel(0x0, dp->reg_base + ANALOGIX_DP_SYS_CTL_1);
+	writel(0x40, dp->reg_base + ANALOGIX_DP_SYS_CTL_2);
+	writel(0x0, dp->reg_base + ANALOGIX_DP_SYS_CTL_3);
+	writel(0x0, dp->reg_base + ANALOGIX_DP_SYS_CTL_4);
+
+	writel(0x0, dp->reg_base + ANALOGIX_DP_PKT_SEND_CTL);
+	writel(0x0, dp->reg_base + ANALOGIX_DP_HDCP_CTL);
+
+	writel(0x5e, dp->reg_base + ANALOGIX_DP_HPD_DEGLITCH_L);
+	writel(0x1a, dp->reg_base + ANALOGIX_DP_HPD_DEGLITCH_H);
+
+	writel(0x10, dp->reg_base + ANALOGIX_DP_LINK_DEBUG_CTL);
+
+	writel(0x0, dp->reg_base + ANALOGIX_DP_PHY_TEST);
+
+	writel(0x0, dp->reg_base + ANALOGIX_DP_VIDEO_FIFO_THRD);
+	writel(0x20, dp->reg_base + ANALOGIX_DP_AUDIO_MARGIN);
+
+	writel(0x4, dp->reg_base + ANALOGIX_DP_M_VID_GEN_FILTER_TH);
+	writel(0x2, dp->reg_base + ANALOGIX_DP_M_AUD_GEN_FILTER_TH);
+
+	writel(0x00000101, dp->reg_base + ANALOGIX_DP_SOC_GENERAL_CTL);
+}
+
+void analogix_dp_swreset(struct analogix_dp_device *dp)
+{
+	writel(RESET_DP_TX, dp->reg_base + ANALOGIX_DP_TX_SW_RESET);
+}
+
+void analogix_dp_config_interrupt(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	/* 0: mask, 1: unmask */
+	reg = COMMON_INT_MASK_1;
+	writel(reg, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_1);
+
+	reg = COMMON_INT_MASK_2;
+	writel(reg, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_2);
+
+	reg = COMMON_INT_MASK_3;
+	writel(reg, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_3);
+
+	reg = COMMON_INT_MASK_4;
+	writel(reg, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_4);
+
+	reg = INT_STA_MASK;
+	writel(reg, dp->reg_base + ANALOGIX_DP_INT_STA_MASK);
+}
+
+enum pll_status analogix_dp_get_pll_lock_status(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + ANALOGIX_DP_DEBUG_CTL);
+	if (reg & PLL_LOCK)
+		return PLL_LOCKED;
+	else
+		return PLL_UNLOCKED;
+}
+
+void analogix_dp_set_pll_power_down(struct analogix_dp_device *dp, bool enable)
+{
+	u32 reg;
+
+	if (enable) {
+		reg = readl(dp->reg_base + ANALOGIX_DP_PLL_CTL);
+		reg |= DP_PLL_PD;
+		writel(reg, dp->reg_base + ANALOGIX_DP_PLL_CTL);
+	} else {
+		reg = readl(dp->reg_base + ANALOGIX_DP_PLL_CTL);
+		reg &= ~DP_PLL_PD;
+		writel(reg, dp->reg_base + ANALOGIX_DP_PLL_CTL);
+	}
+}
+
+void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
+				       enum analog_power_block block,
+				       bool enable)
+{
+	u32 reg;
+
+	switch (block) {
+	case AUX_BLOCK:
+		if (enable) {
+			reg = readl(dp->reg_base + ANALOGIX_DP_PHY_PD);
+			reg |= AUX_PD;
+			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
+		} else {
+			reg = readl(dp->reg_base + ANALOGIX_DP_PHY_PD);
+			reg &= ~AUX_PD;
+			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
+		}
+		break;
+	case CH0_BLOCK:
+		if (enable) {
+			reg = readl(dp->reg_base + ANALOGIX_DP_PHY_PD);
+			reg |= CH0_PD;
+			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
+		} else {
+			reg = readl(dp->reg_base + ANALOGIX_DP_PHY_PD);
+			reg &= ~CH0_PD;
+			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
+		}
+		break;
+	case CH1_BLOCK:
+		if (enable) {
+			reg = readl(dp->reg_base + ANALOGIX_DP_PHY_PD);
+			reg |= CH1_PD;
+			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
+		} else {
+			reg = readl(dp->reg_base + ANALOGIX_DP_PHY_PD);
+			reg &= ~CH1_PD;
+			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
+		}
+		break;
+	case CH2_BLOCK:
+		if (enable) {
+			reg = readl(dp->reg_base + ANALOGIX_DP_PHY_PD);
+			reg |= CH2_PD;
+			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
+		} else {
+			reg = readl(dp->reg_base + ANALOGIX_DP_PHY_PD);
+			reg &= ~CH2_PD;
+			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
+		}
+		break;
+	case CH3_BLOCK:
+		if (enable) {
+			reg = readl(dp->reg_base + ANALOGIX_DP_PHY_PD);
+			reg |= CH3_PD;
+			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
+		} else {
+			reg = readl(dp->reg_base + ANALOGIX_DP_PHY_PD);
+			reg &= ~CH3_PD;
+			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
+		}
+		break;
+	case ANALOG_TOTAL:
+		if (enable) {
+			reg = readl(dp->reg_base + ANALOGIX_DP_PHY_PD);
+			reg |= DP_PHY_PD;
+			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
+		} else {
+			reg = readl(dp->reg_base + ANALOGIX_DP_PHY_PD);
+			reg &= ~DP_PHY_PD;
+			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
+		}
+		break;
+	case POWER_ALL:
+		if (enable) {
+			reg = DP_PHY_PD | AUX_PD | CH3_PD | CH2_PD |
+				CH1_PD | CH0_PD;
+			writel(reg, dp->reg_base + ANALOGIX_DP_PHY_PD);
+		} else {
+			writel(0x00, dp->reg_base + ANALOGIX_DP_PHY_PD);
+		}
+		break;
+	default:
+		break;
+	}
+}
+
+void analogix_dp_init_analog_func(struct analogix_dp_device *dp)
+{
+	u32 reg;
+	int timeout_loop = 0;
+
+	analogix_dp_set_analog_power_down(dp, POWER_ALL, 0);
+
+	reg = PLL_LOCK_CHG;
+	writel(reg, dp->reg_base + ANALOGIX_DP_COMMON_INT_STA_1);
+
+	reg = readl(dp->reg_base + ANALOGIX_DP_DEBUG_CTL);
+	reg &= ~(F_PLL_LOCK | PLL_LOCK_CTRL);
+	writel(reg, dp->reg_base + ANALOGIX_DP_DEBUG_CTL);
+
+	/* Power up PLL */
+	if (analogix_dp_get_pll_lock_status(dp) == PLL_UNLOCKED) {
+		analogix_dp_set_pll_power_down(dp, 0);
+
+		while (analogix_dp_get_pll_lock_status(dp) == PLL_UNLOCKED) {
+			timeout_loop++;
+			if (DP_TIMEOUT_LOOP_COUNT < timeout_loop) {
+				dev_err(dp->dev, "failed to get pll lock status\n");
+				return;
+			}
+			usleep_range(10, 20);
+		}
+	}
+
+	/* Enable Serdes FIFO function and Link symbol clock domain module */
+	reg = readl(dp->reg_base + ANALOGIX_DP_FUNC_EN_2);
+	reg &= ~(SERDES_FIFO_FUNC_EN_N | LS_CLK_DOMAIN_FUNC_EN_N
+		| AUX_FUNC_EN_N);
+	writel(reg, dp->reg_base + ANALOGIX_DP_FUNC_EN_2);
+}
+
+void analogix_dp_clear_hotplug_interrupts(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	if (gpio_is_valid(dp->hpd_gpio))
+		return;
+
+	reg = HOTPLUG_CHG | HPD_LOST | PLUG;
+	writel(reg, dp->reg_base + ANALOGIX_DP_COMMON_INT_STA_4);
+
+	reg = INT_HPD;
+	writel(reg, dp->reg_base + ANALOGIX_DP_INT_STA);
+}
+
+void analogix_dp_init_hpd(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	if (gpio_is_valid(dp->hpd_gpio))
+		return;
+
+	analogix_dp_clear_hotplug_interrupts(dp);
+
+	reg = readl(dp->reg_base + ANALOGIX_DP_SYS_CTL_3);
+	reg &= ~(F_HPD | HPD_CTRL);
+	writel(reg, dp->reg_base + ANALOGIX_DP_SYS_CTL_3);
+}
+
+enum dp_irq_type analogix_dp_get_irq_type(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	if (gpio_is_valid(dp->hpd_gpio)) {
+		reg = gpio_get_value(dp->hpd_gpio);
+		if (reg)
+			return DP_IRQ_TYPE_HP_CABLE_IN;
+		else
+			return DP_IRQ_TYPE_HP_CABLE_OUT;
+	} else {
+		/* Parse hotplug interrupt status register */
+		reg = readl(dp->reg_base + ANALOGIX_DP_COMMON_INT_STA_4);
+
+		if (reg & PLUG)
+			return DP_IRQ_TYPE_HP_CABLE_IN;
+
+		if (reg & HPD_LOST)
+			return DP_IRQ_TYPE_HP_CABLE_OUT;
+
+		if (reg & HOTPLUG_CHG)
+			return DP_IRQ_TYPE_HP_CHANGE;
+
+		return DP_IRQ_TYPE_UNKNOWN;
+	}
+}
+
+void analogix_dp_reset_aux(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	/* Disable AUX channel module */
+	reg = readl(dp->reg_base + ANALOGIX_DP_FUNC_EN_2);
+	reg |= AUX_FUNC_EN_N;
+	writel(reg, dp->reg_base + ANALOGIX_DP_FUNC_EN_2);
+}
+
+void analogix_dp_init_aux(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	/* Clear inerrupts related to AUX channel */
+	reg = RPLY_RECEIV | AUX_ERR;
+	writel(reg, dp->reg_base + ANALOGIX_DP_INT_STA);
+
+	analogix_dp_reset_aux(dp);
+
+	/* Disable AUX transaction H/W retry */
+	reg = AUX_BIT_PERIOD_EXPECTED_DELAY(3) | AUX_HW_RETRY_COUNT_SEL(0) |
+	      AUX_HW_RETRY_INTERVAL_600_MICROSECONDS;
+	writel(reg, dp->reg_base + ANALOGIX_DP_AUX_HW_RETRY_CTL);
+
+	/* Receive AUX Channel DEFER commands equal to DEFFER_COUNT*64 */
+	reg = DEFER_CTRL_EN | DEFER_COUNT(1);
+	writel(reg, dp->reg_base + ANALOGIX_DP_AUX_CH_DEFER_CTL);
+
+	/* Enable AUX channel module */
+	reg = readl(dp->reg_base + ANALOGIX_DP_FUNC_EN_2);
+	reg &= ~AUX_FUNC_EN_N;
+	writel(reg, dp->reg_base + ANALOGIX_DP_FUNC_EN_2);
+}
+
+int analogix_dp_get_plug_in_status(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	if (gpio_is_valid(dp->hpd_gpio)) {
+		if (gpio_get_value(dp->hpd_gpio))
+			return 0;
+	} else {
+		reg = readl(dp->reg_base + ANALOGIX_DP_SYS_CTL_3);
+		if (reg & HPD_STATUS)
+			return 0;
+	}
+
+	return -EINVAL;
+}
+
+void analogix_dp_enable_sw_function(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + ANALOGIX_DP_FUNC_EN_1);
+	reg &= ~SW_FUNC_EN_N;
+	writel(reg, dp->reg_base + ANALOGIX_DP_FUNC_EN_1);
+}
+
+int analogix_dp_start_aux_transaction(struct analogix_dp_device *dp)
+{
+	int reg;
+	int retval = 0;
+	int timeout_loop = 0;
+
+	/* Enable AUX CH operation */
+	reg = readl(dp->reg_base + ANALOGIX_DP_AUX_CH_CTL_2);
+	reg |= AUX_EN;
+	writel(reg, dp->reg_base + ANALOGIX_DP_AUX_CH_CTL_2);
+
+	/* Is AUX CH command reply received? */
+	reg = readl(dp->reg_base + ANALOGIX_DP_INT_STA);
+	while (!(reg & RPLY_RECEIV)) {
+		timeout_loop++;
+		if (DP_TIMEOUT_LOOP_COUNT < timeout_loop) {
+			dev_err(dp->dev, "AUX CH command reply failed!\n");
+			return -ETIMEDOUT;
+		}
+		reg = readl(dp->reg_base + ANALOGIX_DP_INT_STA);
+		usleep_range(10, 11);
+	}
+
+	/* Clear interrupt source for AUX CH command reply */
+	writel(RPLY_RECEIV, dp->reg_base + ANALOGIX_DP_INT_STA);
+
+	/* Clear interrupt source for AUX CH access error */
+	reg = readl(dp->reg_base + ANALOGIX_DP_INT_STA);
+	if (reg & AUX_ERR) {
+		writel(AUX_ERR, dp->reg_base + ANALOGIX_DP_INT_STA);
+		return -EREMOTEIO;
+	}
+
+	/* Check AUX CH error access status */
+	reg = readl(dp->reg_base + ANALOGIX_DP_AUX_CH_STA);
+	if ((reg & AUX_STATUS_MASK) != 0) {
+		dev_err(dp->dev, "AUX CH error happens: %d\n\n",
+			reg & AUX_STATUS_MASK);
+		return -EREMOTEIO;
+	}
+
+	return retval;
+}
+
+int analogix_dp_write_byte_to_dpcd(struct analogix_dp_device *dp,
+				   unsigned int reg_addr,
+				   unsigned char data)
+{
+	u32 reg;
+	int i;
+	int retval;
+
+	for (i = 0; i < 3; i++) {
+		/* Clear AUX CH data buffer */
+		reg = BUF_CLR;
+		writel(reg, dp->reg_base + ANALOGIX_DP_BUFFER_DATA_CTL);
+
+		/* Select DPCD device address */
+		reg = AUX_ADDR_7_0(reg_addr);
+		writel(reg, dp->reg_base + ANALOGIX_DP_AUX_ADDR_7_0);
+		reg = AUX_ADDR_15_8(reg_addr);
+		writel(reg, dp->reg_base + ANALOGIX_DP_AUX_ADDR_15_8);
+		reg = AUX_ADDR_19_16(reg_addr);
+		writel(reg, dp->reg_base + ANALOGIX_DP_AUX_ADDR_19_16);
+
+		/* Write data buffer */
+		reg = (unsigned int)data;
+		writel(reg, dp->reg_base + ANALOGIX_DP_BUF_DATA_0);
+
+		/*
+		 * Set DisplayPort transaction and write 1 byte
+		 * If bit 3 is 1, DisplayPort transaction.
+		 * If Bit 3 is 0, I2C transaction.
+		 */
+		reg = AUX_TX_COMM_DP_TRANSACTION | AUX_TX_COMM_WRITE;
+		writel(reg, dp->reg_base + ANALOGIX_DP_AUX_CH_CTL_1);
+
+		/* Start AUX transaction */
+		retval = analogix_dp_start_aux_transaction(dp);
+		if (retval == 0)
+			break;
+
+		dev_dbg(dp->dev, "%s: Aux Transaction fail!\n", __func__);
+	}
+
+	return retval;
+}
+
+int analogix_dp_read_byte_from_dpcd(struct analogix_dp_device *dp,
+				    unsigned int reg_addr,
+				    unsigned char *data)
+{
+	u32 reg;
+	int i;
+	int retval;
+
+	for (i = 0; i < 3; i++) {
+		/* Clear AUX CH data buffer */
+		reg = BUF_CLR;
+		writel(reg, dp->reg_base + ANALOGIX_DP_BUFFER_DATA_CTL);
+
+		/* Select DPCD device address */
+		reg = AUX_ADDR_7_0(reg_addr);
+		writel(reg, dp->reg_base + ANALOGIX_DP_AUX_ADDR_7_0);
+		reg = AUX_ADDR_15_8(reg_addr);
+		writel(reg, dp->reg_base + ANALOGIX_DP_AUX_ADDR_15_8);
+		reg = AUX_ADDR_19_16(reg_addr);
+		writel(reg, dp->reg_base + ANALOGIX_DP_AUX_ADDR_19_16);
+
+		/*
+		 * Set DisplayPort transaction and read 1 byte
+		 * If bit 3 is 1, DisplayPort transaction.
+		 * If Bit 3 is 0, I2C transaction.
+		 */
+		reg = AUX_TX_COMM_DP_TRANSACTION | AUX_TX_COMM_READ;
+		writel(reg, dp->reg_base + ANALOGIX_DP_AUX_CH_CTL_1);
+
+		/* Start AUX transaction */
+		retval = analogix_dp_start_aux_transaction(dp);
+		if (retval == 0)
+			break;
+
+		dev_dbg(dp->dev, "%s: Aux Transaction fail!\n", __func__);
+	}
+
+	/* Read data buffer */
+	reg = readl(dp->reg_base + ANALOGIX_DP_BUF_DATA_0);
+	*data = (unsigned char)(reg & 0xff);
+
+	return retval;
+}
+
+int analogix_dp_write_bytes_to_dpcd(struct analogix_dp_device *dp,
+				    unsigned int reg_addr,
+				    unsigned int count,
+				    unsigned char data[])
+{
+	u32 reg;
+	unsigned int start_offset;
+	unsigned int cur_data_count;
+	unsigned int cur_data_idx;
+	int i;
+	int retval = 0;
+
+	/* Clear AUX CH data buffer */
+	reg = BUF_CLR;
+	writel(reg, dp->reg_base + ANALOGIX_DP_BUFFER_DATA_CTL);
+
+	start_offset = 0;
+	while (start_offset < count) {
+		/* Buffer size of AUX CH is 16 * 4bytes */
+		if ((count - start_offset) > 16)
+			cur_data_count = 16;
+		else
+			cur_data_count = count - start_offset;
+
+		for (i = 0; i < 3; i++) {
+			/* Select DPCD device address */
+			reg = AUX_ADDR_7_0(reg_addr + start_offset);
+			writel(reg, dp->reg_base + ANALOGIX_DP_AUX_ADDR_7_0);
+			reg = AUX_ADDR_15_8(reg_addr + start_offset);
+			writel(reg, dp->reg_base + ANALOGIX_DP_AUX_ADDR_15_8);
+			reg = AUX_ADDR_19_16(reg_addr + start_offset);
+			writel(reg, dp->reg_base + ANALOGIX_DP_AUX_ADDR_19_16);
+
+			for (cur_data_idx = 0; cur_data_idx < cur_data_count;
+			     cur_data_idx++) {
+				reg = data[start_offset + cur_data_idx];
+				writel(reg, dp->reg_base +
+				       ANALOGIX_DP_BUF_DATA_0 +
+				       4 * cur_data_idx);
+			}
+
+			/*
+			 * Set DisplayPort transaction and write
+			 * If bit 3 is 1, DisplayPort transaction.
+			 * If Bit 3 is 0, I2C transaction.
+			 */
+			reg = AUX_LENGTH(cur_data_count) |
+				AUX_TX_COMM_DP_TRANSACTION | AUX_TX_COMM_WRITE;
+			writel(reg, dp->reg_base + ANALOGIX_DP_AUX_CH_CTL_1);
+
+			/* Start AUX transaction */
+			retval = analogix_dp_start_aux_transaction(dp);
+			if (retval == 0)
+				break;
+
+			dev_dbg(dp->dev, "%s: Aux Transaction fail!\n",
+				__func__);
+		}
+
+		start_offset += cur_data_count;
+	}
+
+	return retval;
+}
+
+int analogix_dp_read_bytes_from_dpcd(struct analogix_dp_device *dp,
+				     unsigned int reg_addr,
+				     unsigned int count,
+				     unsigned char data[])
+{
+	u32 reg;
+	unsigned int start_offset;
+	unsigned int cur_data_count;
+	unsigned int cur_data_idx;
+	int i;
+	int retval = 0;
+
+	/* Clear AUX CH data buffer */
+	reg = BUF_CLR;
+	writel(reg, dp->reg_base + ANALOGIX_DP_BUFFER_DATA_CTL);
+
+	start_offset = 0;
+	while (start_offset < count) {
+		/* Buffer size of AUX CH is 16 * 4bytes */
+		if ((count - start_offset) > 16)
+			cur_data_count = 16;
+		else
+			cur_data_count = count - start_offset;
+
+		/* AUX CH Request Transaction process */
+		for (i = 0; i < 3; i++) {
+			/* Select DPCD device address */
+			reg = AUX_ADDR_7_0(reg_addr + start_offset);
+			writel(reg, dp->reg_base + ANALOGIX_DP_AUX_ADDR_7_0);
+			reg = AUX_ADDR_15_8(reg_addr + start_offset);
+			writel(reg, dp->reg_base + ANALOGIX_DP_AUX_ADDR_15_8);
+			reg = AUX_ADDR_19_16(reg_addr + start_offset);
+			writel(reg, dp->reg_base + ANALOGIX_DP_AUX_ADDR_19_16);
+
+			/*
+			 * Set DisplayPort transaction and read
+			 * If bit 3 is 1, DisplayPort transaction.
+			 * If Bit 3 is 0, I2C transaction.
+			 */
+			reg = AUX_LENGTH(cur_data_count) |
+				AUX_TX_COMM_DP_TRANSACTION | AUX_TX_COMM_READ;
+			writel(reg, dp->reg_base + ANALOGIX_DP_AUX_CH_CTL_1);
+
+			/* Start AUX transaction */
+			retval = analogix_dp_start_aux_transaction(dp);
+			if (retval == 0)
+				break;
+
+			dev_dbg(dp->dev, "%s: Aux Transaction fail!\n",
+				__func__);
+		}
+
+		for (cur_data_idx = 0; cur_data_idx < cur_data_count;
+		    cur_data_idx++) {
+			reg = readl(dp->reg_base + ANALOGIX_DP_BUF_DATA_0
+						 + 4 * cur_data_idx);
+			data[start_offset + cur_data_idx] =
+				(unsigned char)reg;
+		}
+
+		start_offset += cur_data_count;
+	}
+
+	return retval;
+}
+
+int analogix_dp_select_i2c_device(struct analogix_dp_device *dp,
+				  unsigned int device_addr,
+				  unsigned int reg_addr)
+{
+	u32 reg;
+	int retval;
+
+	/* Set EDID device address */
+	reg = device_addr;
+	writel(reg, dp->reg_base + ANALOGIX_DP_AUX_ADDR_7_0);
+	writel(0x0, dp->reg_base + ANALOGIX_DP_AUX_ADDR_15_8);
+	writel(0x0, dp->reg_base + ANALOGIX_DP_AUX_ADDR_19_16);
+
+	/* Set offset from base address of EDID device */
+	writel(reg_addr, dp->reg_base + ANALOGIX_DP_BUF_DATA_0);
+
+	/*
+	 * Set I2C transaction and write address
+	 * If bit 3 is 1, DisplayPort transaction.
+	 * If Bit 3 is 0, I2C transaction.
+	 */
+	reg = AUX_TX_COMM_I2C_TRANSACTION | AUX_TX_COMM_MOT |
+		AUX_TX_COMM_WRITE;
+	writel(reg, dp->reg_base + ANALOGIX_DP_AUX_CH_CTL_1);
+
+	/* Start AUX transaction */
+	retval = analogix_dp_start_aux_transaction(dp);
+	if (retval != 0)
+		dev_dbg(dp->dev, "%s: Aux Transaction fail!\n", __func__);
+
+	return retval;
+}
+
+int analogix_dp_read_byte_from_i2c(struct analogix_dp_device *dp,
+				   unsigned int device_addr,
+				   unsigned int reg_addr,
+				   unsigned int *data)
+{
+	u32 reg;
+	int i;
+	int retval;
+
+	for (i = 0; i < 3; i++) {
+		/* Clear AUX CH data buffer */
+		reg = BUF_CLR;
+		writel(reg, dp->reg_base + ANALOGIX_DP_BUFFER_DATA_CTL);
+
+		/* Select EDID device */
+		retval = analogix_dp_select_i2c_device(dp, device_addr,
+						       reg_addr);
+		if (retval != 0)
+			continue;
+
+		/*
+		 * Set I2C transaction and read data
+		 * If bit 3 is 1, DisplayPort transaction.
+		 * If Bit 3 is 0, I2C transaction.
+		 */
+		reg = AUX_TX_COMM_I2C_TRANSACTION |
+			AUX_TX_COMM_READ;
+		writel(reg, dp->reg_base + ANALOGIX_DP_AUX_CH_CTL_1);
+
+		/* Start AUX transaction */
+		retval = analogix_dp_start_aux_transaction(dp);
+		if (retval == 0)
+			break;
+
+		dev_dbg(dp->dev, "%s: Aux Transaction fail!\n", __func__);
+	}
+
+	/* Read data */
+	if (retval == 0)
+		*data = readl(dp->reg_base + ANALOGIX_DP_BUF_DATA_0);
+
+	return retval;
+}
+
+int analogix_dp_read_bytes_from_i2c(struct analogix_dp_device *dp,
+				    unsigned int device_addr,
+				    unsigned int reg_addr,
+				    unsigned int count,
+				    unsigned char edid[])
+{
+	u32 reg;
+	unsigned int i, j;
+	unsigned int cur_data_idx;
+	unsigned int defer = 0;
+	int retval = 0;
+
+	for (i = 0; i < count; i += 16) {
+		for (j = 0; j < 3; j++) {
+			/* Clear AUX CH data buffer */
+			reg = BUF_CLR;
+			writel(reg, dp->reg_base + ANALOGIX_DP_BUFFER_DATA_CTL);
+
+			/* Set normal AUX CH command */
+			reg = readl(dp->reg_base + ANALOGIX_DP_AUX_CH_CTL_2);
+			reg &= ~ADDR_ONLY;
+			writel(reg, dp->reg_base + ANALOGIX_DP_AUX_CH_CTL_2);
+
+			/*
+			 * If Rx sends defer, Tx sends only reads
+			 * request without sending address
+			 */
+			if (!defer)
+				retval = analogix_dp_select_i2c_device(
+						dp, device_addr, reg_addr + i);
+			else
+				defer = 0;
+
+			if (retval == 0) {
+				/*
+				 * Set I2C transaction and write data
+				 * If bit 3 is 1, DisplayPort transaction.
+				 * If Bit 3 is 0, I2C transaction.
+				 */
+				reg = AUX_LENGTH(16) |
+					AUX_TX_COMM_I2C_TRANSACTION |
+					AUX_TX_COMM_READ;
+				writel(reg, dp->reg_base +
+					ANALOGIX_DP_AUX_CH_CTL_1);
+
+				/* Start AUX transaction */
+				retval = analogix_dp_start_aux_transaction(dp);
+				if (retval == 0)
+					break;
+
+				dev_dbg(dp->dev, "%s: Aux Transaction fail!\n",
+					__func__);
+			}
+			/* Check if Rx sends defer */
+			reg = readl(dp->reg_base + ANALOGIX_DP_AUX_RX_COMM);
+			if (reg == AUX_RX_COMM_AUX_DEFER ||
+			    reg == AUX_RX_COMM_I2C_DEFER) {
+				dev_err(dp->dev, "Defer: %d\n\n", reg);
+				defer = 1;
+			}
+		}
+
+		for (cur_data_idx = 0; cur_data_idx < 16; cur_data_idx++) {
+			reg = readl(dp->reg_base + ANALOGIX_DP_BUF_DATA_0
+						 + 4 * cur_data_idx);
+			edid[i + cur_data_idx] = (unsigned char)reg;
+		}
+	}
+
+	return retval;
+}
+
+void analogix_dp_set_link_bandwidth(struct analogix_dp_device *dp, u32 bwtype)
+{
+	u32 reg;
+
+	reg = bwtype;
+	if ((bwtype == LINK_RATE_2_70GBPS) || (bwtype == LINK_RATE_1_62GBPS))
+		writel(reg, dp->reg_base + ANALOGIX_DP_LINK_BW_SET);
+}
+
+void analogix_dp_get_link_bandwidth(struct analogix_dp_device *dp, u32 *bwtype)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + ANALOGIX_DP_LINK_BW_SET);
+	*bwtype = reg;
+}
+
+void analogix_dp_set_lane_count(struct analogix_dp_device *dp, u32 count)
+{
+	u32 reg;
+
+	reg = count;
+	writel(reg, dp->reg_base + ANALOGIX_DP_LANE_COUNT_SET);
+}
+
+void analogix_dp_get_lane_count(struct analogix_dp_device *dp, u32 *count)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + ANALOGIX_DP_LANE_COUNT_SET);
+	*count = reg;
+}
+
+void analogix_dp_enable_enhanced_mode(struct analogix_dp_device *dp,
+				      bool enable)
+{
+	u32 reg;
+
+	if (enable) {
+		reg = readl(dp->reg_base + ANALOGIX_DP_SYS_CTL_4);
+		reg |= ENHANCED;
+		writel(reg, dp->reg_base + ANALOGIX_DP_SYS_CTL_4);
+	} else {
+		reg = readl(dp->reg_base + ANALOGIX_DP_SYS_CTL_4);
+		reg &= ~ENHANCED;
+		writel(reg, dp->reg_base + ANALOGIX_DP_SYS_CTL_4);
+	}
+}
+
+void analogix_dp_set_training_pattern(struct analogix_dp_device *dp,
+				      enum pattern_set pattern)
+{
+	u32 reg;
+
+	switch (pattern) {
+	case PRBS7:
+		reg = SCRAMBLING_ENABLE | LINK_QUAL_PATTERN_SET_PRBS7;
+		writel(reg, dp->reg_base + ANALOGIX_DP_TRAINING_PTN_SET);
+		break;
+	case D10_2:
+		reg = SCRAMBLING_ENABLE | LINK_QUAL_PATTERN_SET_D10_2;
+		writel(reg, dp->reg_base + ANALOGIX_DP_TRAINING_PTN_SET);
+		break;
+	case TRAINING_PTN1:
+		reg = SCRAMBLING_DISABLE | SW_TRAINING_PATTERN_SET_PTN1;
+		writel(reg, dp->reg_base + ANALOGIX_DP_TRAINING_PTN_SET);
+		break;
+	case TRAINING_PTN2:
+		reg = SCRAMBLING_DISABLE | SW_TRAINING_PATTERN_SET_PTN2;
+		writel(reg, dp->reg_base + ANALOGIX_DP_TRAINING_PTN_SET);
+		break;
+	case DP_NONE:
+		reg = SCRAMBLING_ENABLE |
+			LINK_QUAL_PATTERN_SET_DISABLE |
+			SW_TRAINING_PATTERN_SET_NORMAL;
+		writel(reg, dp->reg_base + ANALOGIX_DP_TRAINING_PTN_SET);
+		break;
+	default:
+		break;
+	}
+}
+
+void analogix_dp_set_lane0_pre_emphasis(struct analogix_dp_device *dp,
+					u32 level)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + ANALOGIX_DP_LN0_LINK_TRAINING_CTL);
+	reg &= ~PRE_EMPHASIS_SET_MASK;
+	reg |= level << PRE_EMPHASIS_SET_SHIFT;
+	writel(reg, dp->reg_base + ANALOGIX_DP_LN0_LINK_TRAINING_CTL);
+}
+
+void analogix_dp_set_lane1_pre_emphasis(struct analogix_dp_device *dp,
+					u32 level)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + ANALOGIX_DP_LN1_LINK_TRAINING_CTL);
+	reg &= ~PRE_EMPHASIS_SET_MASK;
+	reg |= level << PRE_EMPHASIS_SET_SHIFT;
+	writel(reg, dp->reg_base + ANALOGIX_DP_LN1_LINK_TRAINING_CTL);
+}
+
+void analogix_dp_set_lane2_pre_emphasis(struct analogix_dp_device *dp,
+					u32 level)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + ANALOGIX_DP_LN2_LINK_TRAINING_CTL);
+	reg &= ~PRE_EMPHASIS_SET_MASK;
+	reg |= level << PRE_EMPHASIS_SET_SHIFT;
+	writel(reg, dp->reg_base + ANALOGIX_DP_LN2_LINK_TRAINING_CTL);
+}
+
+void analogix_dp_set_lane3_pre_emphasis(struct analogix_dp_device *dp,
+					u32 level)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + ANALOGIX_DP_LN3_LINK_TRAINING_CTL);
+	reg &= ~PRE_EMPHASIS_SET_MASK;
+	reg |= level << PRE_EMPHASIS_SET_SHIFT;
+	writel(reg, dp->reg_base + ANALOGIX_DP_LN3_LINK_TRAINING_CTL);
+}
+
+void analogix_dp_set_lane0_link_training(struct analogix_dp_device *dp,
+					 u32 training_lane)
+{
+	u32 reg;
+
+	reg = training_lane;
+	writel(reg, dp->reg_base + ANALOGIX_DP_LN0_LINK_TRAINING_CTL);
+}
+
+void analogix_dp_set_lane1_link_training(struct analogix_dp_device *dp,
+					 u32 training_lane)
+{
+	u32 reg;
+
+	reg = training_lane;
+	writel(reg, dp->reg_base + ANALOGIX_DP_LN1_LINK_TRAINING_CTL);
+}
+
+void analogix_dp_set_lane2_link_training(struct analogix_dp_device *dp,
+					 u32 training_lane)
+{
+	u32 reg;
+
+	reg = training_lane;
+	writel(reg, dp->reg_base + ANALOGIX_DP_LN2_LINK_TRAINING_CTL);
+}
+
+void analogix_dp_set_lane3_link_training(struct analogix_dp_device *dp,
+					 u32 training_lane)
+{
+	u32 reg;
+
+	reg = training_lane;
+	writel(reg, dp->reg_base + ANALOGIX_DP_LN3_LINK_TRAINING_CTL);
+}
+
+u32 analogix_dp_get_lane0_link_training(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + ANALOGIX_DP_LN0_LINK_TRAINING_CTL);
+	return reg;
+}
+
+u32 analogix_dp_get_lane1_link_training(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + ANALOGIX_DP_LN1_LINK_TRAINING_CTL);
+	return reg;
+}
+
+u32 analogix_dp_get_lane2_link_training(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + ANALOGIX_DP_LN2_LINK_TRAINING_CTL);
+	return reg;
+}
+
+u32 analogix_dp_get_lane3_link_training(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + ANALOGIX_DP_LN3_LINK_TRAINING_CTL);
+	return reg;
+}
+
+void analogix_dp_reset_macro(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + ANALOGIX_DP_PHY_TEST);
+	reg |= MACRO_RST;
+	writel(reg, dp->reg_base + ANALOGIX_DP_PHY_TEST);
+
+	/* 10 us is the minimum reset time. */
+	usleep_range(10, 20);
+
+	reg &= ~MACRO_RST;
+	writel(reg, dp->reg_base + ANALOGIX_DP_PHY_TEST);
+}
+
+void analogix_dp_init_video(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	reg = VSYNC_DET | VID_FORMAT_CHG | VID_CLK_CHG;
+	writel(reg, dp->reg_base + ANALOGIX_DP_COMMON_INT_STA_1);
+
+	reg = 0x0;
+	writel(reg, dp->reg_base + ANALOGIX_DP_SYS_CTL_1);
+
+	reg = CHA_CRI(4) | CHA_CTRL;
+	writel(reg, dp->reg_base + ANALOGIX_DP_SYS_CTL_2);
+
+	reg = 0x0;
+	writel(reg, dp->reg_base + ANALOGIX_DP_SYS_CTL_3);
+
+	reg = VID_HRES_TH(2) | VID_VRES_TH(0);
+	writel(reg, dp->reg_base + ANALOGIX_DP_VIDEO_CTL_8);
+}
+
+void analogix_dp_set_video_color_format(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	/* Configure the input color depth, color space, dynamic range */
+	reg = (dp->video_info->dynamic_range << IN_D_RANGE_SHIFT) |
+		(dp->video_info->color_depth << IN_BPC_SHIFT) |
+		(dp->video_info->color_space << IN_COLOR_F_SHIFT);
+	writel(reg, dp->reg_base + ANALOGIX_DP_VIDEO_CTL_2);
+
+	/* Set Input Color YCbCr Coefficients to ITU601 or ITU709 */
+	reg = readl(dp->reg_base + ANALOGIX_DP_VIDEO_CTL_3);
+	reg &= ~IN_YC_COEFFI_MASK;
+	if (dp->video_info->ycbcr_coeff)
+		reg |= IN_YC_COEFFI_ITU709;
+	else
+		reg |= IN_YC_COEFFI_ITU601;
+	writel(reg, dp->reg_base + ANALOGIX_DP_VIDEO_CTL_3);
+}
+
+int analogix_dp_is_slave_video_stream_clock_on(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + ANALOGIX_DP_SYS_CTL_1);
+	writel(reg, dp->reg_base + ANALOGIX_DP_SYS_CTL_1);
+
+	reg = readl(dp->reg_base + ANALOGIX_DP_SYS_CTL_1);
+
+	if (!(reg & DET_STA)) {
+		dev_dbg(dp->dev, "Input stream clock not detected.\n");
+		return -EINVAL;
+	}
+
+	reg = readl(dp->reg_base + ANALOGIX_DP_SYS_CTL_2);
+	writel(reg, dp->reg_base + ANALOGIX_DP_SYS_CTL_2);
+
+	reg = readl(dp->reg_base + ANALOGIX_DP_SYS_CTL_2);
+	dev_dbg(dp->dev, "wait SYS_CTL_2.\n");
+
+	if (reg & CHA_STA) {
+		dev_dbg(dp->dev, "Input stream clk is changing\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+void analogix_dp_set_video_cr_mn(struct analogix_dp_device *dp,
+				 enum clock_recovery_m_value_type type,
+				 u32 m_value, u32 n_value)
+{
+	u32 reg;
+
+	if (type == REGISTER_M) {
+		reg = readl(dp->reg_base + ANALOGIX_DP_SYS_CTL_4);
+		reg |= FIX_M_VID;
+		writel(reg, dp->reg_base + ANALOGIX_DP_SYS_CTL_4);
+		reg = m_value & 0xff;
+		writel(reg, dp->reg_base + ANALOGIX_DP_M_VID_0);
+		reg = (m_value >> 8) & 0xff;
+		writel(reg, dp->reg_base + ANALOGIX_DP_M_VID_1);
+		reg = (m_value >> 16) & 0xff;
+		writel(reg, dp->reg_base + ANALOGIX_DP_M_VID_2);
+
+		reg = n_value & 0xff;
+		writel(reg, dp->reg_base + ANALOGIX_DP_N_VID_0);
+		reg = (n_value >> 8) & 0xff;
+		writel(reg, dp->reg_base + ANALOGIX_DP_N_VID_1);
+		reg = (n_value >> 16) & 0xff;
+		writel(reg, dp->reg_base + ANALOGIX_DP_N_VID_2);
+	} else  {
+		reg = readl(dp->reg_base + ANALOGIX_DP_SYS_CTL_4);
+		reg &= ~FIX_M_VID;
+		writel(reg, dp->reg_base + ANALOGIX_DP_SYS_CTL_4);
+
+		writel(0x00, dp->reg_base + ANALOGIX_DP_N_VID_0);
+		writel(0x80, dp->reg_base + ANALOGIX_DP_N_VID_1);
+		writel(0x00, dp->reg_base + ANALOGIX_DP_N_VID_2);
+	}
+}
+
+void analogix_dp_set_video_timing_mode(struct analogix_dp_device *dp, u32 type)
+{
+	u32 reg;
+
+	if (type == VIDEO_TIMING_FROM_CAPTURE) {
+		reg = readl(dp->reg_base + ANALOGIX_DP_VIDEO_CTL_10);
+		reg &= ~FORMAT_SEL;
+		writel(reg, dp->reg_base + ANALOGIX_DP_VIDEO_CTL_10);
+	} else {
+		reg = readl(dp->reg_base + ANALOGIX_DP_VIDEO_CTL_10);
+		reg |= FORMAT_SEL;
+		writel(reg, dp->reg_base + ANALOGIX_DP_VIDEO_CTL_10);
+	}
+}
+
+void analogix_dp_enable_video_master(struct analogix_dp_device *dp, bool enable)
+{
+	u32 reg;
+
+	if (enable) {
+		reg = readl(dp->reg_base + ANALOGIX_DP_SOC_GENERAL_CTL);
+		reg &= ~VIDEO_MODE_MASK;
+		reg |= VIDEO_MASTER_MODE_EN | VIDEO_MODE_MASTER_MODE;
+		writel(reg, dp->reg_base + ANALOGIX_DP_SOC_GENERAL_CTL);
+	} else {
+		reg = readl(dp->reg_base + ANALOGIX_DP_SOC_GENERAL_CTL);
+		reg &= ~VIDEO_MODE_MASK;
+		reg |= VIDEO_MODE_SLAVE_MODE;
+		writel(reg, dp->reg_base + ANALOGIX_DP_SOC_GENERAL_CTL);
+	}
+}
+
+void analogix_dp_start_video(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + ANALOGIX_DP_VIDEO_CTL_1);
+	reg |= VIDEO_EN;
+	writel(reg, dp->reg_base + ANALOGIX_DP_VIDEO_CTL_1);
+}
+
+int analogix_dp_is_video_stream_on(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + ANALOGIX_DP_SYS_CTL_3);
+	writel(reg, dp->reg_base + ANALOGIX_DP_SYS_CTL_3);
+
+	reg = readl(dp->reg_base + ANALOGIX_DP_SYS_CTL_3);
+	if (!(reg & STRM_VALID)) {
+		dev_dbg(dp->dev, "Input video stream is not detected.\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+void analogix_dp_config_video_slave_mode(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + ANALOGIX_DP_FUNC_EN_1);
+	reg &= ~(MASTER_VID_FUNC_EN_N | SLAVE_VID_FUNC_EN_N);
+	reg |= MASTER_VID_FUNC_EN_N;
+	writel(reg, dp->reg_base + ANALOGIX_DP_FUNC_EN_1);
+
+	reg = readl(dp->reg_base + ANALOGIX_DP_VIDEO_CTL_10);
+	reg &= ~INTERACE_SCAN_CFG;
+	reg |= (dp->video_info->interlaced << 2);
+	writel(reg, dp->reg_base + ANALOGIX_DP_VIDEO_CTL_10);
+
+	reg = readl(dp->reg_base + ANALOGIX_DP_VIDEO_CTL_10);
+	reg &= ~VSYNC_POLARITY_CFG;
+	reg |= (dp->video_info->v_sync_polarity << 1);
+	writel(reg, dp->reg_base + ANALOGIX_DP_VIDEO_CTL_10);
+
+	reg = readl(dp->reg_base + ANALOGIX_DP_VIDEO_CTL_10);
+	reg &= ~HSYNC_POLARITY_CFG;
+	reg |= (dp->video_info->h_sync_polarity << 0);
+	writel(reg, dp->reg_base + ANALOGIX_DP_VIDEO_CTL_10);
+
+	reg = AUDIO_MODE_SPDIF_MODE | VIDEO_MODE_SLAVE_MODE;
+	writel(reg, dp->reg_base + ANALOGIX_DP_SOC_GENERAL_CTL);
+}
+
+void analogix_dp_enable_scrambling(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + ANALOGIX_DP_TRAINING_PTN_SET);
+	reg &= ~SCRAMBLING_DISABLE;
+	writel(reg, dp->reg_base + ANALOGIX_DP_TRAINING_PTN_SET);
+}
+
+void analogix_dp_disable_scrambling(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + ANALOGIX_DP_TRAINING_PTN_SET);
+	reg |= SCRAMBLING_DISABLE;
+	writel(reg, dp->reg_base + ANALOGIX_DP_TRAINING_PTN_SET);
+}
diff --git a/drivers/gpu/drm/exynos/exynos_dp_reg.h b/drivers/gpu/drm/bridge/analogix_dp_reg.h
similarity index 64%
rename from drivers/gpu/drm/exynos/exynos_dp_reg.h
rename to drivers/gpu/drm/bridge/analogix_dp_reg.h
index 2e9bd0e..bed226f 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_reg.h
+++ b/drivers/gpu/drm/bridge/analogix_dp_reg.h
@@ -1,5 +1,5 @@
 /*
- * Register definition file for Samsung DP driver
+ * Register definition file for Analogix Core DP driver
  *
  * Copyright (C) 2012 Samsung Electronics Co., Ltd.
  * Author: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
@@ -9,96 +9,96 @@
  * published by the Free Software Foundation.
  */
 
-#ifndef _EXYNOS_DP_REG_H
-#define _EXYNOS_DP_REG_H
-
-#define EXYNOS_DP_TX_SW_RESET			0x14
-#define EXYNOS_DP_FUNC_EN_1			0x18
-#define EXYNOS_DP_FUNC_EN_2			0x1C
-#define EXYNOS_DP_VIDEO_CTL_1			0x20
-#define EXYNOS_DP_VIDEO_CTL_2			0x24
-#define EXYNOS_DP_VIDEO_CTL_3			0x28
-
-#define EXYNOS_DP_VIDEO_CTL_8			0x3C
-#define EXYNOS_DP_VIDEO_CTL_10			0x44
-
-#define EXYNOS_DP_LANE_MAP			0x35C
-
-#define EXYNOS_DP_ANALOG_CTL_1			0x370
-#define EXYNOS_DP_ANALOG_CTL_2			0x374
-#define EXYNOS_DP_ANALOG_CTL_3			0x378
-#define EXYNOS_DP_PLL_FILTER_CTL_1		0x37C
-#define EXYNOS_DP_TX_AMP_TUNING_CTL		0x380
-
-#define EXYNOS_DP_AUX_HW_RETRY_CTL		0x390
-
-#define EXYNOS_DP_COMMON_INT_STA_1		0x3C4
-#define EXYNOS_DP_COMMON_INT_STA_2		0x3C8
-#define EXYNOS_DP_COMMON_INT_STA_3		0x3CC
-#define EXYNOS_DP_COMMON_INT_STA_4		0x3D0
-#define EXYNOS_DP_INT_STA			0x3DC
-#define EXYNOS_DP_COMMON_INT_MASK_1		0x3E0
-#define EXYNOS_DP_COMMON_INT_MASK_2		0x3E4
-#define EXYNOS_DP_COMMON_INT_MASK_3		0x3E8
-#define EXYNOS_DP_COMMON_INT_MASK_4		0x3EC
-#define EXYNOS_DP_INT_STA_MASK			0x3F8
-#define EXYNOS_DP_INT_CTL			0x3FC
-
-#define EXYNOS_DP_SYS_CTL_1			0x600
-#define EXYNOS_DP_SYS_CTL_2			0x604
-#define EXYNOS_DP_SYS_CTL_3			0x608
-#define EXYNOS_DP_SYS_CTL_4			0x60C
-
-#define EXYNOS_DP_PKT_SEND_CTL			0x640
-#define EXYNOS_DP_HDCP_CTL			0x648
-
-#define EXYNOS_DP_LINK_BW_SET			0x680
-#define EXYNOS_DP_LANE_COUNT_SET		0x684
-#define EXYNOS_DP_TRAINING_PTN_SET		0x688
-#define EXYNOS_DP_LN0_LINK_TRAINING_CTL		0x68C
-#define EXYNOS_DP_LN1_LINK_TRAINING_CTL		0x690
-#define EXYNOS_DP_LN2_LINK_TRAINING_CTL		0x694
-#define EXYNOS_DP_LN3_LINK_TRAINING_CTL		0x698
-
-#define EXYNOS_DP_DEBUG_CTL			0x6C0
-#define EXYNOS_DP_HPD_DEGLITCH_L		0x6C4
-#define EXYNOS_DP_HPD_DEGLITCH_H		0x6C8
-#define EXYNOS_DP_LINK_DEBUG_CTL		0x6E0
-
-#define EXYNOS_DP_M_VID_0			0x700
-#define EXYNOS_DP_M_VID_1			0x704
-#define EXYNOS_DP_M_VID_2			0x708
-#define EXYNOS_DP_N_VID_0			0x70C
-#define EXYNOS_DP_N_VID_1			0x710
-#define EXYNOS_DP_N_VID_2			0x714
-
-#define EXYNOS_DP_PLL_CTL			0x71C
-#define EXYNOS_DP_PHY_PD			0x720
-#define EXYNOS_DP_PHY_TEST			0x724
-
-#define EXYNOS_DP_VIDEO_FIFO_THRD		0x730
-#define EXYNOS_DP_AUDIO_MARGIN			0x73C
-
-#define EXYNOS_DP_M_VID_GEN_FILTER_TH		0x764
-#define EXYNOS_DP_M_AUD_GEN_FILTER_TH		0x778
-#define EXYNOS_DP_AUX_CH_STA			0x780
-#define EXYNOS_DP_AUX_CH_DEFER_CTL		0x788
-#define EXYNOS_DP_AUX_RX_COMM			0x78C
-#define EXYNOS_DP_BUFFER_DATA_CTL		0x790
-#define EXYNOS_DP_AUX_CH_CTL_1			0x794
-#define EXYNOS_DP_AUX_ADDR_7_0			0x798
-#define EXYNOS_DP_AUX_ADDR_15_8			0x79C
-#define EXYNOS_DP_AUX_ADDR_19_16		0x7A0
-#define EXYNOS_DP_AUX_CH_CTL_2			0x7A4
-
-#define EXYNOS_DP_BUF_DATA_0			0x7C0
-
-#define EXYNOS_DP_SOC_GENERAL_CTL		0x800
-
-/* EXYNOS_DP_TX_SW_RESET */
+#ifndef _ANALOGIX_DP_REG_H
+#define _ANALOGIX_DP_REG_H
+
+#define ANALOGIX_DP_TX_SW_RESET			0x14
+#define ANALOGIX_DP_FUNC_EN_1			0x18
+#define ANALOGIX_DP_FUNC_EN_2			0x1C
+#define ANALOGIX_DP_VIDEO_CTL_1			0x20
+#define ANALOGIX_DP_VIDEO_CTL_2			0x24
+#define ANALOGIX_DP_VIDEO_CTL_3			0x28
+
+#define ANALOGIX_DP_VIDEO_CTL_8			0x3C
+#define ANALOGIX_DP_VIDEO_CTL_10			0x44
+
+#define ANALOGIX_DP_LANE_MAP			0x35C
+
+#define ANALOGIX_DP_ANALOG_CTL_1			0x370
+#define ANALOGIX_DP_ANALOG_CTL_2			0x374
+#define ANALOGIX_DP_ANALOG_CTL_3			0x378
+#define ANALOGIX_DP_PLL_FILTER_CTL_1		0x37C
+#define ANALOGIX_DP_TX_AMP_TUNING_CTL		0x380
+
+#define ANALOGIX_DP_AUX_HW_RETRY_CTL		0x390
+
+#define ANALOGIX_DP_COMMON_INT_STA_1		0x3C4
+#define ANALOGIX_DP_COMMON_INT_STA_2		0x3C8
+#define ANALOGIX_DP_COMMON_INT_STA_3		0x3CC
+#define ANALOGIX_DP_COMMON_INT_STA_4		0x3D0
+#define ANALOGIX_DP_INT_STA			0x3DC
+#define ANALOGIX_DP_COMMON_INT_MASK_1		0x3E0
+#define ANALOGIX_DP_COMMON_INT_MASK_2		0x3E4
+#define ANALOGIX_DP_COMMON_INT_MASK_3		0x3E8
+#define ANALOGIX_DP_COMMON_INT_MASK_4		0x3EC
+#define ANALOGIX_DP_INT_STA_MASK			0x3F8
+#define ANALOGIX_DP_INT_CTL			0x3FC
+
+#define ANALOGIX_DP_SYS_CTL_1			0x600
+#define ANALOGIX_DP_SYS_CTL_2			0x604
+#define ANALOGIX_DP_SYS_CTL_3			0x608
+#define ANALOGIX_DP_SYS_CTL_4			0x60C
+
+#define ANALOGIX_DP_PKT_SEND_CTL			0x640
+#define ANALOGIX_DP_HDCP_CTL			0x648
+
+#define ANALOGIX_DP_LINK_BW_SET			0x680
+#define ANALOGIX_DP_LANE_COUNT_SET		0x684
+#define ANALOGIX_DP_TRAINING_PTN_SET		0x688
+#define ANALOGIX_DP_LN0_LINK_TRAINING_CTL		0x68C
+#define ANALOGIX_DP_LN1_LINK_TRAINING_CTL		0x690
+#define ANALOGIX_DP_LN2_LINK_TRAINING_CTL		0x694
+#define ANALOGIX_DP_LN3_LINK_TRAINING_CTL		0x698
+
+#define ANALOGIX_DP_DEBUG_CTL			0x6C0
+#define ANALOGIX_DP_HPD_DEGLITCH_L		0x6C4
+#define ANALOGIX_DP_HPD_DEGLITCH_H		0x6C8
+#define ANALOGIX_DP_LINK_DEBUG_CTL		0x6E0
+
+#define ANALOGIX_DP_M_VID_0			0x700
+#define ANALOGIX_DP_M_VID_1			0x704
+#define ANALOGIX_DP_M_VID_2			0x708
+#define ANALOGIX_DP_N_VID_0			0x70C
+#define ANALOGIX_DP_N_VID_1			0x710
+#define ANALOGIX_DP_N_VID_2			0x714
+
+#define ANALOGIX_DP_PLL_CTL			0x71C
+#define ANALOGIX_DP_PHY_PD			0x720
+#define ANALOGIX_DP_PHY_TEST			0x724
+
+#define ANALOGIX_DP_VIDEO_FIFO_THRD		0x730
+#define ANALOGIX_DP_AUDIO_MARGIN			0x73C
+
+#define ANALOGIX_DP_M_VID_GEN_FILTER_TH		0x764
+#define ANALOGIX_DP_M_AUD_GEN_FILTER_TH		0x778
+#define ANALOGIX_DP_AUX_CH_STA			0x780
+#define ANALOGIX_DP_AUX_CH_DEFER_CTL		0x788
+#define ANALOGIX_DP_AUX_RX_COMM			0x78C
+#define ANALOGIX_DP_BUFFER_DATA_CTL		0x790
+#define ANALOGIX_DP_AUX_CH_CTL_1			0x794
+#define ANALOGIX_DP_AUX_ADDR_7_0			0x798
+#define ANALOGIX_DP_AUX_ADDR_15_8			0x79C
+#define ANALOGIX_DP_AUX_ADDR_19_16		0x7A0
+#define ANALOGIX_DP_AUX_CH_CTL_2			0x7A4
+
+#define ANALOGIX_DP_BUF_DATA_0			0x7C0
+
+#define ANALOGIX_DP_SOC_GENERAL_CTL		0x800
+
+/* ANALOGIX_DP_TX_SW_RESET */
 #define RESET_DP_TX				(0x1 << 0)
 
-/* EXYNOS_DP_FUNC_EN_1 */
+/* ANALOGIX_DP_FUNC_EN_1 */
 #define MASTER_VID_FUNC_EN_N			(0x1 << 7)
 #define SLAVE_VID_FUNC_EN_N			(0x1 << 5)
 #define AUD_FIFO_FUNC_EN_N			(0x1 << 4)
@@ -107,17 +107,17 @@
 #define CRC_FUNC_EN_N				(0x1 << 1)
 #define SW_FUNC_EN_N				(0x1 << 0)
 
-/* EXYNOS_DP_FUNC_EN_2 */
+/* ANALOGIX_DP_FUNC_EN_2 */
 #define SSC_FUNC_EN_N				(0x1 << 7)
 #define AUX_FUNC_EN_N				(0x1 << 2)
 #define SERDES_FIFO_FUNC_EN_N			(0x1 << 1)
 #define LS_CLK_DOMAIN_FUNC_EN_N			(0x1 << 0)
 
-/* EXYNOS_DP_VIDEO_CTL_1 */
+/* ANALOGIX_DP_VIDEO_CTL_1 */
 #define VIDEO_EN				(0x1 << 7)
 #define HDCP_VIDEO_MUTE				(0x1 << 6)
 
-/* EXYNOS_DP_VIDEO_CTL_1 */
+/* ANALOGIX_DP_VIDEO_CTL_1 */
 #define IN_D_RANGE_MASK				(0x1 << 7)
 #define IN_D_RANGE_SHIFT			(7)
 #define IN_D_RANGE_CEA				(0x1 << 7)
@@ -134,7 +134,7 @@
 #define IN_COLOR_F_YCBCR422			(0x1 << 0)
 #define IN_COLOR_F_RGB				(0x0 << 0)
 
-/* EXYNOS_DP_VIDEO_CTL_3 */
+/* ANALOGIX_DP_VIDEO_CTL_3 */
 #define IN_YC_COEFFI_MASK			(0x1 << 7)
 #define IN_YC_COEFFI_SHIFT			(7)
 #define IN_YC_COEFFI_ITU709			(0x1 << 7)
@@ -144,17 +144,17 @@
 #define VID_CHK_UPDATE_TYPE_1			(0x1 << 4)
 #define VID_CHK_UPDATE_TYPE_0			(0x0 << 4)
 
-/* EXYNOS_DP_VIDEO_CTL_8 */
+/* ANALOGIX_DP_VIDEO_CTL_8 */
 #define VID_HRES_TH(x)				(((x) & 0xf) << 4)
 #define VID_VRES_TH(x)				(((x) & 0xf) << 0)
 
-/* EXYNOS_DP_VIDEO_CTL_10 */
+/* ANALOGIX_DP_VIDEO_CTL_10 */
 #define FORMAT_SEL				(0x1 << 4)
 #define INTERACE_SCAN_CFG			(0x1 << 2)
 #define VSYNC_POLARITY_CFG			(0x1 << 1)
 #define HSYNC_POLARITY_CFG			(0x1 << 0)
 
-/* EXYNOS_DP_LANE_MAP */
+/* ANALOGIX_DP_LANE_MAP */
 #define LANE3_MAP_LOGIC_LANE_0			(0x0 << 6)
 #define LANE3_MAP_LOGIC_LANE_1			(0x1 << 6)
 #define LANE3_MAP_LOGIC_LANE_2			(0x2 << 6)
@@ -172,30 +172,30 @@
 #define LANE0_MAP_LOGIC_LANE_2			(0x2 << 0)
 #define LANE0_MAP_LOGIC_LANE_3			(0x3 << 0)
 
-/* EXYNOS_DP_ANALOG_CTL_1 */
+/* ANALOGIX_DP_ANALOG_CTL_1 */
 #define TX_TERMINAL_CTRL_50_OHM			(0x1 << 4)
 
-/* EXYNOS_DP_ANALOG_CTL_2 */
+/* ANALOGIX_DP_ANALOG_CTL_2 */
 #define SEL_24M					(0x1 << 3)
 #define TX_DVDD_BIT_1_0625V			(0x4 << 0)
 
-/* EXYNOS_DP_ANALOG_CTL_3 */
+/* ANALOGIX_DP_ANALOG_CTL_3 */
 #define DRIVE_DVDD_BIT_1_0625V			(0x4 << 5)
 #define VCO_BIT_600_MICRO			(0x5 << 0)
 
-/* EXYNOS_DP_PLL_FILTER_CTL_1 */
+/* ANALOGIX_DP_PLL_FILTER_CTL_1 */
 #define PD_RING_OSC				(0x1 << 6)
 #define AUX_TERMINAL_CTRL_50_OHM		(0x2 << 4)
 #define TX_CUR1_2X				(0x1 << 2)
 #define TX_CUR_16_MA				(0x3 << 0)
 
-/* EXYNOS_DP_TX_AMP_TUNING_CTL */
+/* ANALOGIX_DP_TX_AMP_TUNING_CTL */
 #define CH3_AMP_400_MV				(0x0 << 24)
 #define CH2_AMP_400_MV				(0x0 << 16)
 #define CH1_AMP_400_MV				(0x0 << 8)
 #define CH0_AMP_400_MV				(0x0 << 0)
 
-/* EXYNOS_DP_AUX_HW_RETRY_CTL */
+/* ANALOGIX_DP_AUX_HW_RETRY_CTL */
 #define AUX_BIT_PERIOD_EXPECTED_DELAY(x)	(((x) & 0x7) << 8)
 #define AUX_HW_RETRY_INTERVAL_MASK		(0x3 << 3)
 #define AUX_HW_RETRY_INTERVAL_600_MICROSECONDS	(0x0 << 3)
@@ -204,7 +204,7 @@
 #define AUX_HW_RETRY_INTERVAL_1800_MICROSECONDS	(0x3 << 3)
 #define AUX_HW_RETRY_COUNT_SEL(x)		(((x) & 0x7) << 0)
 
-/* EXYNOS_DP_COMMON_INT_STA_1 */
+/* ANALOGIX_DP_COMMON_INT_STA_1 */
 #define VSYNC_DET				(0x1 << 7)
 #define PLL_LOCK_CHG				(0x1 << 6)
 #define SPDIF_ERR				(0x1 << 5)
@@ -214,19 +214,19 @@
 #define VID_CLK_CHG				(0x1 << 1)
 #define SW_INT					(0x1 << 0)
 
-/* EXYNOS_DP_COMMON_INT_STA_2 */
+/* ANALOGIX_DP_COMMON_INT_STA_2 */
 #define ENC_EN_CHG				(0x1 << 6)
 #define HW_BKSV_RDY				(0x1 << 3)
 #define HW_SHA_DONE				(0x1 << 2)
 #define HW_AUTH_STATE_CHG			(0x1 << 1)
 #define HW_AUTH_DONE				(0x1 << 0)
 
-/* EXYNOS_DP_COMMON_INT_STA_3 */
+/* ANALOGIX_DP_COMMON_INT_STA_3 */
 #define AFIFO_UNDER				(0x1 << 7)
 #define AFIFO_OVER				(0x1 << 6)
 #define R0_CHK_FLAG				(0x1 << 5)
 
-/* EXYNOS_DP_COMMON_INT_STA_4 */
+/* ANALOGIX_DP_COMMON_INT_STA_4 */
 #define PSR_ACTIVE				(0x1 << 7)
 #define PSR_INACTIVE				(0x1 << 6)
 #define SPDIF_BI_PHASE_ERR			(0x1 << 5)
@@ -234,29 +234,29 @@
 #define HPD_LOST				(0x1 << 1)
 #define PLUG					(0x1 << 0)
 
-/* EXYNOS_DP_INT_STA */
+/* ANALOGIX_DP_INT_STA */
 #define INT_HPD					(0x1 << 6)
 #define HW_TRAINING_FINISH			(0x1 << 5)
 #define RPLY_RECEIV				(0x1 << 1)
 #define AUX_ERR					(0x1 << 0)
 
-/* EXYNOS_DP_INT_CTL */
+/* ANALOGIX_DP_INT_CTL */
 #define SOFT_INT_CTRL				(0x1 << 2)
 #define INT_POL1				(0x1 << 1)
 #define INT_POL0				(0x1 << 0)
 
-/* EXYNOS_DP_SYS_CTL_1 */
+/* ANALOGIX_DP_SYS_CTL_1 */
 #define DET_STA					(0x1 << 2)
 #define FORCE_DET				(0x1 << 1)
 #define DET_CTRL				(0x1 << 0)
 
-/* EXYNOS_DP_SYS_CTL_2 */
+/* ANALOGIX_DP_SYS_CTL_2 */
 #define CHA_CRI(x)				(((x) & 0xf) << 4)
 #define CHA_STA					(0x1 << 2)
 #define FORCE_CHA				(0x1 << 1)
 #define CHA_CTRL				(0x1 << 0)
 
-/* EXYNOS_DP_SYS_CTL_3 */
+/* ANALOGIX_DP_SYS_CTL_3 */
 #define HPD_STATUS				(0x1 << 6)
 #define F_HPD					(0x1 << 5)
 #define HPD_CTRL				(0x1 << 4)
@@ -265,13 +265,13 @@
 #define F_VALID					(0x1 << 1)
 #define VALID_CTRL				(0x1 << 0)
 
-/* EXYNOS_DP_SYS_CTL_4 */
+/* ANALOGIX_DP_SYS_CTL_4 */
 #define FIX_M_AUD				(0x1 << 4)
 #define ENHANCED				(0x1 << 3)
 #define FIX_M_VID				(0x1 << 2)
 #define M_VID_UPDATE_CTRL			(0x3 << 0)
 
-/* EXYNOS_DP_TRAINING_PTN_SET */
+/* ANALOGIX_DP_TRAINING_PTN_SET */
 #define SCRAMBLER_TYPE				(0x1 << 9)
 #define HW_LINK_TRAINING_PATTERN		(0x1 << 8)
 #define SCRAMBLING_DISABLE			(0x1 << 5)
@@ -285,24 +285,24 @@
 #define SW_TRAINING_PATTERN_SET_PTN1		(0x1 << 0)
 #define SW_TRAINING_PATTERN_SET_NORMAL		(0x0 << 0)
 
-/* EXYNOS_DP_LN0_LINK_TRAINING_CTL */
+/* ANALOGIX_DP_LN0_LINK_TRAINING_CTL */
 #define PRE_EMPHASIS_SET_MASK			(0x3 << 3)
 #define PRE_EMPHASIS_SET_SHIFT			(3)
 
-/* EXYNOS_DP_DEBUG_CTL */
+/* ANALOGIX_DP_DEBUG_CTL */
 #define PLL_LOCK				(0x1 << 4)
 #define F_PLL_LOCK				(0x1 << 3)
 #define PLL_LOCK_CTRL				(0x1 << 2)
 #define PN_INV					(0x1 << 0)
 
-/* EXYNOS_DP_PLL_CTL */
+/* ANALOGIX_DP_PLL_CTL */
 #define DP_PLL_PD				(0x1 << 7)
 #define DP_PLL_RESET				(0x1 << 6)
 #define DP_PLL_LOOP_BIT_DEFAULT			(0x1 << 4)
 #define DP_PLL_REF_BIT_1_1250V			(0x5 << 0)
 #define DP_PLL_REF_BIT_1_2500V			(0x7 << 0)
 
-/* EXYNOS_DP_PHY_PD */
+/* ANALOGIX_DP_PHY_PD */
 #define DP_PHY_PD				(0x1 << 5)
 #define AUX_PD					(0x1 << 4)
 #define CH3_PD					(0x1 << 3)
@@ -310,28 +310,28 @@
 #define CH1_PD					(0x1 << 1)
 #define CH0_PD					(0x1 << 0)
 
-/* EXYNOS_DP_PHY_TEST */
+/* ANALOGIX_DP_PHY_TEST */
 #define MACRO_RST				(0x1 << 5)
 #define CH1_TEST				(0x1 << 1)
 #define CH0_TEST				(0x1 << 0)
 
-/* EXYNOS_DP_AUX_CH_STA */
+/* ANALOGIX_DP_AUX_CH_STA */
 #define AUX_BUSY				(0x1 << 4)
 #define AUX_STATUS_MASK				(0xf << 0)
 
-/* EXYNOS_DP_AUX_CH_DEFER_CTL */
+/* ANALOGIX_DP_AUX_CH_DEFER_CTL */
 #define DEFER_CTRL_EN				(0x1 << 7)
 #define DEFER_COUNT(x)				(((x) & 0x7f) << 0)
 
-/* EXYNOS_DP_AUX_RX_COMM */
+/* ANALOGIX_DP_AUX_RX_COMM */
 #define AUX_RX_COMM_I2C_DEFER			(0x2 << 2)
 #define AUX_RX_COMM_AUX_DEFER			(0x2 << 0)
 
-/* EXYNOS_DP_BUFFER_DATA_CTL */
+/* ANALOGIX_DP_BUFFER_DATA_CTL */
 #define BUF_CLR					(0x1 << 7)
 #define BUF_DATA_COUNT(x)			(((x) & 0x1f) << 0)
 
-/* EXYNOS_DP_AUX_CH_CTL_1 */
+/* ANALOGIX_DP_AUX_CH_CTL_1 */
 #define AUX_LENGTH(x)				(((x - 1) & 0xf) << 4)
 #define AUX_TX_COMM_MASK			(0xf << 0)
 #define AUX_TX_COMM_DP_TRANSACTION		(0x1 << 3)
@@ -340,20 +340,20 @@
 #define AUX_TX_COMM_WRITE			(0x0 << 0)
 #define AUX_TX_COMM_READ			(0x1 << 0)
 
-/* EXYNOS_DP_AUX_ADDR_7_0 */
+/* ANALOGIX_DP_AUX_ADDR_7_0 */
 #define AUX_ADDR_7_0(x)				(((x) >> 0) & 0xff)
 
-/* EXYNOS_DP_AUX_ADDR_15_8 */
+/* ANALOGIX_DP_AUX_ADDR_15_8 */
 #define AUX_ADDR_15_8(x)			(((x) >> 8) & 0xff)
 
-/* EXYNOS_DP_AUX_ADDR_19_16 */
+/* ANALOGIX_DP_AUX_ADDR_19_16 */
 #define AUX_ADDR_19_16(x)			(((x) >> 16) & 0x0f)
 
-/* EXYNOS_DP_AUX_CH_CTL_2 */
+/* ANALOGIX_DP_AUX_CH_CTL_2 */
 #define ADDR_ONLY				(0x1 << 1)
 #define AUX_EN					(0x1 << 0)
 
-/* EXYNOS_DP_SOC_GENERAL_CTL */
+/* ANALOGIX_DP_SOC_GENERAL_CTL */
 #define AUDIO_MODE_SPDIF_MODE			(0x1 << 8)
 #define AUDIO_MODE_MASTER_MODE			(0x0 << 8)
 #define MASTER_VIDEO_INTERLACE_EN		(0x1 << 4)
@@ -363,4 +363,4 @@
 #define VIDEO_MODE_SLAVE_MODE			(0x1 << 0)
 #define VIDEO_MODE_MASTER_MODE			(0x0 << 0)
 
-#endif /* _EXYNOS_DP_REG_H */
+#endif /* _ANALOGIX_DP_REG_H */
diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 43003c4..b33549c 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -54,9 +54,10 @@ config DRM_EXYNOS_DSI
 	help
 	  This enables support for Exynos MIPI-DSI device.
 
-config DRM_EXYNOS_DP
-	bool "EXYNOS DRM DP driver support"
+config DRM_EXYNOS_ANALOGIX_DP
+	bool "EXYNOS specific extensions for Analogix DP driver"
 	depends on DRM_EXYNOS && (DRM_EXYNOS_FIMD || DRM_EXYNOS7_DECON) && (DRM_PTN3460=n || DRM_PTN3460=y || DRM_PTN3460=DRM_EXYNOS)
+	select DRM_ANALOGIX_DP
 	default DRM_EXYNOS
 	select DRM_PANEL
 	help
diff --git a/drivers/gpu/drm/exynos/Makefile b/drivers/gpu/drm/exynos/Makefile
index 7de0b10..cda4d26 100644
--- a/drivers/gpu/drm/exynos/Makefile
+++ b/drivers/gpu/drm/exynos/Makefile
@@ -14,7 +14,7 @@ exynosdrm-$(CONFIG_DRM_EXYNOS5433_DECON)	+= exynos5433_drm_decon.o
 exynosdrm-$(CONFIG_DRM_EXYNOS7_DECON)	+= exynos7_drm_decon.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_DPI)	+= exynos_drm_dpi.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_DSI)	+= exynos_drm_dsi.o
-exynosdrm-$(CONFIG_DRM_EXYNOS_DP)	+= exynos_dp_core.o exynos_dp_reg.o
+exynosdrm-$(CONFIG_DRM_EXYNOS_ANALOGIX_DP)	+= analogix_dp-exynos.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_HDMI)	+= exynos_hdmi.o exynos_mixer.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_VIDI)	+= exynos_drm_vidi.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_G2D)	+= exynos_drm_g2d.o
diff --git a/drivers/gpu/drm/exynos/analogix_dp-exynos.c b/drivers/gpu/drm/exynos/analogix_dp-exynos.c
new file mode 100644
index 0000000..d5631c2
--- /dev/null
+++ b/drivers/gpu/drm/exynos/analogix_dp-exynos.c
@@ -0,0 +1,291 @@
+/*
+ * Samsung SoC DP (Display Port) interface driver.
+ *
+ * Copyright (C) 2012 Samsung Electronics Co., Ltd.
+ * Author: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or (at your
+ * option) any later version.
+ */
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/err.h>
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/of_graph.h>
+#include <video/of_display_timing.h>
+#include <video/of_videomode.h>
+
+#include <drm/drmP.h>
+#include <drm/drm_panel.h>
+#include <drm/bridge/ptn3460.h>
+#include <drm/bridge/analogix_dp.h>
+
+#include <drm/exynos_drm.h>
+#include "exynos_drm_drv.h"
+
+#define plat_data_to_dp(pd) \
+		container_of(pd, struct exynos_dp_device, plat_data)
+
+struct exynos_dp_device {
+	struct exynos_drm_display  display;
+	struct drm_bridge          *ptn_bridge;
+	struct drm_device          *drm_dev;
+	struct device              *dev;
+
+	struct exynos_drm_panel_info priv;
+	struct analogix_dp_plat_data plat_data;
+};
+
+int exynos_dp_crtc_clock_enable(struct analogix_dp_plat_data *plat_data,
+				bool enable)
+{
+	struct exynos_dp_device *dp = plat_data_to_dp(plat_data);
+	struct drm_encoder *encoder = dp->display.encoder;
+	struct exynos_drm_crtc *crtc;
+
+	if (!encoder)
+		return -1;
+
+	crtc = to_exynos_crtc(encoder->crtc);
+	if (crtc && crtc->ops && crtc->ops->clock_enable)
+		crtc->ops->clock_enable(crtc, enable);
+
+	return 0;
+}
+
+static int exynos_dp_poweron(struct analogix_dp_plat_data *plat_data)
+{
+	return exynos_dp_crtc_clock_enable(plat_data, true);
+}
+
+static int exynos_dp_poweroff(struct analogix_dp_plat_data *plat_data)
+{
+	return exynos_dp_crtc_clock_enable(plat_data, false);
+}
+
+static int exynos_dp_get_modes(struct analogix_dp_plat_data *plat_data,
+			       struct drm_connector *connector)
+{
+	struct exynos_dp_device *dp = plat_data_to_dp(plat_data);
+	struct drm_display_mode *mode;
+
+	if (dp->plat_data.panel)
+		return 0;
+
+	mode = drm_mode_create(connector->dev);
+	if (!mode) {
+		DRM_ERROR("failed to create a new display mode.\n");
+		return 0;
+	}
+
+	drm_display_mode_from_videomode(&dp->priv.vm, mode);
+	mode->width_mm = dp->priv.width_mm;
+	mode->height_mm = dp->priv.height_mm;
+	connector->display_info.width_mm = mode->width_mm;
+	connector->display_info.height_mm = mode->height_mm;
+
+	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+	drm_mode_set_name(mode);
+	drm_mode_probed_add(connector, mode);
+
+	return 1;
+}
+
+static int exynos_dp_bridge_attach(struct analogix_dp_plat_data *plat_data,
+				   struct drm_bridge *bridge)
+{
+	struct exynos_dp_device *dp = plat_data_to_dp(plat_data);
+	struct drm_encoder *encoder = dp->display.encoder;
+	int ret;
+
+	/* Pre-empt DP connector creation if there's a bridge */
+	if (dp->ptn_bridge) {
+		bridge->next = dp->ptn_bridge;
+		dp->ptn_bridge->encoder = encoder;
+		ret = drm_bridge_attach(encoder->dev, dp->ptn_bridge);
+		if (ret) {
+			DRM_ERROR("Failed to attach bridge to drm\n");
+			bridge->next = NULL;
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static void exynos_dp_dpms(struct exynos_drm_display *display, int mode)
+{
+	/* do nothing */
+}
+
+static int exynos_dp_create_connector(struct exynos_drm_display *display,
+				      struct drm_encoder *encoder)
+{
+	/* do nothing */
+	return 0;
+}
+
+static void exynos_dp_commit(struct exynos_drm_display *display)
+{
+	/* do nothing */
+}
+
+static struct exynos_drm_display_ops exynos_dp_display_ops = {
+	.create_connector = exynos_dp_create_connector,
+	.dpms = exynos_dp_dpms,
+	.commit = exynos_dp_commit,
+};
+
+static int exynos_dp_dt_parse_panel(struct exynos_dp_device *dp)
+{
+	int ret;
+
+	ret = of_get_videomode(dp->dev->of_node, &dp->priv.vm,
+			       OF_USE_NATIVE_MODE);
+	if (ret) {
+		DRM_ERROR("failed: of_get_videomode() : %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
+{
+	struct exynos_dp_device *dp = dev_get_drvdata(dev);
+	struct drm_device *drm_dev = data;
+	int ret;
+
+	/*
+	 * Just like the probe function said, we don't need the
+	 * device drvrate anymore, we should leave the charge to
+	 * analogix dp driver, set the device drvdata to NULL.
+	 */
+	dev_set_drvdata(dev, NULL);
+
+	dp->dev = dev;
+	dp->drm_dev = drm_dev;
+
+	dp->plat_data.power_on = exynos_dp_poweron;
+	dp->plat_data.power_off = exynos_dp_poweroff;
+	dp->plat_data.get_modes = exynos_dp_get_modes;
+	dp->plat_data.attach = exynos_dp_bridge_attach;
+
+	if (!dp->plat_data.panel || !dp->ptn_bridge) {
+		ret = exynos_dp_dt_parse_panel(dp);
+		if (ret)
+			return ret;
+	}
+
+	ret = exynos_drm_create_enc_conn(dp->drm_dev, &dp->display);
+	if (ret) {
+		DRM_ERROR("exynos dp create enc_conn failed\n");
+		return ret;
+	}
+
+	return analogix_dp_bind(dev, dp->drm_dev, dp->display.encoder,
+				&dp->plat_data);
+}
+
+static void exynos_dp_unbind(struct device *dev, struct device *master,
+			     void *data)
+{
+	return analogix_dp_unbind(dev, master, data);
+}
+
+static const struct component_ops exynos_dp_ops = {
+	.bind	= exynos_dp_bind,
+	.unbind	= exynos_dp_unbind,
+};
+
+static int exynos_dp_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *panel_node, *bridge_node, *endpoint;
+	struct exynos_dp_device *dp;
+
+	dp = devm_kzalloc(&pdev->dev, sizeof(struct exynos_dp_device),
+			  GFP_KERNEL);
+	if (!dp)
+		return -ENOMEM;
+
+	/*
+	 * We just use the drvdata until driver run into component
+	 * add function, and then we would set drvdata to null, so
+	 * that analogix dp driver would take charge of the drvdata.
+	 */
+	platform_set_drvdata(pdev, dp);
+
+	dp->display.type = EXYNOS_DISPLAY_TYPE_LCD;
+	dp->display.ops = &exynos_dp_display_ops;
+
+	panel_node = of_parse_phandle(dev->of_node, "panel", 0);
+	if (panel_node) {
+		dp->plat_data.panel = of_drm_find_panel(panel_node);
+		of_node_put(panel_node);
+		if (!dp->plat_data.panel)
+			return -EPROBE_DEFER;
+	}
+
+	endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
+	if (endpoint) {
+		bridge_node = of_graph_get_remote_port_parent(endpoint);
+		if (bridge_node) {
+			dp->ptn_bridge = of_drm_find_bridge(bridge_node);
+			of_node_put(bridge_node);
+			if (!dp->ptn_bridge)
+				return -EPROBE_DEFER;
+		} else {
+			return -EPROBE_DEFER;
+		}
+	}
+
+	return component_add(&pdev->dev, &exynos_dp_ops);
+}
+
+static int exynos_dp_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &exynos_dp_ops);
+
+	return 0;
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int exynos_dp_suspend(struct device *dev)
+{
+	return analogix_dp_suspend(dev);
+}
+
+static int exynos_dp_resume(struct device *dev)
+{
+	return analogix_dp_resume(dev);
+}
+#endif
+
+static const struct dev_pm_ops exynos_dp_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(exynos_dp_suspend, exynos_dp_resume)
+};
+
+static const struct of_device_id exynos_dp_match[] = {
+	{ .compatible = "samsung,exynos5-dp" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, exynos_dp_match);
+
+struct platform_driver dp_driver = {
+	.probe		= exynos_dp_probe,
+	.remove		= exynos_dp_remove,
+	.driver		= {
+		.name	= "exynos-dp",
+		.owner	= THIS_MODULE,
+		.pm	= &exynos_dp_pm_ops,
+		.of_match_table = exynos_dp_match,
+	},
+};
+
+MODULE_AUTHOR("Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>");
+MODULE_DESCRIPTION("Samsung Specific Analogix-DP Driver Extension");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.h b/drivers/gpu/drm/exynos/exynos_dp_core.h
deleted file mode 100644
index 29bd56e..0000000
--- a/drivers/gpu/drm/exynos/exynos_dp_core.h
+++ /dev/null
@@ -1,282 +0,0 @@
-/*
- * Header file for Samsung DP (Display Port) interface driver.
- *
- * Copyright (C) 2012 Samsung Electronics Co., Ltd.
- * Author: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License as published by the
- * Free Software Foundation; either version 2 of the License, or (at your
- * option) any later version.
- */
-
-#ifndef _EXYNOS_DP_CORE_H
-#define _EXYNOS_DP_CORE_H
-
-#include <drm/drm_crtc.h>
-#include <drm/drm_dp_helper.h>
-#include <drm/exynos_drm.h>
-
-#include "exynos_drm_drv.h"
-
-#define DP_TIMEOUT_LOOP_COUNT 100
-#define MAX_CR_LOOP 5
-#define MAX_EQ_LOOP 5
-
-enum link_rate_type {
-	LINK_RATE_1_62GBPS = 0x06,
-	LINK_RATE_2_70GBPS = 0x0a
-};
-
-enum link_lane_count_type {
-	LANE_COUNT1 = 1,
-	LANE_COUNT2 = 2,
-	LANE_COUNT4 = 4
-};
-
-enum link_training_state {
-	START,
-	CLOCK_RECOVERY,
-	EQUALIZER_TRAINING,
-	FINISHED,
-	FAILED
-};
-
-enum voltage_swing_level {
-	VOLTAGE_LEVEL_0,
-	VOLTAGE_LEVEL_1,
-	VOLTAGE_LEVEL_2,
-	VOLTAGE_LEVEL_3,
-};
-
-enum pre_emphasis_level {
-	PRE_EMPHASIS_LEVEL_0,
-	PRE_EMPHASIS_LEVEL_1,
-	PRE_EMPHASIS_LEVEL_2,
-	PRE_EMPHASIS_LEVEL_3,
-};
-
-enum pattern_set {
-	PRBS7,
-	D10_2,
-	TRAINING_PTN1,
-	TRAINING_PTN2,
-	DP_NONE
-};
-
-enum color_space {
-	COLOR_RGB,
-	COLOR_YCBCR422,
-	COLOR_YCBCR444
-};
-
-enum color_depth {
-	COLOR_6,
-	COLOR_8,
-	COLOR_10,
-	COLOR_12
-};
-
-enum color_coefficient {
-	COLOR_YCBCR601,
-	COLOR_YCBCR709
-};
-
-enum dynamic_range {
-	VESA,
-	CEA
-};
-
-enum pll_status {
-	PLL_UNLOCKED,
-	PLL_LOCKED
-};
-
-enum clock_recovery_m_value_type {
-	CALCULATED_M,
-	REGISTER_M
-};
-
-enum video_timing_recognition_type {
-	VIDEO_TIMING_FROM_CAPTURE,
-	VIDEO_TIMING_FROM_REGISTER
-};
-
-enum analog_power_block {
-	AUX_BLOCK,
-	CH0_BLOCK,
-	CH1_BLOCK,
-	CH2_BLOCK,
-	CH3_BLOCK,
-	ANALOG_TOTAL,
-	POWER_ALL
-};
-
-enum dp_irq_type {
-	DP_IRQ_TYPE_HP_CABLE_IN,
-	DP_IRQ_TYPE_HP_CABLE_OUT,
-	DP_IRQ_TYPE_HP_CHANGE,
-	DP_IRQ_TYPE_UNKNOWN,
-};
-
-struct video_info {
-	char *name;
-
-	bool h_sync_polarity;
-	bool v_sync_polarity;
-	bool interlaced;
-
-	enum color_space color_space;
-	enum dynamic_range dynamic_range;
-	enum color_coefficient ycbcr_coeff;
-	enum color_depth color_depth;
-
-	enum link_rate_type link_rate;
-	enum link_lane_count_type lane_count;
-};
-
-struct link_train {
-	int eq_loop;
-	int cr_loop[4];
-
-	u8 link_rate;
-	u8 lane_count;
-	u8 training_lane[4];
-
-	enum link_training_state lt_state;
-};
-
-struct exynos_dp_device {
-	struct exynos_drm_display display;
-	struct device		*dev;
-	struct drm_device	*drm_dev;
-	struct drm_connector	connector;
-	struct drm_encoder	*encoder;
-	struct drm_panel	*panel;
-	struct drm_bridge	*bridge;
-	struct drm_bridge	*ptn_bridge;
-	struct clk		*clock;
-	unsigned int		irq;
-	void __iomem		*reg_base;
-
-	struct video_info	*video_info;
-	struct link_train	link_train;
-	struct work_struct	hotplug_work;
-	struct phy		*phy;
-	int			dpms_mode;
-	int			hpd_gpio;
-
-	struct exynos_drm_panel_info priv;
-};
-
-/* exynos_dp_reg.c */
-void exynos_dp_enable_video_mute(struct exynos_dp_device *dp, bool enable);
-void exynos_dp_stop_video(struct exynos_dp_device *dp);
-void exynos_dp_lane_swap(struct exynos_dp_device *dp, bool enable);
-void exynos_dp_init_analog_param(struct exynos_dp_device *dp);
-void exynos_dp_init_interrupt(struct exynos_dp_device *dp);
-void exynos_dp_reset(struct exynos_dp_device *dp);
-void exynos_dp_swreset(struct exynos_dp_device *dp);
-void exynos_dp_config_interrupt(struct exynos_dp_device *dp);
-enum pll_status exynos_dp_get_pll_lock_status(struct exynos_dp_device *dp);
-void exynos_dp_set_pll_power_down(struct exynos_dp_device *dp, bool enable);
-void exynos_dp_set_analog_power_down(struct exynos_dp_device *dp,
-				     enum analog_power_block block,
-				     bool enable);
-void exynos_dp_init_analog_func(struct exynos_dp_device *dp);
-void exynos_dp_init_hpd(struct exynos_dp_device *dp);
-enum dp_irq_type exynos_dp_get_irq_type(struct exynos_dp_device *dp);
-void exynos_dp_clear_hotplug_interrupts(struct exynos_dp_device *dp);
-void exynos_dp_reset_aux(struct exynos_dp_device *dp);
-void exynos_dp_init_aux(struct exynos_dp_device *dp);
-int exynos_dp_get_plug_in_status(struct exynos_dp_device *dp);
-void exynos_dp_enable_sw_function(struct exynos_dp_device *dp);
-int exynos_dp_start_aux_transaction(struct exynos_dp_device *dp);
-int exynos_dp_write_byte_to_dpcd(struct exynos_dp_device *dp,
-				 unsigned int reg_addr,
-				 unsigned char data);
-int exynos_dp_read_byte_from_dpcd(struct exynos_dp_device *dp,
-				  unsigned int reg_addr,
-				  unsigned char *data);
-int exynos_dp_write_bytes_to_dpcd(struct exynos_dp_device *dp,
-				  unsigned int reg_addr,
-				  unsigned int count,
-				  unsigned char data[]);
-int exynos_dp_read_bytes_from_dpcd(struct exynos_dp_device *dp,
-				   unsigned int reg_addr,
-				   unsigned int count,
-				   unsigned char data[]);
-int exynos_dp_select_i2c_device(struct exynos_dp_device *dp,
-				unsigned int device_addr,
-				unsigned int reg_addr);
-int exynos_dp_read_byte_from_i2c(struct exynos_dp_device *dp,
-				 unsigned int device_addr,
-				 unsigned int reg_addr,
-				 unsigned int *data);
-int exynos_dp_read_bytes_from_i2c(struct exynos_dp_device *dp,
-				  unsigned int device_addr,
-				  unsigned int reg_addr,
-				  unsigned int count,
-				  unsigned char edid[]);
-void exynos_dp_set_link_bandwidth(struct exynos_dp_device *dp, u32 bwtype);
-void exynos_dp_get_link_bandwidth(struct exynos_dp_device *dp, u32 *bwtype);
-void exynos_dp_set_lane_count(struct exynos_dp_device *dp, u32 count);
-void exynos_dp_get_lane_count(struct exynos_dp_device *dp, u32 *count);
-void exynos_dp_enable_enhanced_mode(struct exynos_dp_device *dp, bool enable);
-void exynos_dp_set_training_pattern(struct exynos_dp_device *dp,
-				    enum pattern_set pattern);
-void exynos_dp_set_lane0_pre_emphasis(struct exynos_dp_device *dp, u32 level);
-void exynos_dp_set_lane1_pre_emphasis(struct exynos_dp_device *dp, u32 level);
-void exynos_dp_set_lane2_pre_emphasis(struct exynos_dp_device *dp, u32 level);
-void exynos_dp_set_lane3_pre_emphasis(struct exynos_dp_device *dp, u32 level);
-void exynos_dp_set_lane0_link_training(struct exynos_dp_device *dp,
-				       u32 training_lane);
-void exynos_dp_set_lane1_link_training(struct exynos_dp_device *dp,
-				       u32 training_lane);
-void exynos_dp_set_lane2_link_training(struct exynos_dp_device *dp,
-				       u32 training_lane);
-void exynos_dp_set_lane3_link_training(struct exynos_dp_device *dp,
-				       u32 training_lane);
-u32 exynos_dp_get_lane0_link_training(struct exynos_dp_device *dp);
-u32 exynos_dp_get_lane1_link_training(struct exynos_dp_device *dp);
-u32 exynos_dp_get_lane2_link_training(struct exynos_dp_device *dp);
-u32 exynos_dp_get_lane3_link_training(struct exynos_dp_device *dp);
-void exynos_dp_reset_macro(struct exynos_dp_device *dp);
-void exynos_dp_init_video(struct exynos_dp_device *dp);
-
-void exynos_dp_set_video_color_format(struct exynos_dp_device *dp);
-int exynos_dp_is_slave_video_stream_clock_on(struct exynos_dp_device *dp);
-void exynos_dp_set_video_cr_mn(struct exynos_dp_device *dp,
-			       enum clock_recovery_m_value_type type,
-			       u32 m_value, u32 n_value);
-void exynos_dp_set_video_timing_mode(struct exynos_dp_device *dp, u32 type);
-void exynos_dp_enable_video_master(struct exynos_dp_device *dp, bool enable);
-void exynos_dp_start_video(struct exynos_dp_device *dp);
-int exynos_dp_is_video_stream_on(struct exynos_dp_device *dp);
-void exynos_dp_config_video_slave_mode(struct exynos_dp_device *dp);
-void exynos_dp_enable_scrambling(struct exynos_dp_device *dp);
-void exynos_dp_disable_scrambling(struct exynos_dp_device *dp);
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
-#endif /* _EXYNOS_DP_CORE_H */
diff --git a/drivers/gpu/drm/exynos/exynos_dp_reg.c b/drivers/gpu/drm/exynos/exynos_dp_reg.c
deleted file mode 100644
index 9aa483d..0000000
--- a/drivers/gpu/drm/exynos/exynos_dp_reg.c
+++ /dev/null
@@ -1,1259 +0,0 @@
-/*
- * Samsung DP (Display port) register interface driver.
- *
- * Copyright (C) 2012 Samsung Electronics Co., Ltd.
- * Author: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License as published by the
- * Free Software Foundation; either version 2 of the License, or (at your
- * option) any later version.
- */
-
-#include <linux/device.h>
-#include <linux/io.h>
-#include <linux/delay.h>
-#include <linux/gpio.h>
-
-#include "exynos_dp_core.h"
-#include "exynos_dp_reg.h"
-
-#define COMMON_INT_MASK_1	0
-#define COMMON_INT_MASK_2	0
-#define COMMON_INT_MASK_3	0
-#define COMMON_INT_MASK_4	(HOTPLUG_CHG | HPD_LOST | PLUG)
-#define INT_STA_MASK		INT_HPD
-
-void exynos_dp_enable_video_mute(struct exynos_dp_device *dp, bool enable)
-{
-	u32 reg;
-
-	if (enable) {
-		reg = readl(dp->reg_base + EXYNOS_DP_VIDEO_CTL_1);
-		reg |= HDCP_VIDEO_MUTE;
-		writel(reg, dp->reg_base + EXYNOS_DP_VIDEO_CTL_1);
-	} else {
-		reg = readl(dp->reg_base + EXYNOS_DP_VIDEO_CTL_1);
-		reg &= ~HDCP_VIDEO_MUTE;
-		writel(reg, dp->reg_base + EXYNOS_DP_VIDEO_CTL_1);
-	}
-}
-
-void exynos_dp_stop_video(struct exynos_dp_device *dp)
-{
-	u32 reg;
-
-	reg = readl(dp->reg_base + EXYNOS_DP_VIDEO_CTL_1);
-	reg &= ~VIDEO_EN;
-	writel(reg, dp->reg_base + EXYNOS_DP_VIDEO_CTL_1);
-}
-
-void exynos_dp_lane_swap(struct exynos_dp_device *dp, bool enable)
-{
-	u32 reg;
-
-	if (enable)
-		reg = LANE3_MAP_LOGIC_LANE_0 | LANE2_MAP_LOGIC_LANE_1 |
-			LANE1_MAP_LOGIC_LANE_2 | LANE0_MAP_LOGIC_LANE_3;
-	else
-		reg = LANE3_MAP_LOGIC_LANE_3 | LANE2_MAP_LOGIC_LANE_2 |
-			LANE1_MAP_LOGIC_LANE_1 | LANE0_MAP_LOGIC_LANE_0;
-
-	writel(reg, dp->reg_base + EXYNOS_DP_LANE_MAP);
-}
-
-void exynos_dp_init_analog_param(struct exynos_dp_device *dp)
-{
-	u32 reg;
-
-	reg = TX_TERMINAL_CTRL_50_OHM;
-	writel(reg, dp->reg_base + EXYNOS_DP_ANALOG_CTL_1);
-
-	reg = SEL_24M | TX_DVDD_BIT_1_0625V;
-	writel(reg, dp->reg_base + EXYNOS_DP_ANALOG_CTL_2);
-
-	reg = DRIVE_DVDD_BIT_1_0625V | VCO_BIT_600_MICRO;
-	writel(reg, dp->reg_base + EXYNOS_DP_ANALOG_CTL_3);
-
-	reg = PD_RING_OSC | AUX_TERMINAL_CTRL_50_OHM |
-		TX_CUR1_2X | TX_CUR_16_MA;
-	writel(reg, dp->reg_base + EXYNOS_DP_PLL_FILTER_CTL_1);
-
-	reg = CH3_AMP_400_MV | CH2_AMP_400_MV |
-		CH1_AMP_400_MV | CH0_AMP_400_MV;
-	writel(reg, dp->reg_base + EXYNOS_DP_TX_AMP_TUNING_CTL);
-}
-
-void exynos_dp_init_interrupt(struct exynos_dp_device *dp)
-{
-	/* Set interrupt pin assertion polarity as high */
-	writel(INT_POL1 | INT_POL0, dp->reg_base + EXYNOS_DP_INT_CTL);
-
-	/* Clear pending regisers */
-	writel(0xff, dp->reg_base + EXYNOS_DP_COMMON_INT_STA_1);
-	writel(0x4f, dp->reg_base + EXYNOS_DP_COMMON_INT_STA_2);
-	writel(0xe0, dp->reg_base + EXYNOS_DP_COMMON_INT_STA_3);
-	writel(0xe7, dp->reg_base + EXYNOS_DP_COMMON_INT_STA_4);
-	writel(0x63, dp->reg_base + EXYNOS_DP_INT_STA);
-
-	/* 0:mask,1: unmask */
-	writel(0x00, dp->reg_base + EXYNOS_DP_COMMON_INT_MASK_1);
-	writel(0x00, dp->reg_base + EXYNOS_DP_COMMON_INT_MASK_2);
-	writel(0x00, dp->reg_base + EXYNOS_DP_COMMON_INT_MASK_3);
-	writel(0x00, dp->reg_base + EXYNOS_DP_COMMON_INT_MASK_4);
-	writel(0x00, dp->reg_base + EXYNOS_DP_INT_STA_MASK);
-}
-
-void exynos_dp_reset(struct exynos_dp_device *dp)
-{
-	u32 reg;
-
-	exynos_dp_stop_video(dp);
-	exynos_dp_enable_video_mute(dp, 0);
-
-	reg = MASTER_VID_FUNC_EN_N | SLAVE_VID_FUNC_EN_N |
-		AUD_FIFO_FUNC_EN_N | AUD_FUNC_EN_N |
-		HDCP_FUNC_EN_N | SW_FUNC_EN_N;
-	writel(reg, dp->reg_base + EXYNOS_DP_FUNC_EN_1);
-
-	reg = SSC_FUNC_EN_N | AUX_FUNC_EN_N |
-		SERDES_FIFO_FUNC_EN_N |
-		LS_CLK_DOMAIN_FUNC_EN_N;
-	writel(reg, dp->reg_base + EXYNOS_DP_FUNC_EN_2);
-
-	usleep_range(20, 30);
-
-	exynos_dp_lane_swap(dp, 0);
-
-	writel(0x0, dp->reg_base + EXYNOS_DP_SYS_CTL_1);
-	writel(0x40, dp->reg_base + EXYNOS_DP_SYS_CTL_2);
-	writel(0x0, dp->reg_base + EXYNOS_DP_SYS_CTL_3);
-	writel(0x0, dp->reg_base + EXYNOS_DP_SYS_CTL_4);
-
-	writel(0x0, dp->reg_base + EXYNOS_DP_PKT_SEND_CTL);
-	writel(0x0, dp->reg_base + EXYNOS_DP_HDCP_CTL);
-
-	writel(0x5e, dp->reg_base + EXYNOS_DP_HPD_DEGLITCH_L);
-	writel(0x1a, dp->reg_base + EXYNOS_DP_HPD_DEGLITCH_H);
-
-	writel(0x10, dp->reg_base + EXYNOS_DP_LINK_DEBUG_CTL);
-
-	writel(0x0, dp->reg_base + EXYNOS_DP_PHY_TEST);
-
-	writel(0x0, dp->reg_base + EXYNOS_DP_VIDEO_FIFO_THRD);
-	writel(0x20, dp->reg_base + EXYNOS_DP_AUDIO_MARGIN);
-
-	writel(0x4, dp->reg_base + EXYNOS_DP_M_VID_GEN_FILTER_TH);
-	writel(0x2, dp->reg_base + EXYNOS_DP_M_AUD_GEN_FILTER_TH);
-
-	writel(0x00000101, dp->reg_base + EXYNOS_DP_SOC_GENERAL_CTL);
-}
-
-void exynos_dp_swreset(struct exynos_dp_device *dp)
-{
-	writel(RESET_DP_TX, dp->reg_base + EXYNOS_DP_TX_SW_RESET);
-}
-
-void exynos_dp_config_interrupt(struct exynos_dp_device *dp)
-{
-	u32 reg;
-
-	/* 0: mask, 1: unmask */
-	reg = COMMON_INT_MASK_1;
-	writel(reg, dp->reg_base + EXYNOS_DP_COMMON_INT_MASK_1);
-
-	reg = COMMON_INT_MASK_2;
-	writel(reg, dp->reg_base + EXYNOS_DP_COMMON_INT_MASK_2);
-
-	reg = COMMON_INT_MASK_3;
-	writel(reg, dp->reg_base + EXYNOS_DP_COMMON_INT_MASK_3);
-
-	reg = COMMON_INT_MASK_4;
-	writel(reg, dp->reg_base + EXYNOS_DP_COMMON_INT_MASK_4);
-
-	reg = INT_STA_MASK;
-	writel(reg, dp->reg_base + EXYNOS_DP_INT_STA_MASK);
-}
-
-enum pll_status exynos_dp_get_pll_lock_status(struct exynos_dp_device *dp)
-{
-	u32 reg;
-
-	reg = readl(dp->reg_base + EXYNOS_DP_DEBUG_CTL);
-	if (reg & PLL_LOCK)
-		return PLL_LOCKED;
-	else
-		return PLL_UNLOCKED;
-}
-
-void exynos_dp_set_pll_power_down(struct exynos_dp_device *dp, bool enable)
-{
-	u32 reg;
-
-	if (enable) {
-		reg = readl(dp->reg_base + EXYNOS_DP_PLL_CTL);
-		reg |= DP_PLL_PD;
-		writel(reg, dp->reg_base + EXYNOS_DP_PLL_CTL);
-	} else {
-		reg = readl(dp->reg_base + EXYNOS_DP_PLL_CTL);
-		reg &= ~DP_PLL_PD;
-		writel(reg, dp->reg_base + EXYNOS_DP_PLL_CTL);
-	}
-}
-
-void exynos_dp_set_analog_power_down(struct exynos_dp_device *dp,
-				     enum analog_power_block block,
-				     bool enable)
-{
-	u32 reg;
-
-	switch (block) {
-	case AUX_BLOCK:
-		if (enable) {
-			reg = readl(dp->reg_base + EXYNOS_DP_PHY_PD);
-			reg |= AUX_PD;
-			writel(reg, dp->reg_base + EXYNOS_DP_PHY_PD);
-		} else {
-			reg = readl(dp->reg_base + EXYNOS_DP_PHY_PD);
-			reg &= ~AUX_PD;
-			writel(reg, dp->reg_base + EXYNOS_DP_PHY_PD);
-		}
-		break;
-	case CH0_BLOCK:
-		if (enable) {
-			reg = readl(dp->reg_base + EXYNOS_DP_PHY_PD);
-			reg |= CH0_PD;
-			writel(reg, dp->reg_base + EXYNOS_DP_PHY_PD);
-		} else {
-			reg = readl(dp->reg_base + EXYNOS_DP_PHY_PD);
-			reg &= ~CH0_PD;
-			writel(reg, dp->reg_base + EXYNOS_DP_PHY_PD);
-		}
-		break;
-	case CH1_BLOCK:
-		if (enable) {
-			reg = readl(dp->reg_base + EXYNOS_DP_PHY_PD);
-			reg |= CH1_PD;
-			writel(reg, dp->reg_base + EXYNOS_DP_PHY_PD);
-		} else {
-			reg = readl(dp->reg_base + EXYNOS_DP_PHY_PD);
-			reg &= ~CH1_PD;
-			writel(reg, dp->reg_base + EXYNOS_DP_PHY_PD);
-		}
-		break;
-	case CH2_BLOCK:
-		if (enable) {
-			reg = readl(dp->reg_base + EXYNOS_DP_PHY_PD);
-			reg |= CH2_PD;
-			writel(reg, dp->reg_base + EXYNOS_DP_PHY_PD);
-		} else {
-			reg = readl(dp->reg_base + EXYNOS_DP_PHY_PD);
-			reg &= ~CH2_PD;
-			writel(reg, dp->reg_base + EXYNOS_DP_PHY_PD);
-		}
-		break;
-	case CH3_BLOCK:
-		if (enable) {
-			reg = readl(dp->reg_base + EXYNOS_DP_PHY_PD);
-			reg |= CH3_PD;
-			writel(reg, dp->reg_base + EXYNOS_DP_PHY_PD);
-		} else {
-			reg = readl(dp->reg_base + EXYNOS_DP_PHY_PD);
-			reg &= ~CH3_PD;
-			writel(reg, dp->reg_base + EXYNOS_DP_PHY_PD);
-		}
-		break;
-	case ANALOG_TOTAL:
-		if (enable) {
-			reg = readl(dp->reg_base + EXYNOS_DP_PHY_PD);
-			reg |= DP_PHY_PD;
-			writel(reg, dp->reg_base + EXYNOS_DP_PHY_PD);
-		} else {
-			reg = readl(dp->reg_base + EXYNOS_DP_PHY_PD);
-			reg &= ~DP_PHY_PD;
-			writel(reg, dp->reg_base + EXYNOS_DP_PHY_PD);
-		}
-		break;
-	case POWER_ALL:
-		if (enable) {
-			reg = DP_PHY_PD | AUX_PD | CH3_PD | CH2_PD |
-				CH1_PD | CH0_PD;
-			writel(reg, dp->reg_base + EXYNOS_DP_PHY_PD);
-		} else {
-			writel(0x00, dp->reg_base + EXYNOS_DP_PHY_PD);
-		}
-		break;
-	default:
-		break;
-	}
-}
-
-void exynos_dp_init_analog_func(struct exynos_dp_device *dp)
-{
-	u32 reg;
-	int timeout_loop = 0;
-
-	exynos_dp_set_analog_power_down(dp, POWER_ALL, 0);
-
-	reg = PLL_LOCK_CHG;
-	writel(reg, dp->reg_base + EXYNOS_DP_COMMON_INT_STA_1);
-
-	reg = readl(dp->reg_base + EXYNOS_DP_DEBUG_CTL);
-	reg &= ~(F_PLL_LOCK | PLL_LOCK_CTRL);
-	writel(reg, dp->reg_base + EXYNOS_DP_DEBUG_CTL);
-
-	/* Power up PLL */
-	if (exynos_dp_get_pll_lock_status(dp) == PLL_UNLOCKED) {
-		exynos_dp_set_pll_power_down(dp, 0);
-
-		while (exynos_dp_get_pll_lock_status(dp) == PLL_UNLOCKED) {
-			timeout_loop++;
-			if (DP_TIMEOUT_LOOP_COUNT < timeout_loop) {
-				dev_err(dp->dev, "failed to get pll lock status\n");
-				return;
-			}
-			usleep_range(10, 20);
-		}
-	}
-
-	/* Enable Serdes FIFO function and Link symbol clock domain module */
-	reg = readl(dp->reg_base + EXYNOS_DP_FUNC_EN_2);
-	reg &= ~(SERDES_FIFO_FUNC_EN_N | LS_CLK_DOMAIN_FUNC_EN_N
-		| AUX_FUNC_EN_N);
-	writel(reg, dp->reg_base + EXYNOS_DP_FUNC_EN_2);
-}
-
-void exynos_dp_clear_hotplug_interrupts(struct exynos_dp_device *dp)
-{
-	u32 reg;
-
-	if (gpio_is_valid(dp->hpd_gpio))
-		return;
-
-	reg = HOTPLUG_CHG | HPD_LOST | PLUG;
-	writel(reg, dp->reg_base + EXYNOS_DP_COMMON_INT_STA_4);
-
-	reg = INT_HPD;
-	writel(reg, dp->reg_base + EXYNOS_DP_INT_STA);
-}
-
-void exynos_dp_init_hpd(struct exynos_dp_device *dp)
-{
-	u32 reg;
-
-	if (gpio_is_valid(dp->hpd_gpio))
-		return;
-
-	exynos_dp_clear_hotplug_interrupts(dp);
-
-	reg = readl(dp->reg_base + EXYNOS_DP_SYS_CTL_3);
-	reg &= ~(F_HPD | HPD_CTRL);
-	writel(reg, dp->reg_base + EXYNOS_DP_SYS_CTL_3);
-}
-
-enum dp_irq_type exynos_dp_get_irq_type(struct exynos_dp_device *dp)
-{
-	u32 reg;
-
-	if (gpio_is_valid(dp->hpd_gpio)) {
-		reg = gpio_get_value(dp->hpd_gpio);
-		if (reg)
-			return DP_IRQ_TYPE_HP_CABLE_IN;
-		else
-			return DP_IRQ_TYPE_HP_CABLE_OUT;
-	} else {
-		/* Parse hotplug interrupt status register */
-		reg = readl(dp->reg_base + EXYNOS_DP_COMMON_INT_STA_4);
-
-		if (reg & PLUG)
-			return DP_IRQ_TYPE_HP_CABLE_IN;
-
-		if (reg & HPD_LOST)
-			return DP_IRQ_TYPE_HP_CABLE_OUT;
-
-		if (reg & HOTPLUG_CHG)
-			return DP_IRQ_TYPE_HP_CHANGE;
-
-		return DP_IRQ_TYPE_UNKNOWN;
-	}
-}
-
-void exynos_dp_reset_aux(struct exynos_dp_device *dp)
-{
-	u32 reg;
-
-	/* Disable AUX channel module */
-	reg = readl(dp->reg_base + EXYNOS_DP_FUNC_EN_2);
-	reg |= AUX_FUNC_EN_N;
-	writel(reg, dp->reg_base + EXYNOS_DP_FUNC_EN_2);
-}
-
-void exynos_dp_init_aux(struct exynos_dp_device *dp)
-{
-	u32 reg;
-
-	/* Clear inerrupts related to AUX channel */
-	reg = RPLY_RECEIV | AUX_ERR;
-	writel(reg, dp->reg_base + EXYNOS_DP_INT_STA);
-
-	exynos_dp_reset_aux(dp);
-
-	/* Disable AUX transaction H/W retry */
-	reg = AUX_BIT_PERIOD_EXPECTED_DELAY(3) | AUX_HW_RETRY_COUNT_SEL(0) |
-	      AUX_HW_RETRY_INTERVAL_600_MICROSECONDS;
-	writel(reg, dp->reg_base + EXYNOS_DP_AUX_HW_RETRY_CTL);
-
-	/* Receive AUX Channel DEFER commands equal to DEFFER_COUNT*64 */
-	reg = DEFER_CTRL_EN | DEFER_COUNT(1);
-	writel(reg, dp->reg_base + EXYNOS_DP_AUX_CH_DEFER_CTL);
-
-	/* Enable AUX channel module */
-	reg = readl(dp->reg_base + EXYNOS_DP_FUNC_EN_2);
-	reg &= ~AUX_FUNC_EN_N;
-	writel(reg, dp->reg_base + EXYNOS_DP_FUNC_EN_2);
-}
-
-int exynos_dp_get_plug_in_status(struct exynos_dp_device *dp)
-{
-	u32 reg;
-
-	if (gpio_is_valid(dp->hpd_gpio)) {
-		if (gpio_get_value(dp->hpd_gpio))
-			return 0;
-	} else {
-		reg = readl(dp->reg_base + EXYNOS_DP_SYS_CTL_3);
-		if (reg & HPD_STATUS)
-			return 0;
-	}
-
-	return -EINVAL;
-}
-
-void exynos_dp_enable_sw_function(struct exynos_dp_device *dp)
-{
-	u32 reg;
-
-	reg = readl(dp->reg_base + EXYNOS_DP_FUNC_EN_1);
-	reg &= ~SW_FUNC_EN_N;
-	writel(reg, dp->reg_base + EXYNOS_DP_FUNC_EN_1);
-}
-
-int exynos_dp_start_aux_transaction(struct exynos_dp_device *dp)
-{
-	int reg;
-	int retval = 0;
-	int timeout_loop = 0;
-
-	/* Enable AUX CH operation */
-	reg = readl(dp->reg_base + EXYNOS_DP_AUX_CH_CTL_2);
-	reg |= AUX_EN;
-	writel(reg, dp->reg_base + EXYNOS_DP_AUX_CH_CTL_2);
-
-	/* Is AUX CH command reply received? */
-	reg = readl(dp->reg_base + EXYNOS_DP_INT_STA);
-	while (!(reg & RPLY_RECEIV)) {
-		timeout_loop++;
-		if (DP_TIMEOUT_LOOP_COUNT < timeout_loop) {
-			dev_err(dp->dev, "AUX CH command reply failed!\n");
-			return -ETIMEDOUT;
-		}
-		reg = readl(dp->reg_base + EXYNOS_DP_INT_STA);
-		usleep_range(10, 11);
-	}
-
-	/* Clear interrupt source for AUX CH command reply */
-	writel(RPLY_RECEIV, dp->reg_base + EXYNOS_DP_INT_STA);
-
-	/* Clear interrupt source for AUX CH access error */
-	reg = readl(dp->reg_base + EXYNOS_DP_INT_STA);
-	if (reg & AUX_ERR) {
-		writel(AUX_ERR, dp->reg_base + EXYNOS_DP_INT_STA);
-		return -EREMOTEIO;
-	}
-
-	/* Check AUX CH error access status */
-	reg = readl(dp->reg_base + EXYNOS_DP_AUX_CH_STA);
-	if ((reg & AUX_STATUS_MASK) != 0) {
-		dev_err(dp->dev, "AUX CH error happens: %d\n\n",
-			reg & AUX_STATUS_MASK);
-		return -EREMOTEIO;
-	}
-
-	return retval;
-}
-
-int exynos_dp_write_byte_to_dpcd(struct exynos_dp_device *dp,
-				 unsigned int reg_addr,
-				 unsigned char data)
-{
-	u32 reg;
-	int i;
-	int retval;
-
-	for (i = 0; i < 3; i++) {
-		/* Clear AUX CH data buffer */
-		reg = BUF_CLR;
-		writel(reg, dp->reg_base + EXYNOS_DP_BUFFER_DATA_CTL);
-
-		/* Select DPCD device address */
-		reg = AUX_ADDR_7_0(reg_addr);
-		writel(reg, dp->reg_base + EXYNOS_DP_AUX_ADDR_7_0);
-		reg = AUX_ADDR_15_8(reg_addr);
-		writel(reg, dp->reg_base + EXYNOS_DP_AUX_ADDR_15_8);
-		reg = AUX_ADDR_19_16(reg_addr);
-		writel(reg, dp->reg_base + EXYNOS_DP_AUX_ADDR_19_16);
-
-		/* Write data buffer */
-		reg = (unsigned int)data;
-		writel(reg, dp->reg_base + EXYNOS_DP_BUF_DATA_0);
-
-		/*
-		 * Set DisplayPort transaction and write 1 byte
-		 * If bit 3 is 1, DisplayPort transaction.
-		 * If Bit 3 is 0, I2C transaction.
-		 */
-		reg = AUX_TX_COMM_DP_TRANSACTION | AUX_TX_COMM_WRITE;
-		writel(reg, dp->reg_base + EXYNOS_DP_AUX_CH_CTL_1);
-
-		/* Start AUX transaction */
-		retval = exynos_dp_start_aux_transaction(dp);
-		if (retval == 0)
-			break;
-
-		dev_dbg(dp->dev, "%s: Aux Transaction fail!\n", __func__);
-	}
-
-	return retval;
-}
-
-int exynos_dp_read_byte_from_dpcd(struct exynos_dp_device *dp,
-				  unsigned int reg_addr,
-				  unsigned char *data)
-{
-	u32 reg;
-	int i;
-	int retval;
-
-	for (i = 0; i < 3; i++) {
-		/* Clear AUX CH data buffer */
-		reg = BUF_CLR;
-		writel(reg, dp->reg_base + EXYNOS_DP_BUFFER_DATA_CTL);
-
-		/* Select DPCD device address */
-		reg = AUX_ADDR_7_0(reg_addr);
-		writel(reg, dp->reg_base + EXYNOS_DP_AUX_ADDR_7_0);
-		reg = AUX_ADDR_15_8(reg_addr);
-		writel(reg, dp->reg_base + EXYNOS_DP_AUX_ADDR_15_8);
-		reg = AUX_ADDR_19_16(reg_addr);
-		writel(reg, dp->reg_base + EXYNOS_DP_AUX_ADDR_19_16);
-
-		/*
-		 * Set DisplayPort transaction and read 1 byte
-		 * If bit 3 is 1, DisplayPort transaction.
-		 * If Bit 3 is 0, I2C transaction.
-		 */
-		reg = AUX_TX_COMM_DP_TRANSACTION | AUX_TX_COMM_READ;
-		writel(reg, dp->reg_base + EXYNOS_DP_AUX_CH_CTL_1);
-
-		/* Start AUX transaction */
-		retval = exynos_dp_start_aux_transaction(dp);
-		if (retval == 0)
-			break;
-
-		dev_dbg(dp->dev, "%s: Aux Transaction fail!\n", __func__);
-	}
-
-	/* Read data buffer */
-	reg = readl(dp->reg_base + EXYNOS_DP_BUF_DATA_0);
-	*data = (unsigned char)(reg & 0xff);
-
-	return retval;
-}
-
-int exynos_dp_write_bytes_to_dpcd(struct exynos_dp_device *dp,
-				  unsigned int reg_addr,
-				  unsigned int count,
-				  unsigned char data[])
-{
-	u32 reg;
-	unsigned int start_offset;
-	unsigned int cur_data_count;
-	unsigned int cur_data_idx;
-	int i;
-	int retval = 0;
-
-	/* Clear AUX CH data buffer */
-	reg = BUF_CLR;
-	writel(reg, dp->reg_base + EXYNOS_DP_BUFFER_DATA_CTL);
-
-	start_offset = 0;
-	while (start_offset < count) {
-		/* Buffer size of AUX CH is 16 * 4bytes */
-		if ((count - start_offset) > 16)
-			cur_data_count = 16;
-		else
-			cur_data_count = count - start_offset;
-
-		for (i = 0; i < 3; i++) {
-			/* Select DPCD device address */
-			reg = AUX_ADDR_7_0(reg_addr + start_offset);
-			writel(reg, dp->reg_base + EXYNOS_DP_AUX_ADDR_7_0);
-			reg = AUX_ADDR_15_8(reg_addr + start_offset);
-			writel(reg, dp->reg_base + EXYNOS_DP_AUX_ADDR_15_8);
-			reg = AUX_ADDR_19_16(reg_addr + start_offset);
-			writel(reg, dp->reg_base + EXYNOS_DP_AUX_ADDR_19_16);
-
-			for (cur_data_idx = 0; cur_data_idx < cur_data_count;
-			     cur_data_idx++) {
-				reg = data[start_offset + cur_data_idx];
-				writel(reg, dp->reg_base + EXYNOS_DP_BUF_DATA_0
-							  + 4 * cur_data_idx);
-			}
-
-			/*
-			 * Set DisplayPort transaction and write
-			 * If bit 3 is 1, DisplayPort transaction.
-			 * If Bit 3 is 0, I2C transaction.
-			 */
-			reg = AUX_LENGTH(cur_data_count) |
-				AUX_TX_COMM_DP_TRANSACTION | AUX_TX_COMM_WRITE;
-			writel(reg, dp->reg_base + EXYNOS_DP_AUX_CH_CTL_1);
-
-			/* Start AUX transaction */
-			retval = exynos_dp_start_aux_transaction(dp);
-			if (retval == 0)
-				break;
-
-			dev_dbg(dp->dev, "%s: Aux Transaction fail!\n",
-				__func__);
-		}
-
-		start_offset += cur_data_count;
-	}
-
-	return retval;
-}
-
-int exynos_dp_read_bytes_from_dpcd(struct exynos_dp_device *dp,
-				   unsigned int reg_addr,
-				   unsigned int count,
-				   unsigned char data[])
-{
-	u32 reg;
-	unsigned int start_offset;
-	unsigned int cur_data_count;
-	unsigned int cur_data_idx;
-	int i;
-	int retval = 0;
-
-	/* Clear AUX CH data buffer */
-	reg = BUF_CLR;
-	writel(reg, dp->reg_base + EXYNOS_DP_BUFFER_DATA_CTL);
-
-	start_offset = 0;
-	while (start_offset < count) {
-		/* Buffer size of AUX CH is 16 * 4bytes */
-		if ((count - start_offset) > 16)
-			cur_data_count = 16;
-		else
-			cur_data_count = count - start_offset;
-
-		/* AUX CH Request Transaction process */
-		for (i = 0; i < 3; i++) {
-			/* Select DPCD device address */
-			reg = AUX_ADDR_7_0(reg_addr + start_offset);
-			writel(reg, dp->reg_base + EXYNOS_DP_AUX_ADDR_7_0);
-			reg = AUX_ADDR_15_8(reg_addr + start_offset);
-			writel(reg, dp->reg_base + EXYNOS_DP_AUX_ADDR_15_8);
-			reg = AUX_ADDR_19_16(reg_addr + start_offset);
-			writel(reg, dp->reg_base + EXYNOS_DP_AUX_ADDR_19_16);
-
-			/*
-			 * Set DisplayPort transaction and read
-			 * If bit 3 is 1, DisplayPort transaction.
-			 * If Bit 3 is 0, I2C transaction.
-			 */
-			reg = AUX_LENGTH(cur_data_count) |
-				AUX_TX_COMM_DP_TRANSACTION | AUX_TX_COMM_READ;
-			writel(reg, dp->reg_base + EXYNOS_DP_AUX_CH_CTL_1);
-
-			/* Start AUX transaction */
-			retval = exynos_dp_start_aux_transaction(dp);
-			if (retval == 0)
-				break;
-
-			dev_dbg(dp->dev, "%s: Aux Transaction fail!\n",
-				__func__);
-		}
-
-		for (cur_data_idx = 0; cur_data_idx < cur_data_count;
-		    cur_data_idx++) {
-			reg = readl(dp->reg_base + EXYNOS_DP_BUF_DATA_0
-						 + 4 * cur_data_idx);
-			data[start_offset + cur_data_idx] =
-				(unsigned char)reg;
-		}
-
-		start_offset += cur_data_count;
-	}
-
-	return retval;
-}
-
-int exynos_dp_select_i2c_device(struct exynos_dp_device *dp,
-				unsigned int device_addr,
-				unsigned int reg_addr)
-{
-	u32 reg;
-	int retval;
-
-	/* Set EDID device address */
-	reg = device_addr;
-	writel(reg, dp->reg_base + EXYNOS_DP_AUX_ADDR_7_0);
-	writel(0x0, dp->reg_base + EXYNOS_DP_AUX_ADDR_15_8);
-	writel(0x0, dp->reg_base + EXYNOS_DP_AUX_ADDR_19_16);
-
-	/* Set offset from base address of EDID device */
-	writel(reg_addr, dp->reg_base + EXYNOS_DP_BUF_DATA_0);
-
-	/*
-	 * Set I2C transaction and write address
-	 * If bit 3 is 1, DisplayPort transaction.
-	 * If Bit 3 is 0, I2C transaction.
-	 */
-	reg = AUX_TX_COMM_I2C_TRANSACTION | AUX_TX_COMM_MOT |
-		AUX_TX_COMM_WRITE;
-	writel(reg, dp->reg_base + EXYNOS_DP_AUX_CH_CTL_1);
-
-	/* Start AUX transaction */
-	retval = exynos_dp_start_aux_transaction(dp);
-	if (retval != 0)
-		dev_dbg(dp->dev, "%s: Aux Transaction fail!\n", __func__);
-
-	return retval;
-}
-
-int exynos_dp_read_byte_from_i2c(struct exynos_dp_device *dp,
-				 unsigned int device_addr,
-				 unsigned int reg_addr,
-				 unsigned int *data)
-{
-	u32 reg;
-	int i;
-	int retval;
-
-	for (i = 0; i < 3; i++) {
-		/* Clear AUX CH data buffer */
-		reg = BUF_CLR;
-		writel(reg, dp->reg_base + EXYNOS_DP_BUFFER_DATA_CTL);
-
-		/* Select EDID device */
-		retval = exynos_dp_select_i2c_device(dp, device_addr, reg_addr);
-		if (retval != 0)
-			continue;
-
-		/*
-		 * Set I2C transaction and read data
-		 * If bit 3 is 1, DisplayPort transaction.
-		 * If Bit 3 is 0, I2C transaction.
-		 */
-		reg = AUX_TX_COMM_I2C_TRANSACTION |
-			AUX_TX_COMM_READ;
-		writel(reg, dp->reg_base + EXYNOS_DP_AUX_CH_CTL_1);
-
-		/* Start AUX transaction */
-		retval = exynos_dp_start_aux_transaction(dp);
-		if (retval == 0)
-			break;
-
-		dev_dbg(dp->dev, "%s: Aux Transaction fail!\n", __func__);
-	}
-
-	/* Read data */
-	if (retval == 0)
-		*data = readl(dp->reg_base + EXYNOS_DP_BUF_DATA_0);
-
-	return retval;
-}
-
-int exynos_dp_read_bytes_from_i2c(struct exynos_dp_device *dp,
-				  unsigned int device_addr,
-				  unsigned int reg_addr,
-				  unsigned int count,
-				  unsigned char edid[])
-{
-	u32 reg;
-	unsigned int i, j;
-	unsigned int cur_data_idx;
-	unsigned int defer = 0;
-	int retval = 0;
-
-	for (i = 0; i < count; i += 16) {
-		for (j = 0; j < 3; j++) {
-			/* Clear AUX CH data buffer */
-			reg = BUF_CLR;
-			writel(reg, dp->reg_base + EXYNOS_DP_BUFFER_DATA_CTL);
-
-			/* Set normal AUX CH command */
-			reg = readl(dp->reg_base + EXYNOS_DP_AUX_CH_CTL_2);
-			reg &= ~ADDR_ONLY;
-			writel(reg, dp->reg_base + EXYNOS_DP_AUX_CH_CTL_2);
-
-			/*
-			 * If Rx sends defer, Tx sends only reads
-			 * request without sending address
-			 */
-			if (!defer)
-				retval = exynos_dp_select_i2c_device(
-						dp, device_addr, reg_addr + i);
-			else
-				defer = 0;
-
-			if (retval == 0) {
-				/*
-				 * Set I2C transaction and write data
-				 * If bit 3 is 1, DisplayPort transaction.
-				 * If Bit 3 is 0, I2C transaction.
-				 */
-				reg = AUX_LENGTH(16) |
-					AUX_TX_COMM_I2C_TRANSACTION |
-					AUX_TX_COMM_READ;
-				writel(reg, dp->reg_base +
-					EXYNOS_DP_AUX_CH_CTL_1);
-
-				/* Start AUX transaction */
-				retval = exynos_dp_start_aux_transaction(dp);
-				if (retval == 0)
-					break;
-
-				dev_dbg(dp->dev, "%s: Aux Transaction fail!\n",
-					__func__);
-			}
-			/* Check if Rx sends defer */
-			reg = readl(dp->reg_base + EXYNOS_DP_AUX_RX_COMM);
-			if (reg == AUX_RX_COMM_AUX_DEFER ||
-			    reg == AUX_RX_COMM_I2C_DEFER) {
-				dev_err(dp->dev, "Defer: %d\n\n", reg);
-				defer = 1;
-			}
-		}
-
-		for (cur_data_idx = 0; cur_data_idx < 16; cur_data_idx++) {
-			reg = readl(dp->reg_base + EXYNOS_DP_BUF_DATA_0
-						 + 4 * cur_data_idx);
-			edid[i + cur_data_idx] = (unsigned char)reg;
-		}
-	}
-
-	return retval;
-}
-
-void exynos_dp_set_link_bandwidth(struct exynos_dp_device *dp, u32 bwtype)
-{
-	u32 reg;
-
-	reg = bwtype;
-	if ((bwtype == LINK_RATE_2_70GBPS) || (bwtype == LINK_RATE_1_62GBPS))
-		writel(reg, dp->reg_base + EXYNOS_DP_LINK_BW_SET);
-}
-
-void exynos_dp_get_link_bandwidth(struct exynos_dp_device *dp, u32 *bwtype)
-{
-	u32 reg;
-
-	reg = readl(dp->reg_base + EXYNOS_DP_LINK_BW_SET);
-	*bwtype = reg;
-}
-
-void exynos_dp_set_lane_count(struct exynos_dp_device *dp, u32 count)
-{
-	u32 reg;
-
-	reg = count;
-	writel(reg, dp->reg_base + EXYNOS_DP_LANE_COUNT_SET);
-}
-
-void exynos_dp_get_lane_count(struct exynos_dp_device *dp, u32 *count)
-{
-	u32 reg;
-
-	reg = readl(dp->reg_base + EXYNOS_DP_LANE_COUNT_SET);
-	*count = reg;
-}
-
-void exynos_dp_enable_enhanced_mode(struct exynos_dp_device *dp, bool enable)
-{
-	u32 reg;
-
-	if (enable) {
-		reg = readl(dp->reg_base + EXYNOS_DP_SYS_CTL_4);
-		reg |= ENHANCED;
-		writel(reg, dp->reg_base + EXYNOS_DP_SYS_CTL_4);
-	} else {
-		reg = readl(dp->reg_base + EXYNOS_DP_SYS_CTL_4);
-		reg &= ~ENHANCED;
-		writel(reg, dp->reg_base + EXYNOS_DP_SYS_CTL_4);
-	}
-}
-
-void exynos_dp_set_training_pattern(struct exynos_dp_device *dp,
-				    enum pattern_set pattern)
-{
-	u32 reg;
-
-	switch (pattern) {
-	case PRBS7:
-		reg = SCRAMBLING_ENABLE | LINK_QUAL_PATTERN_SET_PRBS7;
-		writel(reg, dp->reg_base + EXYNOS_DP_TRAINING_PTN_SET);
-		break;
-	case D10_2:
-		reg = SCRAMBLING_ENABLE | LINK_QUAL_PATTERN_SET_D10_2;
-		writel(reg, dp->reg_base + EXYNOS_DP_TRAINING_PTN_SET);
-		break;
-	case TRAINING_PTN1:
-		reg = SCRAMBLING_DISABLE | SW_TRAINING_PATTERN_SET_PTN1;
-		writel(reg, dp->reg_base + EXYNOS_DP_TRAINING_PTN_SET);
-		break;
-	case TRAINING_PTN2:
-		reg = SCRAMBLING_DISABLE | SW_TRAINING_PATTERN_SET_PTN2;
-		writel(reg, dp->reg_base + EXYNOS_DP_TRAINING_PTN_SET);
-		break;
-	case DP_NONE:
-		reg = SCRAMBLING_ENABLE |
-			LINK_QUAL_PATTERN_SET_DISABLE |
-			SW_TRAINING_PATTERN_SET_NORMAL;
-		writel(reg, dp->reg_base + EXYNOS_DP_TRAINING_PTN_SET);
-		break;
-	default:
-		break;
-	}
-}
-
-void exynos_dp_set_lane0_pre_emphasis(struct exynos_dp_device *dp, u32 level)
-{
-	u32 reg;
-
-	reg = readl(dp->reg_base + EXYNOS_DP_LN0_LINK_TRAINING_CTL);
-	reg &= ~PRE_EMPHASIS_SET_MASK;
-	reg |= level << PRE_EMPHASIS_SET_SHIFT;
-	writel(reg, dp->reg_base + EXYNOS_DP_LN0_LINK_TRAINING_CTL);
-}
-
-void exynos_dp_set_lane1_pre_emphasis(struct exynos_dp_device *dp, u32 level)
-{
-	u32 reg;
-
-	reg = readl(dp->reg_base + EXYNOS_DP_LN1_LINK_TRAINING_CTL);
-	reg &= ~PRE_EMPHASIS_SET_MASK;
-	reg |= level << PRE_EMPHASIS_SET_SHIFT;
-	writel(reg, dp->reg_base + EXYNOS_DP_LN1_LINK_TRAINING_CTL);
-}
-
-void exynos_dp_set_lane2_pre_emphasis(struct exynos_dp_device *dp, u32 level)
-{
-	u32 reg;
-
-	reg = readl(dp->reg_base + EXYNOS_DP_LN2_LINK_TRAINING_CTL);
-	reg &= ~PRE_EMPHASIS_SET_MASK;
-	reg |= level << PRE_EMPHASIS_SET_SHIFT;
-	writel(reg, dp->reg_base + EXYNOS_DP_LN2_LINK_TRAINING_CTL);
-}
-
-void exynos_dp_set_lane3_pre_emphasis(struct exynos_dp_device *dp, u32 level)
-{
-	u32 reg;
-
-	reg = readl(dp->reg_base + EXYNOS_DP_LN3_LINK_TRAINING_CTL);
-	reg &= ~PRE_EMPHASIS_SET_MASK;
-	reg |= level << PRE_EMPHASIS_SET_SHIFT;
-	writel(reg, dp->reg_base + EXYNOS_DP_LN3_LINK_TRAINING_CTL);
-}
-
-void exynos_dp_set_lane0_link_training(struct exynos_dp_device *dp,
-				       u32 training_lane)
-{
-	u32 reg;
-
-	reg = training_lane;
-	writel(reg, dp->reg_base + EXYNOS_DP_LN0_LINK_TRAINING_CTL);
-}
-
-void exynos_dp_set_lane1_link_training(struct exynos_dp_device *dp,
-				       u32 training_lane)
-{
-	u32 reg;
-
-	reg = training_lane;
-	writel(reg, dp->reg_base + EXYNOS_DP_LN1_LINK_TRAINING_CTL);
-}
-
-void exynos_dp_set_lane2_link_training(struct exynos_dp_device *dp,
-				       u32 training_lane)
-{
-	u32 reg;
-
-	reg = training_lane;
-	writel(reg, dp->reg_base + EXYNOS_DP_LN2_LINK_TRAINING_CTL);
-}
-
-void exynos_dp_set_lane3_link_training(struct exynos_dp_device *dp,
-				       u32 training_lane)
-{
-	u32 reg;
-
-	reg = training_lane;
-	writel(reg, dp->reg_base + EXYNOS_DP_LN3_LINK_TRAINING_CTL);
-}
-
-u32 exynos_dp_get_lane0_link_training(struct exynos_dp_device *dp)
-{
-	u32 reg;
-
-	reg = readl(dp->reg_base + EXYNOS_DP_LN0_LINK_TRAINING_CTL);
-	return reg;
-}
-
-u32 exynos_dp_get_lane1_link_training(struct exynos_dp_device *dp)
-{
-	u32 reg;
-
-	reg = readl(dp->reg_base + EXYNOS_DP_LN1_LINK_TRAINING_CTL);
-	return reg;
-}
-
-u32 exynos_dp_get_lane2_link_training(struct exynos_dp_device *dp)
-{
-	u32 reg;
-
-	reg = readl(dp->reg_base + EXYNOS_DP_LN2_LINK_TRAINING_CTL);
-	return reg;
-}
-
-u32 exynos_dp_get_lane3_link_training(struct exynos_dp_device *dp)
-{
-	u32 reg;
-
-	reg = readl(dp->reg_base + EXYNOS_DP_LN3_LINK_TRAINING_CTL);
-	return reg;
-}
-
-void exynos_dp_reset_macro(struct exynos_dp_device *dp)
-{
-	u32 reg;
-
-	reg = readl(dp->reg_base + EXYNOS_DP_PHY_TEST);
-	reg |= MACRO_RST;
-	writel(reg, dp->reg_base + EXYNOS_DP_PHY_TEST);
-
-	/* 10 us is the minimum reset time. */
-	usleep_range(10, 20);
-
-	reg &= ~MACRO_RST;
-	writel(reg, dp->reg_base + EXYNOS_DP_PHY_TEST);
-}
-
-void exynos_dp_init_video(struct exynos_dp_device *dp)
-{
-	u32 reg;
-
-	reg = VSYNC_DET | VID_FORMAT_CHG | VID_CLK_CHG;
-	writel(reg, dp->reg_base + EXYNOS_DP_COMMON_INT_STA_1);
-
-	reg = 0x0;
-	writel(reg, dp->reg_base + EXYNOS_DP_SYS_CTL_1);
-
-	reg = CHA_CRI(4) | CHA_CTRL;
-	writel(reg, dp->reg_base + EXYNOS_DP_SYS_CTL_2);
-
-	reg = 0x0;
-	writel(reg, dp->reg_base + EXYNOS_DP_SYS_CTL_3);
-
-	reg = VID_HRES_TH(2) | VID_VRES_TH(0);
-	writel(reg, dp->reg_base + EXYNOS_DP_VIDEO_CTL_8);
-}
-
-void exynos_dp_set_video_color_format(struct exynos_dp_device *dp)
-{
-	u32 reg;
-
-	/* Configure the input color depth, color space, dynamic range */
-	reg = (dp->video_info->dynamic_range << IN_D_RANGE_SHIFT) |
-		(dp->video_info->color_depth << IN_BPC_SHIFT) |
-		(dp->video_info->color_space << IN_COLOR_F_SHIFT);
-	writel(reg, dp->reg_base + EXYNOS_DP_VIDEO_CTL_2);
-
-	/* Set Input Color YCbCr Coefficients to ITU601 or ITU709 */
-	reg = readl(dp->reg_base + EXYNOS_DP_VIDEO_CTL_3);
-	reg &= ~IN_YC_COEFFI_MASK;
-	if (dp->video_info->ycbcr_coeff)
-		reg |= IN_YC_COEFFI_ITU709;
-	else
-		reg |= IN_YC_COEFFI_ITU601;
-	writel(reg, dp->reg_base + EXYNOS_DP_VIDEO_CTL_3);
-}
-
-int exynos_dp_is_slave_video_stream_clock_on(struct exynos_dp_device *dp)
-{
-	u32 reg;
-
-	reg = readl(dp->reg_base + EXYNOS_DP_SYS_CTL_1);
-	writel(reg, dp->reg_base + EXYNOS_DP_SYS_CTL_1);
-
-	reg = readl(dp->reg_base + EXYNOS_DP_SYS_CTL_1);
-
-	if (!(reg & DET_STA)) {
-		dev_dbg(dp->dev, "Input stream clock not detected.\n");
-		return -EINVAL;
-	}
-
-	reg = readl(dp->reg_base + EXYNOS_DP_SYS_CTL_2);
-	writel(reg, dp->reg_base + EXYNOS_DP_SYS_CTL_2);
-
-	reg = readl(dp->reg_base + EXYNOS_DP_SYS_CTL_2);
-	dev_dbg(dp->dev, "wait SYS_CTL_2.\n");
-
-	if (reg & CHA_STA) {
-		dev_dbg(dp->dev, "Input stream clk is changing\n");
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-void exynos_dp_set_video_cr_mn(struct exynos_dp_device *dp,
-			       enum clock_recovery_m_value_type type,
-			       u32 m_value,
-			       u32 n_value)
-{
-	u32 reg;
-
-	if (type == REGISTER_M) {
-		reg = readl(dp->reg_base + EXYNOS_DP_SYS_CTL_4);
-		reg |= FIX_M_VID;
-		writel(reg, dp->reg_base + EXYNOS_DP_SYS_CTL_4);
-		reg = m_value & 0xff;
-		writel(reg, dp->reg_base + EXYNOS_DP_M_VID_0);
-		reg = (m_value >> 8) & 0xff;
-		writel(reg, dp->reg_base + EXYNOS_DP_M_VID_1);
-		reg = (m_value >> 16) & 0xff;
-		writel(reg, dp->reg_base + EXYNOS_DP_M_VID_2);
-
-		reg = n_value & 0xff;
-		writel(reg, dp->reg_base + EXYNOS_DP_N_VID_0);
-		reg = (n_value >> 8) & 0xff;
-		writel(reg, dp->reg_base + EXYNOS_DP_N_VID_1);
-		reg = (n_value >> 16) & 0xff;
-		writel(reg, dp->reg_base + EXYNOS_DP_N_VID_2);
-	} else  {
-		reg = readl(dp->reg_base + EXYNOS_DP_SYS_CTL_4);
-		reg &= ~FIX_M_VID;
-		writel(reg, dp->reg_base + EXYNOS_DP_SYS_CTL_4);
-
-		writel(0x00, dp->reg_base + EXYNOS_DP_N_VID_0);
-		writel(0x80, dp->reg_base + EXYNOS_DP_N_VID_1);
-		writel(0x00, dp->reg_base + EXYNOS_DP_N_VID_2);
-	}
-}
-
-void exynos_dp_set_video_timing_mode(struct exynos_dp_device *dp, u32 type)
-{
-	u32 reg;
-
-	if (type == VIDEO_TIMING_FROM_CAPTURE) {
-		reg = readl(dp->reg_base + EXYNOS_DP_VIDEO_CTL_10);
-		reg &= ~FORMAT_SEL;
-		writel(reg, dp->reg_base + EXYNOS_DP_VIDEO_CTL_10);
-	} else {
-		reg = readl(dp->reg_base + EXYNOS_DP_VIDEO_CTL_10);
-		reg |= FORMAT_SEL;
-		writel(reg, dp->reg_base + EXYNOS_DP_VIDEO_CTL_10);
-	}
-}
-
-void exynos_dp_enable_video_master(struct exynos_dp_device *dp, bool enable)
-{
-	u32 reg;
-
-	if (enable) {
-		reg = readl(dp->reg_base + EXYNOS_DP_SOC_GENERAL_CTL);
-		reg &= ~VIDEO_MODE_MASK;
-		reg |= VIDEO_MASTER_MODE_EN | VIDEO_MODE_MASTER_MODE;
-		writel(reg, dp->reg_base + EXYNOS_DP_SOC_GENERAL_CTL);
-	} else {
-		reg = readl(dp->reg_base + EXYNOS_DP_SOC_GENERAL_CTL);
-		reg &= ~VIDEO_MODE_MASK;
-		reg |= VIDEO_MODE_SLAVE_MODE;
-		writel(reg, dp->reg_base + EXYNOS_DP_SOC_GENERAL_CTL);
-	}
-}
-
-void exynos_dp_start_video(struct exynos_dp_device *dp)
-{
-	u32 reg;
-
-	reg = readl(dp->reg_base + EXYNOS_DP_VIDEO_CTL_1);
-	reg |= VIDEO_EN;
-	writel(reg, dp->reg_base + EXYNOS_DP_VIDEO_CTL_1);
-}
-
-int exynos_dp_is_video_stream_on(struct exynos_dp_device *dp)
-{
-	u32 reg;
-
-	reg = readl(dp->reg_base + EXYNOS_DP_SYS_CTL_3);
-	writel(reg, dp->reg_base + EXYNOS_DP_SYS_CTL_3);
-
-	reg = readl(dp->reg_base + EXYNOS_DP_SYS_CTL_3);
-	if (!(reg & STRM_VALID)) {
-		dev_dbg(dp->dev, "Input video stream is not detected.\n");
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-void exynos_dp_config_video_slave_mode(struct exynos_dp_device *dp)
-{
-	u32 reg;
-
-	reg = readl(dp->reg_base + EXYNOS_DP_FUNC_EN_1);
-	reg &= ~(MASTER_VID_FUNC_EN_N | SLAVE_VID_FUNC_EN_N);
-	reg |= MASTER_VID_FUNC_EN_N;
-	writel(reg, dp->reg_base + EXYNOS_DP_FUNC_EN_1);
-
-	reg = readl(dp->reg_base + EXYNOS_DP_VIDEO_CTL_10);
-	reg &= ~INTERACE_SCAN_CFG;
-	reg |= (dp->video_info->interlaced << 2);
-	writel(reg, dp->reg_base + EXYNOS_DP_VIDEO_CTL_10);
-
-	reg = readl(dp->reg_base + EXYNOS_DP_VIDEO_CTL_10);
-	reg &= ~VSYNC_POLARITY_CFG;
-	reg |= (dp->video_info->v_sync_polarity << 1);
-	writel(reg, dp->reg_base + EXYNOS_DP_VIDEO_CTL_10);
-
-	reg = readl(dp->reg_base + EXYNOS_DP_VIDEO_CTL_10);
-	reg &= ~HSYNC_POLARITY_CFG;
-	reg |= (dp->video_info->h_sync_polarity << 0);
-	writel(reg, dp->reg_base + EXYNOS_DP_VIDEO_CTL_10);
-
-	reg = AUDIO_MODE_SPDIF_MODE | VIDEO_MODE_SLAVE_MODE;
-	writel(reg, dp->reg_base + EXYNOS_DP_SOC_GENERAL_CTL);
-}
-
-void exynos_dp_enable_scrambling(struct exynos_dp_device *dp)
-{
-	u32 reg;
-
-	reg = readl(dp->reg_base + EXYNOS_DP_TRAINING_PTN_SET);
-	reg &= ~SCRAMBLING_DISABLE;
-	writel(reg, dp->reg_base + EXYNOS_DP_TRAINING_PTN_SET);
-}
-
-void exynos_dp_disable_scrambling(struct exynos_dp_device *dp)
-{
-	u32 reg;
-
-	reg = readl(dp->reg_base + EXYNOS_DP_TRAINING_PTN_SET);
-	reg |= SCRAMBLING_DISABLE;
-	writel(reg, dp->reg_base + EXYNOS_DP_TRAINING_PTN_SET);
-}
diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
new file mode 100644
index 0000000..8b4ffad
--- /dev/null
+++ b/include/drm/bridge/analogix_dp.h
@@ -0,0 +1,24 @@
+#ifndef _ANALOGIX_DP_H_
+#define _ANALOGIX_DP_H_
+
+#include <drm/drm_crtc.h>
+
+struct analogix_dp_plat_data {
+	struct drm_panel *panel;
+
+	int (*power_on)(struct analogix_dp_plat_data *);
+	int (*power_off)(struct analogix_dp_plat_data *);
+	int (*attach)(struct analogix_dp_plat_data *, struct drm_bridge *);
+	int (*get_modes)(struct analogix_dp_plat_data *,
+			 struct drm_connector *);
+};
+
+int analogix_dp_resume(struct device *dev);
+int analogix_dp_suspend(struct device *dev);
+
+int analogix_dp_bind(struct device *dev, struct drm_device *drm_dev,
+		     struct drm_encoder *encoder,
+		     struct analogix_dp_plat_data *plat_data);
+void analogix_dp_unbind(struct device *dev, struct device *master, void *data);
+
+#endif /* _ANALOGIX_DP_H_ */
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
