From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [PATCH v6 06/14] drm/exynos: fimd: support LCD I80 interface
Date: Thu, 17 Jul 2014 18:01:21 +0900
Message-ID: <1405587689-1466-7-git-send-email-yj44.cho@samsung.com>
References: <1405587689-1466-1-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1405587689-1466-1-git-send-email-yj44.cho@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

To support MIPI command mode based I80 interface panel,
FIMD should do followings:
- Sets LCD I80 interface timings configuration.
- Uses "lcd_sys" as an IRQ resource and sets relevant IRQ configuration.
- Sets LCD block configuration for I80 interface.
- Sets ideal(pixel) clock is 2 times faster than the original one
  to generate frame done IRQ prior to the next TE signal.
- Implements trigger feature that transfers image data if there is page
  flip request, and implements TE handler to call trigger function.

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/gpu/drm/exynos/Kconfig           |   1 +
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 276 ++++++++++++++++++++++++++-----
 include/video/samsung_fimd.h             |   3 +-
 3 files changed, 235 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 178d2a9..9ba1aae 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -28,6 +28,7 @@ config DRM_EXYNOS_FIMD
 	bool "Exynos DRM FIMD"
 	depends on DRM_EXYNOS && !FB_S3C
 	select FB_MODE_HELPERS
+	select MFD_SYSCON
 	help
 	  Choose this option if you want to use Exynos FIMD for DRM.
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 33161ad..28a3168 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -20,6 +20,8 @@
 #include <linux/of_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/component.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
 
 #include <video/of_display_timing.h>
 #include <video/of_videomode.h>
@@ -61,6 +63,24 @@
 /* color key value register for hardware window 1 ~ 4. */
 #define WKEYCON1_BASE(x)		((WKEYCON1 + 0x140) + ((x - 1) * 8))
 
+/* I80 / RGB trigger control register */
+#define TRIGCON				0x1A4
+#define TRGMODE_I80_RGB_ENABLE_I80	(1 << 0)
+#define SWTRGCMD_I80_RGB_ENABLE		(1 << 1)
+
+/* display mode change control register except exynos4 */
+#define VIDOUT_CON			0x000
+#define VIDOUT_CON_F_I80_LDI0		(0x2 << 8)
+
+/* I80 interface control for main LDI register */
+#define I80IFCONFAx(x)			(0x1B0 + (x) * 4)
+#define I80IFCONFBx(x)			(0x1B8 + (x) * 4)
+#define LCD_CS_SETUP(x)			((x) << 16)
+#define LCD_WR_SETUP(x)			((x) << 12)
+#define LCD_WR_ACTIVE(x)		((x) << 8)
+#define LCD_WR_HOLD(x)			((x) << 4)
+#define I80IFEN_ENABLE			(1 << 0)
+
 /* FIMD has totally five hardware windows. */
 #define WINDOWS_NR	5
 
