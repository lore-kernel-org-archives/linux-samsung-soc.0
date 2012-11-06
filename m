From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH] ARM: Exynos5250: Enabling dwc3-exynos driver
Date: Tue, 06 Nov 2012 20:58:49 +0530
Message-ID: <1352215729-11703-2-git-send-email-gautam.vivek@samsung.com>
References: <1352215729-11703-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:57964 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751160Ab2KFPYk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Nov 2012 10:24:40 -0500
In-reply-to: <1352215729-11703-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: linux-usb@vger.kernel.org, kgene.kim@samsung.com, balbi@ti.com, av.tikhomirov@samsung.com, yulgon.kim@samsung.com, thomas.abraham@linaro.org, p.paneri@samsung.com

Adding DWC3 device tree node for Exynos5250 along with the
device address and clock support needed for the controller.

Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi       |    6 ++++++
 arch/arm/mach-exynos/clock-exynos5.c    |   24 ++++++++++++++++++++++++
 arch/arm/mach-exynos/include/mach/map.h |    1 +
 arch/arm/mach-exynos/mach-exynos5-dt.c  |    2 ++
 drivers/usb/Kconfig                     |    1 +
 5 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index cf6a02d..52bca54 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -68,6 +68,12 @@
 		interrupts = <0 96 0>;
 	};
 
+	dwc3 {
+		compatible = "samsung,exynos-dwc3";
+		reg = <0x12000000 0x10000>;
+		interrupts = <0 72 0>;
+	};
+
 	rtc {
 		compatible = "samsung,s3c6410-rtc";
 		reg = <0x101E0000 0x100>;
diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
index a88e0d9..ee094ee 100644
--- a/arch/arm/mach-exynos/clock-exynos5.c
+++ b/arch/arm/mach-exynos/clock-exynos5.c
@@ -740,6 +740,11 @@ static struct clk exynos5_init_clocks_off[] = {
 		.enable		= exynos5_clk_ip_fsys_ctrl ,
 		.ctrlbit	= (1 << 18),
 	}, {
+		.name		= "usbdrd30",
+		.parent		= &exynos5_clk_aclk_200.clk,
+		.enable		= exynos5_clk_ip_fsys_ctrl,
+		.ctrlbit	= (1 << 19),
+	}, {
 		.name		= "usbotg",
 		.enable		= exynos5_clk_ip_fsys_ctrl,
 		.ctrlbit	= (1 << 7),
@@ -1004,6 +1009,16 @@ struct clksrc_sources exynos5_clkset_group = {
 	.nr_sources	= ARRAY_SIZE(exynos5_clkset_group_list),
 };
 
+struct clk *exynos5_clkset_usbdrd30_list[] = {
+	[0] = &exynos5_clk_mout_mpll.clk,
+	[1] = &exynos5_clk_mout_cpll.clk,
+};
+
+struct clksrc_sources exynos5_clkset_usbdrd30 = {
+	.sources        = exynos5_clkset_usbdrd30_list,
+	.nr_sources     = ARRAY_SIZE(exynos5_clkset_usbdrd30_list),
+};
+
 /* Possible clock sources for aclk_266_gscl_sub Mux */
 static struct clk *clk_src_gscl_266_list[] = {
 	[0] = &clk_ext_xtal_mux,
@@ -1288,6 +1303,15 @@ static struct clksrc_clk exynos5_clksrcs[] = {
 			.parent		= &exynos5_clk_mout_cpll.clk,
 		},
 		.reg_div = { .reg = EXYNOS5_CLKDIV_GEN, .shift = 4, .size = 3 },
+	}, {
+		.clk    = {
+			.name           = "sclk_usbdrd30",
+			.enable         = exynos5_clksrc_mask_fsys_ctrl,
+			.ctrlbit        = (1 << 28),
+		},
+		.sources = &exynos5_clkset_usbdrd30,
+		.reg_src = { .reg = EXYNOS5_CLKSRC_FSYS, .shift = 28, .size = 1 },
+		.reg_div = { .reg = EXYNOS5_CLKDIV_FSYS0, .shift = 24, .size = 4 },
 	},
 };
 
diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
index ef4958b..397fb9d 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -197,6 +197,7 @@
 #define EXYNOS4_PA_EHCI			0x12580000
 #define EXYNOS4_PA_OHCI			0x12590000
 #define EXYNOS4_PA_HSPHY		0x125B0000
+#define EXYNOS5_PA_DRD			0x12000000
 #define EXYNOS4_PA_MFC			0x13400000
 
 #define EXYNOS4_PA_UART			0x13800000
diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index ed37273..8896926 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -86,6 +86,8 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
 				"exynos5-hdmi", NULL),
 	OF_DEV_AUXDATA("samsung,exynos5-mixer", 0x14450000,
 				"exynos5-mixer", NULL),
+	OF_DEV_AUXDATA("samsung,exynos-dwc3", EXYNOS5_PA_DRD,
+				"exynos-dwc3", NULL),
 	{},
 };
 
diff --git a/drivers/usb/Kconfig b/drivers/usb/Kconfig
index 4c90b51..0454b8a 100644
--- a/drivers/usb/Kconfig
+++ b/drivers/usb/Kconfig
@@ -53,6 +53,7 @@ config USB_ARCH_HAS_EHCI
 # some non-PCI HCDs implement xHCI
 config USB_ARCH_HAS_XHCI
 	boolean
+	default y if ARCH_EXYNOS5
 	default PCI
 
 menuconfig USB_SUPPORT
-- 
1.7.6.5
