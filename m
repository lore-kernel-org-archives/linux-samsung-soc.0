From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [PATCH v6 08/14] drm/exynos: dsi: add driver data to support
 Exynos5410/5420/5440 SoCs
Date: Thu, 17 Jul 2014 18:01:23 +0900
Message-ID: <1405587689-1466-9-git-send-email-yj44.cho@samsung.com>
References: <1405587689-1466-1-git-send-email-yj44.cho@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:32328 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755180AbaGQJBk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jul 2014 05:01:40 -0400
In-reply-to: <1405587689-1466-1-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, thierry.reding@gmail.com, kyungmin.park@samsung.com, inki.dae@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com

The offset of register DSIM_PLLTMR_REG in Exynos5410 / 5420 / 5440
SoCs is different from the one in Exynos4 SoCs.

In case of Exynos5410 / 5420 / 5440 SoCs, there is no frequency
band bit in DSIM_PLLCTRL_REG, and it uses DSIM_PHYCTRL_REG and
DSIM_PHYTIMING*_REG instead.
So this patch adds driver data to distinguish it.

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 157 +++++++++++++++++++++++++++-----
 1 file changed, 135 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 4997bfe..93ad4a2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -18,6 +18,7 @@
 #include <linux/clk.h>
 #include <linux/gpio/consumer.h>
 #include <linux/irq.h>
+#include <linux/of_device.h>
 #include <linux/of_gpio.h>
 #include <linux/phy/phy.h>
 #include <linux/regulator/consumer.h>
@@ -57,9 +58,12 @@
 
 /* FIFO memory AC characteristic register */
 #define DSIM_PLLCTRL_REG	0x4c	/* PLL control register */
-#define DSIM_PLLTMR_REG		0x50	/* PLL timer register */
 #define DSIM_PHYACCHR_REG	0x54	/* D-PHY AC characteristic register */
 #define DSIM_PHYACCHR1_REG	0x58	/* D-PHY AC characteristic register1 */
+#define DSIM_PHYCTRL_REG	0x5c
+#define DSIM_PHYTIMING_REG	0x64
+#define DSIM_PHYTIMING1_REG	0x68
+#define DSIM_PHYTIMING2_REG	0x6c
 
 /* DSIM_STATUS */
 #define DSIM_STOP_STATE_DAT(x)		(((x) & 0xf) << 0)
@@ -203,6 +207,24 @@
 #define DSIM_PLL_M(x)			((x) << 4)
 #define DSIM_PLL_S(x)			((x) << 1)
 
+/* DSIM_PHYCTRL */
+#define DSIM_PHYCTRL_ULPS_EXIT(x)	(((x) & 0x1ff) << 0)
+
+/* DSIM_PHYTIMING */
+#define DSIM_PHYTIMING_LPX(x)		((x) << 8)
+#define DSIM_PHYTIMING_HS_EXIT(x)	((x) << 0)
+
+/* DSIM_PHYTIMING1 */
+#define DSIM_PHYTIMING1_CLK_PREPARE(x)	((x) << 24)
+#define DSIM_PHYTIMING1_CLK_ZERO(x)	((x) << 16)
+#define DSIM_PHYTIMING1_CLK_POST(x)	((x) << 8)
+#define DSIM_PHYTIMING1_CLK_TRAIL(x)	((x) << 0)
+
+/* DSIM_PHYTIMING2 */
+#define DSIM_PHYTIMING2_HS_PREPARE(x)	((x) << 16)
+#define DSIM_PHYTIMING2_HS_ZERO(x)	((x) << 8)
+#define DSIM_PHYTIMING2_HS_TRAIL(x)	((x) << 0)
+
 #define DSI_MAX_BUS_WIDTH		4
 #define DSI_NUM_VIRTUAL_CHANNELS	4
 #define DSI_TX_FIFO_SIZE		2048
