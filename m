From: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 1/4 v2] iio: exyno-adc: use syscon for PMU register access
Date: Thu, 17 Jul 2014 16:49:50 +0530
Message-ID: <1405595993-16661-2-git-send-email-ch.naveen@samsung.com>
References: <1405595993-16661-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1405595993-16661-1-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch updates the IIO based ADC driver to use syscon and regmap
APIs to access and use PMU registers instead of remapping the PMU
registers in the driver.

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
Changes since v1:
None

 drivers/iio/adc/exynos_adc.c |   29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
index b63e882..60847ef 100644
--- a/drivers/iio/adc/exynos_adc.c
+++ b/drivers/iio/adc/exynos_adc.c
@@ -38,6 +38,8 @@
 #include <linux/iio/iio.h>
 #include <linux/iio/machine.h>
 #include <linux/iio/driver.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
 
 /* EXYNOS4412/5250 ADC_V1 registers definitions */
 #define ADC_V1_CON(x)		((x) + 0x00)
@@ -79,11 +81,14 @@
 
 #define EXYNOS_ADC_TIMEOUT	(msecs_to_jiffies(100))
 
+#define EXYNOS_ADCV1_PHY_OFFSET	0x0718
+#define EXYNOS_ADCV2_PHY_OFFSET	0x0720
+
 struct exynos_adc {
 	struct exynos_adc_data	*data;
 	struct device		*dev;
 	void __iomem		*regs;
-	void __iomem		*enable_reg;
+	struct regmap		*pmu_map;
 	struct clk		*clk;
 	struct clk		*sclk;
 	unsigned int		irq;
@@ -98,6 +103,7 @@ struct exynos_adc {
 struct exynos_adc_data {
 	int num_channels;
 	bool needs_sclk;
+	int phy_offset;
 
 	void (*init_hw)(struct exynos_adc *info);
 	void (*exit_hw)(struct exynos_adc *info);
@@ -169,7 +175,7 @@ static void exynos_adc_v1_init_hw(struct exynos_adc *info)
 {
 	u32 con1;
 
-	writel(1, info->enable_reg);
+	regmap_write(info->pmu_map, info->data->phy_offset, 1);
 
 	/* set default prescaler values and Enable prescaler */
 	con1 =  ADC_V1_CON_PRSCLV(49) | ADC_V1_CON_PRSCEN;
@@ -183,7 +189,7 @@ static void exynos_adc_v1_exit_hw(struct exynos_adc *info)
 {
 	u32 con;
 
-	writel(0, info->enable_reg);
+	regmap_write(info->pmu_map, info->data->phy_offset, 0);
 
 	con = readl(ADC_V1_CON(info->regs));
 	con |= ADC_V1_CON_STANDBY;
@@ -208,6 +214,7 @@ static void exynos_adc_v1_start_conv(struct exynos_adc *info,
 
 static struct exynos_adc_data const exynos_adc_v1_data = {
 	.num_channels	= MAX_ADC_V1_CHANNELS,
+	.phy_offset	= EXYNOS_ADCV1_PHY_OFFSET,
 
 	.init_hw	= exynos_adc_v1_init_hw,
 	.exit_hw	= exynos_adc_v1_exit_hw,
@@ -219,7 +226,7 @@ static void exynos_adc_v2_init_hw(struct exynos_adc *info)
 {
 	u32 con1, con2;
 
-	writel(1, info->enable_reg);
+	regmap_write(info->pmu_map, info->data->phy_offset, 1);
 
 	con1 = ADC_V2_CON1_SOFT_RESET;
 	writel(con1, ADC_V2_CON1(info->regs));
@@ -236,7 +243,7 @@ static void exynos_adc_v2_exit_hw(struct exynos_adc *info)
 {
 	u32 con;
 
-	writel(0, info->enable_reg);
+	regmap_write(info->pmu_map, info->data->phy_offset, 0);
 
 	con = readl(ADC_V2_CON1(info->regs));
 	con &= ~ADC_CON_EN_START;
@@ -271,10 +278,12 @@ static void exynos_adc_v2_start_conv(struct exynos_adc *info,
 
 static struct exynos_adc_data const exynos_adc_v2_data = {
 	__EXYNOS_ADC_V2_DATA
+	.phy_offset = EXYNOS_ADCV2_PHY_OFFSET,
 };
 
 static struct exynos_adc_data const exynos3250_adc_v2_data = {
 	__EXYNOS_ADC_V2_DATA
+	.phy_offset = EXYNOS_ADCV1_PHY_OFFSET,
 	.needs_sclk = true,
 };
 
@@ -437,10 +446,12 @@ static int exynos_adc_probe(struct platform_device *pdev)
 	if (IS_ERR(info->regs))
 		return PTR_ERR(info->regs);
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	info->enable_reg = devm_ioremap_resource(&pdev->dev, mem);
-	if (IS_ERR(info->enable_reg))
-		return PTR_ERR(info->enable_reg);
+	info->pmu_map = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
+					"samsung,syscon-phandle");
+	if (IS_ERR(info->pmu_map)) {
+		dev_err(&pdev->dev, "syscon regmap lookup failed.\n");
+		return PTR_ERR(info->pmu_map);
+	}
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
-- 
1.7.9.5
