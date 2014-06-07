From: Tushar Behera <tushar.b@samsung.com>
Subject: [PATCH] ARM: dts: Add missing clock/pin-control entries for I2S0 on Exynos4
Date: Sat,  7 Jun 2014 15:00:54 +0530
Message-ID: <1402133454-28445-1-git-send-email-tushar.b@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:39521 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750732AbaFGJdg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 7 Jun 2014 05:33:36 -0400
Received: by mail-pd0-f169.google.com with SMTP id w10so3426362pde.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 07 Jun 2014 02:33:35 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, s.nawrocki@samsung.com

I2S driver uses 3 clocks under different conditions. Added two
missing clocks.

Additionally updated pin-control property for this node.

Signed-off-by: Tushar Behera <tushar.b@samsung.com>
---
Based on next-20140606.

Tested on Exynos4210-based Origen boards with private patches for
codec/machine driver.

 arch/arm/boot/dts/exynos4.dtsi |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index fbaf426..10bb081 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -55,11 +55,15 @@
 	i2s0: i2s@03830000 {
 		compatible = "samsung,s5pv210-i2s";
 		reg = <0x03830000 0x100>;
-		clocks = <&clock_audss EXYNOS_I2S_BUS>;
-		clock-names = "iis";
+		clocks = <&clock_audss EXYNOS_I2S_BUS>,
+			<&clock_audss EXYNOS_I2S_BUS>,
+			<&clock_audss EXYNOS_SCLK_I2S>;
+		clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
 		dmas = <&pdma0 12>, <&pdma0 11>, <&pdma0 10>;
 		dma-names = "tx", "rx", "tx-sec";
 		samsung,idma-addr = <0x03000000>;
+		pinctrl-0 = <&i2s0_bus>;
+		pinctrl-names = "default";
 		status = "disabled";
 	};
 
-- 
1.7.9.5
