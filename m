From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [RFC v2 PATCH v2 06/14] drm/exynos: support MIPI DSI command mode
Date: Mon, 21 Apr 2014 21:28:33 +0900
Message-ID: <1398083321-8668-7-git-send-email-yj44.cho@samsung.com>
References: <1398083321-8668-1-git-send-email-yj44.cho@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:29158 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751858AbaDUM2t (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Apr 2014 08:28:49 -0400
In-reply-to: <1398083321-8668-1-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, thierry.reding@gmail.com, kyungmin.park@samsung.com, inki.dae@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com, laurent.pinchart@ideasonboard.com, sachin.kamat@linaro.org

This patch adds I80 interface for FIMD to support command mode panel.

For this, the below features are added:
- Sets display interface mode relevant registers properly according to the
  interface type from DT
- Adds drm_panel_cpu_timings structure
 . The command mode panel sets them as the private attributes in struct
   drm_display_mode and FIMD gets them by fimd_mode_set().
- Adds TE interrupt handler
  . FIMD driver should know TE signal from lcd panel to avoid tearing issue.
- Adds trigger feature
  . In case of command mode panel, FIMD should set trigger bit,
    so that image data has to be transferred to display bus or lcd panel.

Changelog v2:
- Moves CPU timings relevant properties to panel DT
  (commented by Laurent Pinchart, Andrzej Hajda)

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/gpu/drm/exynos/Kconfig           |    1 +
 drivers/gpu/drm/exynos/exynos_drm_crtc.c |   11 ++
 drivers/gpu/drm/exynos/exynos_drm_crtc.h |    2 +
 drivers/gpu/drm/exynos/exynos_drm_drv.h  |    2 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c  |   13 ++
 drivers/gpu/drm/exynos/exynos_drm_fimd.c |  280 +++++++++++++++++++++++++-----
 include/drm/drm_mipi_dsi.h               |    2 +
 include/drm/drm_panel.h                  |    7 +
 include/video/samsung_fimd.h             |    3 +-
 9 files changed, 277 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 5bf5bca..f4d34f0 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -28,6 +28,7 @@ config DRM_EXYNOS_FIMD
 	bool "Exynos DRM FIMD"
 	depends on DRM_EXYNOS && !FB_S3C && !ARCH_MULTIPLATFORM
 	select FB_MODE_HELPERS
+	select MFD_SYSCON
 	help
 	  Choose this option if you want to use Exynos FIMD for DRM.
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 1419d11..d902d64 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -491,3 +491,14 @@ void exynos_drm_crtc_complete_scanout(struct drm_framebuffer *fb)
 			manager->ops->wait_for_vblank(manager);
 	}
 }
