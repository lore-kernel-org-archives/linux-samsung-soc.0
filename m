From: Chanho Park <chanho61.park@samsung.com>
Subject: [PATCHv2 2/4] ARM: dts: exynos4: add exynos_usbphy node
Date: Fri, 25 Apr 2014 15:59:10 +0900
Message-ID: <1398409152-14770-3-git-send-email-chanho61.park@samsung.com>
References: <1398409152-14770-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:14188 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751664AbaDYG73 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Apr 2014 02:59:29 -0400
In-reply-to: <1398409152-14770-1-git-send-email-chanho61.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: t.figa@samsung.com, k.debski@samsung.com, devicetree@vger.kernel.org, Chanho Park <chanho61.park@samsung.com>

This patch enables a exynos_usbphy node for exynos4 SoCs.
A exynos4x12 usb phy node is almost same with 4210's one
except compatible string and pmu syscon.

Cc: Tomasz Figa <t.figa@samsung.com>
Cc: Kamil Debski <k.debski@samsung.com>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi    | 10 ++++++++++
 arch/arm/boot/dts/exynos4x12.dtsi |  5 +++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 264066f..5f9b23b 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -278,6 +278,16 @@
 		status = "disabled";
 	};
 
+	exynos_usbphy: exynos-usbphy@125B0000 {
+		compatible = "samsung,exynos4210-usb2-phy";
+		reg = <0x125B0000 0x100>;
+		samsung,pmureg-phandle = <&pmu_system_controller>;
+		clocks = <&clock CLK_USB_DEVICE>, <&clock CLK_XUSBXTI>;
+		clock-names = "phy", "ref";
+		status = "disabled";
+		#phy-cells = <1>;
+	};
+
 	ehci@12580000 {
 		compatible = "samsung,exynos4210-ehci";
 		reg = <0x12580000 0x100>;
diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
index 7f767f7..6d9a21a 100644
--- a/arch/arm/boot/dts/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/exynos4x12.dtsi
@@ -247,4 +247,9 @@
 		clock-names = "biu", "ciu";
 		status = "disabled";
 	};
+
+	exynos-usbphy@125B0000 {
+		compatible = "samsung,exynos4x12-usb2-phy";
+		samsung,sysreg-phandle = <&sys_reg>;
+	};
 };
-- 
1.8.3.2
