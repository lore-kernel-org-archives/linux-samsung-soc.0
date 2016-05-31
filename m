From: Yakir Yang <ykk@rock-chips.com>
Subject: [RFC PATCH v1 2/2] drm/rockchip: analogix: add eDP PSR function
Date: Tue, 31 May 2016 21:39:50 +0800
Message-ID: <1464701990-10741-1-git-send-email-ykk@rock-chips.com>
References: <1464701856-8695-1-git-send-email-ykk@rock-chips.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.135]:49143 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753034AbcEaNkF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 May 2016 09:40:05 -0400
In-Reply-To: <1464701856-8695-1-git-send-email-ykk@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Heiko Stuebner <heiko@sntech.de>, tfiga@chromium.org, Jingoo Han <jingoohan1@gmail.com>
Cc: David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch, Thierry Reding <treding@nvidia.com>, dianders@chromium.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, emil.l.velikov@gmail.com, Dan Carpenter <dan.carpenter@oracle.com>, Yakir Yang <ykk@rock-chips.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org

The full name of PSR is Panel Self Refresh, panel device could refresh
itself with the hardware framebuffer in panel, this would make a lots
of sense to save the power consumption.

For example, when desktop haven't change the context for a long time,
then we could refresh the data to the hardware framebuffer of panel,
and then let panel enter into PSR mode. After that system could poweroff
the LCDC controller and eDP controller, just let panel refresh the screen
by itself.

Signed-off-by: Yakir Yang <ykk@rock-chips.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 69 ++++++++++++++++
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |  5 ++
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  | 54 +++++++++++++
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h  | 28 +++++++
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    | 65 ++++++++++++++++
 drivers/gpu/drm/rockchip/rockchip_drm_notify.c     | 39 ++++++++++
 drivers/gpu/drm/rockchip/rockchip_drm_notify.h     |  4 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        | 91 ++++++++++++++++++++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h        |  3 +
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c        |  2 +
 include/drm/bridge/analogix_dp.h                   |  3 +
 11 files changed, 363 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 5af9ce4..a66ccb6 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -39,6 +39,72 @@ struct bridge_init {
 	struct device_node *node;
 };
 