@@ -236,6 +258,12 @@ struct exynos_dsi_transfer {
 #define DSIM_STATE_INITIALIZED		BIT(1)
 #define DSIM_STATE_CMD_LPM		BIT(2)
 
+struct exynos_dsi_driver_data {
+	unsigned int plltmr_reg;
+
+	unsigned int has_freqband:1;
+};
+
 struct exynos_dsi {
 	struct mipi_dsi_host dsi_host;
 	struct drm_connector connector;
@@ -266,11 +294,39 @@ struct exynos_dsi {
 
 	spinlock_t transfer_lock; /* protects transfer_list */
 	struct list_head transfer_list;
+
+	struct exynos_dsi_driver_data *driver_data;
 };
 
 #define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
 #define connector_to_dsi(c) container_of(c, struct exynos_dsi, connector)
 
+static struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
+	.plltmr_reg = 0x50,
+	.has_freqband = 1,
+};
+
+static struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
+	.plltmr_reg = 0x58,
+};
+
+static struct of_device_id exynos_dsi_of_match[] = {
+	{ .compatible = "samsung,exynos4210-mipi-dsi",
+	  .data = &exynos4_dsi_driver_data },
+	{ .compatible = "samsung,exynos5410-mipi-dsi",
+	  .data = &exynos5_dsi_driver_data },
+	{ }
+};
+
+static inline struct exynos_dsi_driver_data *exynos_dsi_get_driver_data(
+						struct platform_device *pdev)
+{
+	const struct of_device_id *of_id =
+			of_match_device(exynos_dsi_of_match, &pdev->dev);
+
+	return (struct exynos_dsi_driver_data *)of_id->data;
+}
+
 static void exynos_dsi_wait_for_reset(struct exynos_dsi *dsi)
 {
 	if (wait_for_completion_timeout(&dsi->completed, msecs_to_jiffies(300)))
@@ -344,14 +400,9 @@ static unsigned long exynos_dsi_pll_find_pms(struct exynos_dsi *dsi,
 static unsigned long exynos_dsi_set_pll(struct exynos_dsi *dsi,
 					unsigned long freq)
 {
-	static const unsigned long freq_bands[] = {
-		100 * MHZ, 120 * MHZ, 160 * MHZ, 200 * MHZ,
-		270 * MHZ, 320 * MHZ, 390 * MHZ, 450 * MHZ,
-		510 * MHZ, 560 * MHZ, 640 * MHZ, 690 * MHZ,
-		770 * MHZ, 870 * MHZ, 950 * MHZ,
-	};
+	struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
 	unsigned long fin, fout;
-	int timeout, band;
+	int timeout;
 	u8 p, s;
 	u16 m;
 	u32 reg;
@@ -372,18 +423,30 @@ static unsigned long exynos_dsi_set_pll(struct exynos_dsi *dsi,
 			"failed to find PLL PMS for requested frequency\n");
 		return -EFAULT;
 	}
+	dev_dbg(dsi->dev, "PLL freq %lu, (p %d, m %d, s %d)\n", fout, p, m, s);
 
-	for (band = 0; band < ARRAY_SIZE(freq_bands); ++band)
-		if (fout < freq_bands[band])
-			break;
+	writel(500, dsi->reg_base + driver_data->plltmr_reg);
+
+	reg = DSIM_PLL_EN | DSIM_PLL_P(p) | DSIM_PLL_M(m) | DSIM_PLL_S(s);
+
+	if (driver_data->has_freqband) {
+		static const unsigned long freq_bands[] = {
+			100 * MHZ, 120 * MHZ, 160 * MHZ, 200 * MHZ,
+			270 * MHZ, 320 * MHZ, 390 * MHZ, 450 * MHZ,
+			510 * MHZ, 560 * MHZ, 640 * MHZ, 690 * MHZ,
+			770 * MHZ, 870 * MHZ, 950 * MHZ,
+		};
+		int band;
 
-	dev_dbg(dsi->dev, "PLL freq %lu, (p %d, m %d, s %d), band %d\n", fout,
-		p, m, s, band);
+		for (band = 0; band < ARRAY_SIZE(freq_bands); ++band)
+			if (fout < freq_bands[band])
+				break;
 
-	writel(500, dsi->reg_base + DSIM_PLLTMR_REG);
+		dev_dbg(dsi->dev, "band %d\n", band);
+
+		reg |= DSIM_FREQ_BAND(band);
+	}
 
-	reg = DSIM_FREQ_BAND(band) | DSIM_PLL_EN
-			| DSIM_PLL_P(p) | DSIM_PLL_M(m) | DSIM_PLL_S(s);
 	writel(reg, dsi->reg_base + DSIM_PLLCTRL_REG);
 
 	timeout = 1000;
@@ -437,6 +500,59 @@ static int exynos_dsi_enable_clock(struct exynos_dsi *dsi)
 	return 0;
 }
 
+static void exynos_dsi_set_phy_ctrl(struct exynos_dsi *dsi)
+{
+	struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
+	u32 reg;
+
+	if (driver_data->has_freqband)
+		return;
+
+	/* B D-PHY: D-PHY Master & Slave Analog Block control */
+	reg = DSIM_PHYCTRL_ULPS_EXIT(0x0af);
+	writel(reg, dsi->reg_base + DSIM_PHYCTRL_REG);
+
+	/*
+	 * T LPX: Transmitted length of any Low-Power state period
+	 * T HS-EXIT: Time that the transmitter drives LP-11 following a HS
+	 *	burst
+	 */
+	reg = DSIM_PHYTIMING_LPX(0x06) | DSIM_PHYTIMING_HS_EXIT(0x0b);
+	writel(reg, dsi->reg_base + DSIM_PHYTIMING_REG);
+
+	/*
+	 * T CLK-PREPARE: Time that the transmitter drives the Clock Lane LP-00
+	 *	Line state immediately before the HS-0 Line state starting the
+	 *	HS transmission
+	 * T CLK-ZERO: Time that the transmitter drives the HS-0 state prior to
+	 *	transmitting the Clock.
+	 * T CLK_POST: Time that the transmitter continues to send HS clock
+	 *	after the last associated Data Lane has transitioned to LP Mode
+	 *	Interval is defined as the period from the end of T HS-TRAIL to
+	 *	the beginning of T CLK-TRAIL
+	 * T CLK-TRAIL: Time that the transmitter drives the HS-0 state after
+	 *	the last payload clock bit of a HS transmission burst
+	 */
+	reg = DSIM_PHYTIMING1_CLK_PREPARE(0x07) |
+			DSIM_PHYTIMING1_CLK_ZERO(0x27) |
+			DSIM_PHYTIMING1_CLK_POST(0x0d) |
+			DSIM_PHYTIMING1_CLK_TRAIL(0x08);
+	writel(reg, dsi->reg_base + DSIM_PHYTIMING1_REG);
+
+	/*
+	 * T HS-PREPARE: Time that the transmitter drives the Data Lane LP-00
+	 *	Line state immediately before the HS-0 Line state starting the
+	 *	HS transmission
+	 * T HS-ZERO: Time that the transmitter drives the HS-0 state prior to
+	 *	transmitting the Sync sequence.
+	 * T HS-TRAIL: Time that the transmitter drives the flipped differential
+	 *	state after last payload data bit of a HS transmission burst
+	 */
+	reg = DSIM_PHYTIMING2_HS_PREPARE(0x09) | DSIM_PHYTIMING2_HS_ZERO(0x0d) |
+			DSIM_PHYTIMING2_HS_TRAIL(0x0b);
+	writel(reg, dsi->reg_base + DSIM_PHYTIMING2_REG);
+}
+
 static void exynos_dsi_disable_clock(struct exynos_dsi *dsi)
 {
 	u32 reg;
@@ -987,10 +1103,11 @@ static void exynos_dsi_disable_irq(struct exynos_dsi *dsi)
 
 static int exynos_dsi_init(struct exynos_dsi *dsi)
 {
-	exynos_dsi_enable_clock(dsi);
 	exynos_dsi_reset(dsi);
 	exynos_dsi_enable_irq(dsi);
+	exynos_dsi_enable_clock(dsi);
 	exynos_dsi_wait_for_reset(dsi);
+	exynos_dsi_set_phy_ctrl(dsi);
 	exynos_dsi_init_link(dsi);
 
 	return 0;
@@ -1544,6 +1661,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	dsi->dsi_host.dev = &pdev->dev;
 
 	dsi->dev = &pdev->dev;
+	dsi->driver_data = exynos_dsi_get_driver_data(pdev);
 
 	ret = exynos_dsi_parse_dt(dsi);
 	if (ret)
@@ -1626,11 +1744,6 @@ static int exynos_dsi_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static struct of_device_id exynos_dsi_of_match[] = {
-	{ .compatible = "samsung,exynos4210-mipi-dsi" },
-	{ }
-};
-
 struct platform_driver dsi_driver = {
 	.probe = exynos_dsi_probe,
 	.remove = exynos_dsi_remove,
-- 
1.9.0
