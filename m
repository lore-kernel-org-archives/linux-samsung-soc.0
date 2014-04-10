From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 16/27] ARM: dts: exynos3250: Add MCT dt node
Date: Thu, 10 Apr 2014 19:06:06 +0900
Message-ID: <1397124377-16969-8-git-send-email-cw00.choi@samsung.com>
References: <1397122658-16013-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:53304 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965752AbaDJKGw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Apr 2014 06:06:52 -0400
In-reply-to: <1397122658-16013-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, t.figa@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: kyungmin.park@samsung.com, cw00.choi@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, hyunhee.kim@samsung.com, yj44.cho@samsung.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

This patch add MCT (Multi Core Timer) dt node with "samsung,exynos4210-mct"
compatible name bacause Exynos3250 uses SPI interrput type. And Exynos3250
provide one global timer and four local timers for Multi Core CPU.

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
[Fix incorrect irq number of MCT and remove unnecessary code by Tomasz Figa]
Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Hyunhee Kim <hyunhee.kim@samsung.com
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos3250.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index d17ed54..2013d0d 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -57,6 +57,15 @@
 		      interrupts = <1 9 0xf04>;
 	};
 
+	mct@10050000 {
+		compatible = "samsung,exynos4210-mct";
+		reg = <0x10050000 0x800>;
+		interrupts = <0 218 0>, <0 219 0>, <0 220 0>, <0 221 0>,
+			     <0 223 0>, <0 226 0>, <0 227 0>, <0 228 0>;
+		clocks = <&cmu CLK_FIN_PLL>, <&cmu CLK_MCT>;
+		clock-names = "fin_pll", "mct";
+	};
+
 	pinctrl_1: pinctrl@11000000 {
 		compatible = "samsung,exynos3250-pinctrl";
 		reg = <0x11000000 0x1000>;
-- 
1.8.0
