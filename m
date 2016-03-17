From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v14.1 01/17] drm: bridge: analogix/dp: split exynos dp driver to bridge directory
Date: Thu, 17 Mar 2016 22:47:27 +0100
Message-ID: <1811552.qvsCm7GUs1@diego>
References: <1455534485-1154-1-git-send-email-ykk@rock-chips.com> <1455534576-1486-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455534576-1486-1-git-send-email-ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Split the dp core driver from exynos directory to bridge directory,
and rename the core driver to analogix_dp_*, rename the platform
code to exynos_dp.

Beside the new analogix_dp driver would export six hooks.
"analogix_dp_bind()" and "analogix_dp_unbind()"
"analogix_dp_suspned()" and "analogix_dp_resume()"
"analogix_dp_detect()" and "analogix_dp_get_modes()"

The bind/unbind symbols is used for analogix platform driver to connect
with analogix_dp core driver. And the detect/get_modes is used for analogix
platform driver to init the connector.

They reason why connector need register in helper driver is rockchip drm
haven't implement the atomic API, but Exynos drm have implement it, so
there would need two different connector helper functions, that's why we
leave the connector register in helper driver.

Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
Changes in v14.1:
- Rebase against drm-next from 2016-03-17
  (adapt to another round of exynos-dp changes)

Changes in v14:
- Rebase the new changes in imx-dp driver
- Split up this patch into 3 parts, make this easy to review (Heiko)

Changes in v13: None
Changes in v12:
- Move the connector init to analogix_dp driver, and using ATOMIC helper (Heiko)

Changes in v11:
- Uses tabs to fix the indentation issues in analogix_dp_core.h (Heiko)

Changes in v10: None
Changes in v9: None
Changes in v8: None
Changes in v7: None
Changes in v6:
- Fix the Kconfig recursive dependency (Javier)

Changes in v5:
- Correct the check condition of gpio_is_valid when driver try to get
  the "hpd-gpios" DT propery. (Heiko)
- Move the platform attach callback in the front of core driver bridge
  attch function. Cause once platform failed at attach, core driver should
  still failed, so no need to init connector before platform attached (Krzysztof)
- Keep code style no changes with the previous exynos_dp_code.c in this
  patch, and update commit message about the new export symbol (Krzysztof)
- Gather the device type patch (v4 11/16) into this one. (Krzysztof)
- leave out the connector registration to analogix platform driver. (Thierry)

Changes in v4:
- Update "analogix,hpd-gpios" to "hpd-gpios" DT propery. (Rob)
- Rename "analogix_dp-exynos.c" file name to "exynos_dp.c" (Jingoo)
- Create a separate folder for analogix code in bridge/ (Archit)

Changes in v3:
- Move exynos's video_timing code to analogix_dp-exynos platform driver,
  add get_modes method to struct analogix_dp_plat_data. (Thierry)
- Rename some "samsung*" dts propery to "analogix*". (Heiko)

Changes in v2:
- Remove new copyright (Jingoo)
- Fix compiled failed due to analogix_dp_device misspell


 drivers/gpu/drm/bridge/Kconfig                     |    2 +
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 drivers/gpu/drm/bridge/analogix/Kconfig            |    3 +
 drivers/gpu/drm/bridge/analogix/Makefile           |    1 +
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 1351 +++++++++++++++++++
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |  277 ++++
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  | 1263 ++++++++++++++++++
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h  |  366 ++++++
 drivers/gpu/drm/exynos/Kconfig                     |    3 +-
 drivers/gpu/drm/exynos/Makefile                    |    2 +-
 drivers/gpu/drm/exynos/exynos_dp_core.c            | 1353 ++------------------
 drivers/gpu/drm/exynos/exynos_dp_core.h            |  282 ----
 drivers/gpu/drm/exynos/exynos_dp_reg.c             | 1263 ------------------
 drivers/gpu/drm/exynos/exynos_dp_reg.h             |  366 ------
 include/drm/bridge/analogix_dp.h                   |   40 +
 15 files changed, 3391 insertions(+), 3182 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/analogix/Kconfig
 create mode 100644 drivers/gpu/drm/bridge/analogix/Makefile
 create mode 100644 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
 create mode 100644 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
 create mode 100644 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
 create mode 100644 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
 delete mode 100644 drivers/gpu/drm/exynos/exynos_dp_core.h
 delete mode 100644 drivers/gpu/drm/exynos/exynos_dp_reg.c
 delete mode 100644 drivers/gpu/drm/exynos/exynos_dp_reg.h
 create mode 100644 include/drm/bridge/analogix_dp.h

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 27e2022..efd94e0 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -40,4 +40,6 @@ config DRM_PARADE_PS8622
 	---help---
 	  Parade eDP-LVDS bridge chip driver.
 
+source "drivers/gpu/drm/bridge/analogix/Kconfig"
+
 endmenu
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index f13c33d..ff821f4 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_DRM_DW_HDMI) += dw-hdmi.o
 obj-$(CONFIG_DRM_DW_HDMI_AHB_AUDIO) += dw-hdmi-ahb-audio.o
 obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
 obj-$(CONFIG_DRM_PARADE_PS8622) += parade-ps8622.o