+
+int exynos_drm_crtc_te_handler(struct drm_crtc *crtc)
+{
+	struct exynos_drm_manager *manager = to_exynos_crtc(crtc)->manager;
+	int ret = 0;
+
+	if (manager->ops->te_handler)
+		ret = manager->ops->te_handler(manager);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.h b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
index c27b66c..8482df2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
@@ -32,4 +32,6 @@ void exynos_drm_crtc_plane_commit(struct drm_crtc *crtc, int zpos);
 void exynos_drm_crtc_plane_enable(struct drm_crtc *crtc, int zpos);
 void exynos_drm_crtc_plane_disable(struct drm_crtc *crtc, int zpos);
 
+int exynos_drm_crtc_te_handler(struct drm_crtc *crtc);
+
 #endif
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 4c5cf68..7cb0baf 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -186,6 +186,7 @@ struct exynos_drm_display {
  * @win_commit: apply hardware specific overlay data to registers.
  * @win_enable: enable hardware specific overlay.
  * @win_disable: disable hardware specific overlay.
+ * @te_handler: call driver specific TE handler callback.
  */
 struct exynos_drm_manager;
 struct exynos_drm_manager_ops {
@@ -207,6 +208,7 @@ struct exynos_drm_manager_ops {
 	void (*win_commit)(struct exynos_drm_manager *mgr, int zpos);
 	void (*win_enable)(struct exynos_drm_manager *mgr, int zpos);
 	void (*win_disable)(struct exynos_drm_manager *mgr, int zpos);
+	int (*te_handler)(struct exynos_drm_manager *mgr);
 };
 
 /*
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 2cf1f0b..179f2fa 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -23,6 +23,7 @@
 #include <video/mipi_display.h>
 #include <video/videomode.h>
 
+#include "exynos_drm_crtc.h"
 #include "exynos_drm_drv.h"
 
 /* returns true iff both arguments logically differs */
@@ -1032,10 +1033,22 @@ static ssize_t exynos_dsi_host_transfer(struct mipi_dsi_host *host,
 	return (ret < 0) ? ret : xfer.rx_done;
 }
 
+static int exynos_dsi_host_te_handler(struct mipi_dsi_host *host)
+{
+	struct exynos_dsi *dsi = host_to_dsi(host);
+	struct drm_encoder *encoder = dsi->encoder;
+
+	if (!(dsi->state & DSIM_STATE_ENABLED))
+		return -EPERM;
+
+	return exynos_drm_crtc_te_handler(encoder->crtc);
+}
+
 static const struct mipi_dsi_host_ops exynos_dsi_ops = {
 	.attach = exynos_dsi_host_attach,
 	.detach = exynos_dsi_host_detach,
 	.transfer = exynos_dsi_host_transfer,
+	.te_handler = exynos_dsi_host_te_handler,
 };
 
 static int exynos_dsi_poweron(struct exynos_dsi *dsi)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 40fd6cc..36d28e8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -19,11 +19,14 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
 
 #include <video/of_display_timing.h>
 #include <video/of_videomode.h>
 #include <video/samsung_fimd.h>
 #include <drm/exynos_drm.h>
+#include <drm/drm_panel.h>
 
 #include "exynos_drm_drv.h"
 #include "exynos_drm_fbdev.h"
@@ -59,6 +62,22 @@
 /* color key value register for hardware window 1 ~ 4. */
 #define WKEYCON1_BASE(x)		((WKEYCON1 + 0x140) + ((x - 1) * 8))
 
+/* i80 / RGB trigger control register */
+#define TRIGCON				0x1A4
+
+/* display mode change control register except exynos4 */
+#define VIDOUT_CON			0x000
+#define VIDOUT_CON_F_I80_LDI0		(0x2 << 8)
+
+/* i80 interface control for main LDI register */
+#define I80IFCONFAx(x)			(0x1B0 + (x) * 4)
+#define I80IFCONFBx(x)			(0x1B8 + (x) * 4)
+#define LCD_CS_SETUP(x)			((x) << 16)
+#define LCD_WR_SETUP(x)			((x) << 12)
+#define LCD_WR_ACT(x)			((x) << 8)
+#define LCD_WR_HOLD(x)			((x) << 4)
+#define I80IFEN_ENABLE			(1 << 0)
+
 /* FIMD has totally five hardware windows. */
 #define WINDOWS_NR	5
 
@@ -66,10 +85,14 @@
 
 struct fimd_driver_data {
 	unsigned int timing_base;
+	unsigned int lcdblk_off;
+	unsigned int lcdblk_vt_shift;
+	unsigned int lcdblk_bypass_shift;
 
 	unsigned int has_shadowcon:1;
 	unsigned int has_clksel:1;
 	unsigned int has_limited_fmt:1;
+	unsigned int has_vidoutcon:1;
 };
 
 static struct fimd_driver_data s3c64xx_fimd_driver_data = {
@@ -80,12 +103,19 @@ static struct fimd_driver_data s3c64xx_fimd_driver_data = {
 
 static struct fimd_driver_data exynos4_fimd_driver_data = {
 	.timing_base = 0x0,
+	.lcdblk_off = 0x210,
+	.lcdblk_vt_shift = 10,
+	.lcdblk_bypass_shift = 1,
 	.has_shadowcon = 1,
 };
 
 static struct fimd_driver_data exynos5_fimd_driver_data = {
 	.timing_base = 0x20000,
+	.lcdblk_off = 0x214,
+	.lcdblk_vt_shift = 24,
+	.lcdblk_bypass_shift = 15,
 	.has_shadowcon = 1,
+	.has_vidoutcon = 1,
 };
 
 struct fimd_win_data {
@@ -110,15 +140,23 @@ struct fimd_context {
 	struct clk			*bus_clk;
 	struct clk			*lcd_clk;
 	void __iomem			*regs;
+	struct regmap			*sysreg;
 	struct drm_display_mode		mode;
 	struct fimd_win_data		win_data[WINDOWS_NR];
 	unsigned int			default_win;
 	unsigned long			irq_flags;
+	u32				vidcon0;
 	u32				vidcon1;
+	u32				vidout_con;
+	u32				i80ifcon;
+	bool				i80_if;
 	bool				suspended;
 	int				pipe;
 	wait_queue_head_t		wait_vsync_queue;
 	atomic_t			wait_vsync_event;
+	atomic_t			win_updated;
+	atomic_t			triggering;
+	spinlock_t			win_updated_lock;
 
 	struct exynos_drm_panel_info panel;
 	struct fimd_driver_data *driver_data;
@@ -190,6 +228,14 @@ static u32 fimd_calc_clkdiv(struct fimd_context *ctx,
 	unsigned long ideal_clk = mode->htotal * mode->vtotal * mode->vrefresh;
 	u32 clkdiv;
 
+	if (ctx->i80_if) {
+		/*
+		 * The frame done interrupt should be occurred prior to the
+		 * next TE signal.
+		 */
+		ideal_clk *= 2;
+	}
+
 	/* Find the clock divider value that gets us closest to ideal_clk */
 	clkdiv = DIV_ROUND_UP(clk_get_rate(ctx->lcd_clk), ideal_clk);
 
@@ -212,17 +258,28 @@ static void fimd_mode_set(struct exynos_drm_manager *mgr,
 	struct fimd_context *ctx = mgr->ctx;
 
 	drm_mode_copy(&ctx->mode, in_mode);
+
+	if (ctx->i80_if) {
+		struct drm_panel_cpu_timings *cpu_timings =
+						(void *)in_mode->private;
+
+		if (cpu_timings) {
+			ctx->i80ifcon = LCD_CS_SETUP(cpu_timings->cs_setup);
+			ctx->i80ifcon |= LCD_WR_SETUP(cpu_timings->wr_setup);
+			ctx->i80ifcon |= LCD_WR_ACT(cpu_timings->wr_act);
+			ctx->i80ifcon |= LCD_WR_HOLD(cpu_timings->wr_hold);
+		}
+	}
 }
 
 static void fimd_commit(struct exynos_drm_manager *mgr)
 {
 	struct fimd_context *ctx = mgr->ctx;
 	struct drm_display_mode *mode = &ctx->mode;
-	struct fimd_driver_data *driver_data;
-	u32 val, clkdiv, vidcon1;
-	int vsync_len, vbpd, vfpd, hsync_len, hbpd, hfpd;
+	struct fimd_driver_data *driver_data = ctx->driver_data;
+	void *timing_base = ctx->regs + driver_data->timing_base;
+	u32 val, clkdiv;
 
-	driver_data = ctx->driver_data;
 	if (ctx->suspended)
 		return;
 
@@ -230,33 +287,65 @@ static void fimd_commit(struct exynos_drm_manager *mgr)
 	if (mode->htotal == 0 || mode->vtotal == 0)
 		return;
 
-	/* setup polarity values */
-	vidcon1 = ctx->vidcon1;
-	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
-		vidcon1 |= VIDCON1_INV_VSYNC;
-	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
-		vidcon1 |= VIDCON1_INV_HSYNC;
-	writel(vidcon1, ctx->regs + driver_data->timing_base + VIDCON1);
-
-	/* setup vertical timing values. */
-	vsync_len = mode->crtc_vsync_end - mode->crtc_vsync_start;
-	vbpd = mode->crtc_vtotal - mode->crtc_vsync_end;
-	vfpd = mode->crtc_vsync_start - mode->crtc_vdisplay;
-
-	val = VIDTCON0_VBPD(vbpd - 1) |
-		VIDTCON0_VFPD(vfpd - 1) |
-		VIDTCON0_VSPW(vsync_len - 1);
-	writel(val, ctx->regs + driver_data->timing_base + VIDTCON0);
-
-	/* setup horizontal timing values.  */
-	hsync_len = mode->crtc_hsync_end - mode->crtc_hsync_start;
-	hbpd = mode->crtc_htotal - mode->crtc_hsync_end;
-	hfpd = mode->crtc_hsync_start - mode->crtc_hdisplay;
-
-	val = VIDTCON1_HBPD(hbpd - 1) |
-		VIDTCON1_HFPD(hfpd - 1) |
-		VIDTCON1_HSPW(hsync_len - 1);
-	writel(val, ctx->regs + driver_data->timing_base + VIDTCON1);
+	if (ctx->i80_if) {
+		val = ctx->i80ifcon | I80IFEN_ENABLE;
+		writel(val, timing_base + I80IFCONFAx(0));
+
+		/* disable auto frame rate */
+		writel(0, timing_base + I80IFCONFBx(0));
+
+		if (ctx->vidout_con)
+			writel(ctx->vidout_con, timing_base + VIDOUT_CON);
+
+		/* set video type selection to i80 interface */
+		if (ctx->sysreg && regmap_update_bits(ctx->sysreg,
+					driver_data->lcdblk_off,
+					0x3 << driver_data->lcdblk_vt_shift,
+					0x1 << driver_data->lcdblk_vt_shift)) {
+			DRM_ERROR("Failed to update sysreg for i80 i/f.\n");
+			return;
+		}
+	} else {
+		int vsync_len, vbpd, vfpd, hsync_len, hbpd, hfpd;
+		u32 vidcon1;
+
+		/* setup polarity values */
+		vidcon1 = ctx->vidcon1;
+		if (mode->flags & DRM_MODE_FLAG_NVSYNC)
+			vidcon1 |= VIDCON1_INV_VSYNC;
+		if (mode->flags & DRM_MODE_FLAG_NHSYNC)
+			vidcon1 |= VIDCON1_INV_HSYNC;
+		writel(vidcon1, ctx->regs + driver_data->timing_base + VIDCON1);
+
+		/* setup vertical timing values. */
+		vsync_len = mode->crtc_vsync_end - mode->crtc_vsync_start;
+		vbpd = mode->crtc_vtotal - mode->crtc_vsync_end;
+		vfpd = mode->crtc_vsync_start - mode->crtc_vdisplay;
+
+		val = VIDTCON0_VBPD(vbpd - 1) |
+			VIDTCON0_VFPD(vfpd - 1) |
+			VIDTCON0_VSPW(vsync_len - 1);
+		writel(val, ctx->regs + driver_data->timing_base + VIDTCON0);
+
+		/* setup horizontal timing values.  */
+		hsync_len = mode->crtc_hsync_end - mode->crtc_hsync_start;
+		hbpd = mode->crtc_htotal - mode->crtc_hsync_end;
+		hfpd = mode->crtc_hsync_start - mode->crtc_hdisplay;
+
+		val = VIDTCON1_HBPD(hbpd - 1) |
+			VIDTCON1_HFPD(hfpd - 1) |
+			VIDTCON1_HSPW(hsync_len - 1);
+		writel(val, ctx->regs + driver_data->timing_base + VIDTCON1);
+	}
+
+	/* set bypass selection */
+	if (ctx->sysreg && regmap_update_bits(ctx->sysreg,
+				driver_data->lcdblk_off,
+				0x1 << driver_data->lcdblk_bypass_shift,
+				0x1 << driver_data->lcdblk_bypass_shift)) {
+		DRM_ERROR("Failed to update sysreg for bypass setting.\n");
+		return;
+	}
 
 	/* setup horizontal and vertical display size. */
 	val = VIDTCON2_LINEVAL(mode->vdisplay - 1) |
@@ -613,6 +702,14 @@ static void fimd_win_commit(struct exynos_drm_manager *mgr, int zpos)
 	}
 
 	win_data->enabled = true;
+
+	if (ctx->i80_if) {
+		unsigned long flags;
+
+		spin_lock_irqsave(&ctx->win_updated_lock, flags);
+		atomic_set(&ctx->win_updated, 1);
+		spin_unlock_irqrestore(&ctx->win_updated_lock, flags);
+	}
 }
 
 static void fimd_win_disable(struct exynos_drm_manager *mgr, int zpos)
@@ -802,6 +899,68 @@ static void fimd_dpms(struct exynos_drm_manager *mgr, int mode)
 	}
 }
 
+static void fimd_trigger(struct device *dev)
+{
+	struct exynos_drm_manager *mgr = get_fimd_manager(dev);
+	struct fimd_context *ctx = mgr->ctx;
+	struct fimd_driver_data *driver_data = ctx->driver_data;
+	void *timing_base = ctx->regs + driver_data->timing_base;
+	u32 reg;
+
+	atomic_set(&ctx->triggering, 1);
+
+	reg = readl(ctx->regs + VIDINTCON0);
+	reg |= (VIDINTCON0_INT_ENABLE | VIDINTCON0_INT_I80IFDONE |
+						VIDINTCON0_INT_SYSMAINCON);
+	writel(reg, ctx->regs + VIDINTCON0);
+
+	reg = readl(timing_base + TRIGCON);
+	reg |= 1 << 0 | 1 << 1;
+	writel(reg, timing_base + TRIGCON);
+}
+
+static int fimd_te_handler(struct exynos_drm_manager *mgr)
+{
+	struct fimd_context *ctx = mgr->ctx;
+	unsigned long flags;
+
+	/* check the crtc is detached already from encoder */
+	if (ctx->pipe < 0 || !ctx->drm_dev)
+		return -EINVAL;
+
+	 /*
+	 * Skips triggering if in triggering state, because multiple
+	 * triggering request can cause panel reset.
+	 */
+	if (atomic_read(&ctx->triggering))
+		return 0;
+
+	spin_lock_irqsave(&ctx->win_updated_lock, flags);
+
+	/*
+	 * If there is a page flip request, trigger and handle the page flip
+	 * event so that current fb can be updated into panel GRAM.
+	 */
+	if (atomic_read(&ctx->win_updated)) {
+		atomic_set(&ctx->win_updated, 0);
+
+		fimd_trigger(ctx->dev);
+	}
+
+	spin_unlock_irqrestore(&ctx->win_updated_lock, flags);
+
+	/* wake up vsync event queue */
+	if (atomic_read(&ctx->wait_vsync_event)) {
+		atomic_set(&ctx->wait_vsync_event, 0);
+		wake_up(&ctx->wait_vsync_queue);
+
+		if (!atomic_read(&ctx->triggering))
+			drm_handle_vblank(ctx->drm_dev, ctx->pipe);
+	}
+
+	return 0;
+}
+
 static struct exynos_drm_manager_ops fimd_manager_ops = {
 	.initialize = fimd_mgr_initialize,
 	.remove = fimd_mgr_remove,
@@ -815,6 +974,7 @@ static struct exynos_drm_manager_ops fimd_manager_ops = {
 	.win_mode_set = fimd_win_mode_set,
 	.win_commit = fimd_win_commit,
 	.win_disable = fimd_win_disable,
+	.te_handler = fimd_te_handler,
 };
 
 static struct exynos_drm_manager fimd_manager = {
@@ -825,26 +985,40 @@ static struct exynos_drm_manager fimd_manager = {
 static irqreturn_t fimd_irq_handler(int irq, void *dev_id)
 {
 	struct fimd_context *ctx = (struct fimd_context *)dev_id;
-	u32 val;
+	u32 val, clear_bit;
 
 	val = readl(ctx->regs + VIDINTCON1);
 
-	if (val & VIDINTCON1_INT_FRAME)
-		/* VSYNC interrupt */
-		writel(VIDINTCON1_INT_FRAME, ctx->regs + VIDINTCON1);
+	clear_bit = ctx->i80_if ? VIDINTCON1_INT_I80 : VIDINTCON1_INT_FRAME;
+	if (val & clear_bit)
+		writel(clear_bit, ctx->regs + VIDINTCON1);
 
 	/* check the crtc is detached already from encoder */
 	if (ctx->pipe < 0 || !ctx->drm_dev)
 		goto out;
 
-	drm_handle_vblank(ctx->drm_dev, ctx->pipe);
-	exynos_drm_crtc_finish_pageflip(ctx->drm_dev, ctx->pipe);
+	if (ctx->i80_if) {
+		/* unset i80 frame done interrupt */
+		val = readl(ctx->regs + VIDINTCON0);
+		val &= ~(VIDINTCON0_INT_I80IFDONE | VIDINTCON0_INT_SYSMAINCON);
+		writel(val, ctx->regs + VIDINTCON0);
 
-	/* set wait vsync event to zero and wake up queue. */
-	if (atomic_read(&ctx->wait_vsync_event)) {
-		atomic_set(&ctx->wait_vsync_event, 0);
-		wake_up(&ctx->wait_vsync_queue);
+		/* exit triggering mode */
+		atomic_set(&ctx->triggering, 0);
+
+		drm_handle_vblank(ctx->drm_dev, ctx->pipe);
+		exynos_drm_crtc_finish_pageflip(ctx->drm_dev, ctx->pipe);
+	} else {
+		drm_handle_vblank(ctx->drm_dev, ctx->pipe);
+		exynos_drm_crtc_finish_pageflip(ctx->drm_dev, ctx->pipe);
+
+		/* set wait vsync event to zero and wake up queue. */
+		if (atomic_read(&ctx->wait_vsync_event)) {
+			atomic_set(&ctx->wait_vsync_event, 0);
+			wake_up(&ctx->wait_vsync_queue);
+		}
 	}
+
 out:
 	return IRQ_HANDLED;
 }
@@ -866,12 +1040,32 @@ static int fimd_probe(struct platform_device *pdev)
 
 	ctx->dev = dev;
 	ctx->suspended = true;
+	ctx->driver_data = drm_fimd_get_driver_data(pdev);
 
 	if (of_property_read_bool(dev->of_node, "samsung,invert-vden"))
 		ctx->vidcon1 |= VIDCON1_INV_VDEN;
 	if (of_property_read_bool(dev->of_node, "samsung,invert-vclk"))
 		ctx->vidcon1 |= VIDCON1_INV_VCLK;
 
+	if (of_property_read_bool(dev->of_node, "vidout-i80-ldi")) {
+		ctx->i80_if = true;
+
+		if (ctx->driver_data->has_vidoutcon)
+			ctx->vidout_con |= VIDOUT_CON_F_I80_LDI0;
+		else
+			ctx->vidcon0 |= VIDCON0_VIDOUT_I80_LDI0;
+		ctx->vidcon0 |= VIDCON0_DSI_EN;
+
+		spin_lock_init(&ctx->win_updated_lock);
+	}
+
+	ctx->sysreg = syscon_regmap_lookup_by_phandle(dev->of_node,
+							"samsung,sysreg");
+	if (IS_ERR(ctx->sysreg)) {
+		dev_warn(dev, "failed to get system register.\n");
+		ctx->sysreg = NULL;
+	}
+
 	ctx->bus_clk = devm_clk_get(dev, "fimd");
 	if (IS_ERR(ctx->bus_clk)) {
 		dev_err(dev, "failed to get bus clock\n");
@@ -890,7 +1084,8 @@ static int fimd_probe(struct platform_device *pdev)
 	if (IS_ERR(ctx->regs))
 		return PTR_ERR(ctx->regs);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_IRQ, "vsync");
+	res = platform_get_resource_byname(pdev, IORESOURCE_IRQ,
+					ctx->i80_if ? "lcd_sys" : "vsync");
 	if (!res) {
 		dev_err(dev, "irq request failed.\n");
 		return -ENXIO;
@@ -903,7 +1098,6 @@ static int fimd_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ctx->driver_data = drm_fimd_get_driver_data(pdev);
 	init_waitqueue_head(&ctx->wait_vsync_queue);
 	atomic_set(&ctx->wait_vsync_event, 0);
 
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 7209df1..244d197 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -49,6 +49,7 @@ struct mipi_dsi_msg {
  * @detach: detach DSI device from DSI host
  * @transfer: send and/or receive DSI packet, return number of received bytes,
  * 	      or error
+ * @te_handler: call CRTC TE handler callback from DSI host
  */
 struct mipi_dsi_host_ops {
 	int (*attach)(struct mipi_dsi_host *host,
@@ -57,6 +58,7 @@ struct mipi_dsi_host_ops {
 		      struct mipi_dsi_device *dsi);
 	ssize_t (*transfer)(struct mipi_dsi_host *host,
 			    struct mipi_dsi_msg *msg);
+	int (*te_handler)(struct mipi_dsi_host *host);
 };
 
 /**
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index c2ab77a..0ad64ed 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -46,6 +46,13 @@ struct drm_panel {
 	struct list_head list;
 };
 
+struct drm_panel_cpu_timings {
+	unsigned int cs_setup;
+	unsigned int wr_setup;
+	unsigned int wr_act;
+	unsigned int wr_hold;
+};
+
 static inline int drm_panel_disable(struct drm_panel *panel)
 {
 	if (panel && panel->funcs && panel->funcs->disable)
diff --git a/include/video/samsung_fimd.h b/include/video/samsung_fimd.h
index b039320..eaad58b 100644
--- a/include/video/samsung_fimd.h
+++ b/include/video/samsung_fimd.h
@@ -19,6 +19,7 @@
 /* VIDCON0 */
 
 #define VIDCON0					0x00
+#define VIDCON0_DSI_EN				(1 << 30)
 #define VIDCON0_INTERLACE			(1 << 29)
 #define VIDCON0_VIDOUT_MASK			(0x7 << 26)
 #define VIDCON0_VIDOUT_SHIFT			26
@@ -355,7 +356,7 @@
 #define VIDINTCON0_INT_ENABLE			(1 << 0)
 
 #define VIDINTCON1				0x134
-#define VIDINTCON1_INT_I180			(1 << 2)
+#define VIDINTCON1_INT_I80			(1 << 2)
 #define VIDINTCON1_INT_FRAME			(1 << 1)
 #define VIDINTCON1_INT_FIFO			(1 << 0)
 
-- 
1.7.9.5
