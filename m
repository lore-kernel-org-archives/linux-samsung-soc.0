From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: [Patch v4 1/2] clocksource: mct: extend mct to support 8 local interrupts for Exynos5420
Date: Mon,  7 Oct 2013 09:47:09 +0530
Message-ID: <1381119431-12697-2-git-send-email-chander.kashyap@linaro.org>
References: <1381119431-12697-1-git-send-email-chander.kashyap@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f49.google.com ([209.85.160.49]:36538 "EHLO
	mail-pb0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751558Ab3JGERe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Oct 2013 00:17:34 -0400
Received: by mail-pb0-f49.google.com with SMTP id xb4so6549966pbc.22
        for <linux-samsung-soc@vger.kernel.org>; Sun, 06 Oct 2013 21:17:34 -0700 (PDT)
In-Reply-To: <1381119431-12697-1-git-send-email-chander.kashyap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene@kernel.org, thomas.abraham@linaro.org, sylvester.nawrocki@gmail.com, Chander Kashyap <chander.kashyap@linaro.org>

Exynos5420 is octa-core SoC from Samsung. Hence extend exynos-mct clocksource
driver to support 8 local interrupts.

Also extend dts entries for 8 interrupts.

Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
---
 arch/arm/boot/dts/exynos5420.dtsi |    9 +++++++--
 drivers/clocksource/exynos_mct.c  |    4 ++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 6ce2f94..e97c87b 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -69,7 +69,8 @@
 		compatible = "samsung,exynos4210-mct";
 		reg = <0x101C0000 0x800>;
 		interrupt-parent = <&mct_map>;
-		interrupts = <0>, <1>, <2>, <3>, <4>, <5>, <6>, <7>;
+		interrupts = <0>, <1>, <2>, <3>, <4>, <5>, <6>, <7>,
+				<8>, <9>, <10>, <11>;
 		clocks = <&clock 1>, <&clock 315>;
 		clock-names = "fin_pll", "mct";
 
@@ -84,7 +85,11 @@
 					<4 &gic 0 120 0>,
 					<5 &gic 0 121 0>,
 					<6 &gic 0 122 0>,
-					<7 &gic 0 123 0>;
+					<7 &gic 0 123 0>,
+					<8 &gic 0 128 0>,
+					<9 &gic 0 129 0>,
+					<10 &gic 0 130 0>,
+					<11 &gic 0 131 0>;
 		};
 	};
 
diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index b2bbc41..ff4711e 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -71,6 +71,10 @@ enum {
 	MCT_L1_IRQ,
 	MCT_L2_IRQ,
 	MCT_L3_IRQ,
+	MCT_L4_IRQ,
+	MCT_L5_IRQ,
+	MCT_L6_IRQ,
+	MCT_L7_IRQ,
 	MCT_NR_IRQS,
 };
 
-- 
1.7.9.5
