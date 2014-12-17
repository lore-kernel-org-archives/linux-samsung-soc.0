From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [PATCH 1/2] ARM: dts: add fimd device node to exynos4415.dtsi
Date: Wed, 17 Dec 2014 09:39:41 +0900
Message-ID: <1418776782-6691-2-git-send-email-yj44.cho@samsung.com>
References: <1418776782-6691-1-git-send-email-yj44.cho@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:63393 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750854AbaLQAjt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Dec 2014 19:39:49 -0500
In-reply-to: <1418776782-6691-1-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, kgene.kim@samsung.com, mark.rutland@arm.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, robh+dt@kernel.org, galak@codeaurora.org, kyungmin.park@samsung.com, inki.dae@samsung.com

This patch adds fimd device node to exynos4415.dtsi.

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4415.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4415.dtsi b/arch/arm/boot/dts/exynos4415.dtsi
index c1c9b37..30acb3a 100644
--- a/arch/arm/boot/dts/exynos4415.dtsi
+++ b/arch/arm/boot/dts/exynos4415.dtsi
@@ -234,6 +234,18 @@
 			interrupts = <0 240 0>;
 		};
 
+		fimd: fimd@11C00000 {
+			compatible = "samsung,exynos4415-fimd";
+			reg = <0x11C00000 0x30000>;
+			interrupt-names = "fifo", "vsync", "lcd_sys";
+			interrupts = <0 84 0>, <0 85 0>, <0 86 0>;
+			clocks = <&cmu CLK_SCLK_FIMD0>, <&cmu CLK_FIMD0>;
+			clock-names = "sclk_fimd", "fimd";
+			samsung,power-domain = <&pd_lcd0>;
+			samsung,sysreg = <&sysreg_system_controller>;
+			status = "disabled";
+		};
+
 		hsotg: hsotg@12480000 {
 			compatible = "samsung,s3c6400-hsotg";
 			reg = <0x12480000 0x20000>;
-- 
1.9.0
