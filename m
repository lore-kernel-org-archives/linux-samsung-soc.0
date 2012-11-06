From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH 2/2] ARM: Exynos5250: Enabling USB 3.0 phy for samsung-usbphy
 driver
Date: Tue, 06 Nov 2012 21:06:37 +0530
Message-ID: <1352216197-11828-3-git-send-email-gautam.vivek@samsung.com>
References: <1352216197-11828-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:58980 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751556Ab2KFPdt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Nov 2012 10:33:49 -0500
In-reply-to: <1352216197-11828-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: gregkh@linuxfoundation.org, balbi@ti.com, rob.herring@calxeda.com, kgene.kim@samsung.com, yulgon.kim@samsung.com, av.tikhomirov@samsung.com, thomas.abraham@linaro.org, kishon@ti.com, p.paneri@samsung.com

Adding base address information and required platform data
support for enabling USB DRD phy on exynos5250 SOC.

Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi            |    3 ++-
 arch/arm/mach-exynos/include/mach/regs-pmu.h |    4 ++++
 arch/arm/mach-exynos/setup-usb-phy.c         |    9 +++++++++
 3 files changed, 15 insertions(+), 1 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 82bf042..51693af 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -220,7 +220,8 @@
 
 	usbphy {
 		compatible = "samsung,exynos5250-usbphy";
-		reg = <0x12130000 0x100>;
+		reg = <0x12130000 0x100>,
+		      <0x12100000 0x100>;
 	};
 
 	amba {
diff --git a/arch/arm/mach-exynos/include/mach/regs-pmu.h b/arch/arm/mach-exynos/include/mach/regs-pmu.h
index d4e392b..67132b4 100644
--- a/arch/arm/mach-exynos/include/mach/regs-pmu.h
+++ b/arch/arm/mach-exynos/include/mach/regs-pmu.h
@@ -39,6 +39,10 @@
 #define S5P_HDMI_PHY_CONTROL			S5P_PMUREG(0x0700)
 #define S5P_HDMI_PHY_ENABLE			(1 << 0)
 
+/* only for EXYNOS5250*/
+#define S5P_USBDRD_PHY_CONTROL			S5P_PMUREG(0x0704)
+#define S5P_USBDRD_PHY_ENABLE			(1 << 0)
+
 #define S5P_DAC_PHY_CONTROL			S5P_PMUREG(0x070C)
 #define S5P_DAC_PHY_ENABLE			(1 << 0)
 
diff --git a/arch/arm/mach-exynos/setup-usb-phy.c b/arch/arm/mach-exynos/setup-usb-phy.c
index 6c768e0..5e46fdd 100644
--- a/arch/arm/mach-exynos/setup-usb-phy.c
+++ b/arch/arm/mach-exynos/setup-usb-phy.c
@@ -238,6 +238,15 @@ void s5p_usb_phy_pmu_isolation(int on, int type)
 			writel(readl(S5P_USBHOST_PHY_CONTROL)
 				| S5P_USBHOST_PHY_ENABLE,
 					S5P_USBHOST_PHY_CONTROL);
+	} else if (type == USB_PHY_TYPE_DRD) {
+		if (on)
+			writel(readl(S5P_USBDRD_PHY_CONTROL)
+				& ~S5P_USBDRD_PHY_ENABLE,
+					S5P_USBDRD_PHY_CONTROL);
+		else
+			writel(readl(S5P_USBDRD_PHY_CONTROL)
+				| S5P_USBDRD_PHY_ENABLE,
+					S5P_USBDRD_PHY_CONTROL);
 	} else {
 		if (on)
 			writel(readl(S5P_USBDEVICE_PHY_CONTROL)
-- 
1.7.6.5
