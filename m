From: Jaewon Kim <jaewon02.kim@samsung.com>
Subject: [PATCH RESEND v2 2/4] ARM: dts: Add hsotg node for exynos3250
Date: Wed, 07 Jan 2015 23:08:19 +0900
Message-ID: <1420639701-1524-3-git-send-email-jaewon02.kim@samsung.com>
References: <1420639701-1524-1-git-send-email-jaewon02.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:10368 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752038AbbAGOIb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Jan 2015 09:08:31 -0500
In-reply-to: <1420639701-1524-1-git-send-email-jaewon02.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org, Jaewon Kim <jaewon02.kim@samsung.com>

This patch adds device tree node for hsotg to control USB 2.0 Device.

Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
---
 arch/arm/boot/dts/exynos3250.dtsi |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 27d385f..204a84b 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -255,6 +255,17 @@
 			status = "disabled";
 		};
 
+		hsotg: hsotg@12480000 {
+			compatible = "snps,dwc2";
+			reg = <0x12480000 0x20000>;
+			interrupts = <0 141 0>;
+			clocks = <&cmu CLK_USBOTG>;
+			clock-names = "otg";
+			phys = <&exynos_usbphy 0>;
+			phy-names = "usb2-phy";
+			status = "disabled";
+		};
+
 		mshc_0: mshc@12510000 {
 			compatible = "samsung,exynos5250-dw-mshc";
 			reg = <0x12510000 0x1000>;
-- 
1.7.9.5