+int analogix_dp_actice_psr(struct device *dev)
+{
+	struct analogix_dp_device *dp = dev_get_drvdata(dev);
+
+	if (!dp->psr_support)
+		return -EINVAL;
+
+	analogix_dp_send_vsc(dp, EDP_VSC_PSR_STATE_ACTIVE |
+			     EDP_VSC_PSR_CRC_VALUES_VALID);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(analogix_dp_actice_psr);
+
+int analogix_dp_inactice_psr(struct device *dev)
+{
+	struct analogix_dp_device *dp = dev_get_drvdata(dev);
+
+	if (!dp->psr_support)
+		return -EINVAL;
+
+	analogix_dp_send_vsc(dp, 0);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(analogix_dp_inactice_psr);
+
+int analogix_dp_enable_psr(struct analogix_dp_device *dp)
+{
+	unsigned char psr_version, psr_caps;
+	unsigned char psr_en;
+
+	/* disable psr function */
+	analogix_dp_read_byte_from_dpcd(dp, DP_PSR_EN_CFG, &psr_en);
+	psr_en &= ~DP_PSR_ENABLE;
+	analogix_dp_write_byte_to_dpcd(dp, DP_PSR_EN_CFG, psr_en);
+
+	/* check panel psr version */
+	analogix_dp_read_byte_from_dpcd(dp, DP_PSR_SUPPORT, &psr_version);
+	analogix_dp_read_byte_from_dpcd(dp, DP_PSR_CAPS, &psr_caps);
+	dev_info(dp->dev, "Panel PSR version : %x.%x\n", psr_version, psr_caps);
+
+	if (!(psr_version & DP_PSR_IS_SUPPORTED))
+		return -1;
+
+	/* Main-Link transmitter remains active during PSR active states */
+	analogix_dp_read_byte_from_dpcd(dp, DP_PSR_EN_CFG, &psr_en);
+	psr_en = DP_PSR_MAIN_LINK_ACTIVE | DP_PSR_CRC_VERIFICATION;
+	analogix_dp_write_byte_to_dpcd(dp, DP_PSR_EN_CFG, psr_en);
+
+	/* enable PSR function */
+	analogix_dp_read_byte_from_dpcd(dp, DP_PSR_EN_CFG, &psr_en);
+	psr_en = DP_PSR_ENABLE | DP_PSR_MAIN_LINK_ACTIVE |
+		 DP_PSR_CRC_VERIFICATION;
+	analogix_dp_write_byte_to_dpcd(dp, DP_PSR_EN_CFG, psr_en);
+
+	/* read sink psr state */
+	analogix_dp_read_byte_from_dpcd(dp, DP_PSR_EN_CFG, &psr_en);
+	dev_info(dp->dev, "DP_PSR_EN_CFG: %x\n", psr_en);
+
+	analogix_dp_enable_psr_crc(dp);
+	dp->psr_support = true;
+
+	return 0;
+}
+
 static void analogix_dp_init_dp(struct analogix_dp_device *dp)
 {
 	analogix_dp_reset(dp);
@@ -921,6 +987,9 @@ static void analogix_dp_commit(struct analogix_dp_device *dp)
 
 	/* Enable video */
 	analogix_dp_start_video(dp);
+
+	/* Enable PSR support */
+	analogix_dp_enable_psr(dp);
 }
 
 int analogix_dp_get_modes(struct drm_connector *connector)
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index b456380..948e59a 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -178,6 +178,8 @@ struct analogix_dp_device {
 	bool                    force_hpd;
 	unsigned char           edid[EDID_BLOCK_LENGTH * 2];
 
+	bool			psr_support;
+
 	struct analogix_dp_plat_data *plat_data;
 };
 
@@ -278,4 +280,7 @@ int analogix_dp_is_video_stream_on(struct analogix_dp_device *dp);
 void analogix_dp_config_video_slave_mode(struct analogix_dp_device *dp);
 void analogix_dp_enable_scrambling(struct analogix_dp_device *dp);
 void analogix_dp_disable_scrambling(struct analogix_dp_device *dp);
+void analogix_dp_enable_psr_crc(struct analogix_dp_device *dp);
+void analogix_dp_send_vsc(struct analogix_dp_device *dp, int db1);
+
 #endif /* _ANALOGIX_DP_CORE_H */
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index 31366bf..8d8c37a 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -1322,3 +1322,57 @@ void analogix_dp_disable_scrambling(struct analogix_dp_device *dp)
 	reg |= SCRAMBLING_DISABLE;
 	writel(reg, dp->reg_base + ANALOGIX_DP_TRAINING_PTN_SET);
 }
+
+void analogix_dp_enable_psr_crc(struct analogix_dp_device *dp)
+{
+	writel(PSR_VID_CRC_FLUSH | PSR_VID_CRC_ENABLE,
+	       dp->reg_base + ANALOGIX_DP_CRC_CON);
+
+	usleep_range(10, 20);
+
+	writel(PSR_VID_CRC_ENABLE, dp->reg_base + ANALOGIX_DP_CRC_CON);
+}
+
+void analogix_dp_send_vsc(struct analogix_dp_device *dp, int db1)
+{
+	unsigned int val;
+
+	/* don't send info frame */
+	val = readl(dp->reg_base + ANALOGIX_DP_PKT_SEND_CTL);
+	val &= ~IF_EN;
+	writel(val, dp->reg_base + ANALOGIX_DP_PKT_SEND_CTL);
+
+	/* configure single frame update mode */
+	writel(0x3, dp->reg_base + ANALOGIX_DP_PSR_FRAME_UPDATE_CTRL);
+
+	/* configure VSC HB0 ~ HB3 */
+	writel(0x00, dp->reg_base + ANALOGIX_DP_SPD_HB0);
+	writel(0x07, dp->reg_base + ANALOGIX_DP_SPD_HB1);
+	writel(0x02, dp->reg_base + ANALOGIX_DP_SPD_HB2);
+	writel(0x08, dp->reg_base + ANALOGIX_DP_SPD_HB3);
+
+	/* configure VSC HB0 ~ HB3 */
+	writel(0x00, dp->reg_base + ANALOGIX_DP_SPD_PB0);
+	writel(0x16, dp->reg_base + ANALOGIX_DP_SPD_PB1);
+	writel(0xCE, dp->reg_base + ANALOGIX_DP_SPD_PB2);
+	writel(0x5D, dp->reg_base + ANALOGIX_DP_SPD_PB3);
+
+	/* configure DB0 / DB1 values */
+	writel(0x00, dp->reg_base + ANALOGIX_DP_VSC_SHADOW_DB0);
+	writel(db1, dp->reg_base + ANALOGIX_DP_VSC_SHADOW_DB1);
+
+	/* set reuse spd inforframe */
+	val = readl(dp->reg_base + ANALOGIX_DP_VIDEO_CTL_3);
+	val |= REUSE_SPD_EN;
+	writel(val, dp->reg_base + ANALOGIX_DP_VIDEO_CTL_3);
+
+	/* mark info frame update */
+	val = readl(dp->reg_base + ANALOGIX_DP_PKT_SEND_CTL);
+	val = (val | IF_UP) & ~IF_EN;
+	writel(val, dp->reg_base + ANALOGIX_DP_PKT_SEND_CTL);
+
+	/* send info frame */
+	val = readl(dp->reg_base + ANALOGIX_DP_PKT_SEND_CTL);
+	val |= IF_EN;
+	writel(val, dp->reg_base + ANALOGIX_DP_PKT_SEND_CTL);
+}
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
index cdcc6c5..a2698e4 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
@@ -22,6 +22,8 @@
 #define ANALOGIX_DP_VIDEO_CTL_8			0x3C
 #define ANALOGIX_DP_VIDEO_CTL_10		0x44
 
+#define ANALOGIX_DP_SPDIF_AUDIO_CTL_0		0xD8
+
 #define ANALOGIX_DP_PLL_REG_1			0xfc
 #define ANALOGIX_DP_PLL_REG_2			0x9e4
 #define ANALOGIX_DP_PLL_REG_3			0x9e8
@@ -30,6 +32,21 @@
 
 #define ANALOGIX_DP_PD				0x12c
 
+#define ANALOGIX_DP_IF_TYPE			0x244
+#define ANALOGIX_DP_IF_PKT_DB1			0x254
+#define ANALOGIX_DP_IF_PKT_DB2			0x258
+#define ANALOGIX_DP_SPD_HB0			0x2F8
+#define ANALOGIX_DP_SPD_HB1			0x2FC
+#define ANALOGIX_DP_SPD_HB2			0x300
+#define ANALOGIX_DP_SPD_HB3			0x304
+#define ANALOGIX_DP_SPD_PB0			0x308
+#define ANALOGIX_DP_SPD_PB1			0x30C
+#define ANALOGIX_DP_SPD_PB2			0x310
+#define ANALOGIX_DP_SPD_PB3			0x314
+#define ANALOGIX_DP_PSR_FRAME_UPDATE_CTRL	0x318
+#define ANALOGIX_DP_VSC_SHADOW_DB0		0x31C
+#define ANALOGIX_DP_VSC_SHADOW_DB1		0x320
+
 #define ANALOGIX_DP_LANE_MAP			0x35C
 
 #define ANALOGIX_DP_ANALOG_CTL_1		0x370
@@ -103,6 +120,8 @@
 
 #define ANALOGIX_DP_SOC_GENERAL_CTL		0x800
 
+#define ANALOGIX_DP_CRC_CON			0x890
+
 /* ANALOGIX_DP_TX_SW_RESET */
 #define RESET_DP_TX				(0x1 << 0)
 
@@ -151,6 +170,7 @@
 #define VID_CHK_UPDATE_TYPE_SHIFT		(4)
 #define VID_CHK_UPDATE_TYPE_1			(0x1 << 4)
 #define VID_CHK_UPDATE_TYPE_0			(0x0 << 4)
+#define REUSE_SPD_EN				(0x1 << 3)
 
 /* ANALOGIX_DP_VIDEO_CTL_8 */
 #define VID_HRES_TH(x)				(((x) & 0xf) << 4)
@@ -376,4 +396,12 @@
 #define VIDEO_MODE_SLAVE_MODE			(0x1 << 0)
 #define VIDEO_MODE_MASTER_MODE			(0x0 << 0)
 
+/* ANALOGIX_DP_PKT_SEND_CTL */
+#define IF_UP					(0x1 << 4)
+#define IF_EN					(0x1 << 0)
+
+/* ANALOGIX_DP_CRC_CON */
+#define PSR_VID_CRC_FLUSH			(0x1 << 2)
+#define PSR_VID_CRC_ENABLE			(0x1 << 0)
+
 #endif /* _ANALOGIX_DP_REG_H */
diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index eb1b8ac..44a7a27 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -33,6 +33,7 @@
 
 #include "rockchip_drm_drv.h"
 #include "rockchip_drm_vop.h"
+#include "rockchip_drm_notify.h"
 
 #define to_dp(nm)	container_of(nm, struct rockchip_dp_device, nm)
 
@@ -54,6 +55,12 @@ struct rockchip_dp_device {
 	struct regmap            *grf;
 	struct reset_control     *rst;
 
+	struct workqueue_struct	 *dp_workq;
+	struct work_struct	 psr_work;
+	struct notifier_block    psr_nb;
+	unsigned int		 psr_state;
+	struct mutex		 psr_state_mutex;
+
 	const struct rockchip_dp_chip_data *data;
 
 	struct analogix_dp_plat_data plat_data;
@@ -97,6 +104,50 @@ static int rockchip_dp_powerdown(struct analogix_dp_plat_data *plat_data)
 	return 0;
 }
 
+static int psr_notify(struct notifier_block *psr_nb, unsigned long action,
+		      void *data)
+{
+	struct rockchip_dp_device *dp = to_dp(psr_nb);
+
+	switch (action) {
+	case VBLANK_ENABLE:
+		mutex_lock(&dp->psr_state_mutex);
+		dp->psr_state = 0;
+		mutex_unlock(&dp->psr_state_mutex);
+		break;
+
+	case VBLANK_DISABLE:
+		mutex_lock(&dp->psr_state_mutex);
+		dp->psr_state = EDP_VSC_PSR_STATE_ACTIVE;
+		mutex_unlock(&dp->psr_state_mutex);
+		break;
+
+	default:
+		return 0;
+	}
+
+	queue_work(dp->dp_workq, &dp->psr_work);
+
+	return 0;
+}
+
+static void dp_psr_work(struct work_struct *psr_work)
+{
+	struct rockchip_dp_device *dp = to_dp(psr_work);
+	int psr_state = dp->psr_state;
+	int ret;
+
+	if (psr_state == EDP_VSC_PSR_STATE_ACTIVE) {
+		ret = rockchip_psr_ready_wait();
+		if (ret == 0)
+			analogix_dp_actice_psr(dp->dev);
+	} else {
+		ret = rockchip_psr_ready_wait();
+		if (ret == 0)
+			analogix_dp_inactice_psr(dp->dev);
+	}
+}
+
 static enum drm_mode_status
 rockchip_dp_mode_valid(struct analogix_dp_plat_data *plat_data,
 		       struct drm_connector *connector,
@@ -131,6 +182,7 @@ static void rockchip_dp_drm_encoder_mode_set(struct drm_encoder *encoder,
 	/* do nothing */
 }
 
+
 static void rockchip_dp_drm_encoder_enable(struct drm_encoder *encoder)
 {
 	struct rockchip_dp_device *dp = to_dp(encoder);
@@ -322,6 +374,19 @@ static int rockchip_dp_bind(struct device *dev, struct device *master,
 	dp->plat_data.power_off = rockchip_dp_powerdown;
 	dp->plat_data.mode_valid = rockchip_dp_mode_valid;
 
+	dp->psr_nb.notifier_call = psr_notify;
+	rockchip_drm_vblank_register_notifier(&dp->psr_nb);
+
+	dp->dp_workq = create_singlethread_workqueue("dp");
+	if (!dp->dp_workq) {
+		dev_err(dp->dev, "failed to create workqueue\n");
+		return PTR_ERR(dp->dp_workq);
+	}
+
+	dp->psr_state = 0;
+	mutex_init(&dp->psr_state_mutex);
+	INIT_WORK(&dp->psr_work, dp_psr_work);
+
 	return analogix_dp_bind(dev, dp->drm_dev, &dp->plat_data);
 }
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_notify.c b/drivers/gpu/drm/rockchip/rockchip_drm_notify.c
index 84111d9..652f03f 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_notify.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_notify.c
@@ -1,7 +1,9 @@
 #include "rockchip_drm_notify.h"
 
 static RAW_NOTIFIER_HEAD(vblank_chain);
+static RAW_NOTIFIER_HEAD(psr_ready_chain);
 static DEFINE_MUTEX(vblank_lock);
+static DEFINE_MUTEX(psr_ready_lock);
 
 /**
  * rockchip_drm_vblank_enable - Send Vblank enable event. Will only enable send
@@ -64,3 +66,40 @@ int rockchip_drm_vblank_unregister_notifier(struct notifier_block *nb)
 	return ret;
 }
 EXPORT_SYMBOL_GPL(rockchip_drm_vblank_unregister_notifier);
+
+
+int rockchip_drm_psr_ready_register_notifier(struct notifier_block *nb)
+{
+	int ret = 0;
+
+	if (!nb)
+		return -EINVAL;
+
+	ret = raw_notifier_chain_register(&psr_ready_chain, nb);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(rockchip_drm_psr_ready_register_notifier);
+
+int rockchip_drm_psr_ready_unregister_notifier(struct notifier_block *nb)
+{
+	int ret = 0;
+
+	if (!nb)
+		return -EINVAL;
+
+	ret = raw_notifier_chain_unregister(&psr_ready_chain, nb);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(rockchip_drm_psr_ready_unregister_notifier);
+
+int rockchip_psr_ready_wait(void)
+{
+	int ret;
+
+	ret = raw_notifier_call_chain(&psr_ready_chain, 0, 0);
+	if (ret == NOTIFY_BAD)
+		return -ETIMEDOUT;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(rockchip_psr_ready_wait);
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_notify.h b/drivers/gpu/drm/rockchip/rockchip_drm_notify.h
index 2f28afa..34614fc 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_notify.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_notify.h
@@ -26,4 +26,8 @@ void rockchip_drm_vblank_disable(void);
 int rockchip_drm_vblank_register_notifier(struct notifier_block *nb);
 int rockchip_drm_vblank_unregister_notifier(struct notifier_block *nb);
 
+int rockchip_psr_ready_wait(void);
+int rockchip_drm_psr_ready_register_notifier(struct notifier_block *nb);
+int rockchip_drm_psr_ready_unregister_notifier(struct notifier_block *nb);
+
 #endif /* __ROCKCHIP_DRM_NOTIFY_H */
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index fb6ce4b..53d1809 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -118,6 +118,9 @@ struct vop {
 	struct completion wait_update_complete;
 	struct drm_pending_vblank_event *event;
 
+	struct notifier_block psr_prepare_nb;
+	struct completion line_flag_completion;
+
 	const struct vop_data *data;
 
 	uint32_t *regsbak;
@@ -428,6 +431,59 @@ static void vop_dsp_hold_valid_irq_disable(struct vop *vop)
 	spin_unlock_irqrestore(&vop->irq_lock, flags);
 }
 
+/*
+ * (1) each frame starts at the start of the Vsync pulse which is signaled by
+ *     the "FRAME_SYNC" interrupt.
+ * (2) the active data region of each frame ends at dsp_vact_end
+ * (3) we should program this same number (dsp_vact_end) into dsp_line_frag_num,
+ *      to get "LINE_FLAG" interrupt at the end of the active on screen data.
+ *
+ * VOP_INTR_CTRL0.dsp_line_frag_num = VOP_DSP_VACT_ST_END.dsp_vact_end
+ * Interrupts
+ * LINE_FLAG -------------------------------+
+ * FRAME_SYNC ----+                         |
+ *                |                         |
+ *                v                         v
+ *                | Vsync | Vbp |  Vactive  | Vfp |
+ *                        ^     ^           ^     ^
+ *                        |     |           |     |
+ *                        |     |           |     |
+ * dsp_vs_end ------------+     |           |     |   VOP_DSP_VTOTAL_VS_END
+ * dsp_vact_start --------------+           |     |   VOP_DSP_VACT_ST_END
+ * dsp_vact_end ----------------------------+     |   VOP_DSP_VACT_ST_END
+ * dsp_total -------------------------------------+   VOP_DSP_VTOTAL_VS_END
+ */
+
+static void vop_line_flag_irq_enable(struct vop *vop, int line_num)
+{
+	unsigned long flags;
+
+	if (WARN_ON(!vop->is_enabled))
+		return;
+
+	spin_lock_irqsave(&vop->irq_lock, flags);
+
+	VOP_CTRL_SET(vop, line_flag_num_0, line_num);
+	VOP_INTR_SET_TYPE(vop, enable, LINE_FLAG_INTR, 1);
+	vop_cfg_done(vop);
+
+	spin_unlock_irqrestore(&vop->irq_lock, flags);
+}
+
+static void vop_line_flag_irq_disable(struct vop *vop)
+{
+	unsigned long flags;
+
+	if (WARN_ON(!vop->is_enabled))
+		return;
+
+	spin_lock_irqsave(&vop->irq_lock, flags);
+
+	VOP_INTR_SET_TYPE(vop, enable, LINE_FLAG_INTR, 0);
+
+	spin_unlock_irqrestore(&vop->irq_lock, flags);
+}
+
 static void vop_enable(struct drm_crtc *crtc)
 {
 	struct vop *vop = to_vop(crtc);
@@ -1128,6 +1184,30 @@ static void vop_handle_vblank(struct vop *vop)
 		complete(&vop->wait_update_complete);
 }
 
+static int psr_prepare_notify(struct notifier_block *psr_prepare_nb,
+			      unsigned long action, void *data)
+{
+	struct vop *vop = container_of(psr_prepare_nb, struct vop,
+				       psr_prepare_nb);
+	struct drm_display_mode *mode = &vop->crtc.mode;
+	int vact_end = mode->vtotal - mode->vsync_start + mode->vdisplay;
+	unsigned long jiffies_left;
+
+	reinit_completion(&vop->line_flag_completion);
+	vop_line_flag_irq_enable(vop, vact_end);
+
+	jiffies_left = wait_for_completion_timeout(&vop->line_flag_completion,
+						   msecs_to_jiffies(200));
+	vop_line_flag_irq_disable(vop);
+
+	if (jiffies_left == 0) {
+		dev_err(vop->dev, "Timeout waiting for IRQ\n");
+		return NOTIFY_BAD;
+	}
+
+	return NOTIFY_STOP;
+}
+
 static irqreturn_t vop_isr(int irq, void *data)
 {
 	struct vop *vop = data;
@@ -1159,6 +1239,13 @@ static irqreturn_t vop_isr(int irq, void *data)
 		ret = IRQ_HANDLED;
 	}
 
+	if (active_irqs & LINE_FLAG_INTR) {
+		if (!completion_done(&vop->line_flag_completion))
+			complete(&vop->line_flag_completion);
+		active_irqs &= ~LINE_FLAG_INTR;
+		ret = IRQ_HANDLED;
+	}
+
 	if (active_irqs & FS_INTR) {
 		drm_crtc_handle_vblank(crtc);
 		vop_handle_vblank(vop);
@@ -1255,8 +1342,12 @@ static int vop_create_crtc(struct vop *vop)
 		goto err_cleanup_crtc;
 	}
 
+	vop->psr_prepare_nb.notifier_call = psr_prepare_notify;
+	rockchip_drm_psr_ready_register_notifier(&vop->psr_prepare_nb);
+
 	init_completion(&vop->dsp_hold_completion);
 	init_completion(&vop->wait_update_complete);
+	init_completion(&vop->line_flag_completion);
 	crtc->port = port;
 	rockchip_register_crtc_funcs(crtc, &private_crtc_funcs);
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
index ff4f52e..34fcd03 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
@@ -61,6 +61,9 @@ struct vop_ctrl {
 	struct vop_reg hpost_st_end;
 	struct vop_reg vpost_st_end;
 
+	struct vop_reg line_flag_num_0;
+	struct vop_reg line_flag_num_1;
+
 	struct vop_reg cfg_done;
 };
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
index 6f42e56..bf78892 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
@@ -299,6 +299,8 @@ static const struct vop_ctrl rk3399_ctrl_data = {
 	.vact_st_end = VOP_REG(RK3399_DSP_VACT_ST_END, 0x1fff1fff, 0),
 	.hpost_st_end = VOP_REG(RK3399_POST_DSP_HACT_INFO, 0x1fff1fff, 0),
 	.vpost_st_end = VOP_REG(RK3399_POST_DSP_VACT_INFO, 0x1fff1fff, 0),
+	.line_flag_num_0 = VOP_REG(RK3399_LINE_FLAG, 0xffff, 0),
+	.line_flag_num_1 = VOP_REG(RK3399_LINE_FLAG, 0xffff, 16),
 	.cfg_done = VOP_REG_MASK(RK3399_REG_CFG_DONE, 0x1, 0),
 };
 
diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index 9ef89de..dd38527 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -41,6 +41,9 @@ struct analogix_dp_plat_data {
 					   struct drm_display_mode *);
 };
 
+int analogix_dp_actice_psr(struct device *dev);
+int analogix_dp_inactice_psr(struct device *dev);
+
 int analogix_dp_resume(struct device *dev);
 int analogix_dp_suspend(struct device *dev);
 
-- 
1.9.1