+obj-$(CONFIG_DRM_ANALOGIX_DP) += analogix/
diff --git a/drivers/gpu/drm/bridge/analogix/Kconfig b/drivers/gpu/drm/bridge/analogix/Kconfig
new file mode 100644
index 0000000..80f286f
--- /dev/null
+++ b/drivers/gpu/drm/bridge/analogix/Kconfig
@@ -0,0 +1,3 @@
+config DRM_ANALOGIX_DP
+	tristate
+	depends on DRM
diff --git a/drivers/gpu/drm/bridge/analogix/Makefile b/drivers/gpu/drm/bridge/analogix/Makefile
new file mode 100644
index 0000000..9107b86
--- /dev/null
+++ b/drivers/gpu/drm/bridge/analogix/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_DRM_ANALOGIX_DP) += analogix_dp_core.o analogix_dp_reg.o
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
new file mode 100644
index 0000000..392c296
--- /dev/null
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -0,0 +1,1351 @@
+/*
+* Analogix DP (Display Port) core interface driver.
+*
+* Copyright (C) 2012 Samsung Electronics Co., Ltd.
+* Author: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
+*
+* This program is free software; you can redistribute it and/or modify it
+* under the terms of the GNU General Public License as published by the
+* Free Software Foundation; either version 2 of the License, or (at your
+* option) any later version.
+*/
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/err.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/interrupt.h>
+#include <linux/of.h>
+#include <linux/of_gpio.h>
+#include <linux/gpio.h>
+#include <linux/component.h>
+#include <linux/phy/phy.h>
+
+#include <drm/drmP.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_panel.h>
+
+#include <drm/bridge/analogix_dp.h>
+
+#include "analogix_dp_core.h"
+
+#define to_dp(nm)	container_of(nm, struct analogix_dp_device, nm)
+
+struct bridge_init {
+	struct i2c_client *client;
+	struct device_node *node;
+};
+
+static void analogix_dp_init_dp(struct analogix_dp_device *dp)
+{
+	analogix_dp_reset(dp);
+
+	analogix_dp_swreset(dp);
+
+	analogix_dp_init_analog_param(dp);
+	analogix_dp_init_interrupt(dp);
+
+	/* SW defined function Normal operation */
+	analogix_dp_enable_sw_function(dp);
+
+	analogix_dp_config_interrupt(dp);
+	analogix_dp_init_analog_func(dp);
+
+	analogix_dp_init_hpd(dp);
+	analogix_dp_init_aux(dp);
+}
+
+static int analogix_dp_detect_hpd(struct analogix_dp_device *dp)
+{
+	int timeout_loop = 0;
+
+	while (analogix_dp_get_plug_in_status(dp) != 0) {
+		timeout_loop++;
+		if (DP_TIMEOUT_LOOP_COUNT < timeout_loop) {
+			dev_err(dp->dev, "failed to get hpd plug status\n");
+			return -ETIMEDOUT;
+		}
+		usleep_range(10, 11);
+	}
+
+	return 0;
+}
+
+static unsigned char analogix_dp_calc_edid_check_sum(unsigned char *edid_data)
+{
+	int i;
+	unsigned char sum = 0;
+
+	for (i = 0; i < EDID_BLOCK_LENGTH; i++)
+		sum = sum + edid_data[i];
+
+	return sum;
+}
+
+static int analogix_dp_read_edid(struct analogix_dp_device *dp)
+{
+	unsigned char edid[EDID_BLOCK_LENGTH * 2];
+	unsigned int extend_block = 0;
+	unsigned char sum;
+	unsigned char test_vector;
+	int retval;
+
+	/*
+	 * EDID device address is 0x50.
+	 * However, if necessary, you must have set upper address
+	 * into E-EDID in I2C device, 0x30.
+	 */
+
+	/* Read Extension Flag, Number of 128-byte EDID extension blocks */
+	retval = analogix_dp_read_byte_from_i2c(dp, I2C_EDID_DEVICE_ADDR,
+				EDID_EXTENSION_FLAG,
+				&extend_block);
+	if (retval)
+		return retval;
+
+	if (extend_block > 0) {
+		dev_dbg(dp->dev, "EDID data includes a single extension!\n");
+
+		/* Read EDID data */
+		retval = analogix_dp_read_bytes_from_i2c(dp, I2C_EDID_DEVICE_ADDR,
+						EDID_HEADER_PATTERN,
+						EDID_BLOCK_LENGTH,
+						&edid[EDID_HEADER_PATTERN]);
+		if (retval != 0) {
+			dev_err(dp->dev, "EDID Read failed!\n");
+			return -EIO;
+		}
+		sum = analogix_dp_calc_edid_check_sum(edid);
+		if (sum != 0) {
+			dev_err(dp->dev, "EDID bad checksum!\n");
+			return -EIO;
+		}
+
+		/* Read additional EDID data */
+		retval = analogix_dp_read_bytes_from_i2c(dp,
+				I2C_EDID_DEVICE_ADDR,
+				EDID_BLOCK_LENGTH,
+				EDID_BLOCK_LENGTH,
+				&edid[EDID_BLOCK_LENGTH]);
+		if (retval != 0) {
+			dev_err(dp->dev, "EDID Read failed!\n");
+			return -EIO;
+		}
+		sum = analogix_dp_calc_edid_check_sum(&edid[EDID_BLOCK_LENGTH]);
+		if (sum != 0) {
+			dev_err(dp->dev, "EDID bad checksum!\n");
+			return -EIO;
+		}
+
+		analogix_dp_read_byte_from_dpcd(dp, DP_TEST_REQUEST,
+					&test_vector);
+		if (test_vector & DP_TEST_LINK_EDID_READ) {
+			analogix_dp_write_byte_to_dpcd(dp,
+				DP_TEST_EDID_CHECKSUM,
+				edid[EDID_BLOCK_LENGTH + EDID_CHECKSUM]);
+			analogix_dp_write_byte_to_dpcd(dp,
+				DP_TEST_RESPONSE,
+				DP_TEST_EDID_CHECKSUM_WRITE);
+		}
+	} else {
+		dev_info(dp->dev, "EDID data does not include any extensions.\n");
+
+		/* Read EDID data */
+		retval = analogix_dp_read_bytes_from_i2c(dp,
+				I2C_EDID_DEVICE_ADDR,
+				EDID_HEADER_PATTERN,
+				EDID_BLOCK_LENGTH,
+				&edid[EDID_HEADER_PATTERN]);
+		if (retval != 0) {
+			dev_err(dp->dev, "EDID Read failed!\n");
+			return -EIO;
+		}
+		sum = analogix_dp_calc_edid_check_sum(edid);
+		if (sum != 0) {
+			dev_err(dp->dev, "EDID bad checksum!\n");
+			return -EIO;
+		}
+
+		analogix_dp_read_byte_from_dpcd(dp,
+			DP_TEST_REQUEST,
+			&test_vector);
+		if (test_vector & DP_TEST_LINK_EDID_READ) {
+			analogix_dp_write_byte_to_dpcd(dp,
+				DP_TEST_EDID_CHECKSUM,
+				edid[EDID_CHECKSUM]);
+			analogix_dp_write_byte_to_dpcd(dp,
+				DP_TEST_RESPONSE,
+				DP_TEST_EDID_CHECKSUM_WRITE);
+		}
+	}
+
+	dev_dbg(dp->dev, "EDID Read success!\n");
+	return 0;
+}
+
+static int analogix_dp_handle_edid(struct analogix_dp_device *dp)
+{
+	u8 buf[12];
+	int i;
+	int retval;
+
+	/* Read DPCD DP_DPCD_REV~RECEIVE_PORT1_CAP_1 */
+	retval = analogix_dp_read_bytes_from_dpcd(dp, DP_DPCD_REV,
+				12, buf);
+	if (retval)
+		return retval;
+
+	/* Read EDID */
+	for (i = 0; i < 3; i++) {
+		retval = analogix_dp_read_edid(dp);
+		if (!retval)
+			break;
+	}
+
+	return retval;
+}
+
+static void analogix_dp_enable_rx_to_enhanced_mode(struct analogix_dp_device *dp,
+						bool enable)
+{
+	u8 data;
+
+	analogix_dp_read_byte_from_dpcd(dp, DP_LANE_COUNT_SET, &data);
+
+	if (enable)
+		analogix_dp_write_byte_to_dpcd(dp, DP_LANE_COUNT_SET,
+			DP_LANE_COUNT_ENHANCED_FRAME_EN |
+			DPCD_LANE_COUNT_SET(data));
+	else
+		analogix_dp_write_byte_to_dpcd(dp, DP_LANE_COUNT_SET,
+			DPCD_LANE_COUNT_SET(data));
+}
+
+static int analogix_dp_is_enhanced_mode_available(struct analogix_dp_device *dp)
+{
+	u8 data;
+	int retval;
+
+	analogix_dp_read_byte_from_dpcd(dp, DP_MAX_LANE_COUNT, &data);
+	retval = DPCD_ENHANCED_FRAME_CAP(data);
+
+	return retval;
+}
+
+static void analogix_dp_set_enhanced_mode(struct analogix_dp_device *dp)
+{
+	u8 data;
+
+	data = analogix_dp_is_enhanced_mode_available(dp);
+	analogix_dp_enable_rx_to_enhanced_mode(dp, data);
+	analogix_dp_enable_enhanced_mode(dp, data);
+}
+
+static void analogix_dp_training_pattern_dis(struct analogix_dp_device *dp)
+{
+	analogix_dp_set_training_pattern(dp, DP_NONE);
+
+	analogix_dp_write_byte_to_dpcd(dp,
+		DP_TRAINING_PATTERN_SET,
+		DP_TRAINING_PATTERN_DISABLE);
+}
+
+static void analogix_dp_set_lane_lane_pre_emphasis(struct analogix_dp_device *dp,
+					int pre_emphasis, int lane)
+{
+	switch (lane) {
+	case 0:
+		analogix_dp_set_lane0_pre_emphasis(dp, pre_emphasis);
+		break;
+	case 1:
+		analogix_dp_set_lane1_pre_emphasis(dp, pre_emphasis);
+		break;
+
+	case 2:
+		analogix_dp_set_lane2_pre_emphasis(dp, pre_emphasis);
+		break;
+
+	case 3:
+		analogix_dp_set_lane3_pre_emphasis(dp, pre_emphasis);
+		break;
+	}
+}
+
+static int analogix_dp_link_start(struct analogix_dp_device *dp)
+{
+	u8 buf[4];
+	int lane, lane_count, pll_tries, retval;
+
+	lane_count = dp->link_train.lane_count;
+
+	dp->link_train.lt_state = CLOCK_RECOVERY;
+	dp->link_train.eq_loop = 0;
+
+	for (lane = 0; lane < lane_count; lane++)
+		dp->link_train.cr_loop[lane] = 0;
+
+	/* Set link rate and count as you want to establish*/
+	analogix_dp_set_link_bandwidth(dp, dp->link_train.link_rate);
+	analogix_dp_set_lane_count(dp, dp->link_train.lane_count);
+
+	/* Setup RX configuration */
+	buf[0] = dp->link_train.link_rate;
+	buf[1] = dp->link_train.lane_count;
+	retval = analogix_dp_write_bytes_to_dpcd(dp, DP_LINK_BW_SET,
+				2, buf);
+	if (retval)
+		return retval;
+
+	/* Set TX pre-emphasis to minimum */
+	for (lane = 0; lane < lane_count; lane++)
+		analogix_dp_set_lane_lane_pre_emphasis(dp,
+			PRE_EMPHASIS_LEVEL_0, lane);
+
+	/* Wait for PLL lock */
+	pll_tries = 0;
+	while (analogix_dp_get_pll_lock_status(dp) == PLL_UNLOCKED) {
+		if (pll_tries == DP_TIMEOUT_LOOP_COUNT) {
+			dev_err(dp->dev, "Wait for PLL lock timed out\n");
+			return -ETIMEDOUT;
+		}
+
+		pll_tries++;
+		usleep_range(90, 120);
+	}
+
+	/* Set training pattern 1 */
+	analogix_dp_set_training_pattern(dp, TRAINING_PTN1);
+
+	/* Set RX training pattern */
+	retval = analogix_dp_write_byte_to_dpcd(dp,
+			DP_TRAINING_PATTERN_SET,
+			DP_LINK_SCRAMBLING_DISABLE | DP_TRAINING_PATTERN_1);
+	if (retval)
+		return retval;
+
+	for (lane = 0; lane < lane_count; lane++)
+		buf[lane] = DP_TRAIN_PRE_EMPH_LEVEL_0 |
+			    DP_TRAIN_VOLTAGE_SWING_LEVEL_0;
+
+	retval = analogix_dp_write_bytes_to_dpcd(dp, DP_TRAINING_LANE0_SET,
+			lane_count, buf);
+
+	return retval;
+}
+
+static unsigned char analogix_dp_get_lane_status(u8 link_status[2], int lane)
+{
+	int shift = (lane & 1) * 4;
+	u8 link_value = link_status[lane>>1];
+
+	return (link_value >> shift) & 0xf;
+}
+
+static int analogix_dp_clock_recovery_ok(u8 link_status[2], int lane_count)
+{
+	int lane;
+	u8 lane_status;
+
+	for (lane = 0; lane < lane_count; lane++) {
+		lane_status = analogix_dp_get_lane_status(link_status, lane);
+		if ((lane_status & DP_LANE_CR_DONE) == 0)
+			return -EINVAL;
+	}
+	return 0;
+}
+
+static int analogix_dp_channel_eq_ok(u8 link_status[2], u8 link_align,
+				int lane_count)
+{
+	int lane;
+	u8 lane_status;
+
+	if ((link_align & DP_INTERLANE_ALIGN_DONE) == 0)
+		return -EINVAL;
+
+	for (lane = 0; lane < lane_count; lane++) {
+		lane_status = analogix_dp_get_lane_status(link_status, lane);
+		lane_status &= DP_CHANNEL_EQ_BITS;
+		if (lane_status != DP_CHANNEL_EQ_BITS)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+static unsigned char analogix_dp_get_adjust_request_voltage(u8 adjust_request[2],
+							int lane)
+{
+	int shift = (lane & 1) * 4;
+	u8 link_value = adjust_request[lane>>1];
+
+	return (link_value >> shift) & 0x3;
+}
+
+static unsigned char analogix_dp_get_adjust_request_pre_emphasis(
+					u8 adjust_request[2],
+					int lane)
+{
+	int shift = (lane & 1) * 4;
+	u8 link_value = adjust_request[lane>>1];
+
+	return ((link_value >> shift) & 0xc) >> 2;
+}
+
+static void analogix_dp_set_lane_link_training(struct analogix_dp_device *dp,
+					u8 training_lane_set, int lane)
+{
+	switch (lane) {
+	case 0:
+		analogix_dp_set_lane0_link_training(dp, training_lane_set);
+		break;
+	case 1:
+		analogix_dp_set_lane1_link_training(dp, training_lane_set);
+		break;
+
+	case 2:
+		analogix_dp_set_lane2_link_training(dp, training_lane_set);
+		break;
+
+	case 3:
+		analogix_dp_set_lane3_link_training(dp, training_lane_set);
+		break;
+	}
+}
+
+static unsigned int analogix_dp_get_lane_link_training(
+				struct analogix_dp_device *dp,
+				int lane)
+{
+	u32 reg;
+
+	switch (lane) {
+	case 0:
+		reg = analogix_dp_get_lane0_link_training(dp);
+		break;
+	case 1:
+		reg = analogix_dp_get_lane1_link_training(dp);
+		break;
+	case 2:
+		reg = analogix_dp_get_lane2_link_training(dp);
+		break;
+	case 3:
+		reg = analogix_dp_get_lane3_link_training(dp);
+		break;
+	default:
+		WARN_ON(1);
+		return 0;
+	}
+
+	return reg;
+}
+
+static void analogix_dp_reduce_link_rate(struct analogix_dp_device *dp)
+{
+	analogix_dp_training_pattern_dis(dp);
+	analogix_dp_set_enhanced_mode(dp);
+
+	dp->link_train.lt_state = FAILED;
+}
+
+static void analogix_dp_get_adjust_training_lane(struct analogix_dp_device *dp,
+					u8 adjust_request[2])
+{
+	int lane, lane_count;
+	u8 voltage_swing, pre_emphasis, training_lane;
+
+	lane_count = dp->link_train.lane_count;
+	for (lane = 0; lane < lane_count; lane++) {
+		voltage_swing = analogix_dp_get_adjust_request_voltage(
+						adjust_request, lane);
+		pre_emphasis = analogix_dp_get_adjust_request_pre_emphasis(
+						adjust_request, lane);
+		training_lane = DPCD_VOLTAGE_SWING_SET(voltage_swing) |
+				DPCD_PRE_EMPHASIS_SET(pre_emphasis);
+
+		if (voltage_swing == VOLTAGE_LEVEL_3)
+			training_lane |= DP_TRAIN_MAX_SWING_REACHED;
+		if (pre_emphasis == PRE_EMPHASIS_LEVEL_3)
+			training_lane |= DP_TRAIN_MAX_PRE_EMPHASIS_REACHED;
+
+		dp->link_train.training_lane[lane] = training_lane;
+	}
+}
+
+static int analogix_dp_process_clock_recovery(struct analogix_dp_device *dp)
+{
+	int lane, lane_count, retval;
+	u8 voltage_swing, pre_emphasis, training_lane;
+	u8 link_status[2], adjust_request[2];
+
+	usleep_range(100, 101);
+
+	lane_count = dp->link_train.lane_count;
+
+	retval =  analogix_dp_read_bytes_from_dpcd(dp,
+			DP_LANE0_1_STATUS, 2, link_status);
+	if (retval)
+		return retval;
+
+	retval =  analogix_dp_read_bytes_from_dpcd(dp,
+			DP_ADJUST_REQUEST_LANE0_1, 2, adjust_request);
+	if (retval)
+		return retval;
+
+	if (analogix_dp_clock_recovery_ok(link_status, lane_count) == 0) {
+		/* set training pattern 2 for EQ */
+		analogix_dp_set_training_pattern(dp, TRAINING_PTN2);
+
+		retval = analogix_dp_write_byte_to_dpcd(dp,
+				DP_TRAINING_PATTERN_SET,
+				DP_LINK_SCRAMBLING_DISABLE |
+				DP_TRAINING_PATTERN_2);
+		if (retval)
+			return retval;
+
+		dev_info(dp->dev, "Link Training Clock Recovery success\n");
+		dp->link_train.lt_state = EQUALIZER_TRAINING;
+	} else {
+		for (lane = 0; lane < lane_count; lane++) {
+			training_lane = analogix_dp_get_lane_link_training(
+							dp, lane);
+			voltage_swing = analogix_dp_get_adjust_request_voltage(
+							adjust_request, lane);
+			pre_emphasis = analogix_dp_get_adjust_request_pre_emphasis(
+							adjust_request, lane);
+
+			if (DPCD_VOLTAGE_SWING_GET(training_lane) ==
+					voltage_swing &&
+			    DPCD_PRE_EMPHASIS_GET(training_lane) ==
+					pre_emphasis)
+				dp->link_train.cr_loop[lane]++;
+
+			if (dp->link_train.cr_loop[lane] == MAX_CR_LOOP ||
+			    voltage_swing == VOLTAGE_LEVEL_3 ||
+			    pre_emphasis == PRE_EMPHASIS_LEVEL_3) {
+				dev_err(dp->dev, "CR Max reached (%d,%d,%d)\n",
+					dp->link_train.cr_loop[lane],
+					voltage_swing, pre_emphasis);
+				analogix_dp_reduce_link_rate(dp);
+				return -EIO;
+			}
+		}
+	}
+
+	analogix_dp_get_adjust_training_lane(dp, adjust_request);
+
+	for (lane = 0; lane < lane_count; lane++)
+		analogix_dp_set_lane_link_training(dp,
+			dp->link_train.training_lane[lane], lane);
+
+	retval = analogix_dp_write_bytes_to_dpcd(dp,
+			DP_TRAINING_LANE0_SET, lane_count,
+			dp->link_train.training_lane);
+	if (retval)
+		return retval;
+
+	return retval;
+}
+
+static int analogix_dp_process_equalizer_training(struct analogix_dp_device *dp)
+{
+	int lane, lane_count, retval;
+	u32 reg;
+	u8 link_align, link_status[2], adjust_request[2];
+
+	usleep_range(400, 401);
+
+	lane_count = dp->link_train.lane_count;
+
+	retval = analogix_dp_read_bytes_from_dpcd(dp,
+			DP_LANE0_1_STATUS, 2, link_status);
+	if (retval)
+		return retval;
+
+	if (analogix_dp_clock_recovery_ok(link_status, lane_count)) {
+		analogix_dp_reduce_link_rate(dp);
+		return -EIO;
+	}
+
+	retval = analogix_dp_read_bytes_from_dpcd(dp,
+			DP_ADJUST_REQUEST_LANE0_1, 2, adjust_request);
+	if (retval)
+		return retval;
+
+	retval = analogix_dp_read_byte_from_dpcd(dp,
+			DP_LANE_ALIGN_STATUS_UPDATED, &link_align);
+	if (retval)
+		return retval;
+
+	analogix_dp_get_adjust_training_lane(dp, adjust_request);
+
+	if (!analogix_dp_channel_eq_ok(link_status, link_align, lane_count)) {
+		/* traing pattern Set to Normal */
+		analogix_dp_training_pattern_dis(dp);
+
+		dev_info(dp->dev, "Link Training success!\n");
+
+		analogix_dp_get_link_bandwidth(dp, &reg);
+		dp->link_train.link_rate = reg;
+		dev_dbg(dp->dev, "final bandwidth = %.2x\n",
+			dp->link_train.link_rate);
+
+		analogix_dp_get_lane_count(dp, &reg);
+		dp->link_train.lane_count = reg;
+		dev_dbg(dp->dev, "final lane count = %.2x\n",
+			dp->link_train.lane_count);
+
+		/* set enhanced mode if available */
+		analogix_dp_set_enhanced_mode(dp);
+		dp->link_train.lt_state = FINISHED;
+
+		return 0;
+	}
+
+	/* not all locked */
+	dp->link_train.eq_loop++;
+
+	if (dp->link_train.eq_loop > MAX_EQ_LOOP) {
+		dev_err(dp->dev, "EQ Max loop\n");
+		analogix_dp_reduce_link_rate(dp);
+		return -EIO;
+	}
+
+	for (lane = 0; lane < lane_count; lane++)
+		analogix_dp_set_lane_link_training(dp,
+			dp->link_train.training_lane[lane], lane);
+
+	retval = analogix_dp_write_bytes_to_dpcd(dp, DP_TRAINING_LANE0_SET,
+			lane_count, dp->link_train.training_lane);
+
+	return retval;
+}
+
+static void analogix_dp_get_max_rx_bandwidth(struct analogix_dp_device *dp,
+					u8 *bandwidth)
+{
+	u8 data;
+
+	/*
+	 * For DP rev.1.1, Maximum link rate of Main Link lanes
+	 * 0x06 = 1.62 Gbps, 0x0a = 2.7 Gbps
+	 */
+	analogix_dp_read_byte_from_dpcd(dp, DP_MAX_LINK_RATE, &data);
+	*bandwidth = data;
+}
+
+static void analogix_dp_get_max_rx_lane_count(struct analogix_dp_device *dp,
+					u8 *lane_count)
+{
+	u8 data;
+
+	/*
+	 * For DP rev.1.1, Maximum number of Main Link lanes
+	 * 0x01 = 1 lane, 0x02 = 2 lanes, 0x04 = 4 lanes
+	 */
+	analogix_dp_read_byte_from_dpcd(dp, DP_MAX_LANE_COUNT, &data);
+	*lane_count = DPCD_MAX_LANE_COUNT(data);
+}
+
+static void analogix_dp_init_training(struct analogix_dp_device *dp,
+			enum link_lane_count_type max_lane,
+			enum link_rate_type max_rate)
+{
+	/*
+	 * MACRO_RST must be applied after the PLL_LOCK to avoid
+	 * the DP inter pair skew issue for at least 10 us
+	 */
+	analogix_dp_reset_macro(dp);
+
+	/* Initialize by reading RX's DPCD */
+	analogix_dp_get_max_rx_bandwidth(dp, &dp->link_train.link_rate);
+	analogix_dp_get_max_rx_lane_count(dp, &dp->link_train.lane_count);
+
+	if ((dp->link_train.link_rate != LINK_RATE_1_62GBPS) &&
+	   (dp->link_train.link_rate != LINK_RATE_2_70GBPS)) {
+		dev_err(dp->dev, "Rx Max Link Rate is abnormal :%x !\n",
+			dp->link_train.link_rate);
+		dp->link_train.link_rate = LINK_RATE_1_62GBPS;
+	}
+
+	if (dp->link_train.lane_count == 0) {
+		dev_err(dp->dev, "Rx Max Lane count is abnormal :%x !\n",
+			dp->link_train.lane_count);
+		dp->link_train.lane_count = (u8)LANE_COUNT1;
+	}
+
+	/* Setup TX lane count & rate */
+	if (dp->link_train.lane_count > max_lane)
+		dp->link_train.lane_count = max_lane;
+	if (dp->link_train.link_rate > max_rate)
+		dp->link_train.link_rate = max_rate;
+
+	/* All DP analog module power up */
+	analogix_dp_set_analog_power_down(dp, POWER_ALL, 0);
+}
+
+static int analogix_dp_sw_link_training(struct analogix_dp_device *dp)
+{
+	int retval = 0, training_finished = 0;
+
+	dp->link_train.lt_state = START;
+
+	/* Process here */
+	while (!retval && !training_finished) {
+		switch (dp->link_train.lt_state) {
+		case START:
+			retval = analogix_dp_link_start(dp);
+			if (retval)
+				dev_err(dp->dev, "LT link start failed!\n");
+			break;
+		case CLOCK_RECOVERY:
+			retval = analogix_dp_process_clock_recovery(dp);
+			if (retval)
+				dev_err(dp->dev, "LT CR failed!\n");
+			break;
+		case EQUALIZER_TRAINING:
+			retval = analogix_dp_process_equalizer_training(dp);
+			if (retval)
+				dev_err(dp->dev, "LT EQ failed!\n");
+			break;
+		case FINISHED:
+			training_finished = 1;
+			break;
+		case FAILED:
+			return -EREMOTEIO;
+		}
+	}
+	if (retval)
+		dev_err(dp->dev, "eDP link training failed (%d)\n", retval);
+
+	return retval;
+}
+
+static int analogix_dp_set_link_train(struct analogix_dp_device *dp,
+				u32 count,
+				u32 bwtype)
+{
+	int i;
+	int retval;
+
+	for (i = 0; i < DP_TIMEOUT_LOOP_COUNT; i++) {
+		analogix_dp_init_training(dp, count, bwtype);
+		retval = analogix_dp_sw_link_training(dp);
+		if (retval == 0)
+			break;
+
+		usleep_range(100, 110);
+	}
+
+	return retval;
+}
+
+static int analogix_dp_config_video(struct analogix_dp_device *dp)
+{
+	int retval = 0;
+	int timeout_loop = 0;
+	int done_count = 0;
+
+	analogix_dp_config_video_slave_mode(dp);
+
+	analogix_dp_set_video_color_format(dp);
+
+	if (analogix_dp_get_pll_lock_status(dp) == PLL_UNLOCKED) {
+		dev_err(dp->dev, "PLL is not locked yet.\n");
+		return -EINVAL;
+	}
+
+	for (;;) {
+		timeout_loop++;
+		if (analogix_dp_is_slave_video_stream_clock_on(dp) == 0)
+			break;
+		if (DP_TIMEOUT_LOOP_COUNT < timeout_loop) {
+			dev_err(dp->dev, "Timeout of video streamclk ok\n");
+			return -ETIMEDOUT;
+		}
+
+		usleep_range(1, 2);
+	}
+
+	/* Set to use the register calculated M/N video */
+	analogix_dp_set_video_cr_mn(dp, CALCULATED_M, 0, 0);
+
+	/* For video bist, Video timing must be generated by register */
+	analogix_dp_set_video_timing_mode(dp, VIDEO_TIMING_FROM_CAPTURE);
+
+	/* Disable video mute */
+	analogix_dp_enable_video_mute(dp, 0);
+
+	/* Configure video slave mode */
+	analogix_dp_enable_video_master(dp, 0);
+
+	timeout_loop = 0;
+
+	for (;;) {
+		timeout_loop++;
+		if (analogix_dp_is_video_stream_on(dp) == 0) {
+			done_count++;
+			if (done_count > 10)
+				break;
+		} else if (done_count) {
+			done_count = 0;
+		}
+		if (DP_TIMEOUT_LOOP_COUNT < timeout_loop) {
+			dev_err(dp->dev, "Timeout of video streamclk ok\n");
+			return -ETIMEDOUT;
+		}
+
+		usleep_range(1000, 1001);
+	}
+
+	if (retval != 0)
+		dev_err(dp->dev, "Video stream is not detected!\n");
+
+	return retval;
+}
+
+static void analogix_dp_enable_scramble(struct analogix_dp_device *dp, bool enable)
+{
+	u8 data;
+
+	if (enable) {
+		analogix_dp_enable_scrambling(dp);
+
+		analogix_dp_read_byte_from_dpcd(dp,
+			DP_TRAINING_PATTERN_SET,
+			&data);
+		analogix_dp_write_byte_to_dpcd(dp,
+			DP_TRAINING_PATTERN_SET,
+			(u8)(data & ~DP_LINK_SCRAMBLING_DISABLE));
+	} else {
+		analogix_dp_disable_scrambling(dp);
+
+		analogix_dp_read_byte_from_dpcd(dp,
+			DP_TRAINING_PATTERN_SET,
+			&data);
+		analogix_dp_write_byte_to_dpcd(dp,
+			DP_TRAINING_PATTERN_SET,
+			(u8)(data | DP_LINK_SCRAMBLING_DISABLE));
+	}
+}
+
+static irqreturn_t analogix_dp_irq_handler(int irq, void *arg)
+{
+	struct analogix_dp_device *dp = arg;
+
+	enum dp_irq_type irq_type;
+
+	irq_type = analogix_dp_get_irq_type(dp);
+	switch (irq_type) {
+	case DP_IRQ_TYPE_HP_CABLE_IN:
+		dev_dbg(dp->dev, "Received irq - cable in\n");
+		schedule_work(&dp->hotplug_work);
+		analogix_dp_clear_hotplug_interrupts(dp);
+		break;
+	case DP_IRQ_TYPE_HP_CABLE_OUT:
+		dev_dbg(dp->dev, "Received irq - cable out\n");
+		analogix_dp_clear_hotplug_interrupts(dp);
+		break;
+	case DP_IRQ_TYPE_HP_CHANGE:
+		/*
+		 * We get these change notifications once in a while, but there
+		 * is nothing we can do with them. Just ignore it for now and
+		 * only handle cable changes.
+		 */
+		dev_dbg(dp->dev, "Received irq - hotplug change; ignoring.\n");
+		analogix_dp_clear_hotplug_interrupts(dp);
+		break;
+	default:
+		dev_err(dp->dev, "Received irq - unknown type!\n");
+		break;
+	}
+	return IRQ_HANDLED;
+}
+
+static void analogix_dp_hotplug(struct work_struct *work)
+{
+	struct analogix_dp_device *dp;
+
+	dp = container_of(work, struct analogix_dp_device, hotplug_work);
+
+	if (dp->drm_dev)
+		drm_helper_hpd_irq_event(dp->drm_dev);
+}
+
+static void analogix_dp_commit(struct analogix_dp_device *dp)
+{
+	int ret;
+
+	/* Keep the panel disabled while we configure video */
+	if (dp->plat_data->panel) {
+		if (drm_panel_disable(dp->plat_data->panel))
+			DRM_ERROR("failed to disable the panel\n");
+	}
+
+	ret = analogix_dp_detect_hpd(dp);
+	if (ret) {
+		/* Cable has been disconnected, we're done */
+		return;
+	}
+
+	ret = analogix_dp_handle_edid(dp);
+	if (ret) {
+		dev_err(dp->dev, "unable to handle edid\n");
+		return;
+	}
+
+	ret = analogix_dp_set_link_train(dp, dp->video_info->lane_count,
+					dp->video_info->link_rate);
+	if (ret) {
+		dev_err(dp->dev, "unable to do link train\n");
+		return;
+	}
+
+	analogix_dp_enable_scramble(dp, 1);
+	analogix_dp_enable_rx_to_enhanced_mode(dp, 1);
+	analogix_dp_enable_enhanced_mode(dp, 1);
+
+	analogix_dp_set_lane_count(dp, dp->video_info->lane_count);
+	analogix_dp_set_link_bandwidth(dp, dp->video_info->link_rate);
+
+	analogix_dp_init_video(dp);
+	ret = analogix_dp_config_video(dp);
+	if (ret)
+		dev_err(dp->dev, "unable to config video\n");
+
+	/* Safe to enable the panel now */
+	if (dp->plat_data->panel) {
+		if (drm_panel_enable(dp->plat_data->panel))
+			DRM_ERROR("failed to enable the panel\n");
+	}
+
+	/* Enable video */
+	analogix_dp_start_video(dp);
+}
+
+int analogix_dp_get_modes(struct drm_connector *connector)
+{
+	struct analogix_dp_device *dp = to_dp(connector);
+	int num_modes = 0;
+
+	if (dp->plat_data->panel)
+		num_modes += drm_panel_get_modes(dp->plat_data->panel);
+
+	if (dp->plat_data->get_modes)
+		num_modes += dp->plat_data->get_modes(dp->plat_data);
+
+	return num_modes;
+}
+
+static struct drm_encoder *
+analogix_dp_best_encoder(struct drm_connector *connector)
+{
+	struct analogix_dp_device *dp = to_dp(connector);
+
+	return dp->encoder;
+}
+
+static const struct drm_connector_helper_funcs analogix_dp_connector_helper_funcs = {
+	.get_modes = analogix_dp_get_modes,
+	.best_encoder = analogix_dp_best_encoder,
+};
+
+enum drm_connector_status
+analogix_dp_detect(struct drm_connector *connector, bool force)
+{
+	return connector_status_connected;
+}
+
+static void analogix_dp_connector_destroy(struct drm_connector *connector)
+{
+	drm_connector_unregister(connector);
+	drm_connector_cleanup(connector);
+}
+
+static const struct drm_connector_funcs analogix_dp_connector_funcs = {
+	.dpms = drm_atomic_helper_connector_dpms,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.detect = analogix_dp_detect,
+	.destroy = analogix_dp_connector_destroy,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static int analogix_dp_bridge_attach(struct drm_bridge *bridge)
+{
+	struct analogix_dp_device *dp = bridge->driver_private;
+	struct drm_encoder *encoder = dp->encoder;
+	struct drm_connector *connector = &dp->connector;
+	int ret;
+
+	if (!bridge->encoder) {
+		DRM_ERROR("Parent encoder object not found");
+		return -ENODEV;
+	}
+
+	connector->polled = DRM_CONNECTOR_POLL_HPD;
+
+	ret = drm_connector_init(dp->drm_dev, connector,
+				 &analogix_dp_connector_funcs,
+				 DRM_MODE_CONNECTOR_eDP);
+	if (ret) {
+		DRM_ERROR("Failed to initialize connector with drm\n");
+		return ret;
+	}
+
+	drm_connector_helper_add(connector,
+				 &analogix_dp_connector_helper_funcs);
+	drm_mode_connector_attach_encoder(connector, encoder);
+
+	/*
+	 * NOTE: the connector registration is implemented in analogix
+	 * platform driver, that to say connector would be exist after
+	 * plat_data->attch return, that's why we record the connector
+	 * point after plat attached.
+	 */
+	 if (dp->plat_data->attach) {
+		 ret = dp->plat_data->attach(dp->plat_data, bridge, connector);
+		 if (ret) {
+			 DRM_ERROR("Failed at platform attch func\n");
+			 return ret;
+		 }
+	}
+
+	if (dp->plat_data->panel) {
+		ret = drm_panel_attach(dp->plat_data->panel, &dp->connector);
+		if (ret) {
+			DRM_ERROR("Failed to attach panel\n");
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static void analogix_dp_bridge_enable(struct drm_bridge *bridge)
+{
+	struct analogix_dp_device *dp = bridge->driver_private;
+
+	if (dp->dpms_mode == DRM_MODE_DPMS_ON)
+		return;
+
+	pm_runtime_get_sync(dp->dev);
+
+	if (dp->plat_data->panel) {
+		if (drm_panel_prepare(dp->plat_data->panel)) {
+			DRM_ERROR("failed to setup the panel\n");
+			return;
+		}
+	}
+
+	if (dp->plat_data->power_on)
+		dp->plat_data->power_on(dp->plat_data);
+
+	phy_power_on(dp->phy);
+	analogix_dp_init_dp(dp);
+	enable_irq(dp->irq);
+	analogix_dp_commit(dp);
+
+	dp->dpms_mode = DRM_MODE_DPMS_ON;
+}
+
+static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
+{
+	struct analogix_dp_device *dp = bridge->driver_private;
+
+	if (dp->dpms_mode != DRM_MODE_DPMS_ON)
+		return;
+
+	if (dp->plat_data->panel) {
+		if (drm_panel_disable(dp->plat_data->panel)) {
+			DRM_ERROR("failed to disable the panel\n");
+			return;
+		}
+	}
+
+	disable_irq(dp->irq);
+	flush_work(&dp->hotplug_work);
+	phy_power_off(dp->phy);
+
+	if (dp->plat_data->power_off)
+		dp->plat_data->power_off(dp->plat_data);
+
+	if (dp->plat_data->panel) {
+		if (drm_panel_unprepare(dp->plat_data->panel))
+			DRM_ERROR("failed to turnoff the panel\n");
+	}
+
+	pm_runtime_put_sync(dp->dev);
+
+	dp->dpms_mode = DRM_MODE_DPMS_OFF;
+}
+
+static void analogix_dp_bridge_nop(struct drm_bridge *bridge)
+{
+	/* do nothing */
+}
+
+static const struct drm_bridge_funcs analogix_dp_bridge_funcs = {
+	.enable = analogix_dp_bridge_enable,
+	.disable = analogix_dp_bridge_disable,
+	.pre_enable = analogix_dp_bridge_nop,
+	.post_disable = analogix_dp_bridge_nop,
+	.attach = analogix_dp_bridge_attach,
+};
+
+static int analogix_dp_create_bridge(struct drm_device *drm_dev,
+				     struct analogix_dp_device *dp)
+{
+	struct drm_bridge *bridge;
+	int ret;
+
+	bridge = devm_kzalloc(drm_dev->dev, sizeof(*bridge), GFP_KERNEL);
+	if (!bridge) {
+		DRM_ERROR("failed to allocate for drm bridge\n");
+		return -ENOMEM;
+	}
+
+	dp->bridge = bridge;
+
+	dp->encoder->bridge = bridge;
+	bridge->driver_private = dp;
+	bridge->encoder = dp->encoder;
+	bridge->funcs = &analogix_dp_bridge_funcs;
+
+	ret = drm_bridge_attach(drm_dev, bridge);
+	if (ret) {
+		DRM_ERROR("failed to attach drm bridge\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static struct video_info *analogix_dp_dt_parse_pdata(struct device *dev)
+{
+	struct device_node *dp_node = dev->of_node;
+	struct video_info *dp_video_config;
+
+	dp_video_config = devm_kzalloc(dev,
+				sizeof(*dp_video_config), GFP_KERNEL);
+	if (!dp_video_config)
+		return ERR_PTR(-ENOMEM);
+
+	dp_video_config->h_sync_polarity =
+		of_property_read_bool(dp_node, "hsync-active-high");
+
+	dp_video_config->v_sync_polarity =
+		of_property_read_bool(dp_node, "vsync-active-high");
+
+	dp_video_config->interlaced =
+		of_property_read_bool(dp_node, "interlaced");
+
+	if (of_property_read_u32(dp_node, "samsung,color-space",
+				&dp_video_config->color_space)) {
+		dev_err(dev, "failed to get color-space\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (of_property_read_u32(dp_node, "samsung,dynamic-range",
+				&dp_video_config->dynamic_range)) {
+		dev_err(dev, "failed to get dynamic-range\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (of_property_read_u32(dp_node, "samsung,ycbcr-coeff",
+				&dp_video_config->ycbcr_coeff)) {
+		dev_err(dev, "failed to get ycbcr-coeff\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (of_property_read_u32(dp_node, "samsung,color-depth",
+				&dp_video_config->color_depth)) {
+		dev_err(dev, "failed to get color-depth\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (of_property_read_u32(dp_node, "samsung,link-rate",
+				&dp_video_config->link_rate)) {
+		dev_err(dev, "failed to get link-rate\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (of_property_read_u32(dp_node, "samsung,lane-count",
+				&dp_video_config->lane_count)) {
+		dev_err(dev, "failed to get lane-count\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	return dp_video_config;
+}
+
+int analogix_dp_bind(struct device *dev, struct drm_device *drm_dev,
+		     struct analogix_dp_plat_data *plat_data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct analogix_dp_device *dp;
+	struct resource *res;
+	unsigned int irq_flags;
+	int ret;
+
+	if (!plat_data) {
+		dev_err(dev, "Invalided input plat_data\n");
+		return -EINVAL;
+	}
+
+	dp = devm_kzalloc(dev, sizeof(struct analogix_dp_device), GFP_KERNEL);
+	if (!dp)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, dp);
+
+	dp->dev = &pdev->dev;
+	dp->dpms_mode = DRM_MODE_DPMS_OFF;
+
+	/*
+	 * platform dp driver need containor_of the plat_data to get
+	 * the driver private data, so we need to store the point of
+	 * plat_data, not the context of plat_data.
+	 */
+	dp->plat_data = plat_data;
+
+	dp->video_info = analogix_dp_dt_parse_pdata(&pdev->dev);
+	if (IS_ERR(dp->video_info))
+		return PTR_ERR(dp->video_info);
+
+	dp->phy = devm_phy_get(dp->dev, "dp");
+	if (IS_ERR(dp->phy)) {
+		dev_err(dp->dev, "no DP phy configured\n");
+		ret = PTR_ERR(dp->phy);
+		if (ret) {
+			/*
+			 * phy itself is not enabled, so we can move forward
+			 * assigning NULL to phy pointer.
+			 */
+			if (ret == -ENOSYS || ret == -ENODEV)
+				dp->phy = NULL;
+			else
+				return ret;
+		}
+	}
+
+	dp->clock = devm_clk_get(&pdev->dev, "dp");
+	if (IS_ERR(dp->clock)) {
+		dev_err(&pdev->dev, "failed to get clock\n");
+		return PTR_ERR(dp->clock);
+	}
+
+	clk_prepare_enable(dp->clock);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+
+	dp->reg_base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(dp->reg_base))
+		return PTR_ERR(dp->reg_base);
+
+	dp->hpd_gpio = of_get_named_gpio(dev->of_node, "hpd-gpios", 0);
+	if (!gpio_is_valid(dp->hpd_gpio))
+		dp->hpd_gpio = of_get_named_gpio(dev->of_node,
+						 "samsung,hpd-gpio", 0);
+
+	if (gpio_is_valid(dp->hpd_gpio)) {
+		/*
+		 * Set up the hotplug GPIO from the device tree as an interrupt.
+		 * Simply specifying a different interrupt in the device tree
+		 * doesn't work since we handle hotplug rather differently when
+		 * using a GPIO.  We also need the actual GPIO specifier so
+		 * that we can get the current state of the GPIO.
+		 */
+		ret = devm_gpio_request_one(&pdev->dev, dp->hpd_gpio, GPIOF_IN,
+					    "hpd_gpio");
+		if (ret) {
+			dev_err(&pdev->dev, "failed to get hpd gpio\n");
+			return ret;
+		}
+		dp->irq = gpio_to_irq(dp->hpd_gpio);
+		irq_flags = IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING;
+	} else {
+		dp->hpd_gpio = -ENODEV;
+		dp->irq = platform_get_irq(pdev, 0);
+		irq_flags = 0;
+	}
+
+	if (dp->irq == -ENXIO) {
+		dev_err(&pdev->dev, "failed to get irq\n");
+		return -ENODEV;
+	}
+
+	INIT_WORK(&dp->hotplug_work, analogix_dp_hotplug);
+
+	pm_runtime_enable(dev);
+
+	ret = devm_request_irq(&pdev->dev, dp->irq, analogix_dp_irq_handler,
+			irq_flags, "analogix-dp", dp);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to request irq\n");
+		goto err_disable_pm_runtime;
+	}
+	disable_irq(dp->irq);
+
+	dp->drm_dev = drm_dev;
+	dp->encoder = dp->plat_data->encoder;
+
+	ret = analogix_dp_create_bridge(drm_dev, dp);
+	if (ret) {
+		DRM_ERROR("failed to create bridge (%d)\n", ret);
+		drm_encoder_cleanup(dp->encoder);
+		goto err_disable_pm_runtime;
+	}
+
+	return 0;
+
+err_disable_pm_runtime:
+	pm_runtime_disable(dev);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(analogix_dp_bind);
+
+void analogix_dp_unbind(struct device *dev, struct device *master,
+			void *data)
+{
+	struct analogix_dp_device *dp = dev_get_drvdata(dev);
+
+	analogix_dp_bridge_disable(dp->bridge);
+	pm_runtime_disable(dev);
+}
+EXPORT_SYMBOL_GPL(analogix_dp_unbind);
+
+#ifdef CONFIG_PM
+int analogix_dp_suspend(struct device *dev)
+{
+	struct analogix_dp_device *dp = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(dp->clock);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(analogix_dp_suspend);
+
+int analogix_dp_resume(struct device *dev)
+{
+	struct analogix_dp_device *dp = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(dp->clock);
+	if (ret < 0) {
+		DRM_ERROR("Failed to prepare_enable the clock clk [%d]\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(analogix_dp_resume);
+#endif
+
+MODULE_AUTHOR("Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>");
+MODULE_DESCRIPTION("Analogix DP Core Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
new file mode 100644
index 0000000..0fff745
--- /dev/null
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -0,0 +1,277 @@
+/*
+ * Header file for Analogix DP (Display Port) core interface driver.
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
+	struct drm_encoder	*encoder;
+	struct device		*dev;
+	struct drm_device	*drm_dev;
+	struct drm_connector	connector;
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
+				unsigned int reg_addr,
+				unsigned char data);
+int analogix_dp_read_byte_from_dpcd(struct analogix_dp_device *dp,
+				unsigned int reg_addr,
+				unsigned char *data);
+int analogix_dp_write_bytes_to_dpcd(struct analogix_dp_device *dp,
+				unsigned int reg_addr,
+				unsigned int count,
+				unsigned char data[]);
+int analogix_dp_read_bytes_from_dpcd(struct analogix_dp_device *dp,
+				unsigned int reg_addr,
+				unsigned int count,
+				unsigned char data[]);
+int analogix_dp_select_i2c_device(struct analogix_dp_device *dp,
+				unsigned int device_addr,
+				unsigned int reg_addr);
+int analogix_dp_read_byte_from_i2c(struct analogix_dp_device *dp,
+				unsigned int device_addr,
+				unsigned int reg_addr,
+				unsigned int *data);
+int analogix_dp_read_bytes_from_i2c(struct analogix_dp_device *dp,
+				unsigned int device_addr,
+				unsigned int reg_addr,
+				unsigned int count,
+				unsigned char edid[]);
+void analogix_dp_set_link_bandwidth(struct analogix_dp_device *dp, u32 bwtype);
+void analogix_dp_get_link_bandwidth(struct analogix_dp_device *dp, u32 *bwtype);
+void analogix_dp_set_lane_count(struct analogix_dp_device *dp, u32 count);
+void analogix_dp_get_lane_count(struct analogix_dp_device *dp, u32 *count);
+void analogix_dp_enable_enhanced_mode(struct analogix_dp_device *dp, bool enable);
+void analogix_dp_set_training_pattern(struct analogix_dp_device *dp,
+				enum pattern_set pattern);
+void analogix_dp_set_lane0_pre_emphasis(struct analogix_dp_device *dp, u32 level);
+void analogix_dp_set_lane1_pre_emphasis(struct analogix_dp_device *dp, u32 level);
+void analogix_dp_set_lane2_pre_emphasis(struct analogix_dp_device *dp, u32 level);
+void analogix_dp_set_lane3_pre_emphasis(struct analogix_dp_device *dp, u32 level);
+void analogix_dp_set_lane0_link_training(struct analogix_dp_device *dp,
+				u32 training_lane);
+void analogix_dp_set_lane1_link_training(struct analogix_dp_device *dp,
+				u32 training_lane);
+void analogix_dp_set_lane2_link_training(struct analogix_dp_device *dp,
+				u32 training_lane);
+void analogix_dp_set_lane3_link_training(struct analogix_dp_device *dp,
+				u32 training_lane);
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
+			enum clock_recovery_m_value_type type,
+			u32 m_value,
+			u32 n_value);
+void analogix_dp_set_video_timing_mode(struct analogix_dp_device *dp, u32 type);
+void analogix_dp_enable_video_master(struct analogix_dp_device *dp, bool enable);
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
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
new file mode 100644
index 0000000..0b926ea
--- /dev/null
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -0,0 +1,1263 @@
+/*
+ * Analogix DP (Display port) core register interface driver.
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
+		reg = readl(dp->reg_base + EXYNOS_DP_VIDEO_CTL_1);
+		reg |= HDCP_VIDEO_MUTE;
+		writel(reg, dp->reg_base + EXYNOS_DP_VIDEO_CTL_1);
+	} else {
+		reg = readl(dp->reg_base + EXYNOS_DP_VIDEO_CTL_1);
+		reg &= ~HDCP_VIDEO_MUTE;
+		writel(reg, dp->reg_base + EXYNOS_DP_VIDEO_CTL_1);
+	}
+}
+
+void analogix_dp_stop_video(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + EXYNOS_DP_VIDEO_CTL_1);
+	reg &= ~VIDEO_EN;
+	writel(reg, dp->reg_base + EXYNOS_DP_VIDEO_CTL_1);
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
+	writel(reg, dp->reg_base + EXYNOS_DP_LANE_MAP);
+}
+
+void analogix_dp_init_analog_param(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	reg = TX_TERMINAL_CTRL_50_OHM;
+	writel(reg, dp->reg_base + EXYNOS_DP_ANALOG_CTL_1);
+
+	reg = SEL_24M | TX_DVDD_BIT_1_0625V;
+	writel(reg, dp->reg_base + EXYNOS_DP_ANALOG_CTL_2);
+
+	reg = DRIVE_DVDD_BIT_1_0625V | VCO_BIT_600_MICRO;
+	writel(reg, dp->reg_base + EXYNOS_DP_ANALOG_CTL_3);
+
+	reg = PD_RING_OSC | AUX_TERMINAL_CTRL_50_OHM |
+		TX_CUR1_2X | TX_CUR_16_MA;
+	writel(reg, dp->reg_base + EXYNOS_DP_PLL_FILTER_CTL_1);
+
+	reg = CH3_AMP_400_MV | CH2_AMP_400_MV |
+		CH1_AMP_400_MV | CH0_AMP_400_MV;
+	writel(reg, dp->reg_base + EXYNOS_DP_TX_AMP_TUNING_CTL);
+}
+
+void analogix_dp_init_interrupt(struct analogix_dp_device *dp)
+{
+	/* Set interrupt pin assertion polarity as high */
+	writel(INT_POL1 | INT_POL0, dp->reg_base + EXYNOS_DP_INT_CTL);
+
+	/* Clear pending regisers */
+	writel(0xff, dp->reg_base + EXYNOS_DP_COMMON_INT_STA_1);
+	writel(0x4f, dp->reg_base + EXYNOS_DP_COMMON_INT_STA_2);
+	writel(0xe0, dp->reg_base + EXYNOS_DP_COMMON_INT_STA_3);
+	writel(0xe7, dp->reg_base + EXYNOS_DP_COMMON_INT_STA_4);
+	writel(0x63, dp->reg_base + EXYNOS_DP_INT_STA);
+
+	/* 0:mask,1: unmask */
+	writel(0x00, dp->reg_base + EXYNOS_DP_COMMON_INT_MASK_1);
+	writel(0x00, dp->reg_base + EXYNOS_DP_COMMON_INT_MASK_2);
+	writel(0x00, dp->reg_base + EXYNOS_DP_COMMON_INT_MASK_3);
+	writel(0x00, dp->reg_base + EXYNOS_DP_COMMON_INT_MASK_4);
+	writel(0x00, dp->reg_base + EXYNOS_DP_INT_STA_MASK);
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
+	writel(reg, dp->reg_base + EXYNOS_DP_FUNC_EN_1);
+
+	reg = SSC_FUNC_EN_N | AUX_FUNC_EN_N |
+		SERDES_FIFO_FUNC_EN_N |
+		LS_CLK_DOMAIN_FUNC_EN_N;
+	writel(reg, dp->reg_base + EXYNOS_DP_FUNC_EN_2);
+
+	usleep_range(20, 30);
+
+	analogix_dp_lane_swap(dp, 0);
+
+	writel(0x0, dp->reg_base + EXYNOS_DP_SYS_CTL_1);
+	writel(0x40, dp->reg_base + EXYNOS_DP_SYS_CTL_2);
+	writel(0x0, dp->reg_base + EXYNOS_DP_SYS_CTL_3);
+	writel(0x0, dp->reg_base + EXYNOS_DP_SYS_CTL_4);
+
+	writel(0x0, dp->reg_base + EXYNOS_DP_PKT_SEND_CTL);
+	writel(0x0, dp->reg_base + EXYNOS_DP_HDCP_CTL);
+
+	writel(0x5e, dp->reg_base + EXYNOS_DP_HPD_DEGLITCH_L);
+	writel(0x1a, dp->reg_base + EXYNOS_DP_HPD_DEGLITCH_H);
+
+	writel(0x10, dp->reg_base + EXYNOS_DP_LINK_DEBUG_CTL);
+
+	writel(0x0, dp->reg_base + EXYNOS_DP_PHY_TEST);
+
+	writel(0x0, dp->reg_base + EXYNOS_DP_VIDEO_FIFO_THRD);
+	writel(0x20, dp->reg_base + EXYNOS_DP_AUDIO_MARGIN);
+
+	writel(0x4, dp->reg_base + EXYNOS_DP_M_VID_GEN_FILTER_TH);
+	writel(0x2, dp->reg_base + EXYNOS_DP_M_AUD_GEN_FILTER_TH);
+
+	writel(0x00000101, dp->reg_base + EXYNOS_DP_SOC_GENERAL_CTL);
+}
+
+void analogix_dp_swreset(struct analogix_dp_device *dp)
+{
+	writel(RESET_DP_TX, dp->reg_base + EXYNOS_DP_TX_SW_RESET);
+}
+
+void analogix_dp_config_interrupt(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	/* 0: mask, 1: unmask */
+	reg = COMMON_INT_MASK_1;
+	writel(reg, dp->reg_base + EXYNOS_DP_COMMON_INT_MASK_1);
+
+	reg = COMMON_INT_MASK_2;
+	writel(reg, dp->reg_base + EXYNOS_DP_COMMON_INT_MASK_2);
+
+	reg = COMMON_INT_MASK_3;
+	writel(reg, dp->reg_base + EXYNOS_DP_COMMON_INT_MASK_3);
+
+	reg = COMMON_INT_MASK_4;
+	writel(reg, dp->reg_base + EXYNOS_DP_COMMON_INT_MASK_4);
+
+	reg = INT_STA_MASK;
+	writel(reg, dp->reg_base + EXYNOS_DP_INT_STA_MASK);
+}
+
+enum pll_status analogix_dp_get_pll_lock_status(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + EXYNOS_DP_DEBUG_CTL);
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
+		reg = readl(dp->reg_base + EXYNOS_DP_PLL_CTL);
+		reg |= DP_PLL_PD;
+		writel(reg, dp->reg_base + EXYNOS_DP_PLL_CTL);
+	} else {
+		reg = readl(dp->reg_base + EXYNOS_DP_PLL_CTL);
+		reg &= ~DP_PLL_PD;
+		writel(reg, dp->reg_base + EXYNOS_DP_PLL_CTL);
+	}
+}
+
+void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
+				enum analog_power_block block,
+				bool enable)
+{
+	u32 reg;
+
+	switch (block) {
+	case AUX_BLOCK:
+		if (enable) {
+			reg = readl(dp->reg_base + EXYNOS_DP_PHY_PD);
+			reg |= AUX_PD;
+			writel(reg, dp->reg_base + EXYNOS_DP_PHY_PD);
+		} else {
+			reg = readl(dp->reg_base + EXYNOS_DP_PHY_PD);
+			reg &= ~AUX_PD;
+			writel(reg, dp->reg_base + EXYNOS_DP_PHY_PD);
+		}
+		break;
+	case CH0_BLOCK:
+		if (enable) {
+			reg = readl(dp->reg_base + EXYNOS_DP_PHY_PD);
+			reg |= CH0_PD;
+			writel(reg, dp->reg_base + EXYNOS_DP_PHY_PD);
+		} else {
+			reg = readl(dp->reg_base + EXYNOS_DP_PHY_PD);
+			reg &= ~CH0_PD;
+			writel(reg, dp->reg_base + EXYNOS_DP_PHY_PD);
+		}
+		break;
+	case CH1_BLOCK:
+		if (enable) {
+			reg = readl(dp->reg_base + EXYNOS_DP_PHY_PD);
+			reg |= CH1_PD;
+			writel(reg, dp->reg_base + EXYNOS_DP_PHY_PD);
+		} else {
+			reg = readl(dp->reg_base + EXYNOS_DP_PHY_PD);
+			reg &= ~CH1_PD;
+			writel(reg, dp->reg_base + EXYNOS_DP_PHY_PD);
+		}
+		break;
+	case CH2_BLOCK:
+		if (enable) {
+			reg = readl(dp->reg_base + EXYNOS_DP_PHY_PD);
+			reg |= CH2_PD;
+			writel(reg, dp->reg_base + EXYNOS_DP_PHY_PD);
+		} else {
+			reg = readl(dp->reg_base + EXYNOS_DP_PHY_PD);
+			reg &= ~CH2_PD;
+			writel(reg, dp->reg_base + EXYNOS_DP_PHY_PD);
+		}
+		break;
+	case CH3_BLOCK:
+		if (enable) {
+			reg = readl(dp->reg_base + EXYNOS_DP_PHY_PD);
+			reg |= CH3_PD;
+			writel(reg, dp->reg_base + EXYNOS_DP_PHY_PD);
+		} else {
+			reg = readl(dp->reg_base + EXYNOS_DP_PHY_PD);
+			reg &= ~CH3_PD;
+			writel(reg, dp->reg_base + EXYNOS_DP_PHY_PD);
+		}
+		break;
+	case ANALOG_TOTAL:
+		if (enable) {
+			reg = readl(dp->reg_base + EXYNOS_DP_PHY_PD);
+			reg |= DP_PHY_PD;
+			writel(reg, dp->reg_base + EXYNOS_DP_PHY_PD);
+		} else {
+			reg = readl(dp->reg_base + EXYNOS_DP_PHY_PD);
+			reg &= ~DP_PHY_PD;
+			writel(reg, dp->reg_base + EXYNOS_DP_PHY_PD);
+		}
+		break;
+	case POWER_ALL:
+		if (enable) {
+			reg = DP_PHY_PD | AUX_PD | CH3_PD | CH2_PD |
+				CH1_PD | CH0_PD;
+			writel(reg, dp->reg_base + EXYNOS_DP_PHY_PD);
+		} else {
+			writel(0x00, dp->reg_base + EXYNOS_DP_PHY_PD);
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
+	writel(reg, dp->reg_base + EXYNOS_DP_COMMON_INT_STA_1);
+
+	reg = readl(dp->reg_base + EXYNOS_DP_DEBUG_CTL);
+	reg &= ~(F_PLL_LOCK | PLL_LOCK_CTRL);
+	writel(reg, dp->reg_base + EXYNOS_DP_DEBUG_CTL);
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
+	reg = readl(dp->reg_base + EXYNOS_DP_FUNC_EN_2);
+	reg &= ~(SERDES_FIFO_FUNC_EN_N | LS_CLK_DOMAIN_FUNC_EN_N
+		| AUX_FUNC_EN_N);
+	writel(reg, dp->reg_base + EXYNOS_DP_FUNC_EN_2);
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
+	writel(reg, dp->reg_base + EXYNOS_DP_COMMON_INT_STA_4);
+
+	reg = INT_HPD;
+	writel(reg, dp->reg_base + EXYNOS_DP_INT_STA);
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
+	reg = readl(dp->reg_base + EXYNOS_DP_SYS_CTL_3);
+	reg &= ~(F_HPD | HPD_CTRL);
+	writel(reg, dp->reg_base + EXYNOS_DP_SYS_CTL_3);
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
+		reg = readl(dp->reg_base + EXYNOS_DP_COMMON_INT_STA_4);
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
+	reg = readl(dp->reg_base + EXYNOS_DP_FUNC_EN_2);
+	reg |= AUX_FUNC_EN_N;
+	writel(reg, dp->reg_base + EXYNOS_DP_FUNC_EN_2);
+}
+
+void analogix_dp_init_aux(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	/* Clear inerrupts related to AUX channel */
+	reg = RPLY_RECEIV | AUX_ERR;
+	writel(reg, dp->reg_base + EXYNOS_DP_INT_STA);
+
+	analogix_dp_reset_aux(dp);
+
+	/* Disable AUX transaction H/W retry */
+	reg = AUX_BIT_PERIOD_EXPECTED_DELAY(3) | AUX_HW_RETRY_COUNT_SEL(0)|
+		AUX_HW_RETRY_INTERVAL_600_MICROSECONDS;
+	writel(reg, dp->reg_base + EXYNOS_DP_AUX_HW_RETRY_CTL);
+
+	/* Receive AUX Channel DEFER commands equal to DEFFER_COUNT*64 */
+	reg = DEFER_CTRL_EN | DEFER_COUNT(1);
+	writel(reg, dp->reg_base + EXYNOS_DP_AUX_CH_DEFER_CTL);
+
+	/* Enable AUX channel module */
+	reg = readl(dp->reg_base + EXYNOS_DP_FUNC_EN_2);
+	reg &= ~AUX_FUNC_EN_N;
+	writel(reg, dp->reg_base + EXYNOS_DP_FUNC_EN_2);
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
+		reg = readl(dp->reg_base + EXYNOS_DP_SYS_CTL_3);
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
+	reg = readl(dp->reg_base + EXYNOS_DP_FUNC_EN_1);
+	reg &= ~SW_FUNC_EN_N;
+	writel(reg, dp->reg_base + EXYNOS_DP_FUNC_EN_1);
+}
+
+int analogix_dp_start_aux_transaction(struct analogix_dp_device *dp)
+{
+	int reg;
+	int retval = 0;
+	int timeout_loop = 0;
+
+	/* Enable AUX CH operation */
+	reg = readl(dp->reg_base + EXYNOS_DP_AUX_CH_CTL_2);
+	reg |= AUX_EN;
+	writel(reg, dp->reg_base + EXYNOS_DP_AUX_CH_CTL_2);
+
+	/* Is AUX CH command reply received? */
+	reg = readl(dp->reg_base + EXYNOS_DP_INT_STA);
+	while (!(reg & RPLY_RECEIV)) {
+		timeout_loop++;
+		if (DP_TIMEOUT_LOOP_COUNT < timeout_loop) {
+			dev_err(dp->dev, "AUX CH command reply failed!\n");
+			return -ETIMEDOUT;
+		}
+		reg = readl(dp->reg_base + EXYNOS_DP_INT_STA);
+		usleep_range(10, 11);
+	}
+
+	/* Clear interrupt source for AUX CH command reply */
+	writel(RPLY_RECEIV, dp->reg_base + EXYNOS_DP_INT_STA);
+
+	/* Clear interrupt source for AUX CH access error */
+	reg = readl(dp->reg_base + EXYNOS_DP_INT_STA);
+	if (reg & AUX_ERR) {
+		writel(AUX_ERR, dp->reg_base + EXYNOS_DP_INT_STA);
+		return -EREMOTEIO;
+	}
+
+	/* Check AUX CH error access status */
+	reg = readl(dp->reg_base + EXYNOS_DP_AUX_CH_STA);
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
+				unsigned int reg_addr,
+				unsigned char data)
+{
+	u32 reg;
+	int i;
+	int retval;
+
+	for (i = 0; i < 3; i++) {
+		/* Clear AUX CH data buffer */
+		reg = BUF_CLR;
+		writel(reg, dp->reg_base + EXYNOS_DP_BUFFER_DATA_CTL);
+
+		/* Select DPCD device address */
+		reg = AUX_ADDR_7_0(reg_addr);
+		writel(reg, dp->reg_base + EXYNOS_DP_AUX_ADDR_7_0);
+		reg = AUX_ADDR_15_8(reg_addr);
+		writel(reg, dp->reg_base + EXYNOS_DP_AUX_ADDR_15_8);
+		reg = AUX_ADDR_19_16(reg_addr);
+		writel(reg, dp->reg_base + EXYNOS_DP_AUX_ADDR_19_16);
+
+		/* Write data buffer */
+		reg = (unsigned int)data;
+		writel(reg, dp->reg_base + EXYNOS_DP_BUF_DATA_0);
+
+		/*
+		 * Set DisplayPort transaction and write 1 byte
+		 * If bit 3 is 1, DisplayPort transaction.
+		 * If Bit 3 is 0, I2C transaction.
+		 */
+		reg = AUX_TX_COMM_DP_TRANSACTION | AUX_TX_COMM_WRITE;
+		writel(reg, dp->reg_base + EXYNOS_DP_AUX_CH_CTL_1);
+
+		/* Start AUX transaction */
+		retval = analogix_dp_start_aux_transaction(dp);
+		if (retval == 0)
+			break;
+		else
+			dev_dbg(dp->dev, "%s: Aux Transaction fail!\n",
+				__func__);
+	}
+
+	return retval;
+}
+
+int analogix_dp_read_byte_from_dpcd(struct analogix_dp_device *dp,
+				unsigned int reg_addr,
+				unsigned char *data)
+{
+	u32 reg;
+	int i;
+	int retval;
+
+	for (i = 0; i < 3; i++) {
+		/* Clear AUX CH data buffer */
+		reg = BUF_CLR;
+		writel(reg, dp->reg_base + EXYNOS_DP_BUFFER_DATA_CTL);
+
+		/* Select DPCD device address */
+		reg = AUX_ADDR_7_0(reg_addr);
+		writel(reg, dp->reg_base + EXYNOS_DP_AUX_ADDR_7_0);
+		reg = AUX_ADDR_15_8(reg_addr);
+		writel(reg, dp->reg_base + EXYNOS_DP_AUX_ADDR_15_8);
+		reg = AUX_ADDR_19_16(reg_addr);
+		writel(reg, dp->reg_base + EXYNOS_DP_AUX_ADDR_19_16);
+
+		/*
+		 * Set DisplayPort transaction and read 1 byte
+		 * If bit 3 is 1, DisplayPort transaction.
+		 * If Bit 3 is 0, I2C transaction.
+		 */
+		reg = AUX_TX_COMM_DP_TRANSACTION | AUX_TX_COMM_READ;
+		writel(reg, dp->reg_base + EXYNOS_DP_AUX_CH_CTL_1);
+
+		/* Start AUX transaction */
+		retval = analogix_dp_start_aux_transaction(dp);
+		if (retval == 0)
+			break;
+		else
+			dev_dbg(dp->dev, "%s: Aux Transaction fail!\n",
+				__func__);
+	}
+
+	/* Read data buffer */
+	reg = readl(dp->reg_base + EXYNOS_DP_BUF_DATA_0);
+	*data = (unsigned char)(reg & 0xff);
+
+	return retval;
+}
+
+int analogix_dp_write_bytes_to_dpcd(struct analogix_dp_device *dp,
+				unsigned int reg_addr,
+				unsigned int count,
+				unsigned char data[])
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
+	writel(reg, dp->reg_base + EXYNOS_DP_BUFFER_DATA_CTL);
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
+			writel(reg, dp->reg_base + EXYNOS_DP_AUX_ADDR_7_0);
+			reg = AUX_ADDR_15_8(reg_addr + start_offset);
+			writel(reg, dp->reg_base + EXYNOS_DP_AUX_ADDR_15_8);
+			reg = AUX_ADDR_19_16(reg_addr + start_offset);
+			writel(reg, dp->reg_base + EXYNOS_DP_AUX_ADDR_19_16);
+
+			for (cur_data_idx = 0; cur_data_idx < cur_data_count;
+			     cur_data_idx++) {
+				reg = data[start_offset + cur_data_idx];
+				writel(reg, dp->reg_base + EXYNOS_DP_BUF_DATA_0
+							  + 4 * cur_data_idx);
+			}
+
+			/*
+			 * Set DisplayPort transaction and write
+			 * If bit 3 is 1, DisplayPort transaction.
+			 * If Bit 3 is 0, I2C transaction.
+			 */
+			reg = AUX_LENGTH(cur_data_count) |
+				AUX_TX_COMM_DP_TRANSACTION | AUX_TX_COMM_WRITE;
+			writel(reg, dp->reg_base + EXYNOS_DP_AUX_CH_CTL_1);
+
+			/* Start AUX transaction */
+			retval = analogix_dp_start_aux_transaction(dp);
+			if (retval == 0)
+				break;
+			else
+				dev_dbg(dp->dev, "%s: Aux Transaction fail!\n",
+					__func__);
+		}
+
+		start_offset += cur_data_count;
+	}
+
+	return retval;
+}
+
+int analogix_dp_read_bytes_from_dpcd(struct analogix_dp_device *dp,
+				unsigned int reg_addr,
+				unsigned int count,
+				unsigned char data[])
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
+	writel(reg, dp->reg_base + EXYNOS_DP_BUFFER_DATA_CTL);
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
+			writel(reg, dp->reg_base + EXYNOS_DP_AUX_ADDR_7_0);
+			reg = AUX_ADDR_15_8(reg_addr + start_offset);
+			writel(reg, dp->reg_base + EXYNOS_DP_AUX_ADDR_15_8);
+			reg = AUX_ADDR_19_16(reg_addr + start_offset);
+			writel(reg, dp->reg_base + EXYNOS_DP_AUX_ADDR_19_16);
+
+			/*
+			 * Set DisplayPort transaction and read
+			 * If bit 3 is 1, DisplayPort transaction.
+			 * If Bit 3 is 0, I2C transaction.
+			 */
+			reg = AUX_LENGTH(cur_data_count) |
+				AUX_TX_COMM_DP_TRANSACTION | AUX_TX_COMM_READ;
+			writel(reg, dp->reg_base + EXYNOS_DP_AUX_CH_CTL_1);
+
+			/* Start AUX transaction */
+			retval = analogix_dp_start_aux_transaction(dp);
+			if (retval == 0)
+				break;
+			else
+				dev_dbg(dp->dev, "%s: Aux Transaction fail!\n",
+					__func__);
+		}
+
+		for (cur_data_idx = 0; cur_data_idx < cur_data_count;
+		    cur_data_idx++) {
+			reg = readl(dp->reg_base + EXYNOS_DP_BUF_DATA_0
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
+				unsigned int device_addr,
+				unsigned int reg_addr)
+{
+	u32 reg;
+	int retval;
+
+	/* Set EDID device address */
+	reg = device_addr;
+	writel(reg, dp->reg_base + EXYNOS_DP_AUX_ADDR_7_0);
+	writel(0x0, dp->reg_base + EXYNOS_DP_AUX_ADDR_15_8);
+	writel(0x0, dp->reg_base + EXYNOS_DP_AUX_ADDR_19_16);
+
+	/* Set offset from base address of EDID device */
+	writel(reg_addr, dp->reg_base + EXYNOS_DP_BUF_DATA_0);
+
+	/*
+	 * Set I2C transaction and write address
+	 * If bit 3 is 1, DisplayPort transaction.
+	 * If Bit 3 is 0, I2C transaction.
+	 */
+	reg = AUX_TX_COMM_I2C_TRANSACTION | AUX_TX_COMM_MOT |
+		AUX_TX_COMM_WRITE;
+	writel(reg, dp->reg_base + EXYNOS_DP_AUX_CH_CTL_1);
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
+				unsigned int device_addr,
+				unsigned int reg_addr,
+				unsigned int *data)
+{
+	u32 reg;
+	int i;
+	int retval;
+
+	for (i = 0; i < 3; i++) {
+		/* Clear AUX CH data buffer */
+		reg = BUF_CLR;
+		writel(reg, dp->reg_base + EXYNOS_DP_BUFFER_DATA_CTL);
+
+		/* Select EDID device */
+		retval = analogix_dp_select_i2c_device(dp, device_addr, reg_addr);
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
+		writel(reg, dp->reg_base + EXYNOS_DP_AUX_CH_CTL_1);
+
+		/* Start AUX transaction */
+		retval = analogix_dp_start_aux_transaction(dp);
+		if (retval == 0)
+			break;
+		else
+			dev_dbg(dp->dev, "%s: Aux Transaction fail!\n",
+				__func__);
+	}
+
+	/* Read data */
+	if (retval == 0)
+		*data = readl(dp->reg_base + EXYNOS_DP_BUF_DATA_0);
+
+	return retval;
+}
+
+int analogix_dp_read_bytes_from_i2c(struct analogix_dp_device *dp,
+				unsigned int device_addr,
+				unsigned int reg_addr,
+				unsigned int count,
+				unsigned char edid[])
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
+			writel(reg, dp->reg_base + EXYNOS_DP_BUFFER_DATA_CTL);
+
+			/* Set normal AUX CH command */
+			reg = readl(dp->reg_base + EXYNOS_DP_AUX_CH_CTL_2);
+			reg &= ~ADDR_ONLY;
+			writel(reg, dp->reg_base + EXYNOS_DP_AUX_CH_CTL_2);
+
+			/*
+			 * If Rx sends defer, Tx sends only reads
+			 * request without sending address
+			 */
+			if (!defer)
+				retval = analogix_dp_select_i2c_device(dp,
+						device_addr, reg_addr + i);
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
+					EXYNOS_DP_AUX_CH_CTL_1);
+
+				/* Start AUX transaction */
+				retval = analogix_dp_start_aux_transaction(dp);
+				if (retval == 0)
+					break;
+				else
+					dev_dbg(dp->dev,
+						"%s: Aux Transaction fail!\n",
+						__func__);
+			}
+			/* Check if Rx sends defer */
+			reg = readl(dp->reg_base + EXYNOS_DP_AUX_RX_COMM);
+			if (reg == AUX_RX_COMM_AUX_DEFER ||
+				reg == AUX_RX_COMM_I2C_DEFER) {
+				dev_err(dp->dev, "Defer: %d\n\n", reg);
+				defer = 1;
+			}
+		}
+
+		for (cur_data_idx = 0; cur_data_idx < 16; cur_data_idx++) {
+			reg = readl(dp->reg_base + EXYNOS_DP_BUF_DATA_0
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
+		writel(reg, dp->reg_base + EXYNOS_DP_LINK_BW_SET);
+}
+
+void analogix_dp_get_link_bandwidth(struct analogix_dp_device *dp, u32 *bwtype)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + EXYNOS_DP_LINK_BW_SET);
+	*bwtype = reg;
+}
+
+void analogix_dp_set_lane_count(struct analogix_dp_device *dp, u32 count)
+{
+	u32 reg;
+
+	reg = count;
+	writel(reg, dp->reg_base + EXYNOS_DP_LANE_COUNT_SET);
+}
+
+void analogix_dp_get_lane_count(struct analogix_dp_device *dp, u32 *count)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + EXYNOS_DP_LANE_COUNT_SET);
+	*count = reg;
+}
+
+void analogix_dp_enable_enhanced_mode(struct analogix_dp_device *dp, bool enable)
+{
+	u32 reg;
+
+	if (enable) {
+		reg = readl(dp->reg_base + EXYNOS_DP_SYS_CTL_4);
+		reg |= ENHANCED;
+		writel(reg, dp->reg_base + EXYNOS_DP_SYS_CTL_4);
+	} else {
+		reg = readl(dp->reg_base + EXYNOS_DP_SYS_CTL_4);
+		reg &= ~ENHANCED;
+		writel(reg, dp->reg_base + EXYNOS_DP_SYS_CTL_4);
+	}
+}
+
+void analogix_dp_set_training_pattern(struct analogix_dp_device *dp,
+				enum pattern_set pattern)
+{
+	u32 reg;
+
+	switch (pattern) {
+	case PRBS7:
+		reg = SCRAMBLING_ENABLE | LINK_QUAL_PATTERN_SET_PRBS7;
+		writel(reg, dp->reg_base + EXYNOS_DP_TRAINING_PTN_SET);
+		break;
+	case D10_2:
+		reg = SCRAMBLING_ENABLE | LINK_QUAL_PATTERN_SET_D10_2;
+		writel(reg, dp->reg_base + EXYNOS_DP_TRAINING_PTN_SET);
+		break;
+	case TRAINING_PTN1:
+		reg = SCRAMBLING_DISABLE | SW_TRAINING_PATTERN_SET_PTN1;
+		writel(reg, dp->reg_base + EXYNOS_DP_TRAINING_PTN_SET);
+		break;
+	case TRAINING_PTN2:
+		reg = SCRAMBLING_DISABLE | SW_TRAINING_PATTERN_SET_PTN2;
+		writel(reg, dp->reg_base + EXYNOS_DP_TRAINING_PTN_SET);
+		break;
+	case DP_NONE:
+		reg = SCRAMBLING_ENABLE |
+			LINK_QUAL_PATTERN_SET_DISABLE |
+			SW_TRAINING_PATTERN_SET_NORMAL;
+		writel(reg, dp->reg_base + EXYNOS_DP_TRAINING_PTN_SET);
+		break;
+	default:
+		break;
+	}
+}
+
+void analogix_dp_set_lane0_pre_emphasis(struct analogix_dp_device *dp, u32 level)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + EXYNOS_DP_LN0_LINK_TRAINING_CTL);
+	reg &= ~PRE_EMPHASIS_SET_MASK;
+	reg |= level << PRE_EMPHASIS_SET_SHIFT;
+	writel(reg, dp->reg_base + EXYNOS_DP_LN0_LINK_TRAINING_CTL);
+}
+
+void analogix_dp_set_lane1_pre_emphasis(struct analogix_dp_device *dp, u32 level)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + EXYNOS_DP_LN1_LINK_TRAINING_CTL);
+	reg &= ~PRE_EMPHASIS_SET_MASK;
+	reg |= level << PRE_EMPHASIS_SET_SHIFT;
+	writel(reg, dp->reg_base + EXYNOS_DP_LN1_LINK_TRAINING_CTL);
+}
+
+void analogix_dp_set_lane2_pre_emphasis(struct analogix_dp_device *dp, u32 level)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + EXYNOS_DP_LN2_LINK_TRAINING_CTL);
+	reg &= ~PRE_EMPHASIS_SET_MASK;
+	reg |= level << PRE_EMPHASIS_SET_SHIFT;
+	writel(reg, dp->reg_base + EXYNOS_DP_LN2_LINK_TRAINING_CTL);
+}
+
+void analogix_dp_set_lane3_pre_emphasis(struct analogix_dp_device *dp, u32 level)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + EXYNOS_DP_LN3_LINK_TRAINING_CTL);
+	reg &= ~PRE_EMPHASIS_SET_MASK;
+	reg |= level << PRE_EMPHASIS_SET_SHIFT;
+	writel(reg, dp->reg_base + EXYNOS_DP_LN3_LINK_TRAINING_CTL);
+}
+
+void analogix_dp_set_lane0_link_training(struct analogix_dp_device *dp,
+					u32 training_lane)
+{
+	u32 reg;
+
+	reg = training_lane;
+	writel(reg, dp->reg_base + EXYNOS_DP_LN0_LINK_TRAINING_CTL);
+}
+
+void analogix_dp_set_lane1_link_training(struct analogix_dp_device *dp,
+					u32 training_lane)
+{
+	u32 reg;
+
+	reg = training_lane;
+	writel(reg, dp->reg_base + EXYNOS_DP_LN1_LINK_TRAINING_CTL);
+}
+
+void analogix_dp_set_lane2_link_training(struct analogix_dp_device *dp,
+					 u32 training_lane)
+{
+	u32 reg;
+
+	reg = training_lane;
+	writel(reg, dp->reg_base + EXYNOS_DP_LN2_LINK_TRAINING_CTL);
+}
+
+void analogix_dp_set_lane3_link_training(struct analogix_dp_device *dp,
+					u32 training_lane)
+{
+	u32 reg;
+
+	reg = training_lane;
+	writel(reg, dp->reg_base + EXYNOS_DP_LN3_LINK_TRAINING_CTL);
+}
+
+u32 analogix_dp_get_lane0_link_training(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + EXYNOS_DP_LN0_LINK_TRAINING_CTL);
+	return reg;
+}
+
+u32 analogix_dp_get_lane1_link_training(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + EXYNOS_DP_LN1_LINK_TRAINING_CTL);
+	return reg;
+}
+
+u32 analogix_dp_get_lane2_link_training(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + EXYNOS_DP_LN2_LINK_TRAINING_CTL);
+	return reg;
+}
+
+u32 analogix_dp_get_lane3_link_training(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + EXYNOS_DP_LN3_LINK_TRAINING_CTL);
+	return reg;
+}
+
+void analogix_dp_reset_macro(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + EXYNOS_DP_PHY_TEST);
+	reg |= MACRO_RST;
+	writel(reg, dp->reg_base + EXYNOS_DP_PHY_TEST);
+
+	/* 10 us is the minimum reset time. */
+	usleep_range(10, 20);
+
+	reg &= ~MACRO_RST;
+	writel(reg, dp->reg_base + EXYNOS_DP_PHY_TEST);
+}
+
+void analogix_dp_init_video(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	reg = VSYNC_DET | VID_FORMAT_CHG | VID_CLK_CHG;
+	writel(reg, dp->reg_base + EXYNOS_DP_COMMON_INT_STA_1);
+
+	reg = 0x0;
+	writel(reg, dp->reg_base + EXYNOS_DP_SYS_CTL_1);
+
+	reg = CHA_CRI(4) | CHA_CTRL;
+	writel(reg, dp->reg_base + EXYNOS_DP_SYS_CTL_2);
+
+	reg = 0x0;
+	writel(reg, dp->reg_base + EXYNOS_DP_SYS_CTL_3);
+
+	reg = VID_HRES_TH(2) | VID_VRES_TH(0);
+	writel(reg, dp->reg_base + EXYNOS_DP_VIDEO_CTL_8);
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
+	writel(reg, dp->reg_base + EXYNOS_DP_VIDEO_CTL_2);
+
+	/* Set Input Color YCbCr Coefficients to ITU601 or ITU709 */
+	reg = readl(dp->reg_base + EXYNOS_DP_VIDEO_CTL_3);
+	reg &= ~IN_YC_COEFFI_MASK;
+	if (dp->video_info->ycbcr_coeff)
+		reg |= IN_YC_COEFFI_ITU709;
+	else
+		reg |= IN_YC_COEFFI_ITU601;
+	writel(reg, dp->reg_base + EXYNOS_DP_VIDEO_CTL_3);
+}
+
+int analogix_dp_is_slave_video_stream_clock_on(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + EXYNOS_DP_SYS_CTL_1);
+	writel(reg, dp->reg_base + EXYNOS_DP_SYS_CTL_1);
+
+	reg = readl(dp->reg_base + EXYNOS_DP_SYS_CTL_1);
+
+	if (!(reg & DET_STA)) {
+		dev_dbg(dp->dev, "Input stream clock not detected.\n");
+		return -EINVAL;
+	}
+
+	reg = readl(dp->reg_base + EXYNOS_DP_SYS_CTL_2);
+	writel(reg, dp->reg_base + EXYNOS_DP_SYS_CTL_2);
+
+	reg = readl(dp->reg_base + EXYNOS_DP_SYS_CTL_2);
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
+		enum clock_recovery_m_value_type type,
+		u32 m_value,
+		u32 n_value)
+{
+	u32 reg;
+
+	if (type == REGISTER_M) {
+		reg = readl(dp->reg_base + EXYNOS_DP_SYS_CTL_4);
+		reg |= FIX_M_VID;
+		writel(reg, dp->reg_base + EXYNOS_DP_SYS_CTL_4);
+		reg = m_value & 0xff;
+		writel(reg, dp->reg_base + EXYNOS_DP_M_VID_0);
+		reg = (m_value >> 8) & 0xff;
+		writel(reg, dp->reg_base + EXYNOS_DP_M_VID_1);
+		reg = (m_value >> 16) & 0xff;
+		writel(reg, dp->reg_base + EXYNOS_DP_M_VID_2);
+
+		reg = n_value & 0xff;
+		writel(reg, dp->reg_base + EXYNOS_DP_N_VID_0);
+		reg = (n_value >> 8) & 0xff;
+		writel(reg, dp->reg_base + EXYNOS_DP_N_VID_1);
+		reg = (n_value >> 16) & 0xff;
+		writel(reg, dp->reg_base + EXYNOS_DP_N_VID_2);
+	} else  {
+		reg = readl(dp->reg_base + EXYNOS_DP_SYS_CTL_4);
+		reg &= ~FIX_M_VID;
+		writel(reg, dp->reg_base + EXYNOS_DP_SYS_CTL_4);
+
+		writel(0x00, dp->reg_base + EXYNOS_DP_N_VID_0);
+		writel(0x80, dp->reg_base + EXYNOS_DP_N_VID_1);
+		writel(0x00, dp->reg_base + EXYNOS_DP_N_VID_2);
+	}
+}
+
+void analogix_dp_set_video_timing_mode(struct analogix_dp_device *dp, u32 type)
+{
+	u32 reg;
+
+	if (type == VIDEO_TIMING_FROM_CAPTURE) {
+		reg = readl(dp->reg_base + EXYNOS_DP_VIDEO_CTL_10);
+		reg &= ~FORMAT_SEL;
+		writel(reg, dp->reg_base + EXYNOS_DP_VIDEO_CTL_10);
+	} else {
+		reg = readl(dp->reg_base + EXYNOS_DP_VIDEO_CTL_10);
+		reg |= FORMAT_SEL;
+		writel(reg, dp->reg_base + EXYNOS_DP_VIDEO_CTL_10);
+	}
+}
+
+void analogix_dp_enable_video_master(struct analogix_dp_device *dp, bool enable)
+{
+	u32 reg;
+
+	if (enable) {
+		reg = readl(dp->reg_base + EXYNOS_DP_SOC_GENERAL_CTL);
+		reg &= ~VIDEO_MODE_MASK;
+		reg |= VIDEO_MASTER_MODE_EN | VIDEO_MODE_MASTER_MODE;
+		writel(reg, dp->reg_base + EXYNOS_DP_SOC_GENERAL_CTL);
+	} else {
+		reg = readl(dp->reg_base + EXYNOS_DP_SOC_GENERAL_CTL);
+		reg &= ~VIDEO_MODE_MASK;
+		reg |= VIDEO_MODE_SLAVE_MODE;
+		writel(reg, dp->reg_base + EXYNOS_DP_SOC_GENERAL_CTL);
+	}
+}
+
+void analogix_dp_start_video(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + EXYNOS_DP_VIDEO_CTL_1);
+	reg |= VIDEO_EN;
+	writel(reg, dp->reg_base + EXYNOS_DP_VIDEO_CTL_1);
+}
+
+int analogix_dp_is_video_stream_on(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + EXYNOS_DP_SYS_CTL_3);
+	writel(reg, dp->reg_base + EXYNOS_DP_SYS_CTL_3);
+
+	reg = readl(dp->reg_base + EXYNOS_DP_SYS_CTL_3);
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
+	reg = readl(dp->reg_base + EXYNOS_DP_FUNC_EN_1);
+	reg &= ~(MASTER_VID_FUNC_EN_N|SLAVE_VID_FUNC_EN_N);
+	reg |= MASTER_VID_FUNC_EN_N;
+	writel(reg, dp->reg_base + EXYNOS_DP_FUNC_EN_1);
+
+	reg = readl(dp->reg_base + EXYNOS_DP_VIDEO_CTL_10);
+	reg &= ~INTERACE_SCAN_CFG;
+	reg |= (dp->video_info->interlaced << 2);
+	writel(reg, dp->reg_base + EXYNOS_DP_VIDEO_CTL_10);
+
+	reg = readl(dp->reg_base + EXYNOS_DP_VIDEO_CTL_10);
+	reg &= ~VSYNC_POLARITY_CFG;
+	reg |= (dp->video_info->v_sync_polarity << 1);
+	writel(reg, dp->reg_base + EXYNOS_DP_VIDEO_CTL_10);
+
+	reg = readl(dp->reg_base + EXYNOS_DP_VIDEO_CTL_10);
+	reg &= ~HSYNC_POLARITY_CFG;
+	reg |= (dp->video_info->h_sync_polarity << 0);
+	writel(reg, dp->reg_base + EXYNOS_DP_VIDEO_CTL_10);
+
+	reg = AUDIO_MODE_SPDIF_MODE | VIDEO_MODE_SLAVE_MODE;
+	writel(reg, dp->reg_base + EXYNOS_DP_SOC_GENERAL_CTL);
+}
+
+void analogix_dp_enable_scrambling(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + EXYNOS_DP_TRAINING_PTN_SET);
+	reg &= ~SCRAMBLING_DISABLE;
+	writel(reg, dp->reg_base + EXYNOS_DP_TRAINING_PTN_SET);
+}
+
+void analogix_dp_disable_scrambling(struct analogix_dp_device *dp)
+{
+	u32 reg;
+
+	reg = readl(dp->reg_base + EXYNOS_DP_TRAINING_PTN_SET);
+	reg |= SCRAMBLING_DISABLE;
+	writel(reg, dp->reg_base + EXYNOS_DP_TRAINING_PTN_SET);
+}
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
new file mode 100644
index 0000000..b9661c9
--- /dev/null
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
@@ -0,0 +1,366 @@
+/*
+ * Register definition file for Analogix DP core driver
+ *
+ * Copyright (C) 2012 Samsung Electronics Co., Ltd.
+ * Author: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef _ANALOGIX_DP_REG_H
+#define _ANALOGIX_DP_REG_H
+
+#define EXYNOS_DP_TX_SW_RESET			0x14
+#define EXYNOS_DP_FUNC_EN_1			0x18
+#define EXYNOS_DP_FUNC_EN_2			0x1C
+#define EXYNOS_DP_VIDEO_CTL_1			0x20
+#define EXYNOS_DP_VIDEO_CTL_2			0x24
+#define EXYNOS_DP_VIDEO_CTL_3			0x28
+
+#define EXYNOS_DP_VIDEO_CTL_8			0x3C
+#define EXYNOS_DP_VIDEO_CTL_10			0x44
+
+#define EXYNOS_DP_LANE_MAP			0x35C
+
+#define EXYNOS_DP_ANALOG_CTL_1			0x370
+#define EXYNOS_DP_ANALOG_CTL_2			0x374
+#define EXYNOS_DP_ANALOG_CTL_3			0x378
+#define EXYNOS_DP_PLL_FILTER_CTL_1		0x37C
+#define EXYNOS_DP_TX_AMP_TUNING_CTL		0x380
+
+#define EXYNOS_DP_AUX_HW_RETRY_CTL		0x390
+
+#define EXYNOS_DP_COMMON_INT_STA_1		0x3C4
+#define EXYNOS_DP_COMMON_INT_STA_2		0x3C8
+#define EXYNOS_DP_COMMON_INT_STA_3		0x3CC
+#define EXYNOS_DP_COMMON_INT_STA_4		0x3D0
+#define EXYNOS_DP_INT_STA			0x3DC
+#define EXYNOS_DP_COMMON_INT_MASK_1		0x3E0
+#define EXYNOS_DP_COMMON_INT_MASK_2		0x3E4
+#define EXYNOS_DP_COMMON_INT_MASK_3		0x3E8
+#define EXYNOS_DP_COMMON_INT_MASK_4		0x3EC
+#define EXYNOS_DP_INT_STA_MASK			0x3F8
+#define EXYNOS_DP_INT_CTL			0x3FC
+
+#define EXYNOS_DP_SYS_CTL_1			0x600
+#define EXYNOS_DP_SYS_CTL_2			0x604
+#define EXYNOS_DP_SYS_CTL_3			0x608
+#define EXYNOS_DP_SYS_CTL_4			0x60C
+
+#define EXYNOS_DP_PKT_SEND_CTL			0x640
+#define EXYNOS_DP_HDCP_CTL			0x648
+
+#define EXYNOS_DP_LINK_BW_SET			0x680
+#define EXYNOS_DP_LANE_COUNT_SET		0x684
+#define EXYNOS_DP_TRAINING_PTN_SET		0x688
+#define EXYNOS_DP_LN0_LINK_TRAINING_CTL		0x68C
+#define EXYNOS_DP_LN1_LINK_TRAINING_CTL		0x690
+#define EXYNOS_DP_LN2_LINK_TRAINING_CTL		0x694
+#define EXYNOS_DP_LN3_LINK_TRAINING_CTL		0x698
+
+#define EXYNOS_DP_DEBUG_CTL			0x6C0
+#define EXYNOS_DP_HPD_DEGLITCH_L		0x6C4
+#define EXYNOS_DP_HPD_DEGLITCH_H		0x6C8
+#define EXYNOS_DP_LINK_DEBUG_CTL		0x6E0
+
+#define EXYNOS_DP_M_VID_0			0x700
+#define EXYNOS_DP_M_VID_1			0x704
+#define EXYNOS_DP_M_VID_2			0x708
+#define EXYNOS_DP_N_VID_0			0x70C
+#define EXYNOS_DP_N_VID_1			0x710
+#define EXYNOS_DP_N_VID_2			0x714
+
+#define EXYNOS_DP_PLL_CTL			0x71C
+#define EXYNOS_DP_PHY_PD			0x720
+#define EXYNOS_DP_PHY_TEST			0x724
+
+#define EXYNOS_DP_VIDEO_FIFO_THRD		0x730
+#define EXYNOS_DP_AUDIO_MARGIN			0x73C
+
+#define EXYNOS_DP_M_VID_GEN_FILTER_TH		0x764
+#define EXYNOS_DP_M_AUD_GEN_FILTER_TH		0x778
+#define EXYNOS_DP_AUX_CH_STA			0x780
+#define EXYNOS_DP_AUX_CH_DEFER_CTL		0x788
+#define EXYNOS_DP_AUX_RX_COMM			0x78C
+#define EXYNOS_DP_BUFFER_DATA_CTL		0x790
+#define EXYNOS_DP_AUX_CH_CTL_1			0x794
+#define EXYNOS_DP_AUX_ADDR_7_0			0x798
+#define EXYNOS_DP_AUX_ADDR_15_8			0x79C
+#define EXYNOS_DP_AUX_ADDR_19_16		0x7A0
+#define EXYNOS_DP_AUX_CH_CTL_2			0x7A4
+
+#define EXYNOS_DP_BUF_DATA_0			0x7C0
+
+#define EXYNOS_DP_SOC_GENERAL_CTL		0x800
+
+/* EXYNOS_DP_TX_SW_RESET */
+#define RESET_DP_TX				(0x1 << 0)
+
+/* EXYNOS_DP_FUNC_EN_1 */
+#define MASTER_VID_FUNC_EN_N			(0x1 << 7)
+#define SLAVE_VID_FUNC_EN_N			(0x1 << 5)
+#define AUD_FIFO_FUNC_EN_N			(0x1 << 4)
+#define AUD_FUNC_EN_N				(0x1 << 3)
+#define HDCP_FUNC_EN_N				(0x1 << 2)
+#define CRC_FUNC_EN_N				(0x1 << 1)
+#define SW_FUNC_EN_N				(0x1 << 0)
+
+/* EXYNOS_DP_FUNC_EN_2 */
+#define SSC_FUNC_EN_N				(0x1 << 7)
+#define AUX_FUNC_EN_N				(0x1 << 2)
+#define SERDES_FIFO_FUNC_EN_N			(0x1 << 1)
+#define LS_CLK_DOMAIN_FUNC_EN_N			(0x1 << 0)
+
+/* EXYNOS_DP_VIDEO_CTL_1 */
+#define VIDEO_EN				(0x1 << 7)
+#define HDCP_VIDEO_MUTE				(0x1 << 6)
+
+/* EXYNOS_DP_VIDEO_CTL_1 */
+#define IN_D_RANGE_MASK				(0x1 << 7)
+#define IN_D_RANGE_SHIFT			(7)
+#define IN_D_RANGE_CEA				(0x1 << 7)
+#define IN_D_RANGE_VESA				(0x0 << 7)
+#define IN_BPC_MASK				(0x7 << 4)
+#define IN_BPC_SHIFT				(4)
+#define IN_BPC_12_BITS				(0x3 << 4)
+#define IN_BPC_10_BITS				(0x2 << 4)
+#define IN_BPC_8_BITS				(0x1 << 4)
+#define IN_BPC_6_BITS				(0x0 << 4)
+#define IN_COLOR_F_MASK				(0x3 << 0)
+#define IN_COLOR_F_SHIFT			(0)
+#define IN_COLOR_F_YCBCR444			(0x2 << 0)
+#define IN_COLOR_F_YCBCR422			(0x1 << 0)
+#define IN_COLOR_F_RGB				(0x0 << 0)
+
+/* EXYNOS_DP_VIDEO_CTL_3 */
+#define IN_YC_COEFFI_MASK			(0x1 << 7)
+#define IN_YC_COEFFI_SHIFT			(7)
+#define IN_YC_COEFFI_ITU709			(0x1 << 7)
+#define IN_YC_COEFFI_ITU601			(0x0 << 7)
+#define VID_CHK_UPDATE_TYPE_MASK		(0x1 << 4)
+#define VID_CHK_UPDATE_TYPE_SHIFT		(4)
+#define VID_CHK_UPDATE_TYPE_1			(0x1 << 4)
+#define VID_CHK_UPDATE_TYPE_0			(0x0 << 4)
+
+/* EXYNOS_DP_VIDEO_CTL_8 */
+#define VID_HRES_TH(x)				(((x) & 0xf) << 4)
+#define VID_VRES_TH(x)				(((x) & 0xf) << 0)
+
+/* EXYNOS_DP_VIDEO_CTL_10 */
+#define FORMAT_SEL				(0x1 << 4)
+#define INTERACE_SCAN_CFG			(0x1 << 2)
+#define VSYNC_POLARITY_CFG			(0x1 << 1)
+#define HSYNC_POLARITY_CFG			(0x1 << 0)
+
+/* EXYNOS_DP_LANE_MAP */
+#define LANE3_MAP_LOGIC_LANE_0			(0x0 << 6)
+#define LANE3_MAP_LOGIC_LANE_1			(0x1 << 6)
+#define LANE3_MAP_LOGIC_LANE_2			(0x2 << 6)
+#define LANE3_MAP_LOGIC_LANE_3			(0x3 << 6)
+#define LANE2_MAP_LOGIC_LANE_0			(0x0 << 4)
+#define LANE2_MAP_LOGIC_LANE_1			(0x1 << 4)
+#define LANE2_MAP_LOGIC_LANE_2			(0x2 << 4)
+#define LANE2_MAP_LOGIC_LANE_3			(0x3 << 4)
+#define LANE1_MAP_LOGIC_LANE_0			(0x0 << 2)
+#define LANE1_MAP_LOGIC_LANE_1			(0x1 << 2)
+#define LANE1_MAP_LOGIC_LANE_2			(0x2 << 2)
+#define LANE1_MAP_LOGIC_LANE_3			(0x3 << 2)
+#define LANE0_MAP_LOGIC_LANE_0			(0x0 << 0)
+#define LANE0_MAP_LOGIC_LANE_1			(0x1 << 0)
+#define LANE0_MAP_LOGIC_LANE_2			(0x2 << 0)
+#define LANE0_MAP_LOGIC_LANE_3			(0x3 << 0)
+
+/* EXYNOS_DP_ANALOG_CTL_1 */
+#define TX_TERMINAL_CTRL_50_OHM			(0x1 << 4)
+
+/* EXYNOS_DP_ANALOG_CTL_2 */
+#define SEL_24M					(0x1 << 3)
+#define TX_DVDD_BIT_1_0625V			(0x4 << 0)
+
+/* EXYNOS_DP_ANALOG_CTL_3 */
+#define DRIVE_DVDD_BIT_1_0625V			(0x4 << 5)
+#define VCO_BIT_600_MICRO			(0x5 << 0)
+
+/* EXYNOS_DP_PLL_FILTER_CTL_1 */
+#define PD_RING_OSC				(0x1 << 6)
+#define AUX_TERMINAL_CTRL_50_OHM		(0x2 << 4)
+#define TX_CUR1_2X				(0x1 << 2)
+#define TX_CUR_16_MA				(0x3 << 0)
+
+/* EXYNOS_DP_TX_AMP_TUNING_CTL */
+#define CH3_AMP_400_MV				(0x0 << 24)
+#define CH2_AMP_400_MV				(0x0 << 16)
+#define CH1_AMP_400_MV				(0x0 << 8)
+#define CH0_AMP_400_MV				(0x0 << 0)
+
+/* EXYNOS_DP_AUX_HW_RETRY_CTL */
+#define AUX_BIT_PERIOD_EXPECTED_DELAY(x)	(((x) & 0x7) << 8)
+#define AUX_HW_RETRY_INTERVAL_MASK		(0x3 << 3)
+#define AUX_HW_RETRY_INTERVAL_600_MICROSECONDS	(0x0 << 3)
+#define AUX_HW_RETRY_INTERVAL_800_MICROSECONDS	(0x1 << 3)
+#define AUX_HW_RETRY_INTERVAL_1000_MICROSECONDS	(0x2 << 3)
+#define AUX_HW_RETRY_INTERVAL_1800_MICROSECONDS	(0x3 << 3)
+#define AUX_HW_RETRY_COUNT_SEL(x)		(((x) & 0x7) << 0)
+
+/* EXYNOS_DP_COMMON_INT_STA_1 */
+#define VSYNC_DET				(0x1 << 7)
+#define PLL_LOCK_CHG				(0x1 << 6)
+#define SPDIF_ERR				(0x1 << 5)
+#define SPDIF_UNSTBL				(0x1 << 4)
+#define VID_FORMAT_CHG				(0x1 << 3)
+#define AUD_CLK_CHG				(0x1 << 2)
+#define VID_CLK_CHG				(0x1 << 1)
+#define SW_INT					(0x1 << 0)
+
+/* EXYNOS_DP_COMMON_INT_STA_2 */
+#define ENC_EN_CHG				(0x1 << 6)
+#define HW_BKSV_RDY				(0x1 << 3)
+#define HW_SHA_DONE				(0x1 << 2)
+#define HW_AUTH_STATE_CHG			(0x1 << 1)
+#define HW_AUTH_DONE				(0x1 << 0)
+
+/* EXYNOS_DP_COMMON_INT_STA_3 */
+#define AFIFO_UNDER				(0x1 << 7)
+#define AFIFO_OVER				(0x1 << 6)
+#define R0_CHK_FLAG				(0x1 << 5)
+
+/* EXYNOS_DP_COMMON_INT_STA_4 */
+#define PSR_ACTIVE				(0x1 << 7)
+#define PSR_INACTIVE				(0x1 << 6)
+#define SPDIF_BI_PHASE_ERR			(0x1 << 5)
+#define HOTPLUG_CHG				(0x1 << 2)
+#define HPD_LOST				(0x1 << 1)
+#define PLUG					(0x1 << 0)
+
+/* EXYNOS_DP_INT_STA */
+#define INT_HPD					(0x1 << 6)
+#define HW_TRAINING_FINISH			(0x1 << 5)
+#define RPLY_RECEIV				(0x1 << 1)
+#define AUX_ERR					(0x1 << 0)
+
+/* EXYNOS_DP_INT_CTL */
+#define SOFT_INT_CTRL				(0x1 << 2)
+#define INT_POL1				(0x1 << 1)
+#define INT_POL0				(0x1 << 0)
+
+/* EXYNOS_DP_SYS_CTL_1 */
+#define DET_STA					(0x1 << 2)
+#define FORCE_DET				(0x1 << 1)
+#define DET_CTRL				(0x1 << 0)
+
+/* EXYNOS_DP_SYS_CTL_2 */
+#define CHA_CRI(x)				(((x) & 0xf) << 4)
+#define CHA_STA					(0x1 << 2)
+#define FORCE_CHA				(0x1 << 1)
+#define CHA_CTRL				(0x1 << 0)
+
+/* EXYNOS_DP_SYS_CTL_3 */
+#define HPD_STATUS				(0x1 << 6)
+#define F_HPD					(0x1 << 5)
+#define HPD_CTRL				(0x1 << 4)
+#define HDCP_RDY				(0x1 << 3)
+#define STRM_VALID				(0x1 << 2)
+#define F_VALID					(0x1 << 1)
+#define VALID_CTRL				(0x1 << 0)
+
+/* EXYNOS_DP_SYS_CTL_4 */
+#define FIX_M_AUD				(0x1 << 4)
+#define ENHANCED				(0x1 << 3)
+#define FIX_M_VID				(0x1 << 2)
+#define M_VID_UPDATE_CTRL			(0x3 << 0)
+
+/* EXYNOS_DP_TRAINING_PTN_SET */
+#define SCRAMBLER_TYPE				(0x1 << 9)
+#define HW_LINK_TRAINING_PATTERN		(0x1 << 8)
+#define SCRAMBLING_DISABLE			(0x1 << 5)
+#define SCRAMBLING_ENABLE			(0x0 << 5)
+#define LINK_QUAL_PATTERN_SET_MASK		(0x3 << 2)
+#define LINK_QUAL_PATTERN_SET_PRBS7		(0x3 << 2)
+#define LINK_QUAL_PATTERN_SET_D10_2		(0x1 << 2)
+#define LINK_QUAL_PATTERN_SET_DISABLE		(0x0 << 2)
+#define SW_TRAINING_PATTERN_SET_MASK		(0x3 << 0)
+#define SW_TRAINING_PATTERN_SET_PTN2		(0x2 << 0)
+#define SW_TRAINING_PATTERN_SET_PTN1		(0x1 << 0)
+#define SW_TRAINING_PATTERN_SET_NORMAL		(0x0 << 0)
+
+/* EXYNOS_DP_LN0_LINK_TRAINING_CTL */
+#define PRE_EMPHASIS_SET_MASK			(0x3 << 3)
+#define PRE_EMPHASIS_SET_SHIFT			(3)
+
+/* EXYNOS_DP_DEBUG_CTL */
+#define PLL_LOCK				(0x1 << 4)
+#define F_PLL_LOCK				(0x1 << 3)
+#define PLL_LOCK_CTRL				(0x1 << 2)
+#define PN_INV					(0x1 << 0)
+
+/* EXYNOS_DP_PLL_CTL */
+#define DP_PLL_PD				(0x1 << 7)
+#define DP_PLL_RESET				(0x1 << 6)
+#define DP_PLL_LOOP_BIT_DEFAULT			(0x1 << 4)
+#define DP_PLL_REF_BIT_1_1250V			(0x5 << 0)
+#define DP_PLL_REF_BIT_1_2500V			(0x7 << 0)
+
+/* EXYNOS_DP_PHY_PD */
+#define DP_PHY_PD				(0x1 << 5)
+#define AUX_PD					(0x1 << 4)
+#define CH3_PD					(0x1 << 3)
+#define CH2_PD					(0x1 << 2)
+#define CH1_PD					(0x1 << 1)
+#define CH0_PD					(0x1 << 0)
+
+/* EXYNOS_DP_PHY_TEST */
+#define MACRO_RST				(0x1 << 5)
+#define CH1_TEST				(0x1 << 1)
+#define CH0_TEST				(0x1 << 0)
+
+/* EXYNOS_DP_AUX_CH_STA */
+#define AUX_BUSY				(0x1 << 4)
+#define AUX_STATUS_MASK				(0xf << 0)
+
+/* EXYNOS_DP_AUX_CH_DEFER_CTL */
+#define DEFER_CTRL_EN				(0x1 << 7)
+#define DEFER_COUNT(x)				(((x) & 0x7f) << 0)
+
+/* EXYNOS_DP_AUX_RX_COMM */
+#define AUX_RX_COMM_I2C_DEFER			(0x2 << 2)
+#define AUX_RX_COMM_AUX_DEFER			(0x2 << 0)
+
+/* EXYNOS_DP_BUFFER_DATA_CTL */
+#define BUF_CLR					(0x1 << 7)
+#define BUF_DATA_COUNT(x)			(((x) & 0x1f) << 0)
+
+/* EXYNOS_DP_AUX_CH_CTL_1 */
+#define AUX_LENGTH(x)				(((x - 1) & 0xf) << 4)
+#define AUX_TX_COMM_MASK			(0xf << 0)
+#define AUX_TX_COMM_DP_TRANSACTION		(0x1 << 3)
+#define AUX_TX_COMM_I2C_TRANSACTION		(0x0 << 3)
+#define AUX_TX_COMM_MOT				(0x1 << 2)
+#define AUX_TX_COMM_WRITE			(0x0 << 0)
+#define AUX_TX_COMM_READ			(0x1 << 0)
+
+/* EXYNOS_DP_AUX_ADDR_7_0 */
+#define AUX_ADDR_7_0(x)				(((x) >> 0) & 0xff)
+
+/* EXYNOS_DP_AUX_ADDR_15_8 */
+#define AUX_ADDR_15_8(x)			(((x) >> 8) & 0xff)
+
+/* EXYNOS_DP_AUX_ADDR_19_16 */
+#define AUX_ADDR_19_16(x)			(((x) >> 16) & 0x0f)
+
+/* EXYNOS_DP_AUX_CH_CTL_2 */
+#define ADDR_ONLY				(0x1 << 1)
+#define AUX_EN					(0x1 << 0)
+
+/* EXYNOS_DP_SOC_GENERAL_CTL */
+#define AUDIO_MODE_SPDIF_MODE			(0x1 << 8)
+#define AUDIO_MODE_MASTER_MODE			(0x0 << 8)
+#define MASTER_VIDEO_INTERLACE_EN		(0x1 << 4)
+#define VIDEO_MASTER_CLK_SEL			(0x1 << 2)
+#define VIDEO_MASTER_MODE_EN			(0x1 << 1)
+#define VIDEO_MODE_MASK				(0x1 << 0)
+#define VIDEO_MODE_SLAVE_MODE			(0x1 << 0)
+#define VIDEO_MODE_MASTER_MODE			(0x0 << 0)
+
+#endif /* _ANALOGIX_DP_REG_H */
diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index f17d392..2fadd82 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -71,8 +71,9 @@ config DRM_EXYNOS_DSI
 	  This enables support for Exynos MIPI-DSI device.
 
 config DRM_EXYNOS_DP
