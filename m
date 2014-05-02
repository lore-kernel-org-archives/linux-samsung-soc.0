From: Chanho Park <chanho61.park@samsung.com>
Subject: [PATCHv4 2/4] ARM: dts: exynos4: add exynos_usbphy node
Date: Fri, 02 May 2014 13:26:07 +0900
Message-ID: <1399004769-31033-3-git-send-email-chanho61.park@samsung.com>
References: <1399004769-31033-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:34106 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750850AbaEBE0W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 May 2014 00:26:22 -0400
In-reply-to: <1399004769-31033-1-git-send-email-chanho61.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, t.figa@samsung.com, k.debski@samsung.com, Chanho Park <chanho61.park@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>

This patch enables a exynos_usbphy node for exynos4 SoCs.
A exynos4x12 usb phy node is almost same with 4210's one
except compatible string and pmu syscon.

Cc: Tomasz Figa <t.figa@samsung.com>
Cc: Kamil Debski <k.debski@samsung.com>
Cc: Sachin Kamat <sachin.kamat@linaro.org>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi    | 10 ++++++++++
 arch/arm/boot/dts/exynos4x12.dtsi |  5 +++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 264066f..e72acb7 100644
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
+		#phy-cells = <1>;
+		status = "disabled";
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
