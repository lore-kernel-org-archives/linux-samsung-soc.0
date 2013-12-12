From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 3/3] ARM: dts: exynos4412-trats2: Use MSHC controller for eMMC
 memory
Date: Thu, 12 Dec 2013 17:18:03 +0100
Message-ID: <1386865083-20082-4-git-send-email-t.figa@samsung.com>
References: <1386865083-20082-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:53010 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751663Ab3LLQS3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Dec 2013 11:18:29 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MXP00CN4BYSIR60@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Dec 2013 16:18:28 +0000 (GMT)
In-reply-to: <1386865083-20082-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@wwwdotorg.org>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Tomasz Figa <t.figa@samsung.com>

This patch removes device tree node of SDHCI0 controller and replaces
it with MSHC to enable support MMC 4.4 and improve performance of eMMC
memory.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4412-trats2.dts | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index fb7b9ae..890ad27 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -442,13 +442,25 @@
 		};
 	};
 
-	sdhci@12510000 {
-		bus-width = <8>;
+	mmc@12550000 {
+		num-slots = <1>;
+		supports-highspeed;
+		broken-cd;
 		non-removable;
-		pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus8>;
-		pinctrl-names = "default";
+		card-detect-delay = <200>;
 		vmmc-supply = <&vemmc_reg>;
+		clock-frequency = <400000000>;
+		samsung,dw-mshc-ciu-div = <0>;
+		samsung,dw-mshc-sdr-timing = <2 3>;
+		samsung,dw-mshc-ddr-timing = <1 2>;
+		pinctrl-0 = <&sd4_clk &sd4_cmd &sd4_bus4 &sd4_bus8>;
+		pinctrl-names = "default";
 		status = "okay";
+
+		slot@0 {
+			reg = <0>;
+			bus-width = <8>;
+		};
 	};
 
 	serial@13800000 {
-- 
1.8.4.3