-	bool "Display Port"
+	bool "EXYNOS specific extensions for Analogix DP driver"
 	depends on DRM_EXYNOS_FIMD || DRM_EXYNOS7_DECON
+	select DRM_ANALOGIX_DP
 	default DRM_EXYNOS
 	select DRM_PANEL
 	help
diff --git a/drivers/gpu/drm/exynos/Makefile b/drivers/gpu/drm/exynos/Makefile
index 968b31c..2bdd949 100644
--- a/drivers/gpu/drm/exynos/Makefile
+++ b/drivers/gpu/drm/exynos/Makefile
@@ -12,7 +12,7 @@ exynosdrm-$(CONFIG_DRM_EXYNOS5433_DECON)	+= exynos5433_drm_decon.o
 exynosdrm-$(CONFIG_DRM_EXYNOS7_DECON)	+= exynos7_drm_decon.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_DPI)	+= exynos_drm_dpi.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_DSI)	+= exynos_drm_dsi.o
-exynosdrm-$(CONFIG_DRM_EXYNOS_DP)	+= exynos_dp_core.o exynos_dp_reg.o
+exynosdrm-$(CONFIG_DRM_EXYNOS_DP)	+= exynos_dp_core.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_MIXER)	+= exynos_mixer.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_HDMI)	+= exynos_hdmi.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_VIDI)	+= exynos_drm_vidi.o
diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index cff8dc7..8456794 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -14,967 +14,76 @@
 #include <linux/platform_device.h>
 #include <linux/err.h>
 #include <linux/clk.h>
