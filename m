From: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] drivers: phy: exynos-usb2: add support for Exynos 3250
Date: Fri, 04 Jul 2014 14:13:09 +0200
Message-ID: <1404475989-30588-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds support for Exynos3250 SoC to Exynos2USB PHY driver.
Although Exynos3250 has only one device phy interface, the register
layout and all operations that are required to get it enabled are almost
same as on Exynos4x12. The only different is one more register
(REFCLKSEL) which need to be set.

Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/phy/Kconfig               | 12 ++++++------
 drivers/phy/phy-exynos4x12-usb2.c | 18 ++++++++++++++++++
 drivers/phy/phy-samsung-usb2.c    |  6 ++++++
 drivers/phy/phy-samsung-usb2.h    |  2 ++
 4 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 16a2f067c242..58737b9eaa6e 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -141,14 +141,14 @@ config PHY_EXYNOS4210_USB2
 	  phys are available - device, host, HSIC0 and HSIC1.
 
 config PHY_EXYNOS4X12_USB2
-	bool "Support for Exynos 4x12"
+	bool "Support for Exynos 3250/4x12"
 	depends on PHY_SAMSUNG_USB2
-	depends on (SOC_EXYNOS4212 || SOC_EXYNOS4412)
+	depends on (SOC_EXYNOS3250 || SOC_EXYNOS4212 || SOC_EXYNOS4412)
 	help
-	  Enable USB PHY support for Exynos 4x12. This option requires that
-	  Samsung USB 2.0 PHY driver is enabled and means that support for this
-	  particular SoC is compiled in the driver. In case of Exynos 4x12 four
-	  phys are available - device, host, HSIC0 and HSIC1.
+	  Enable USB PHY support for Exynos 3250/4x12. This option requires
+	  that Samsung USB 2.0 PHY driver is enabled and means that support for
+	  this particular SoC is compiled in the driver. In case of Exynos 4x12
+	  four phys are available - device, host, HSIC0 and HSIC1.
 
 config PHY_EXYNOS5250_USB2
 	bool "Support for Exynos 5250"
diff --git a/drivers/phy/phy-exynos4x12-usb2.c b/drivers/phy/phy-exynos4x12-usb2.c
index 59d8dd3ff390..b29bbfacd4b5 100644
--- a/drivers/phy/phy-exynos4x12-usb2.c
+++ b/drivers/phy/phy-exynos4x12-usb2.c
@@ -67,6 +67,12 @@
 #define EXYNOS_4x12_UPHYCLK_PHYFSEL_24MHZ	(0x5 << 0)
 #define EXYNOS_4x12_UPHYCLK_PHYFSEL_50MHZ	(0x7 << 0)
 
+#define EXYNOS_4212_UPHYCLK_PHY0_ID_PULLUP	(0x1 << 3)
+#define EXYNOS_4212_UPHYCLK_PHY0_COMMON_ON	(0x1 << 4)
+#define EXYNOS_4212_UPHYCLK_PHY1_COMMON_ON	(0x1 << 7)
+
+#define EXYNOS_3250_UPHYCLK_REFCLKSEL		(0x2 << 8)
+
 #define EXYNOS_4x12_UPHYCLK_PHY0_ID_PULLUP	BIT(3)
 #define EXYNOS_4x12_UPHYCLK_PHY0_COMMON_ON	BIT(4)
 #define EXYNOS_4x12_UPHYCLK_PHY1_COMMON_ON	BIT(7)
@@ -197,6 +203,10 @@ static void exynos4x12_setup_clk(struct samsung_usb2_phy_instance *inst)
 
 	clk = readl(drv->reg_phy + EXYNOS_4x12_UPHYCLK);
 	clk &= ~EXYNOS_4x12_UPHYCLK_PHYFSEL_MASK;
+
+	if (drv->cfg->has_refclk_sel)
+		clk = EXYNOS_3250_UPHYCLK_REFCLKSEL;
+
 	clk |= drv->ref_reg_val << EXYNOS_4x12_UPHYCLK_PHYFSEL_OFFSET;
 	clk |= EXYNOS_4x12_UPHYCLK_PHY1_COMMON_ON;
 	writel(clk, drv->reg_phy + EXYNOS_4x12_UPHYCLK);
@@ -358,6 +368,14 @@ static const struct samsung_usb2_common_phy exynos4x12_phys[] = {
 	{},
 };
 
+const struct samsung_usb2_phy_config exynos3250_usb2_phy_config = {
+	.has_mode_switch	= 1,
+	.has_refclk_sel		= 1,
+	.num_phys		= 1,
+	.phys			= exynos4x12_phys,
+	.rate_to_clk		= exynos4x12_rate_to_clk,
+};
+
 const struct samsung_usb2_phy_config exynos4x12_usb2_phy_config = {
 	.has_mode_switch	= 1,
 	.num_phys		= EXYNOS4x12_NUM_PHYS,
diff --git a/drivers/phy/phy-samsung-usb2.c b/drivers/phy/phy-samsung-usb2.c
index 8a8c6bc8709a..36db8eb8c5f4 100644
--- a/drivers/phy/phy-samsung-usb2.c
+++ b/drivers/phy/phy-samsung-usb2.c
@@ -87,6 +87,12 @@ static struct phy *samsung_usb2_phy_xlate(struct device *dev,
 }
 
 static const struct of_device_id samsung_usb2_phy_of_match[] = {
+#ifdef CONFIG_PHY_EXYNOS4X12_USB2
+	{
+		.compatible = "samsung,exynos3250-usb2-phy",
+		.data = &exynos3250_usb2_phy_config,
+	},
+#endif
 #ifdef CONFIG_PHY_EXYNOS4210_USB2
 	{
 		.compatible = "samsung,exynos4210-usb2-phy",
diff --git a/drivers/phy/phy-samsung-usb2.h b/drivers/phy/phy-samsung-usb2.h
index 918847843a95..b03da0ef39ac 100644
--- a/drivers/phy/phy-samsung-usb2.h
+++ b/drivers/phy/phy-samsung-usb2.h
@@ -60,8 +60,10 @@ struct samsung_usb2_phy_config {
 	int (*rate_to_clk)(unsigned long, u32 *);
 	unsigned int num_phys;
 	bool has_mode_switch;
+	bool has_refclk_sel;
 };
 
+extern const struct samsung_usb2_phy_config exynos3250_usb2_phy_config;
 extern const struct samsung_usb2_phy_config exynos4210_usb2_phy_config;
 extern const struct samsung_usb2_phy_config exynos4x12_usb2_phy_config;
 extern const struct samsung_usb2_phy_config exynos5250_usb2_phy_config;
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
