From: Jaewon Kim <jaewon02.kim@samsung.com>
Subject: [PATCH RESEND v2 1/4] ARM: dts: Add exynos_usbphy node for exynos3250
Date: Wed, 07 Jan 2015 23:08:18 +0900
Message-ID: <1420639701-1524-2-git-send-email-jaewon02.kim@samsung.com>
References: <1420639701-1524-1-git-send-email-jaewon02.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:10368 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751827AbbAGOIa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Jan 2015 09:08:30 -0500
In-reply-to: <1420639701-1524-1-git-send-email-jaewon02.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org, Jaewon Kim <jaewon02.kim@samsung.com>

This patch adds device tree node for exynos_usbphy to use USB 2.0 Device.

Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
---
 arch/arm/boot/dts/exynos3250.dtsi |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 2246549..27d385f 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -279,6 +279,16 @@
 			status = "disabled";
 		};
 
+		exynos_usbphy: exynos-usbphy@125B0000 {
+			compatible = "samsung,exynos3250-usb2-phy";
+			reg = <0x125B0000 0x100>;
+			samsung,pmureg-phandle = <&pmu_system_controller>;
+			clocks = <&cmu CLK_USBOTG>, <&cmu CLK_SCLK_UPLL>;
+			clock-names = "phy", "ref";
+			#phy-cells = <1>;
+			status = "disabled";
+		};
+
 		amba {
 			compatible = "arm,amba-bus";
 			#address-cells = <1>;
-- 
1.7.9.5