-#include <linux/io.h>
-#include <linux/interrupt.h>
-#include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/of_graph.h>
-#include <linux/gpio.h>
 #include <linux/component.h>
-#include <linux/phy/phy.h>
 #include <video/of_display_timing.h>
 #include <video/of_videomode.h>
+#include <video/videomode.h>
 
 #include <drm/drmP.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
-#include <drm/drm_atomic_helper.h>
 #include <drm/drm_panel.h>
 
-#include "exynos_dp_core.h"
+#include <drm/bridge/analogix_dp.h>
+#include <drm/exynos_drm.h>
+
 #include "exynos_drm_crtc.h"
 
-#define ctx_from_connector(c)	container_of(c, struct exynos_dp_device, \
-					connector)
+#define to_dp(nm)	container_of(nm, struct exynos_dp_device, nm)
 
-static inline struct exynos_drm_crtc *dp_to_crtc(struct exynos_dp_device *dp)
-{
-	return to_exynos_crtc(dp->encoder.crtc);
-}
+struct exynos_dp_device {
+	struct drm_encoder         encoder;
+	struct drm_connector       connector;
+	struct drm_bridge          *ptn_bridge;
+	struct drm_device          *drm_dev;
+	struct device              *dev;
 
-static inline struct exynos_dp_device *encoder_to_dp(
-						struct drm_encoder *e)
-{
-	return container_of(e, struct exynos_dp_device, encoder);
-}
-
-struct bridge_init {
-	struct i2c_client *client;
-	struct device_node *node;
+	struct videomode           vm;
+	struct analogix_dp_plat_data plat_data;
 };
 
-static void exynos_dp_init_dp(struct exynos_dp_device *dp)
-{
-	exynos_dp_reset(dp);
-
-	exynos_dp_swreset(dp);
-
-	exynos_dp_init_analog_param(dp);
-	exynos_dp_init_interrupt(dp);
-
-	/* SW defined function Normal operation */
-	exynos_dp_enable_sw_function(dp);
-
-	exynos_dp_config_interrupt(dp);
-	exynos_dp_init_analog_func(dp);
-
-	exynos_dp_init_hpd(dp);
-	exynos_dp_init_aux(dp);
-}
-
-static int exynos_dp_detect_hpd(struct exynos_dp_device *dp)
-{
-	int timeout_loop = 0;
-
-	while (exynos_dp_get_plug_in_status(dp) != 0) {
-		timeout_loop++;
-		if (DP_TIMEOUT_LOOP_COUNT < timeout_loop) {
-			dev_err(dp->dev, "failed to get hpd plug status\n");
-			return -ETIMEDOUT;
-		}
-		usleep_range(10, 11);
-	}
-
-	return 0;
-}
-
-static unsigned char exynos_dp_calc_edid_check_sum(unsigned char *edid_data)
-{
-	int i;
-	unsigned char sum = 0;
-
-	for (i = 0; i < EDID_BLOCK_LENGTH; i++)
-		sum = sum + edid_data[i];
-
-	return sum;
-}
-
-static int exynos_dp_read_edid(struct exynos_dp_device *dp)
-{
-	unsigned char edid[EDID_BLOCK_LENGTH * 2];
-	unsigned int extend_block = 0;
-	unsigned char sum;
-	unsigned char test_vector;
-	int retval;
-
-	/*
-	 * EDID device address is 0x50.
-	 * However, if necessary, you must have set upper address
-	 * into E-EDID in I2C device, 0x30.
-	 */
-
-	/* Read Extension Flag, Number of 128-byte EDID extension blocks */
-	retval = exynos_dp_read_byte_from_i2c(dp, I2C_EDID_DEVICE_ADDR,
-				EDID_EXTENSION_FLAG,
-				&extend_block);
-	if (retval)
-		return retval;
-
-	if (extend_block > 0) {
-		dev_dbg(dp->dev, "EDID data includes a single extension!\n");
-
-		/* Read EDID data */
-		retval = exynos_dp_read_bytes_from_i2c(dp, I2C_EDID_DEVICE_ADDR,
-						EDID_HEADER_PATTERN,
-						EDID_BLOCK_LENGTH,
-						&edid[EDID_HEADER_PATTERN]);
-		if (retval != 0) {
-			dev_err(dp->dev, "EDID Read failed!\n");
-			return -EIO;
-		}
-		sum = exynos_dp_calc_edid_check_sum(edid);
-		if (sum != 0) {
-			dev_err(dp->dev, "EDID bad checksum!\n");
-			return -EIO;
-		}
-
-		/* Read additional EDID data */
-		retval = exynos_dp_read_bytes_from_i2c(dp,
-				I2C_EDID_DEVICE_ADDR,
-				EDID_BLOCK_LENGTH,
-				EDID_BLOCK_LENGTH,
-				&edid[EDID_BLOCK_LENGTH]);
-		if (retval != 0) {
-			dev_err(dp->dev, "EDID Read failed!\n");
-			return -EIO;
-		}
-		sum = exynos_dp_calc_edid_check_sum(&edid[EDID_BLOCK_LENGTH]);
-		if (sum != 0) {
-			dev_err(dp->dev, "EDID bad checksum!\n");
-			return -EIO;
-		}
-
-		exynos_dp_read_byte_from_dpcd(dp, DP_TEST_REQUEST,
-					&test_vector);
-		if (test_vector & DP_TEST_LINK_EDID_READ) {
-			exynos_dp_write_byte_to_dpcd(dp,
-				DP_TEST_EDID_CHECKSUM,
-				edid[EDID_BLOCK_LENGTH + EDID_CHECKSUM]);
-			exynos_dp_write_byte_to_dpcd(dp,
-				DP_TEST_RESPONSE,
-				DP_TEST_EDID_CHECKSUM_WRITE);
-		}
-	} else {
-		dev_info(dp->dev, "EDID data does not include any extensions.\n");
-
-		/* Read EDID data */
-		retval = exynos_dp_read_bytes_from_i2c(dp,
-				I2C_EDID_DEVICE_ADDR,
-				EDID_HEADER_PATTERN,
-				EDID_BLOCK_LENGTH,
-				&edid[EDID_HEADER_PATTERN]);
-		if (retval != 0) {
-			dev_err(dp->dev, "EDID Read failed!\n");
-			return -EIO;
-		}
-		sum = exynos_dp_calc_edid_check_sum(edid);
-		if (sum != 0) {
-			dev_err(dp->dev, "EDID bad checksum!\n");
-			return -EIO;
-		}
-
-		exynos_dp_read_byte_from_dpcd(dp,
-			DP_TEST_REQUEST,
-			&test_vector);
-		if (test_vector & DP_TEST_LINK_EDID_READ) {
-			exynos_dp_write_byte_to_dpcd(dp,
-				DP_TEST_EDID_CHECKSUM,
-				edid[EDID_CHECKSUM]);
-			exynos_dp_write_byte_to_dpcd(dp,
-				DP_TEST_RESPONSE,
-				DP_TEST_EDID_CHECKSUM_WRITE);
-		}
-	}
-
-	dev_dbg(dp->dev, "EDID Read success!\n");
-	return 0;
-}
-
-static int exynos_dp_handle_edid(struct exynos_dp_device *dp)
-{
-	u8 buf[12];
-	int i;
-	int retval;
-
-	/* Read DPCD DP_DPCD_REV~RECEIVE_PORT1_CAP_1 */
-	retval = exynos_dp_read_bytes_from_dpcd(dp, DP_DPCD_REV,
-				12, buf);
-	if (retval)
-		return retval;
-
-	/* Read EDID */
-	for (i = 0; i < 3; i++) {
-		retval = exynos_dp_read_edid(dp);
-		if (!retval)
-			break;
-	}
-
-	return retval;
-}
-
-static void exynos_dp_enable_rx_to_enhanced_mode(struct exynos_dp_device *dp,
-						bool enable)
-{
-	u8 data;
-
-	exynos_dp_read_byte_from_dpcd(dp, DP_LANE_COUNT_SET, &data);
-
-	if (enable)
-		exynos_dp_write_byte_to_dpcd(dp, DP_LANE_COUNT_SET,
-			DP_LANE_COUNT_ENHANCED_FRAME_EN |
-			DPCD_LANE_COUNT_SET(data));
-	else
-		exynos_dp_write_byte_to_dpcd(dp, DP_LANE_COUNT_SET,
-			DPCD_LANE_COUNT_SET(data));
-}
-
-static int exynos_dp_is_enhanced_mode_available(struct exynos_dp_device *dp)
-{
-	u8 data;
-	int retval;
-
-	exynos_dp_read_byte_from_dpcd(dp, DP_MAX_LANE_COUNT, &data);
-	retval = DPCD_ENHANCED_FRAME_CAP(data);
-
-	return retval;
-}
-
-static void exynos_dp_set_enhanced_mode(struct exynos_dp_device *dp)
-{
-	u8 data;
-
-	data = exynos_dp_is_enhanced_mode_available(dp);
-	exynos_dp_enable_rx_to_enhanced_mode(dp, data);
-	exynos_dp_enable_enhanced_mode(dp, data);
-}
-
-static void exynos_dp_training_pattern_dis(struct exynos_dp_device *dp)
-{
-	exynos_dp_set_training_pattern(dp, DP_NONE);
-
-	exynos_dp_write_byte_to_dpcd(dp,
-		DP_TRAINING_PATTERN_SET,
-		DP_TRAINING_PATTERN_DISABLE);
-}
-
-static void exynos_dp_set_lane_lane_pre_emphasis(struct exynos_dp_device *dp,
-					int pre_emphasis, int lane)
-{
-	switch (lane) {
-	case 0:
-		exynos_dp_set_lane0_pre_emphasis(dp, pre_emphasis);
-		break;
-	case 1:
-		exynos_dp_set_lane1_pre_emphasis(dp, pre_emphasis);
-		break;
-
-	case 2:
-		exynos_dp_set_lane2_pre_emphasis(dp, pre_emphasis);
-		break;
-
-	case 3:
-		exynos_dp_set_lane3_pre_emphasis(dp, pre_emphasis);
-		break;
-	}
-}
-
-static int exynos_dp_link_start(struct exynos_dp_device *dp)
-{
-	u8 buf[4];
-	int lane, lane_count, pll_tries, retval;
-
-	lane_count = dp->link_train.lane_count;
-
-	dp->link_train.lt_state = CLOCK_RECOVERY;
-	dp->link_train.eq_loop = 0;
-
-	for (lane = 0; lane < lane_count; lane++)
-		dp->link_train.cr_loop[lane] = 0;
-
-	/* Set link rate and count as you want to establish*/
-	exynos_dp_set_link_bandwidth(dp, dp->link_train.link_rate);
-	exynos_dp_set_lane_count(dp, dp->link_train.lane_count);
-
-	/* Setup RX configuration */
-	buf[0] = dp->link_train.link_rate;
-	buf[1] = dp->link_train.lane_count;
-	retval = exynos_dp_write_bytes_to_dpcd(dp, DP_LINK_BW_SET,
-				2, buf);
-	if (retval)
-		return retval;
-
-	/* Set TX pre-emphasis to minimum */
-	for (lane = 0; lane < lane_count; lane++)
-		exynos_dp_set_lane_lane_pre_emphasis(dp,
-			PRE_EMPHASIS_LEVEL_0, lane);
-
-	/* Wait for PLL lock */
-	pll_tries = 0;
-	while (exynos_dp_get_pll_lock_status(dp) == PLL_UNLOCKED) {
-		if (pll_tries == DP_TIMEOUT_LOOP_COUNT) {
-			dev_err(dp->dev, "Wait for PLL lock timed out\n");
-			return -ETIMEDOUT;
-		}
-
-		pll_tries++;
-		usleep_range(90, 120);
-	}
-
-	/* Set training pattern 1 */
-	exynos_dp_set_training_pattern(dp, TRAINING_PTN1);
-
-	/* Set RX training pattern */
-	retval = exynos_dp_write_byte_to_dpcd(dp,
-			DP_TRAINING_PATTERN_SET,
-			DP_LINK_SCRAMBLING_DISABLE | DP_TRAINING_PATTERN_1);
-	if (retval)
-		return retval;
-
-	for (lane = 0; lane < lane_count; lane++)
-		buf[lane] = DP_TRAIN_PRE_EMPH_LEVEL_0 |
-			    DP_TRAIN_VOLTAGE_SWING_LEVEL_0;
-
-	retval = exynos_dp_write_bytes_to_dpcd(dp, DP_TRAINING_LANE0_SET,
-			lane_count, buf);
-
-	return retval;
-}
-
-static unsigned char exynos_dp_get_lane_status(u8 link_status[2], int lane)
-{
-	int shift = (lane & 1) * 4;
-	u8 link_value = link_status[lane>>1];
-
-	return (link_value >> shift) & 0xf;
-}
-
-static int exynos_dp_clock_recovery_ok(u8 link_status[2], int lane_count)
-{
-	int lane;
-	u8 lane_status;
-
-	for (lane = 0; lane < lane_count; lane++) {
-		lane_status = exynos_dp_get_lane_status(link_status, lane);
-		if ((lane_status & DP_LANE_CR_DONE) == 0)
-			return -EINVAL;
-	}
-	return 0;
-}
-
-static int exynos_dp_channel_eq_ok(u8 link_status[2], u8 link_align,
-				int lane_count)
+int exynos_dp_crtc_clock_enable(struct analogix_dp_plat_data *plat_data,
+				bool enable)
 {
-	int lane;
-	u8 lane_status;
+	struct exynos_dp_device *dp = to_dp(plat_data);
+	struct drm_encoder *encoder = &dp->encoder;
+	struct exynos_drm_crtc *crtc;
 
-	if ((link_align & DP_INTERLANE_ALIGN_DONE) == 0)
-		return -EINVAL;
+	if (!encoder)
+		return -1;
 
-	for (lane = 0; lane < lane_count; lane++) {
-		lane_status = exynos_dp_get_lane_status(link_status, lane);
-		lane_status &= DP_CHANNEL_EQ_BITS;
-		if (lane_status != DP_CHANNEL_EQ_BITS)
-			return -EINVAL;
-	}
+	crtc = to_exynos_crtc(encoder->crtc);
+	if (crtc && crtc->ops && crtc->ops->clock_enable)
+		crtc->ops->clock_enable(crtc, enable);
 
 	return 0;
 }
 
-static unsigned char exynos_dp_get_adjust_request_voltage(u8 adjust_request[2],
-							int lane)
-{
-	int shift = (lane & 1) * 4;
-	u8 link_value = adjust_request[lane>>1];
-
-	return (link_value >> shift) & 0x3;
-}
-
-static unsigned char exynos_dp_get_adjust_request_pre_emphasis(
-					u8 adjust_request[2],
-					int lane)
-{
-	int shift = (lane & 1) * 4;
-	u8 link_value = adjust_request[lane>>1];
-
-	return ((link_value >> shift) & 0xc) >> 2;
-}
-
-static void exynos_dp_set_lane_link_training(struct exynos_dp_device *dp,
-					u8 training_lane_set, int lane)
-{
-	switch (lane) {
-	case 0:
-		exynos_dp_set_lane0_link_training(dp, training_lane_set);
-		break;
-	case 1:
-		exynos_dp_set_lane1_link_training(dp, training_lane_set);
-		break;
-
-	case 2:
-		exynos_dp_set_lane2_link_training(dp, training_lane_set);
-		break;
-
-	case 3:
-		exynos_dp_set_lane3_link_training(dp, training_lane_set);
-		break;
-	}
-}
-
-static unsigned int exynos_dp_get_lane_link_training(
-				struct exynos_dp_device *dp,
-				int lane)
-{
-	u32 reg;
-
-	switch (lane) {
-	case 0:
-		reg = exynos_dp_get_lane0_link_training(dp);
-		break;
-	case 1:
-		reg = exynos_dp_get_lane1_link_training(dp);
-		break;
-	case 2:
-		reg = exynos_dp_get_lane2_link_training(dp);
-		break;
-	case 3:
-		reg = exynos_dp_get_lane3_link_training(dp);
-		break;
-	default:
-		WARN_ON(1);
-		return 0;
-	}
-
-	return reg;
-}
-
-static void exynos_dp_reduce_link_rate(struct exynos_dp_device *dp)
-{
-	exynos_dp_training_pattern_dis(dp);
-	exynos_dp_set_enhanced_mode(dp);
-
-	dp->link_train.lt_state = FAILED;
-}
-
-static void exynos_dp_get_adjust_training_lane(struct exynos_dp_device *dp,
-					u8 adjust_request[2])
-{
-	int lane, lane_count;
-	u8 voltage_swing, pre_emphasis, training_lane;
-
-	lane_count = dp->link_train.lane_count;
-	for (lane = 0; lane < lane_count; lane++) {
-		voltage_swing = exynos_dp_get_adjust_request_voltage(
-						adjust_request, lane);
-		pre_emphasis = exynos_dp_get_adjust_request_pre_emphasis(
-						adjust_request, lane);
-		training_lane = DPCD_VOLTAGE_SWING_SET(voltage_swing) |
-				DPCD_PRE_EMPHASIS_SET(pre_emphasis);
-
-		if (voltage_swing == VOLTAGE_LEVEL_3)
-			training_lane |= DP_TRAIN_MAX_SWING_REACHED;
-		if (pre_emphasis == PRE_EMPHASIS_LEVEL_3)
-			training_lane |= DP_TRAIN_MAX_PRE_EMPHASIS_REACHED;
-
-		dp->link_train.training_lane[lane] = training_lane;
-	}
-}
-
-static int exynos_dp_process_clock_recovery(struct exynos_dp_device *dp)
-{
-	int lane, lane_count, retval;
-	u8 voltage_swing, pre_emphasis, training_lane;
-	u8 link_status[2], adjust_request[2];
-
-	usleep_range(100, 101);
-
-	lane_count = dp->link_train.lane_count;
-
-	retval =  exynos_dp_read_bytes_from_dpcd(dp,
-			DP_LANE0_1_STATUS, 2, link_status);
-	if (retval)
-		return retval;
-
-	retval =  exynos_dp_read_bytes_from_dpcd(dp,
-			DP_ADJUST_REQUEST_LANE0_1, 2, adjust_request);
-	if (retval)
-		return retval;
-
-	if (exynos_dp_clock_recovery_ok(link_status, lane_count) == 0) {
-		/* set training pattern 2 for EQ */
-		exynos_dp_set_training_pattern(dp, TRAINING_PTN2);
-
-		retval = exynos_dp_write_byte_to_dpcd(dp,
-				DP_TRAINING_PATTERN_SET,
-				DP_LINK_SCRAMBLING_DISABLE |
-				DP_TRAINING_PATTERN_2);
-		if (retval)
-			return retval;
-
-		dev_info(dp->dev, "Link Training Clock Recovery success\n");
-		dp->link_train.lt_state = EQUALIZER_TRAINING;
-	} else {
-		for (lane = 0; lane < lane_count; lane++) {
-			training_lane = exynos_dp_get_lane_link_training(
-							dp, lane);
-			voltage_swing = exynos_dp_get_adjust_request_voltage(
-							adjust_request, lane);
-			pre_emphasis = exynos_dp_get_adjust_request_pre_emphasis(
-							adjust_request, lane);
-
-			if (DPCD_VOLTAGE_SWING_GET(training_lane) ==
-					voltage_swing &&
-			    DPCD_PRE_EMPHASIS_GET(training_lane) ==
-					pre_emphasis)
-				dp->link_train.cr_loop[lane]++;
-
-			if (dp->link_train.cr_loop[lane] == MAX_CR_LOOP ||
-			    voltage_swing == VOLTAGE_LEVEL_3 ||
-			    pre_emphasis == PRE_EMPHASIS_LEVEL_3) {
-				dev_err(dp->dev, "CR Max reached (%d,%d,%d)\n",
-					dp->link_train.cr_loop[lane],
-					voltage_swing, pre_emphasis);
-				exynos_dp_reduce_link_rate(dp);
-				return -EIO;
-			}
-		}
-	}
-
-	exynos_dp_get_adjust_training_lane(dp, adjust_request);
-
-	for (lane = 0; lane < lane_count; lane++)
-		exynos_dp_set_lane_link_training(dp,
-			dp->link_train.training_lane[lane], lane);
-
-	retval = exynos_dp_write_bytes_to_dpcd(dp,
-			DP_TRAINING_LANE0_SET, lane_count,
-			dp->link_train.training_lane);
-	if (retval)
-		return retval;
-
-	return retval;
-}
-
-static int exynos_dp_process_equalizer_training(struct exynos_dp_device *dp)
-{
-	int lane, lane_count, retval;
-	u32 reg;
-	u8 link_align, link_status[2], adjust_request[2];
-
-	usleep_range(400, 401);
-
-	lane_count = dp->link_train.lane_count;
-
-	retval = exynos_dp_read_bytes_from_dpcd(dp,
-			DP_LANE0_1_STATUS, 2, link_status);
-	if (retval)
-		return retval;
-
-	if (exynos_dp_clock_recovery_ok(link_status, lane_count)) {
-		exynos_dp_reduce_link_rate(dp);
-		return -EIO;
-	}
-
-	retval = exynos_dp_read_bytes_from_dpcd(dp,
-			DP_ADJUST_REQUEST_LANE0_1, 2, adjust_request);
-	if (retval)
-		return retval;
-
-	retval = exynos_dp_read_byte_from_dpcd(dp,
-			DP_LANE_ALIGN_STATUS_UPDATED, &link_align);
-	if (retval)
-		return retval;
-
-	exynos_dp_get_adjust_training_lane(dp, adjust_request);
-
-	if (!exynos_dp_channel_eq_ok(link_status, link_align, lane_count)) {
-		/* traing pattern Set to Normal */
-		exynos_dp_training_pattern_dis(dp);
-
-		dev_info(dp->dev, "Link Training success!\n");
-
-		exynos_dp_get_link_bandwidth(dp, &reg);
-		dp->link_train.link_rate = reg;
-		dev_dbg(dp->dev, "final bandwidth = %.2x\n",
-			dp->link_train.link_rate);
-
-		exynos_dp_get_lane_count(dp, &reg);
-		dp->link_train.lane_count = reg;
-		dev_dbg(dp->dev, "final lane count = %.2x\n",
-			dp->link_train.lane_count);
-
-		/* set enhanced mode if available */
-		exynos_dp_set_enhanced_mode(dp);
-		dp->link_train.lt_state = FINISHED;
-
-		return 0;
-	}
-
-	/* not all locked */
-	dp->link_train.eq_loop++;
-
-	if (dp->link_train.eq_loop > MAX_EQ_LOOP) {
-		dev_err(dp->dev, "EQ Max loop\n");
-		exynos_dp_reduce_link_rate(dp);
-		return -EIO;
-	}
-
-	for (lane = 0; lane < lane_count; lane++)
-		exynos_dp_set_lane_link_training(dp,
-			dp->link_train.training_lane[lane], lane);
-
-	retval = exynos_dp_write_bytes_to_dpcd(dp, DP_TRAINING_LANE0_SET,
-			lane_count, dp->link_train.training_lane);
-
-	return retval;
-}
-
-static void exynos_dp_get_max_rx_bandwidth(struct exynos_dp_device *dp,
-					u8 *bandwidth)
-{
-	u8 data;
-
-	/*
-	 * For DP rev.1.1, Maximum link rate of Main Link lanes
-	 * 0x06 = 1.62 Gbps, 0x0a = 2.7 Gbps
-	 */
-	exynos_dp_read_byte_from_dpcd(dp, DP_MAX_LINK_RATE, &data);
-	*bandwidth = data;
-}
-
-static void exynos_dp_get_max_rx_lane_count(struct exynos_dp_device *dp,
-					u8 *lane_count)
-{
-	u8 data;
-
-	/*
-	 * For DP rev.1.1, Maximum number of Main Link lanes
-	 * 0x01 = 1 lane, 0x02 = 2 lanes, 0x04 = 4 lanes
-	 */
-	exynos_dp_read_byte_from_dpcd(dp, DP_MAX_LANE_COUNT, &data);
-	*lane_count = DPCD_MAX_LANE_COUNT(data);
-}
-
-static void exynos_dp_init_training(struct exynos_dp_device *dp,
-			enum link_lane_count_type max_lane,
-			enum link_rate_type max_rate)
-{
-	/*
-	 * MACRO_RST must be applied after the PLL_LOCK to avoid
-	 * the DP inter pair skew issue for at least 10 us
-	 */
-	exynos_dp_reset_macro(dp);
-
-	/* Initialize by reading RX's DPCD */
-	exynos_dp_get_max_rx_bandwidth(dp, &dp->link_train.link_rate);
-	exynos_dp_get_max_rx_lane_count(dp, &dp->link_train.lane_count);
-
-	if ((dp->link_train.link_rate != LINK_RATE_1_62GBPS) &&
-	   (dp->link_train.link_rate != LINK_RATE_2_70GBPS)) {
-		dev_err(dp->dev, "Rx Max Link Rate is abnormal :%x !\n",
-			dp->link_train.link_rate);
-		dp->link_train.link_rate = LINK_RATE_1_62GBPS;
-	}
-
-	if (dp->link_train.lane_count == 0) {
-		dev_err(dp->dev, "Rx Max Lane count is abnormal :%x !\n",
-			dp->link_train.lane_count);
-		dp->link_train.lane_count = (u8)LANE_COUNT1;
-	}
-
-	/* Setup TX lane count & rate */
-	if (dp->link_train.lane_count > max_lane)
-		dp->link_train.lane_count = max_lane;
-	if (dp->link_train.link_rate > max_rate)
-		dp->link_train.link_rate = max_rate;
-
-	/* All DP analog module power up */
-	exynos_dp_set_analog_power_down(dp, POWER_ALL, 0);
-}
-
-static int exynos_dp_sw_link_training(struct exynos_dp_device *dp)
+static int exynos_dp_poweron(struct analogix_dp_plat_data *plat_data)
 {
-	int retval = 0, training_finished = 0;
-
-	dp->link_train.lt_state = START;
-
-	/* Process here */
-	while (!retval && !training_finished) {
-		switch (dp->link_train.lt_state) {
-		case START:
-			retval = exynos_dp_link_start(dp);
-			if (retval)
-				dev_err(dp->dev, "LT link start failed!\n");
-			break;
-		case CLOCK_RECOVERY:
-			retval = exynos_dp_process_clock_recovery(dp);
-			if (retval)
-				dev_err(dp->dev, "LT CR failed!\n");
-			break;
-		case EQUALIZER_TRAINING:
-			retval = exynos_dp_process_equalizer_training(dp);
-			if (retval)
-				dev_err(dp->dev, "LT EQ failed!\n");
-			break;
-		case FINISHED:
-			training_finished = 1;
-			break;
-		case FAILED:
-			return -EREMOTEIO;
-		}
-	}
-	if (retval)
-		dev_err(dp->dev, "eDP link training failed (%d)\n", retval);
-
-	return retval;
+	return exynos_dp_crtc_clock_enable(plat_data, true);
 }
 
-static int exynos_dp_set_link_train(struct exynos_dp_device *dp,
-				u32 count,
-				u32 bwtype)
+static int exynos_dp_poweroff(struct analogix_dp_plat_data *plat_data)
 {
-	int i;
-	int retval;
-
-	for (i = 0; i < DP_TIMEOUT_LOOP_COUNT; i++) {
-		exynos_dp_init_training(dp, count, bwtype);
-		retval = exynos_dp_sw_link_training(dp);
-		if (retval == 0)
-			break;
-
-		usleep_range(100, 110);
-	}
-
-	return retval;
+	return exynos_dp_crtc_clock_enable(plat_data, false);
 }
 
-static int exynos_dp_config_video(struct exynos_dp_device *dp)
+static int exynos_dp_get_modes(struct analogix_dp_plat_data *plat_data)
 {
-	int retval = 0;
-	int timeout_loop = 0;
-	int done_count = 0;
-
-	exynos_dp_config_video_slave_mode(dp);
-
-	exynos_dp_set_video_color_format(dp);
-
-	if (exynos_dp_get_pll_lock_status(dp) == PLL_UNLOCKED) {
-		dev_err(dp->dev, "PLL is not locked yet.\n");
-		return -EINVAL;
-	}
-
-	for (;;) {
-		timeout_loop++;
-		if (exynos_dp_is_slave_video_stream_clock_on(dp) == 0)
-			break;
-		if (DP_TIMEOUT_LOOP_COUNT < timeout_loop) {
-			dev_err(dp->dev, "Timeout of video streamclk ok\n");
-			return -ETIMEDOUT;
-		}
-
-		usleep_range(1, 2);
-	}
-
-	/* Set to use the register calculated M/N video */
-	exynos_dp_set_video_cr_mn(dp, CALCULATED_M, 0, 0);
-
-	/* For video bist, Video timing must be generated by register */
-	exynos_dp_set_video_timing_mode(dp, VIDEO_TIMING_FROM_CAPTURE);
-
-	/* Disable video mute */
-	exynos_dp_enable_video_mute(dp, 0);
-
-	/* Configure video slave mode */
-	exynos_dp_enable_video_master(dp, 0);
-
-	timeout_loop = 0;
-
-	for (;;) {
-		timeout_loop++;
-		if (exynos_dp_is_video_stream_on(dp) == 0) {
-			done_count++;
-			if (done_count > 10)
-				break;
-		} else if (done_count) {
-			done_count = 0;
-		}
-		if (DP_TIMEOUT_LOOP_COUNT < timeout_loop) {
-			dev_err(dp->dev, "Timeout of video streamclk ok\n");
-			return -ETIMEDOUT;
-		}
-
-		usleep_range(1000, 1001);
-	}
-
-	if (retval != 0)
-		dev_err(dp->dev, "Video stream is not detected!\n");
-
-	return retval;
-}
-
-static void exynos_dp_enable_scramble(struct exynos_dp_device *dp, bool enable)
-{
-	u8 data;
-
-	if (enable) {
-		exynos_dp_enable_scrambling(dp);
-
-		exynos_dp_read_byte_from_dpcd(dp,
-			DP_TRAINING_PATTERN_SET,
-			&data);
-		exynos_dp_write_byte_to_dpcd(dp,
-			DP_TRAINING_PATTERN_SET,
-			(u8)(data & ~DP_LINK_SCRAMBLING_DISABLE));
-	} else {
-		exynos_dp_disable_scrambling(dp);
-
-		exynos_dp_read_byte_from_dpcd(dp,
-			DP_TRAINING_PATTERN_SET,
-			&data);
-		exynos_dp_write_byte_to_dpcd(dp,
-			DP_TRAINING_PATTERN_SET,
-			(u8)(data | DP_LINK_SCRAMBLING_DISABLE));
-	}
-}
-
-static irqreturn_t exynos_dp_irq_handler(int irq, void *arg)
-{
-	struct exynos_dp_device *dp = arg;
-
-	enum dp_irq_type irq_type;
-
-	irq_type = exynos_dp_get_irq_type(dp);
-	switch (irq_type) {
-	case DP_IRQ_TYPE_HP_CABLE_IN:
-		dev_dbg(dp->dev, "Received irq - cable in\n");
-		schedule_work(&dp->hotplug_work);
-		exynos_dp_clear_hotplug_interrupts(dp);
-		break;
-	case DP_IRQ_TYPE_HP_CABLE_OUT:
-		dev_dbg(dp->dev, "Received irq - cable out\n");
-		exynos_dp_clear_hotplug_interrupts(dp);
-		break;
-	case DP_IRQ_TYPE_HP_CHANGE:
-		/*
-		 * We get these change notifications once in a while, but there
-		 * is nothing we can do with them. Just ignore it for now and
-		 * only handle cable changes.
-		 */
-		dev_dbg(dp->dev, "Received irq - hotplug change; ignoring.\n");
-		exynos_dp_clear_hotplug_interrupts(dp);
-		break;
-	default:
-		dev_err(dp->dev, "Received irq - unknown type!\n");
-		break;
-	}
-	return IRQ_HANDLED;
-}
-
-static void exynos_dp_hotplug(struct work_struct *work)
-{
-	struct exynos_dp_device *dp;
-
-	dp = container_of(work, struct exynos_dp_device, hotplug_work);
-
-	if (dp->drm_dev)
-		drm_helper_hpd_irq_event(dp->drm_dev);
-}
-
-static void exynos_dp_commit(struct drm_encoder *encoder)
-{
-	struct exynos_dp_device *dp = encoder_to_dp(encoder);
-	int ret;
-
-	/* Keep the panel disabled while we configure video */
-	if (dp->panel) {
-		if (drm_panel_disable(dp->panel))
-			DRM_ERROR("failed to disable the panel\n");
-	}
-
-	ret = exynos_dp_detect_hpd(dp);
-	if (ret) {
-		/* Cable has been disconnected, we're done */
-		return;
-	}
-
-	ret = exynos_dp_handle_edid(dp);
-	if (ret) {
-		dev_err(dp->dev, "unable to handle edid\n");
-		return;
-	}
-
-	ret = exynos_dp_set_link_train(dp, dp->video_info->lane_count,
-					dp->video_info->link_rate);
-	if (ret) {
-		dev_err(dp->dev, "unable to do link train\n");
-		return;
-	}
-
-	exynos_dp_enable_scramble(dp, 1);
-	exynos_dp_enable_rx_to_enhanced_mode(dp, 1);
-	exynos_dp_enable_enhanced_mode(dp, 1);
-
-	exynos_dp_set_lane_count(dp, dp->video_info->lane_count);
-	exynos_dp_set_link_bandwidth(dp, dp->video_info->link_rate);
-
-	exynos_dp_init_video(dp);
-	ret = exynos_dp_config_video(dp);
-	if (ret)
-		dev_err(dp->dev, "unable to config video\n");
-
-	/* Safe to enable the panel now */
-	if (dp->panel) {
-		if (drm_panel_enable(dp->panel))
-			DRM_ERROR("failed to enable the panel\n");
-	}
-
-	/* Enable video */
-	exynos_dp_start_video(dp);
-}
-
-static enum drm_connector_status exynos_dp_detect(
-				struct drm_connector *connector, bool force)
-{
-	return connector_status_connected;
-}
-
-static void exynos_dp_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_unregister(connector);
-	drm_connector_cleanup(connector);
-}
-
-static const struct drm_connector_funcs exynos_dp_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.detect = exynos_dp_detect,
-	.destroy = exynos_dp_connector_destroy,
-	.reset = drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
-static int exynos_dp_get_modes(struct drm_connector *connector)
-{
-	struct exynos_dp_device *dp = ctx_from_connector(connector);
+	struct exynos_dp_device *dp = to_dp(plat_data);
+	struct drm_connector *connector = &dp->connector;
 	struct drm_display_mode *mode;
+	int num_modes = 0;
 
-	if (dp->panel)
-		return drm_panel_get_modes(dp->panel);
+	if (dp->plat_data.panel)
+		return num_modes;
 
 	mode = drm_mode_create(connector->dev);
 	if (!mode) {
 		DRM_ERROR("failed to create a new display mode.\n");
-		return 0;
+		return num_modes;
 	}
 
 	drm_display_mode_from_videomode(&dp->vm, mode);
@@ -985,171 +94,31 @@ static int exynos_dp_get_modes(struct drm_connector *connector)
 	drm_mode_set_name(mode);
 	drm_mode_probed_add(connector, mode);
 
-	return 1;
-}
-
-static struct drm_encoder *exynos_dp_best_encoder(
-			struct drm_connector *connector)
-{
-	struct exynos_dp_device *dp = ctx_from_connector(connector);
-
-	return &dp->encoder;
-}
-
-static const struct drm_connector_helper_funcs exynos_dp_connector_helper_funcs = {
-	.get_modes = exynos_dp_get_modes,
-	.best_encoder = exynos_dp_best_encoder,
-};
-
-/* returns the number of bridges attached */
-static int exynos_drm_attach_lcd_bridge(struct exynos_dp_device *dp,
-		struct drm_encoder *encoder)
-{
-	int ret;
-
-	encoder->bridge->next = dp->ptn_bridge;
-	dp->ptn_bridge->encoder = encoder;
-	ret = drm_bridge_attach(encoder->dev, dp->ptn_bridge);
-	if (ret) {
-		DRM_ERROR("Failed to attach bridge to drm\n");
-		return ret;
-	}
-
-	return 0;
+	return num_modes + 1;
 }
 
