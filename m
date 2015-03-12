From: Jaewon Kim <jaewon02.kim@samsung.com>
Subject: [PATCH] phy: exynos5-usbdrd: Add to support for Exynos5433 SoC
Date: Thu, 12 Mar 2015 19:11:13 +0900
Message-ID: <1426155073-22356-1-git-send-email-jaewon02.kim@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kamil Debski <k.debski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Vivek Gautam <gautam.vivek@samsung.com>, Felipe Balbi <balbi@ti.com>
Cc: Inki Dae <inki.dae@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, Jaewon Kim <jaewon02.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds driver data to support for Exynos5433 SoC.
The Exynos5433 has one USB3.0 Host and USB3.0 DRD(Dual Role Device).
Exynos5433 is simplar to Eyxnos7 but Exynos5433 have
one more USB3.0 Host controller.

Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
---
 .../devicetree/bindings/phy/samsung-phy.txt        |    3 ++-
 drivers/phy/phy-exynos5-usbdrd.c                   |   10 ++++++++++
 include/linux/mfd/syscon/exynos5-pmu.h             |    3 +++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/samsung-phy.txt b/Documentation/devicetree/bindings/phy/samsung-phy.txt
index 91e38cf..60c6f2a 100644
--- a/Documentation/devicetree/bindings/phy/samsung-phy.txt
+++ b/Documentation/devicetree/bindings/phy/samsung-phy.txt
@@ -128,6 +128,7 @@ Required properties:
 - compatible : Should be set to one of the following supported values:
 	- "samsung,exynos5250-usbdrd-phy" - for exynos5250 SoC,
 	- "samsung,exynos5420-usbdrd-phy" - for exynos5420 SoC.
+	- "samsung,exynos5433-usbdrd-phy" - for exynos5433 SoC.
 	- "samsung,exynos7-usbdrd-phy" - for exynos7 SoC.
 - reg : Register offset and length of USB DRD PHY register set;
 - clocks: Clock IDs array as required by the controller
@@ -139,7 +140,7 @@ Required properties:
 	       PHY operations, associated by phy name. It is used to
 	       determine bit values for clock settings register.
 	       For Exynos5420 this is given as 'sclk_usbphy30' in CMU.
-	- optional clocks: Exynos7 SoC has now following additional
+	- optional clocks: Exynos5433 & Exynos7 SoC has now following additional
 			   gate clocks available:
 			   - phy_pipe: for PIPE3 phy
 			   - phy_utmi: for UTMI+ phy
diff --git a/drivers/phy/phy-exynos5-usbdrd.c b/drivers/phy/phy-exynos5-usbdrd.c
index 0437401..597e7dd 100644
--- a/drivers/phy/phy-exynos5-usbdrd.c
+++ b/drivers/phy/phy-exynos5-usbdrd.c
@@ -624,6 +624,13 @@ static const struct exynos5_usbdrd_phy_drvdata exynos5250_usbdrd_phy = {
 	.has_common_clk_gate	= true,
 };
 
+static const struct exynos5_usbdrd_phy_drvdata exynos5433_usbdrd_phy = {
+	.phy_cfg		= phy_cfg_exynos5,
+	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
+	.pmu_offset_usbdrd1_phy	= EXYNOS5433_USBHOST30_PHY_CONTROL,
+	.has_common_clk_gate	= false,
+};
+
 static const struct exynos5_usbdrd_phy_drvdata exynos7_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos5,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
@@ -638,6 +645,9 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
 		.compatible = "samsung,exynos5420-usbdrd-phy",
 		.data = &exynos5420_usbdrd_phy
 	}, {
+		.compatible = "samsung,exynos5433-usbdrd-phy",
+		.data = &exynos5433_usbdrd_phy
+	}, {
 		.compatible = "samsung,exynos7-usbdrd-phy",
 		.data = &exynos7_usbdrd_phy
 	},
diff --git a/include/linux/mfd/syscon/exynos5-pmu.h b/include/linux/mfd/syscon/exynos5-pmu.h
index 00ef24b..9352adc 100644
--- a/include/linux/mfd/syscon/exynos5-pmu.h
+++ b/include/linux/mfd/syscon/exynos5-pmu.h
@@ -36,6 +36,9 @@
 #define EXYNOS5420_MTCADC_PHY_CONTROL		(0x724)
 #define EXYNOS5420_DPTX_PHY_CONTROL		(0x728)
 
+/* Exynos5433 specific register definitions */
+#define EXYNOS5433_USBHOST30_PHY_CONTROL	(0x728)
+
 #define EXYNOS5_PHY_ENABLE			BIT(0)
 
 #define EXYNOS5_MIPI_PHY_S_RESETN		BIT(1)
-- 
1.7.9.5
