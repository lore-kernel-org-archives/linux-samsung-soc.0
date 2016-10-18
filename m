From: Zain Wang <wzz@rock-chips.com>
Subject: [PATCH v3 3/6] drm/bridge: analogix_dp: detect Sink PSR state after configuring the PSR
Date: Tue, 18 Oct 2016 14:21:37 +0800
Message-ID: <1476771697-11895-1-git-send-email-wzz@rock-chips.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.140]:47993 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751350AbcJRGVw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Oct 2016 02:21:52 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, David Airlie <airlied@linux.ie>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Mika Kahola <mika.kahola@intel.com>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, Tomasz Figa <tfiga@chromium.org>, dianders@chromium.org, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org

From: Yakir Yang <ykk@rock-chips.com>

Make sure the request PSR state takes effect in analogix_dp_send_psr_spd()
function, or print the sink PSR error state if we failed to apply the
requested PSR setting.

Signed-off-by: zain wang <wzz@rock-chips.com>
Signed-off-by: Yakir Yang <ykk@rock-chips.com>
---

Changes in v3: None
Changes in v2: None

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  6 ++----
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |  6 ++++--
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  | 25 ++++++++++++++++++++--
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |  6 ++++--
 4 files changed, 33 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index bcae4dd..7faad93 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -124,8 +124,7 @@ int analogix_dp_enable_psr(struct device *dev)
 	psr_vsc.DB0 = 0;
 	psr_vsc.DB1 = EDP_VSC_PSR_STATE_ACTIVE | EDP_VSC_PSR_CRC_VALUES_VALID;
 
-	analogix_dp_send_psr_spd(dp, &psr_vsc);
-	return 0;
+	return analogix_dp_send_psr_spd(dp, &psr_vsc);
 }
 EXPORT_SYMBOL_GPL(analogix_dp_enable_psr);
 
@@ -147,8 +146,7 @@ int analogix_dp_disable_psr(struct device *dev)
 	psr_vsc.DB0 = 0;
 	psr_vsc.DB1 = 0;
 
-	analogix_dp_send_psr_spd(dp, &psr_vsc);
-	return 0;
+	return analogix_dp_send_psr_spd(dp, &psr_vsc);
 }
 EXPORT_SYMBOL_GPL(analogix_dp_disable_psr);
 
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index 5c6a288..cdc0535 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -20,6 +20,8 @@
 #define MAX_CR_LOOP 5
 #define MAX_EQ_LOOP 5
 
+#define DP_TIMEOUT_PSR_LOOP_MS			msecs_to_jiffies(300)
+
 /* DP_MAX_LANE_COUNT */
 #define DPCD_ENHANCED_FRAME_CAP(x)		(((x) >> 7) & 0x1)
 #define DPCD_MAX_LANE_COUNT(x)			((x) & 0x1f)
@@ -247,8 +249,8 @@ void analogix_dp_config_video_slave_mode(struct analogix_dp_device *dp);
 void analogix_dp_enable_scrambling(struct analogix_dp_device *dp);
 void analogix_dp_disable_scrambling(struct analogix_dp_device *dp);
 void analogix_dp_enable_psr_crc(struct analogix_dp_device *dp);
-void analogix_dp_send_psr_spd(struct analogix_dp_device *dp,
-			      struct edp_vsc_psr *vsc);
+int analogix_dp_send_psr_spd(struct analogix_dp_device *dp,
+			     struct edp_vsc_psr *vsc);
 ssize_t analogix_dp_transfer(struct analogix_dp_device *dp,
 			     struct drm_dp_aux_msg *msg);
 
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index cd37ac0..9e1177c 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -992,10 +992,12 @@ void analogix_dp_enable_psr_crc(struct analogix_dp_device *dp)
 	writel(PSR_VID_CRC_ENABLE, dp->reg_base + ANALOGIX_DP_CRC_CON);
 }
 
-void analogix_dp_send_psr_spd(struct analogix_dp_device *dp,
-			      struct edp_vsc_psr *vsc)
+int analogix_dp_send_psr_spd(struct analogix_dp_device *dp,
+			     struct edp_vsc_psr *vsc)
 {
+	unsigned long timeout;
 	unsigned int val;
+	u8 sink;
 
 	/* don't send info frame */
 	val = readl(dp->reg_base + ANALOGIX_DP_PKT_SEND_CTL);
@@ -1036,6 +1038,25 @@ void analogix_dp_send_psr_spd(struct analogix_dp_device *dp,
 	val = readl(dp->reg_base + ANALOGIX_DP_PKT_SEND_CTL);
 	val |= IF_EN;
 	writel(val, dp->reg_base + ANALOGIX_DP_PKT_SEND_CTL);
+
+	timeout = jiffies + DP_TIMEOUT_PSR_LOOP_MS;
+	while (time_before(jiffies, timeout)) {
+		val = drm_dp_dpcd_readb(&dp->aux, DP_PSR_STATUS, &sink);
+		if (val != 1) {
+			dev_err(dp->dev, "PSR_STATUS read failed ret=%d", val);
+			return -EBUSY;
+		}
+
+		if ((vsc->DB1 && sink == DP_PSR_SINK_ACTIVE_RFB) ||
+		    (!vsc->DB1 && sink == DP_PSR_SINK_INACTIVE))
+			return 0;
+
+		usleep_range(1000, 1500);
+	}
+
+	dev_warn(dp->dev, "Failed to apply PSR, sink state was [%x]", sink);
+
+	return -ETIMEDOUT;
 }
 
 ssize_t analogix_dp_transfer(struct analogix_dp_device *dp,
diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index e5471e7..1c2d756 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -105,7 +105,7 @@ static void analogix_dp_psr_work(struct work_struct *work)
 	struct rockchip_dp_device *dp =
 				container_of(work, typeof(*dp), psr_work);
 	struct drm_crtc *crtc = dp->encoder.crtc;
-	int psr_state = dp->psr_state;
+	int psr_state;
 	int vact_end;
 	int ret;
 	unsigned long flags;
@@ -123,11 +123,13 @@ static void analogix_dp_psr_work(struct work_struct *work)
 	}
 
 	spin_lock_irqsave(&dp->psr_lock, flags);
+	psr_state = dp->psr_state;
+	spin_unlock_irqrestore(&dp->psr_lock, flags);
+
 	if (psr_state == EDP_VSC_PSR_STATE_ACTIVE)
 		analogix_dp_enable_psr(dp->dev);
 	else
 		analogix_dp_disable_psr(dp->dev);
-	spin_unlock_irqrestore(&dp->psr_lock, flags);
 }
 
 static int rockchip_dp_pre_init(struct rockchip_dp_device *dp)
-- 
1.9.1