-static int exynos_dp_bridge_attach(struct drm_bridge *bridge)
+static int exynos_dp_bridge_attach(struct analogix_dp_plat_data *plat_data,
+				   struct drm_bridge *bridge,
+				   struct drm_connector *connector)
 {
-	struct exynos_dp_device *dp = bridge->driver_private;
+	struct exynos_dp_device *dp = to_dp(plat_data);
 	struct drm_encoder *encoder = &dp->encoder;
-	struct drm_connector *connector = &dp->connector;
 	int ret;
 
-	/* Pre-empt DP connector creation if there's a bridge */
-	if (dp->ptn_bridge) {
-		ret = exynos_drm_attach_lcd_bridge(dp, encoder);
-		if (!ret)
-			return 0;
-	}
-
-	connector->polled = DRM_CONNECTOR_POLL_HPD;
-
-	ret = drm_connector_init(dp->drm_dev, connector,
-			&exynos_dp_connector_funcs, DRM_MODE_CONNECTOR_eDP);
-	if (ret) {
-		DRM_ERROR("Failed to initialize connector with drm\n");
-		return ret;
-	}
-
-	drm_connector_helper_add(connector, &exynos_dp_connector_helper_funcs);
 	drm_connector_register(connector);
-	drm_mode_connector_attach_encoder(connector, encoder);
-
-	if (dp->panel)
-		ret = drm_panel_attach(dp->panel, &dp->connector);
-
-	return ret;
-}
-
-static void exynos_dp_bridge_enable(struct drm_bridge *bridge)
-{
-	struct exynos_dp_device *dp = bridge->driver_private;
-	struct exynos_drm_crtc *crtc = dp_to_crtc(dp);
-
-	if (dp->dpms_mode == DRM_MODE_DPMS_ON)
-		return;
-
-	pm_runtime_get_sync(dp->dev);
-
-	if (dp->panel) {
-		if (drm_panel_prepare(dp->panel)) {
-			DRM_ERROR("failed to setup the panel\n");
-			return;
-		}
-	}
-
-	if (crtc->ops->clock_enable)
-		crtc->ops->clock_enable(dp_to_crtc(dp), true);
-
-	phy_power_on(dp->phy);
-	exynos_dp_init_dp(dp);
-	enable_irq(dp->irq);
-	exynos_dp_commit(&dp->encoder);
 
-	dp->dpms_mode = DRM_MODE_DPMS_ON;
-}
-
-static void exynos_dp_bridge_disable(struct drm_bridge *bridge)
-{
-	struct exynos_dp_device *dp = bridge->driver_private;
-	struct exynos_drm_crtc *crtc = dp_to_crtc(dp);
-
-	if (dp->dpms_mode != DRM_MODE_DPMS_ON)
-		return;
-
-	if (dp->panel) {
-		if (drm_panel_disable(dp->panel)) {
-			DRM_ERROR("failed to disable the panel\n");
-			return;
+	/* Pre-empt DP connector creation if there's a bridge */
+	if (dp->ptn_bridge) {
+		bridge->next = dp->ptn_bridge;
+		dp->ptn_bridge->encoder = encoder;
+		ret = drm_bridge_attach(encoder->dev, dp->ptn_bridge);
+		if (ret) {
+			DRM_ERROR("Failed to attach bridge to drm\n");
+			bridge->next = NULL;
+			return ret;
 		}
 	}
 
-	disable_irq(dp->irq);
-	flush_work(&dp->hotplug_work);
-	phy_power_off(dp->phy);
-
-	if (crtc->ops->clock_enable)
-		crtc->ops->clock_enable(dp_to_crtc(dp), false);
-
-	if (dp->panel) {
-		if (drm_panel_unprepare(dp->panel))
-			DRM_ERROR("failed to turnoff the panel\n");
-	}
-
-	pm_runtime_put_sync(dp->dev);
-
-	dp->dpms_mode = DRM_MODE_DPMS_OFF;
-}
-
-static void exynos_dp_bridge_nop(struct drm_bridge *bridge)
-{
-	/* do nothing */
-}
-
-static const struct drm_bridge_funcs exynos_dp_bridge_funcs = {
-	.enable = exynos_dp_bridge_enable,
-	.disable = exynos_dp_bridge_disable,
-	.pre_enable = exynos_dp_bridge_nop,
-	.post_disable = exynos_dp_bridge_nop,
-	.attach = exynos_dp_bridge_attach,
-};
-
-static int exynos_dp_create_connector(struct drm_encoder *encoder)
-{
-	struct exynos_dp_device *dp = encoder_to_dp(encoder);
-	struct drm_device *drm_dev = dp->drm_dev;
-	struct drm_bridge *bridge;
-	int ret;
-
-	bridge = devm_kzalloc(drm_dev->dev, sizeof(*bridge), GFP_KERNEL);
-	if (!bridge) {
-		DRM_ERROR("failed to allocate for drm bridge\n");
-		return -ENOMEM;
-	}
-
-	dp->bridge = bridge;
-
-	encoder->bridge = bridge;
-	bridge->driver_private = dp;
-	bridge->encoder = encoder;
-	bridge->funcs = &exynos_dp_bridge_funcs;
-
-	ret = drm_bridge_attach(drm_dev, bridge);
-	if (ret) {
-		DRM_ERROR("failed to attach drm bridge\n");
-		return -EINVAL;
-	}
-
 	return 0;
 }
 
@@ -1159,82 +128,21 @@ static void exynos_dp_mode_set(struct drm_encoder *encoder,
 {
 }
 
-static void exynos_dp_enable(struct drm_encoder *encoder)
-{
-}
-
-static void exynos_dp_disable(struct drm_encoder *encoder)
+static void exynos_dp_nop(struct drm_encoder *encoder)
 {
+	/* do nothing */
 }
 
 static const struct drm_encoder_helper_funcs exynos_dp_encoder_helper_funcs = {
 	.mode_set = exynos_dp_mode_set,
-	.enable = exynos_dp_enable,
-	.disable = exynos_dp_disable,
+	.enable = exynos_dp_nop,
+	.disable = exynos_dp_nop,
 };
 
 static const struct drm_encoder_funcs exynos_dp_encoder_funcs = {
 	.destroy = drm_encoder_cleanup,
 };
 
-static struct video_info *exynos_dp_dt_parse_pdata(struct device *dev)
-{
-	struct device_node *dp_node = dev->of_node;
-	struct video_info *dp_video_config;
-
-	dp_video_config = devm_kzalloc(dev,
-				sizeof(*dp_video_config), GFP_KERNEL);
-	if (!dp_video_config)
-		return ERR_PTR(-ENOMEM);
-
-	dp_video_config->h_sync_polarity =
-		of_property_read_bool(dp_node, "hsync-active-high");
-
-	dp_video_config->v_sync_polarity =
-		of_property_read_bool(dp_node, "vsync-active-high");
-
-	dp_video_config->interlaced =
-		of_property_read_bool(dp_node, "interlaced");
-
-	if (of_property_read_u32(dp_node, "samsung,color-space",
-				&dp_video_config->color_space)) {
-		dev_err(dev, "failed to get color-space\n");
-		return ERR_PTR(-EINVAL);
-	}
-
-	if (of_property_read_u32(dp_node, "samsung,dynamic-range",
-				&dp_video_config->dynamic_range)) {
-		dev_err(dev, "failed to get dynamic-range\n");
-		return ERR_PTR(-EINVAL);
-	}
-
-	if (of_property_read_u32(dp_node, "samsung,ycbcr-coeff",
-				&dp_video_config->ycbcr_coeff)) {
-		dev_err(dev, "failed to get ycbcr-coeff\n");
-		return ERR_PTR(-EINVAL);
-	}
-
-	if (of_property_read_u32(dp_node, "samsung,color-depth",
-				&dp_video_config->color_depth)) {
-		dev_err(dev, "failed to get color-depth\n");
-		return ERR_PTR(-EINVAL);
-	}
-
-	if (of_property_read_u32(dp_node, "samsung,link-rate",
-				&dp_video_config->link_rate)) {
-		dev_err(dev, "failed to get link-rate\n");
-		return ERR_PTR(-EINVAL);
-	}
-
-	if (of_property_read_u32(dp_node, "samsung,lane-count",
-				&dp_video_config->lane_count)) {
-		dev_err(dev, "failed to get lane-count\n");
-		return ERR_PTR(-EINVAL);
-	}
-
-	return dp_video_config;
-}
-
 static int exynos_dp_dt_parse_panel(struct exynos_dp_device *dp)
 {
 	int ret;
@@ -1250,97 +158,32 @@ static int exynos_dp_dt_parse_panel(struct exynos_dp_device *dp)
 static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 {
 	struct exynos_dp_device *dp = dev_get_drvdata(dev);
-	struct platform_device *pdev = to_platform_device(dev);
-	struct drm_device *drm_dev = data;
 	struct drm_encoder *encoder = &dp->encoder;
-	struct resource *res;
-	unsigned int irq_flags;
-	int pipe, ret = 0;
+	struct drm_device *drm_dev = data;
+	int pipe, ret;
 
-	dp->dev = &pdev->dev;
-	dp->dpms_mode = DRM_MODE_DPMS_OFF;
+	/*
+	 * Just like the probe function said, we don't need the
+	 * device drvrate anymore, we should leave the charge to
+	 * analogix dp driver, set the device drvdata to NULL.
+	 */
+	dev_set_drvdata(dev, NULL);
 
-	dp->video_info = exynos_dp_dt_parse_pdata(&pdev->dev);
-	if (IS_ERR(dp->video_info))
-		return PTR_ERR(dp->video_info);
+	dp->dev = dev;
+	dp->drm_dev = drm_dev;
 
-	dp->phy = devm_phy_get(dp->dev, "dp");
-	if (IS_ERR(dp->phy)) {
-		dev_err(dp->dev, "no DP phy configured\n");
-		ret = PTR_ERR(dp->phy);
-		if (ret) {
-			/*
-			 * phy itself is not enabled, so we can move forward
-			 * assigning NULL to phy pointer.
-			 */
-			if (ret == -ENOSYS || ret == -ENODEV)
-				dp->phy = NULL;
-			else
-				return ret;
-		}
-	}
+	dp->plat_data.dev_type = EXYNOS_DP;
+	dp->plat_data.power_on = exynos_dp_poweron;
+	dp->plat_data.power_off = exynos_dp_poweroff;
+	dp->plat_data.attach = exynos_dp_bridge_attach;
+	dp->plat_data.get_modes = exynos_dp_get_modes;
 
-	if (!dp->panel && !dp->ptn_bridge) {
+	if (!dp->plat_data.panel && !dp->ptn_bridge) {
 		ret = exynos_dp_dt_parse_panel(dp);
 		if (ret)
 			return ret;
 	}
 
-	dp->clock = devm_clk_get(&pdev->dev, "dp");
-	if (IS_ERR(dp->clock)) {
-		dev_err(&pdev->dev, "failed to get clock\n");
-		return PTR_ERR(dp->clock);
-	}
-
-	clk_prepare_enable(dp->clock);
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	dp->reg_base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(dp->reg_base))
-		return PTR_ERR(dp->reg_base);
-
-	dp->hpd_gpio = of_get_named_gpio(dev->of_node, "samsung,hpd-gpio", 0);
-
-	if (gpio_is_valid(dp->hpd_gpio)) {
-		/*
-		 * Set up the hotplug GPIO from the device tree as an interrupt.
-		 * Simply specifying a different interrupt in the device tree
-		 * doesn't work since we handle hotplug rather differently when
-		 * using a GPIO.  We also need the actual GPIO specifier so
-		 * that we can get the current state of the GPIO.
-		 */
-		ret = devm_gpio_request_one(&pdev->dev, dp->hpd_gpio, GPIOF_IN,
-					    "hpd_gpio");
-		if (ret) {
-			dev_err(&pdev->dev, "failed to get hpd gpio\n");
-			return ret;
-		}
-		dp->irq = gpio_to_irq(dp->hpd_gpio);
-		irq_flags = IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING;
-	} else {
-		dp->hpd_gpio = -ENODEV;
-		dp->irq = platform_get_irq(pdev, 0);
-		irq_flags = 0;
-	}
-
-	if (dp->irq == -ENXIO) {
-		dev_err(&pdev->dev, "failed to get irq\n");
-		return -ENODEV;
-	}
-
-	INIT_WORK(&dp->hotplug_work, exynos_dp_hotplug);
-
-	ret = devm_request_irq(&pdev->dev, dp->irq, exynos_dp_irq_handler,
-			irq_flags, "exynos-dp", dp);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to request irq\n");
-		return ret;
-	}
-	disable_irq(dp->irq);
-
-	dp->drm_dev = drm_dev;
-
 	pipe = exynos_drm_crtc_get_pipe_from_type(drm_dev,
 						  EXYNOS_DISPLAY_TYPE_LCD);
 	if (pipe < 0)
@@ -1355,22 +198,15 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 
 	drm_encoder_helper_add(encoder, &exynos_dp_encoder_helper_funcs);
 
-	ret = exynos_dp_create_connector(encoder);
-	if (ret) {
-		DRM_ERROR("failed to create connector ret = %d\n", ret);
-		drm_encoder_cleanup(encoder);
-		return ret;
-	}
+	dp->plat_data.encoder = encoder;
 
-	return 0;
+	return analogix_dp_bind(dev, dp->drm_dev, &dp->plat_data);
 }
 
 static void exynos_dp_unbind(struct device *dev, struct device *master,
 				void *data)
 {
-	struct exynos_dp_device *dp = dev_get_drvdata(dev);
-
-	exynos_dp_disable(&dp->encoder);
+	return analogix_dp_unbind(dev, master, data);
 }
 
 static const struct component_ops exynos_dp_ops = {
@@ -1383,21 +219,25 @@ static int exynos_dp_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = NULL, *endpoint = NULL;
 	struct exynos_dp_device *dp;
-	int ret;
 
 	dp = devm_kzalloc(&pdev->dev, sizeof(struct exynos_dp_device),
 				GFP_KERNEL);
 	if (!dp)
 		return -ENOMEM;
 
+	/*
+	 * We just use the drvdata until driver run into component
+	 * add function, and then we would set drvdata to null, so
+	 * that analogix dp driver would take charge of the drvdata.
+	 */
 	platform_set_drvdata(pdev, dp);
 
 	/* This is for the backward compatibility. */
 	np = of_parse_phandle(dev->of_node, "panel", 0);
 	if (np) {
-		dp->panel = of_drm_find_panel(np);
+		dp->plat_data.panel = of_drm_find_panel(np);
 		of_node_put(np);
-		if (!dp->panel)
+		if (!dp->plat_data.panel)
 			return -EPROBE_DEFER;
 		goto out;
 	}
@@ -1407,8 +247,8 @@ static int exynos_dp_probe(struct platform_device *pdev)
 		np = of_graph_get_remote_port_parent(endpoint);
 		if (np) {
 			/* The remote port can be either a panel or a bridge */
-			dp->panel = of_drm_find_panel(np);
-			if (!dp->panel) {
+			dp->plat_data.panel = of_drm_find_panel(np);
+			if (!dp->plat_data.panel) {
 				dp->ptn_bridge = of_drm_find_bridge(np);
 				if (!dp->ptn_bridge) {
 					of_node_put(np);
@@ -1426,23 +266,11 @@ static int exynos_dp_probe(struct platform_device *pdev)
 	}
 
 out:
-	pm_runtime_enable(dev);
-
-	ret = component_add(&pdev->dev, &exynos_dp_ops);
-	if (ret)
-		goto err_disable_pm_runtime;
-
-	return ret;
-
-err_disable_pm_runtime:
-	pm_runtime_disable(dev);
-
-	return ret;
+	return component_add(&pdev->dev, &exynos_dp_ops);
 }
 
 static int exynos_dp_remove(struct platform_device *pdev)
 {
-	pm_runtime_disable(&pdev->dev);
 	component_del(&pdev->dev, &exynos_dp_ops);
 
 	return 0;
@@ -1451,25 +279,12 @@ static int exynos_dp_remove(struct platform_device *pdev)
 #ifdef CONFIG_PM
 static int exynos_dp_suspend(struct device *dev)
 {
-	struct exynos_dp_device *dp = dev_get_drvdata(dev);
-
-	clk_disable_unprepare(dp->clock);
-
-	return 0;
+	return analogix_dp_suspend(dev);
 }
 
 static int exynos_dp_resume(struct device *dev)
 {
-	struct exynos_dp_device *dp = dev_get_drvdata(dev);
-	int ret;
-
-	ret = clk_prepare_enable(dp->clock);
-	if (ret < 0) {
-		DRM_ERROR("Failed to prepare_enable the clock clk [%d]\n", ret);
-		return ret;
-	}
-
-	return 0;
+	return analogix_dp_resume(dev);
 }
 #endif
 
@@ -1495,5 +310,5 @@ struct platform_driver dp_driver = {
 };
 
 MODULE_AUTHOR("Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>");
-MODULE_DESCRIPTION("Samsung SoC DP Driver");
+MODULE_DESCRIPTION("Samsung Specific Analogix-DP Driver Extension");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.h b/drivers/gpu/drm/exynos/exynos_dp_core.h
deleted file mode 100644
index b5c2d8f..0000000
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
-#include <video/videomode.h>
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
-	struct drm_encoder	encoder;
-	struct device		*dev;
-	struct drm_device	*drm_dev;
-	struct drm_connector	connector;
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
-	struct videomode	vm;
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
-				enum analog_power_block block,
-				bool enable);
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
-				unsigned int reg_addr,
-				unsigned char data);
-int exynos_dp_read_byte_from_dpcd(struct exynos_dp_device *dp,
-				unsigned int reg_addr,
-				unsigned char *data);
-int exynos_dp_write_bytes_to_dpcd(struct exynos_dp_device *dp,
-				unsigned int reg_addr,
-				unsigned int count,
-				unsigned char data[]);
-int exynos_dp_read_bytes_from_dpcd(struct exynos_dp_device *dp,
-				unsigned int reg_addr,
-				unsigned int count,
-				unsigned char data[]);
-int exynos_dp_select_i2c_device(struct exynos_dp_device *dp,
-				unsigned int device_addr,
-				unsigned int reg_addr);
-int exynos_dp_read_byte_from_i2c(struct exynos_dp_device *dp,
-				unsigned int device_addr,
-				unsigned int reg_addr,
-				unsigned int *data);
-int exynos_dp_read_bytes_from_i2c(struct exynos_dp_device *dp,
-				unsigned int device_addr,
-				unsigned int reg_addr,
-				unsigned int count,
-				unsigned char edid[]);
-void exynos_dp_set_link_bandwidth(struct exynos_dp_device *dp, u32 bwtype);
-void exynos_dp_get_link_bandwidth(struct exynos_dp_device *dp, u32 *bwtype);
-void exynos_dp_set_lane_count(struct exynos_dp_device *dp, u32 count);
-void exynos_dp_get_lane_count(struct exynos_dp_device *dp, u32 *count);
-void exynos_dp_enable_enhanced_mode(struct exynos_dp_device *dp, bool enable);
-void exynos_dp_set_training_pattern(struct exynos_dp_device *dp,
-				 enum pattern_set pattern);
-void exynos_dp_set_lane0_pre_emphasis(struct exynos_dp_device *dp, u32 level);
-void exynos_dp_set_lane1_pre_emphasis(struct exynos_dp_device *dp, u32 level);
-void exynos_dp_set_lane2_pre_emphasis(struct exynos_dp_device *dp, u32 level);
-void exynos_dp_set_lane3_pre_emphasis(struct exynos_dp_device *dp, u32 level);
-void exynos_dp_set_lane0_link_training(struct exynos_dp_device *dp,
-				u32 training_lane);
-void exynos_dp_set_lane1_link_training(struct exynos_dp_device *dp,
-				u32 training_lane);
-void exynos_dp_set_lane2_link_training(struct exynos_dp_device *dp,
-				u32 training_lane);
-void exynos_dp_set_lane3_link_training(struct exynos_dp_device *dp,
-				u32 training_lane);
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
-			enum clock_recovery_m_value_type type,
-			u32 m_value,
-			u32 n_value);
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
index c1f87a2..0000000
--- a/drivers/gpu/drm/exynos/exynos_dp_reg.c
+++ /dev/null
@@ -1,1263 +0,0 @@
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
-				enum analog_power_block block,
-				bool enable)
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
-	reg = AUX_BIT_PERIOD_EXPECTED_DELAY(3) | AUX_HW_RETRY_COUNT_SEL(0)|
-		AUX_HW_RETRY_INTERVAL_600_MICROSECONDS;
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
-				unsigned int reg_addr,
-				unsigned char data)
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
-		else
-			dev_dbg(dp->dev, "%s: Aux Transaction fail!\n",
-				__func__);
-	}
-
-	return retval;
-}
-
-int exynos_dp_read_byte_from_dpcd(struct exynos_dp_device *dp,
-				unsigned int reg_addr,
-				unsigned char *data)
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
-		else
-			dev_dbg(dp->dev, "%s: Aux Transaction fail!\n",
-				__func__);
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
-				unsigned int reg_addr,
-				unsigned int count,
-				unsigned char data[])
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
-			else
-				dev_dbg(dp->dev, "%s: Aux Transaction fail!\n",
-					__func__);
-		}
-
-		start_offset += cur_data_count;
-	}
-
-	return retval;
-}
-
-int exynos_dp_read_bytes_from_dpcd(struct exynos_dp_device *dp,
-				unsigned int reg_addr,
-				unsigned int count,
-				unsigned char data[])
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
-			else
-				dev_dbg(dp->dev, "%s: Aux Transaction fail!\n",
-					__func__);
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
-				unsigned int device_addr,
-				unsigned int reg_addr,
-				unsigned int *data)
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
-		else
-			dev_dbg(dp->dev, "%s: Aux Transaction fail!\n",
-				__func__);
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
-				unsigned int device_addr,
-				unsigned int reg_addr,
-				unsigned int count,
-				unsigned char edid[])
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
-				retval = exynos_dp_select_i2c_device(dp,
-						device_addr, reg_addr + i);
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
-				else
-					dev_dbg(dp->dev,
-						"%s: Aux Transaction fail!\n",
-						__func__);
-			}
-			/* Check if Rx sends defer */
-			reg = readl(dp->reg_base + EXYNOS_DP_AUX_RX_COMM);
-			if (reg == AUX_RX_COMM_AUX_DEFER ||
-				reg == AUX_RX_COMM_I2C_DEFER) {
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
-				 enum pattern_set pattern)
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
-					u32 training_lane)
-{
-	u32 reg;
-
-	reg = training_lane;
-	writel(reg, dp->reg_base + EXYNOS_DP_LN0_LINK_TRAINING_CTL);
-}
-
-void exynos_dp_set_lane1_link_training(struct exynos_dp_device *dp,
-					u32 training_lane)
-{
-	u32 reg;
-
-	reg = training_lane;
-	writel(reg, dp->reg_base + EXYNOS_DP_LN1_LINK_TRAINING_CTL);
-}
-
-void exynos_dp_set_lane2_link_training(struct exynos_dp_device *dp,
-					u32 training_lane)
-{
-	u32 reg;
-
-	reg = training_lane;
-	writel(reg, dp->reg_base + EXYNOS_DP_LN2_LINK_TRAINING_CTL);
-}
-
-void exynos_dp_set_lane3_link_training(struct exynos_dp_device *dp,
-					u32 training_lane)
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
-		enum clock_recovery_m_value_type type,
-		u32 m_value,
-		u32 n_value)
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
-	reg &= ~(MASTER_VID_FUNC_EN_N|SLAVE_VID_FUNC_EN_N);
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
diff --git a/drivers/gpu/drm/exynos/exynos_dp_reg.h b/drivers/gpu/drm/exynos/exynos_dp_reg.h
deleted file mode 100644
index 2e9bd0e..0000000
--- a/drivers/gpu/drm/exynos/exynos_dp_reg.h
+++ /dev/null
@@ -1,366 +0,0 @@
-/*
- * Register definition file for Samsung DP driver
- *
- * Copyright (C) 2012 Samsung Electronics Co., Ltd.
- * Author: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- */
-
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
-#define RESET_DP_TX				(0x1 << 0)
-
-/* EXYNOS_DP_FUNC_EN_1 */
-#define MASTER_VID_FUNC_EN_N			(0x1 << 7)
-#define SLAVE_VID_FUNC_EN_N			(0x1 << 5)
-#define AUD_FIFO_FUNC_EN_N			(0x1 << 4)
-#define AUD_FUNC_EN_N				(0x1 << 3)
-#define HDCP_FUNC_EN_N				(0x1 << 2)
-#define CRC_FUNC_EN_N				(0x1 << 1)
-#define SW_FUNC_EN_N				(0x1 << 0)
-
-/* EXYNOS_DP_FUNC_EN_2 */
-#define SSC_FUNC_EN_N				(0x1 << 7)
-#define AUX_FUNC_EN_N				(0x1 << 2)
-#define SERDES_FIFO_FUNC_EN_N			(0x1 << 1)
-#define LS_CLK_DOMAIN_FUNC_EN_N			(0x1 << 0)
-
-/* EXYNOS_DP_VIDEO_CTL_1 */
-#define VIDEO_EN				(0x1 << 7)
-#define HDCP_VIDEO_MUTE				(0x1 << 6)
-
-/* EXYNOS_DP_VIDEO_CTL_1 */
-#define IN_D_RANGE_MASK				(0x1 << 7)
-#define IN_D_RANGE_SHIFT			(7)
-#define IN_D_RANGE_CEA				(0x1 << 7)
-#define IN_D_RANGE_VESA				(0x0 << 7)
-#define IN_BPC_MASK				(0x7 << 4)
-#define IN_BPC_SHIFT				(4)
-#define IN_BPC_12_BITS				(0x3 << 4)
-#define IN_BPC_10_BITS				(0x2 << 4)
-#define IN_BPC_8_BITS				(0x1 << 4)
-#define IN_BPC_6_BITS				(0x0 << 4)
-#define IN_COLOR_F_MASK				(0x3 << 0)
-#define IN_COLOR_F_SHIFT			(0)
-#define IN_COLOR_F_YCBCR444			(0x2 << 0)
-#define IN_COLOR_F_YCBCR422			(0x1 << 0)
-#define IN_COLOR_F_RGB				(0x0 << 0)
-
-/* EXYNOS_DP_VIDEO_CTL_3 */
-#define IN_YC_COEFFI_MASK			(0x1 << 7)
-#define IN_YC_COEFFI_SHIFT			(7)
-#define IN_YC_COEFFI_ITU709			(0x1 << 7)
-#define IN_YC_COEFFI_ITU601			(0x0 << 7)
-#define VID_CHK_UPDATE_TYPE_MASK		(0x1 << 4)
-#define VID_CHK_UPDATE_TYPE_SHIFT		(4)
-#define VID_CHK_UPDATE_TYPE_1			(0x1 << 4)
-#define VID_CHK_UPDATE_TYPE_0			(0x0 << 4)
-
-/* EXYNOS_DP_VIDEO_CTL_8 */
-#define VID_HRES_TH(x)				(((x) & 0xf) << 4)
-#define VID_VRES_TH(x)				(((x) & 0xf) << 0)
-
-/* EXYNOS_DP_VIDEO_CTL_10 */
-#define FORMAT_SEL				(0x1 << 4)
-#define INTERACE_SCAN_CFG			(0x1 << 2)
-#define VSYNC_POLARITY_CFG			(0x1 << 1)
-#define HSYNC_POLARITY_CFG			(0x1 << 0)
-
-/* EXYNOS_DP_LANE_MAP */
-#define LANE3_MAP_LOGIC_LANE_0			(0x0 << 6)
-#define LANE3_MAP_LOGIC_LANE_1			(0x1 << 6)
-#define LANE3_MAP_LOGIC_LANE_2			(0x2 << 6)
-#define LANE3_MAP_LOGIC_LANE_3			(0x3 << 6)
-#define LANE2_MAP_LOGIC_LANE_0			(0x0 << 4)
-#define LANE2_MAP_LOGIC_LANE_1			(0x1 << 4)
-#define LANE2_MAP_LOGIC_LANE_2			(0x2 << 4)
-#define LANE2_MAP_LOGIC_LANE_3			(0x3 << 4)
-#define LANE1_MAP_LOGIC_LANE_0			(0x0 << 2)
-#define LANE1_MAP_LOGIC_LANE_1			(0x1 << 2)
-#define LANE1_MAP_LOGIC_LANE_2			(0x2 << 2)
-#define LANE1_MAP_LOGIC_LANE_3			(0x3 << 2)
-#define LANE0_MAP_LOGIC_LANE_0			(0x0 << 0)
-#define LANE0_MAP_LOGIC_LANE_1			(0x1 << 0)
-#define LANE0_MAP_LOGIC_LANE_2			(0x2 << 0)
-#define LANE0_MAP_LOGIC_LANE_3			(0x3 << 0)
-
-/* EXYNOS_DP_ANALOG_CTL_1 */
-#define TX_TERMINAL_CTRL_50_OHM			(0x1 << 4)
-
-/* EXYNOS_DP_ANALOG_CTL_2 */
-#define SEL_24M					(0x1 << 3)
-#define TX_DVDD_BIT_1_0625V			(0x4 << 0)
-
-/* EXYNOS_DP_ANALOG_CTL_3 */
-#define DRIVE_DVDD_BIT_1_0625V			(0x4 << 5)
-#define VCO_BIT_600_MICRO			(0x5 << 0)
-
-/* EXYNOS_DP_PLL_FILTER_CTL_1 */
-#define PD_RING_OSC				(0x1 << 6)
-#define AUX_TERMINAL_CTRL_50_OHM		(0x2 << 4)
-#define TX_CUR1_2X				(0x1 << 2)
-#define TX_CUR_16_MA				(0x3 << 0)
-
-/* EXYNOS_DP_TX_AMP_TUNING_CTL */
-#define CH3_AMP_400_MV				(0x0 << 24)
-#define CH2_AMP_400_MV				(0x0 << 16)
-#define CH1_AMP_400_MV				(0x0 << 8)
-#define CH0_AMP_400_MV				(0x0 << 0)
-
-/* EXYNOS_DP_AUX_HW_RETRY_CTL */
-#define AUX_BIT_PERIOD_EXPECTED_DELAY(x)	(((x) & 0x7) << 8)
-#define AUX_HW_RETRY_INTERVAL_MASK		(0x3 << 3)
-#define AUX_HW_RETRY_INTERVAL_600_MICROSECONDS	(0x0 << 3)
-#define AUX_HW_RETRY_INTERVAL_800_MICROSECONDS	(0x1 << 3)
-#define AUX_HW_RETRY_INTERVAL_1000_MICROSECONDS	(0x2 << 3)
-#define AUX_HW_RETRY_INTERVAL_1800_MICROSECONDS	(0x3 << 3)
-#define AUX_HW_RETRY_COUNT_SEL(x)		(((x) & 0x7) << 0)
-
-/* EXYNOS_DP_COMMON_INT_STA_1 */
-#define VSYNC_DET				(0x1 << 7)
-#define PLL_LOCK_CHG				(0x1 << 6)
-#define SPDIF_ERR				(0x1 << 5)
-#define SPDIF_UNSTBL				(0x1 << 4)
-#define VID_FORMAT_CHG				(0x1 << 3)
-#define AUD_CLK_CHG				(0x1 << 2)
-#define VID_CLK_CHG				(0x1 << 1)
-#define SW_INT					(0x1 << 0)
-
-/* EXYNOS_DP_COMMON_INT_STA_2 */
-#define ENC_EN_CHG				(0x1 << 6)
-#define HW_BKSV_RDY				(0x1 << 3)
-#define HW_SHA_DONE				(0x1 << 2)
-#define HW_AUTH_STATE_CHG			(0x1 << 1)
-#define HW_AUTH_DONE				(0x1 << 0)
-
-/* EXYNOS_DP_COMMON_INT_STA_3 */
-#define AFIFO_UNDER				(0x1 << 7)
-#define AFIFO_OVER				(0x1 << 6)
-#define R0_CHK_FLAG				(0x1 << 5)
-
-/* EXYNOS_DP_COMMON_INT_STA_4 */
-#define PSR_ACTIVE				(0x1 << 7)
-#define PSR_INACTIVE				(0x1 << 6)
-#define SPDIF_BI_PHASE_ERR			(0x1 << 5)
-#define HOTPLUG_CHG				(0x1 << 2)
-#define HPD_LOST				(0x1 << 1)
-#define PLUG					(0x1 << 0)
-
-/* EXYNOS_DP_INT_STA */
-#define INT_HPD					(0x1 << 6)
-#define HW_TRAINING_FINISH			(0x1 << 5)
-#define RPLY_RECEIV				(0x1 << 1)
-#define AUX_ERR					(0x1 << 0)
-
-/* EXYNOS_DP_INT_CTL */
-#define SOFT_INT_CTRL				(0x1 << 2)
-#define INT_POL1				(0x1 << 1)
-#define INT_POL0				(0x1 << 0)
-
-/* EXYNOS_DP_SYS_CTL_1 */
-#define DET_STA					(0x1 << 2)
-#define FORCE_DET				(0x1 << 1)
-#define DET_CTRL				(0x1 << 0)
-
-/* EXYNOS_DP_SYS_CTL_2 */
-#define CHA_CRI(x)				(((x) & 0xf) << 4)
-#define CHA_STA					(0x1 << 2)
-#define FORCE_CHA				(0x1 << 1)
-#define CHA_CTRL				(0x1 << 0)
-
-/* EXYNOS_DP_SYS_CTL_3 */
-#define HPD_STATUS				(0x1 << 6)
-#define F_HPD					(0x1 << 5)
-#define HPD_CTRL				(0x1 << 4)
-#define HDCP_RDY				(0x1 << 3)
-#define STRM_VALID				(0x1 << 2)
-#define F_VALID					(0x1 << 1)
-#define VALID_CTRL				(0x1 << 0)
-
-/* EXYNOS_DP_SYS_CTL_4 */
-#define FIX_M_AUD				(0x1 << 4)
-#define ENHANCED				(0x1 << 3)
-#define FIX_M_VID				(0x1 << 2)
-#define M_VID_UPDATE_CTRL			(0x3 << 0)
-
-/* EXYNOS_DP_TRAINING_PTN_SET */
-#define SCRAMBLER_TYPE				(0x1 << 9)
-#define HW_LINK_TRAINING_PATTERN		(0x1 << 8)
-#define SCRAMBLING_DISABLE			(0x1 << 5)
-#define SCRAMBLING_ENABLE			(0x0 << 5)
-#define LINK_QUAL_PATTERN_SET_MASK		(0x3 << 2)
-#define LINK_QUAL_PATTERN_SET_PRBS7		(0x3 << 2)
-#define LINK_QUAL_PATTERN_SET_D10_2		(0x1 << 2)
-#define LINK_QUAL_PATTERN_SET_DISABLE		(0x0 << 2)
-#define SW_TRAINING_PATTERN_SET_MASK		(0x3 << 0)
-#define SW_TRAINING_PATTERN_SET_PTN2		(0x2 << 0)
-#define SW_TRAINING_PATTERN_SET_PTN1		(0x1 << 0)
-#define SW_TRAINING_PATTERN_SET_NORMAL		(0x0 << 0)
-
-/* EXYNOS_DP_LN0_LINK_TRAINING_CTL */
-#define PRE_EMPHASIS_SET_MASK			(0x3 << 3)
-#define PRE_EMPHASIS_SET_SHIFT			(3)
-
-/* EXYNOS_DP_DEBUG_CTL */
-#define PLL_LOCK				(0x1 << 4)
-#define F_PLL_LOCK				(0x1 << 3)
-#define PLL_LOCK_CTRL				(0x1 << 2)
-#define PN_INV					(0x1 << 0)
-
-/* EXYNOS_DP_PLL_CTL */
-#define DP_PLL_PD				(0x1 << 7)
-#define DP_PLL_RESET				(0x1 << 6)
-#define DP_PLL_LOOP_BIT_DEFAULT			(0x1 << 4)
-#define DP_PLL_REF_BIT_1_1250V			(0x5 << 0)
-#define DP_PLL_REF_BIT_1_2500V			(0x7 << 0)
-
-/* EXYNOS_DP_PHY_PD */
-#define DP_PHY_PD				(0x1 << 5)
-#define AUX_PD					(0x1 << 4)
-#define CH3_PD					(0x1 << 3)
-#define CH2_PD					(0x1 << 2)
-#define CH1_PD					(0x1 << 1)
-#define CH0_PD					(0x1 << 0)
-
-/* EXYNOS_DP_PHY_TEST */
-#define MACRO_RST				(0x1 << 5)
-#define CH1_TEST				(0x1 << 1)
-#define CH0_TEST				(0x1 << 0)
-
-/* EXYNOS_DP_AUX_CH_STA */
-#define AUX_BUSY				(0x1 << 4)
-#define AUX_STATUS_MASK				(0xf << 0)
-
-/* EXYNOS_DP_AUX_CH_DEFER_CTL */
-#define DEFER_CTRL_EN				(0x1 << 7)
-#define DEFER_COUNT(x)				(((x) & 0x7f) << 0)
-
-/* EXYNOS_DP_AUX_RX_COMM */
-#define AUX_RX_COMM_I2C_DEFER			(0x2 << 2)
-#define AUX_RX_COMM_AUX_DEFER			(0x2 << 0)
-
-/* EXYNOS_DP_BUFFER_DATA_CTL */
-#define BUF_CLR					(0x1 << 7)
-#define BUF_DATA_COUNT(x)			(((x) & 0x1f) << 0)
-
-/* EXYNOS_DP_AUX_CH_CTL_1 */
-#define AUX_LENGTH(x)				(((x - 1) & 0xf) << 4)
-#define AUX_TX_COMM_MASK			(0xf << 0)
-#define AUX_TX_COMM_DP_TRANSACTION		(0x1 << 3)
-#define AUX_TX_COMM_I2C_TRANSACTION		(0x0 << 3)
-#define AUX_TX_COMM_MOT				(0x1 << 2)
-#define AUX_TX_COMM_WRITE			(0x0 << 0)
-#define AUX_TX_COMM_READ			(0x1 << 0)
-
-/* EXYNOS_DP_AUX_ADDR_7_0 */
-#define AUX_ADDR_7_0(x)				(((x) >> 0) & 0xff)
-
-/* EXYNOS_DP_AUX_ADDR_15_8 */
-#define AUX_ADDR_15_8(x)			(((x) >> 8) & 0xff)
-
-/* EXYNOS_DP_AUX_ADDR_19_16 */
-#define AUX_ADDR_19_16(x)			(((x) >> 16) & 0x0f)
-
-/* EXYNOS_DP_AUX_CH_CTL_2 */
-#define ADDR_ONLY				(0x1 << 1)
-#define AUX_EN					(0x1 << 0)
-
-/* EXYNOS_DP_SOC_GENERAL_CTL */
-#define AUDIO_MODE_SPDIF_MODE			(0x1 << 8)
-#define AUDIO_MODE_MASTER_MODE			(0x0 << 8)
-#define MASTER_VIDEO_INTERLACE_EN		(0x1 << 4)
-#define VIDEO_MASTER_CLK_SEL			(0x1 << 2)
-#define VIDEO_MASTER_MODE_EN			(0x1 << 1)
-#define VIDEO_MODE_MASK				(0x1 << 0)
-#define VIDEO_MODE_SLAVE_MODE			(0x1 << 0)
-#define VIDEO_MODE_MASTER_MODE			(0x0 << 0)
-
-#endif /* _EXYNOS_DP_REG_H */
diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
new file mode 100644
index 0000000..d1188db
--- /dev/null
+++ b/include/drm/bridge/analogix_dp.h
@@ -0,0 +1,40 @@
+/*
+ * Analogix DP (Display Port) Core interface driver.
+ *
+ * Copyright (C) 2015 Rockchip Electronics Co., Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or (at your
+ * option) any later version.
+ */
+#ifndef _ANALOGIX_DP_H_
+#define _ANALOGIX_DP_H_
+
+#include <drm/drm_crtc.h>
+
+enum analogix_dp_devtype {
+	EXYNOS_DP,
+};
+
+struct analogix_dp_plat_data {
+	enum analogix_dp_devtype dev_type;
+	struct drm_panel *panel;
+	struct drm_encoder *encoder;
+	struct drm_connector *connector;
+
+	int (*power_on)(struct analogix_dp_plat_data *);
+	int (*power_off)(struct analogix_dp_plat_data *);
+	int (*attach)(struct analogix_dp_plat_data *, struct drm_bridge *,
+		      struct drm_connector *);
+	int (*get_modes)(struct analogix_dp_plat_data *);
+};
+
+int analogix_dp_resume(struct device *dev);
+int analogix_dp_suspend(struct device *dev);
+
+int analogix_dp_bind(struct device *dev, struct drm_device *drm_dev,
+		     struct analogix_dp_plat_data *plat_data);
+void analogix_dp_unbind(struct device *dev, struct device *master, void *data);
+
+#endif /* _ANALOGIX_DP_H_ */
-- 
2.6.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