@@ -68,10 +88,14 @@
 
 struct fimd_driver_data {
 	unsigned int timing_base;
+	unsigned int lcdblk_offset;
+	unsigned int lcdblk_vt_shift;
+	unsigned int lcdblk_bypass_shift;
 
 	unsigned int has_shadowcon:1;
 	unsigned int has_clksel:1;
 	unsigned int has_limited_fmt:1;
+	unsigned int has_vidoutcon:1;
 };
 
 static struct fimd_driver_data s3c64xx_fimd_driver_data = {
@@ -82,12 +106,19 @@ static struct fimd_driver_data s3c64xx_fimd_driver_data = {
 
 static struct fimd_driver_data exynos4_fimd_driver_data = {
 	.timing_base = 0x0,
+	.lcdblk_offset = 0x210,
+	.lcdblk_vt_shift = 10,
+	.lcdblk_bypass_shift = 1,
 	.has_shadowcon = 1,
 };
 
 static struct fimd_driver_data exynos5_fimd_driver_data = {
 	.timing_base = 0x20000,
+	.lcdblk_offset = 0x214,
+	.lcdblk_vt_shift = 24,
+	.lcdblk_bypass_shift = 15,
 	.has_shadowcon = 1,
+	.has_vidoutcon = 1,
 };
 
 struct fimd_win_data {
@@ -112,15 +143,22 @@ struct fimd_context {
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
 
 	struct exynos_drm_panel_info panel;
 	struct fimd_driver_data *driver_data;
@@ -243,6 +281,14 @@ static u32 fimd_calc_clkdiv(struct fimd_context *ctx,
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
 
@@ -271,11 +317,10 @@ static void fimd_commit(struct exynos_drm_manager *mgr)
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
 
@@ -283,33 +328,65 @@ static void fimd_commit(struct exynos_drm_manager *mgr)
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
+		/* set video type selection to I80 interface */
+		if (ctx->sysreg && regmap_update_bits(ctx->sysreg,
+					driver_data->lcdblk_offset,
+					0x3 << driver_data->lcdblk_vt_shift,
+					0x1 << driver_data->lcdblk_vt_shift)) {
+			DRM_ERROR("Failed to update sysreg for I80 i/f.\n");
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
+	if (driver_data->has_vidoutcon)
+		writel(ctx->vidout_con, timing_base + VIDOUT_CON);
+
+	/* set bypass selection */
+	if (ctx->sysreg && regmap_update_bits(ctx->sysreg,
+				driver_data->lcdblk_offset,
+				0x1 << driver_data->lcdblk_bypass_shift,
+				0x1 << driver_data->lcdblk_bypass_shift)) {
+		DRM_ERROR("Failed to update sysreg for bypass setting.\n");
+		return;
+	}
 
 	/* setup horizontal and vertical display size. */
 	val = VIDTCON2_LINEVAL(mode->vdisplay - 1) |
@@ -322,7 +399,8 @@ static void fimd_commit(struct exynos_drm_manager *mgr)
 	 * fields of register with prefix '_F' would be updated
 	 * at vsync(same as dma start)
 	 */
-	val = VIDCON0_ENVID | VIDCON0_ENVID_F;
+	val = ctx->vidcon0;
+	val |= VIDCON0_ENVID | VIDCON0_ENVID_F;
 
 	if (ctx->driver_data->has_clksel)
 		val |= VIDCON0_CLKSEL_LCD;
@@ -660,6 +738,9 @@ static void fimd_win_commit(struct exynos_drm_manager *mgr, int zpos)
 	}
 
 	win_data->enabled = true;
+
+	if (ctx->i80_if)
+		atomic_set(&ctx->win_updated, 1);
 }
 
 static void fimd_win_disable(struct exynos_drm_manager *mgr, int zpos)
@@ -838,6 +919,58 @@ static void fimd_dpms(struct exynos_drm_manager *mgr, int mode)
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
+	reg |= (TRGMODE_I80_RGB_ENABLE_I80 | SWTRGCMD_I80_RGB_ENABLE);
+	writel(reg, timing_base + TRIGCON);
+}
+
+static void fimd_te_handler(struct exynos_drm_manager *mgr)
+{
+	struct fimd_context *ctx = mgr->ctx;
+
+	/* Checks the crtc is detached already from encoder */
+	if (ctx->pipe < 0 || !ctx->drm_dev)
+		return;
+
+	 /*
+	 * Skips to trigger if in triggering state, because multiple triggering
+	 * requests can cause panel reset.
+	 */
+	if (atomic_read(&ctx->triggering))
+		return;
+
+	/*
+	 * If there is a page flip request, triggers and handles the page flip
+	 * event so that current fb can be updated into panel GRAM.
+	 */
+	if (atomic_add_unless(&ctx->win_updated, -1, 0))
+		fimd_trigger(ctx->dev);
+
+	/* Wakes up vsync event queue */
+	if (atomic_read(&ctx->wait_vsync_event)) {
+		atomic_set(&ctx->wait_vsync_event, 0);
+		wake_up(&ctx->wait_vsync_queue);
+
+		if (!atomic_read(&ctx->triggering))
+			drm_handle_vblank(ctx->drm_dev, ctx->pipe);
+	}
+}
+
 static struct exynos_drm_manager_ops fimd_manager_ops = {
 	.dpms = fimd_dpms,
 	.mode_fixup = fimd_mode_fixup,
@@ -849,6 +982,7 @@ static struct exynos_drm_manager_ops fimd_manager_ops = {
 	.win_mode_set = fimd_win_mode_set,
 	.win_commit = fimd_win_commit,
 	.win_disable = fimd_win_disable,
+	.te_handler = fimd_te_handler,
 };
 
 static struct exynos_drm_manager fimd_manager = {
@@ -859,26 +993,40 @@ static struct exynos_drm_manager fimd_manager = {
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
+		/* unset I80 frame done interrupt */
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
@@ -923,6 +1071,7 @@ static int fimd_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct fimd_context *ctx;
+	struct device_node *i80_if_timings;
 	struct resource *res;
 	int ret = -EINVAL;
 
@@ -944,12 +1093,51 @@ static int fimd_probe(struct platform_device *pdev)
 
 	ctx->dev = dev;
 	ctx->suspended = true;
+	ctx->driver_data = drm_fimd_get_driver_data(pdev);
 
 	if (of_property_read_bool(dev->of_node, "samsung,invert-vden"))
 		ctx->vidcon1 |= VIDCON1_INV_VDEN;
 	if (of_property_read_bool(dev->of_node, "samsung,invert-vclk"))
 		ctx->vidcon1 |= VIDCON1_INV_VCLK;
 
+	i80_if_timings = of_get_child_by_name(dev->of_node, "i80-if-timings");
+	if (i80_if_timings) {
+		u32 val;
+
+		ctx->i80_if = true;
+
+		if (ctx->driver_data->has_vidoutcon)
+			ctx->vidout_con |= VIDOUT_CON_F_I80_LDI0;
+		else
+			ctx->vidcon0 |= VIDCON0_VIDOUT_I80_LDI0;
+		/*
+		 * The user manual describes that this "DSI_EN" bit is required
+		 * to enable I80 24-bit data interface.
+		 */
+		ctx->vidcon0 |= VIDCON0_DSI_EN;
+
+		if (of_property_read_u32(i80_if_timings, "cs-setup", &val))
+			val = 0;
+		ctx->i80ifcon = LCD_CS_SETUP(val);
+		if (of_property_read_u32(i80_if_timings, "wr-setup", &val))
+			val = 0;
+		ctx->i80ifcon |= LCD_WR_SETUP(val);
+		if (of_property_read_u32(i80_if_timings, "wr-active", &val))
+			val = 1;
+		ctx->i80ifcon |= LCD_WR_ACTIVE(val);
+		if (of_property_read_u32(i80_if_timings, "wr-hold", &val))
+			val = 0;
+		ctx->i80ifcon |= LCD_WR_HOLD(val);
+	}
+	of_node_put(i80_if_timings);
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
@@ -972,7 +1160,8 @@ static int fimd_probe(struct platform_device *pdev)
 		goto err_del_component;
 	}
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_IRQ, "vsync");
+	res = platform_get_resource_byname(pdev, IORESOURCE_IRQ,
+					   ctx->i80_if ? "lcd_sys" : "vsync");
 	if (!res) {
 		dev_err(dev, "irq request failed.\n");
 		ret = -ENXIO;
@@ -986,7 +1175,6 @@ static int fimd_probe(struct platform_device *pdev)
 		goto err_del_component;
 	}
 
-	ctx->driver_data = drm_fimd_get_driver_data(pdev);
 	init_waitqueue_head(&ctx->wait_vsync_queue);
 	atomic_set(&ctx->wait_vsync_event, 0);
 
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
1.9.0
