From: Zain Wang <wzz@rock-chips.com>
Subject: [PATCH  v3 5/6] drm: bridge/analogix: add fast link train for eDP
Date: Tue, 18 Oct 2016 14:22:21 +0800
Message-ID: <1476771741-11997-1-git-send-email-wzz@rock-chips.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.131]:46575 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751350AbcJRGWg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Oct 2016 02:22:36 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, David Airlie <airlied@linux.ie>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Mika Kahola <mika.kahola@intel.com>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, Tomasz Figa <tfiga@chromium.org>, dianders@chromium.org, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, zain wang <wzz@rock-chips.com>

From: zain wang <wzz@rock-chips.com>

we would meet a short black screen when exit PSR with the full link
training, In this case, we should use fast link train instead of full
link training.

Signed-off-by: zain wang <wzz@rock-chips.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 89 +++++++++++++++++++++-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |  1 +
 2 files changed, 86 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 561b644..0516621 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -21,6 +21,7 @@
 #include <linux/gpio.h>
 #include <linux/component.h>
 #include <linux/phy/phy.h>
+#include <linux/iopoll.h>
 
 #include <drm/drmP.h>
 #include <drm/drm_atomic_helper.h>
@@ -35,6 +36,8 @@
 
 #define to_dp(nm)	container_of(nm, struct analogix_dp_device, nm)
 
+static const int FAST_LINK_VERIFICATION = false;
+
 struct bridge_init {
 	struct i2c_client *client;
 	struct device_node *node;
@@ -244,6 +247,7 @@ static int analogix_dp_link_start(struct analogix_dp_device *dp)
 		usleep_range(90, 120);
 	}
 
+
 	/* Set training pattern 1 */
 	analogix_dp_set_training_pattern(dp, TRAINING_PTN1);
 
@@ -481,7 +485,7 @@ static int analogix_dp_process_equalizer_training(struct analogix_dp_device *dp)
 {
 	int lane, lane_count, retval;
 	u32 reg;
-	u8 link_align, link_status[2], adjust_request[2];
+	u8 link_align, link_status[2], adjust_request[2], spread;
 
 	usleep_range(400, 401);
 
@@ -524,6 +528,12 @@ static int analogix_dp_process_equalizer_training(struct analogix_dp_device *dp)
 		dev_dbg(dp->dev, "final lane count = %.2x\n",
 			dp->link_train.lane_count);
 
+		drm_dp_dpcd_readb(&dp->aux, DP_MAX_DOWNSPREAD, &spread);
+		dp->fast_train_support = (spread &
+			DP_NO_AUX_HANDSHAKE_LINK_TRAINING) ? true : false;
+		dev_dbg(dp->dev, "fast link training %s\n",
+			dp->fast_train_support ? "supported" : "unsupported");
+
 		/* set enhanced mode if available */
 		analogix_dp_set_enhanced_mode(dp);
 		dp->link_train.lt_state = FINISHED;
@@ -655,6 +665,75 @@ static int analogix_dp_sw_link_training(struct analogix_dp_device *dp)
 	return retval;
 }
 
+static int analogix_dp_full_link_train(struct analogix_dp_device *dp,
+					    u32 count, u32 bwtype)
+{
+	analogix_dp_init_training(dp, count, bwtype);
+	return analogix_dp_sw_link_training(dp);
+}
+
+static int analogix_dp_fast_link_train(struct analogix_dp_device *dp)
+{
+	int lane;
+	int retval;
+	u8 link_align, link_status[2];
+	enum pll_status status;
+
+	analogix_dp_reset_macro(dp);
+
+	analogix_dp_set_link_bandwidth(dp, dp->link_train.link_rate);
+	analogix_dp_set_lane_count(dp, dp->link_train.lane_count);
+
+	for (lane = 0; lane < dp->link_train.lane_count; lane++) {
+		analogix_dp_set_lane_link_training(dp,
+			dp->link_train.training_lane[lane], lane);
+	}
+
+	retval = readx_poll_timeout(analogix_dp_get_pll_lock_status, dp, status,
+				    status != PLL_UNLOCKED,
+				    120, 120 * DP_TIMEOUT_LOOP_COUNT);
+
+	if (retval)
+		return retval;
+
+	/* source Set training pattern 1 */
+	analogix_dp_set_training_pattern(dp, TRAINING_PTN1);
+	usleep_range(500, 600);
+
+	analogix_dp_set_training_pattern(dp, TRAINING_PTN2);
+	usleep_range(500, 600);
+
+	/* TODO: enhanced_mode?*/
+	analogix_dp_set_training_pattern(dp, DP_NONE);
+
+	if (FAST_LINK_VERIFICATION) {
+		retval = drm_dp_dpcd_readb(&dp->aux,
+					   DP_LANE_ALIGN_STATUS_UPDATED,
+					   &link_align);
+		if (retval < 0)
+			return retval;
+
+		retval = drm_dp_dpcd_read(&dp->aux, DP_LANE0_1_STATUS,
+					  link_status, 2);
+		if (retval < 0)
+			return retval;
+
+		if (analogix_dp_clock_recovery_ok(link_status,
+						  dp->link_train.lane_count)) {
+			analogix_dp_reduce_link_rate(dp);
+			return -EIO;
+		}
+
+		if (analogix_dp_channel_eq_ok(link_status, link_align,
+					      dp->link_train.lane_count)) {
+			analogix_dp_reduce_link_rate(dp);
+			return -EIO;
+		}
+	}
+
+	return 0;
+}
+
 static int analogix_dp_set_link_train(struct analogix_dp_device *dp,
 				      u32 count, u32 bwtype)
 {
@@ -662,11 +741,13 @@ static int analogix_dp_set_link_train(struct analogix_dp_device *dp,
 	int retval;
 
 	for (i = 0; i < DP_TIMEOUT_LOOP_COUNT; i++) {
-		analogix_dp_init_training(dp, count, bwtype);
-		retval = analogix_dp_sw_link_training(dp);
+		if (dp->fast_train_support)
+			retval = analogix_dp_fast_link_train(dp);
+		else
+			retval = analogix_dp_full_link_train(dp, count,
+								  bwtype);
 		if (retval == 0)
 			break;
-
 		usleep_range(100, 110);
 	}
 
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index cdc0535..b86039b 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -171,6 +171,7 @@ struct analogix_dp_device {
 	int			hpd_gpio;
 	bool                    force_hpd;
 	bool			psr_support;
+	bool			fast_train_support;
 
 	struct mutex		panel_lock;
 	bool			panel_is_modeset;
-- 
1.9.1
