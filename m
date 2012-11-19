From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH] ARM: dts: exynos4: Use drive strength 3 for SD pins
Date: Mon, 19 Nov 2012 15:52:37 +0100
Message-ID: <21831256.UCkQ5RyKd5@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:11659 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751707Ab2KSOwn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Nov 2012 09:52:43 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDQ0073DPBURBK0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Nov 2012 23:52:42 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDQ0099RPBSSZA0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Nov 2012 23:52:42 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

This patch modifies pin control groups of SD pins on Exynos4210 and
Exynos4x12 to use drive strength 3, which corresponds to
S5P_GPIO_DRVSTR_LV4 in legacy non-DT code.

This is needed at least on Origen board for sdhci2 to work.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4210-pinctrl.dtsi | 56 +++++++++++++++----------------
 arch/arm/boot/dts/exynos4x12-pinctrl.dtsi | 56 +++++++++++++++----------------
 2 files changed, 56 insertions(+), 56 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-pinctrl.dtsi b/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
index 6a4a1a0..55a2efb 100644
--- a/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
@@ -482,196 +482,196 @@
 			samsung,pins = "gpk0-0";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <0>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd0_cmd: sd0-cmd {
 			samsung,pins = "gpk0-1";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <0>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd0_cd: sd0-cd {
 			samsung,pins = "gpk0-2";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <3>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd0_bus1: sd0-bus-width1 {
 			samsung,pins = "gpk0-3";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <3>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd0_bus4: sd0-bus-width4 {
 			samsung,pins = "gpk0-3", "gpk0-4", "gpk0-5", "gpk0-6";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <3>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd0_bus8: sd0-bus-width8 {
 			samsung,pins = "gpk1-3", "gpk1-4", "gpk1-5", "gpk1-6";
 			samsung,pin-function = <3>;
 			samsung,pin-pud = <3>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd4_clk: sd4-clk {
 			samsung,pins = "gpk0-0";
 			samsung,pin-function = <3>;
 			samsung,pin-pud = <0>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd4_cmd: sd4-cmd {
 			samsung,pins = "gpk0-1";
 			samsung,pin-function = <3>;
 			samsung,pin-pud = <0>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd4_cd: sd4-cd {
 			samsung,pins = "gpk0-2";
 			samsung,pin-function = <3>;
 			samsung,pin-pud = <3>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd4_bus1: sd4-bus-width1 {
 			samsung,pins = "gpk0-3";
 			samsung,pin-function = <3>;
 			samsung,pin-pud = <3>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd4_bus4: sd4-bus-width4 {
 			samsung,pins = "gpk0-3", "gpk0-4", "gpk0-5", "gpk0-6";
 			samsung,pin-function = <3>;
 			samsung,pin-pud = <3>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd4_bus8: sd4-bus-width8 {
 			samsung,pins = "gpk1-3", "gpk1-4", "gpk1-5", "gpk1-6";
 			samsung,pin-function = <3>;
 			samsung,pin-pud = <4>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd1_clk: sd1-clk {
 			samsung,pins = "gpk1-0";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <0>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd1_cmd: sd1-cmd {
 			samsung,pins = "gpk1-1";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <0>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd1_cd: sd1-cd {
 			samsung,pins = "gpk1-2";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <3>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd1_bus1: sd1-bus-width1 {
 			samsung,pins = "gpk1-3";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <3>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd1_bus4: sd1-bus-width4 {
 			samsung,pins = "gpk1-3", "gpk1-4", "gpk1-5", "gpk1-6";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <3>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd2_clk: sd2-clk {
 			samsung,pins = "gpk2-0";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <0>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd2_cmd: sd2-cmd {
 			samsung,pins = "gpk2-1";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <0>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd2_cd: sd2-cd {
 			samsung,pins = "gpk2-2";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <3>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd2_bus1: sd2-bus-width1 {
 			samsung,pins = "gpk2-3";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <3>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd2_bus4: sd2-bus-width4 {
 			samsung,pins = "gpk2-3", "gpk2-4", "gpk2-5", "gpk2-6";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <3>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd2_bus8: sd2-bus-width8 {
 			samsung,pins = "gpk3-3", "gpk3-4", "gpk3-5", "gpk3-6";
 			samsung,pin-function = <3>;
 			samsung,pin-pud = <3>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd3_clk: sd3-clk {
 			samsung,pins = "gpk3-0";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <0>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd3_cmd: sd3-cmd {
 			samsung,pins = "gpk3-1";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <0>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd3_cd: sd3-cd {
 			samsung,pins = "gpk3-2";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <3>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd3_bus1: sd3-bus-width1 {
 			samsung,pins = "gpk3-3";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <3>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd3_bus4: sd3-bus-width4 {
 			samsung,pins = "gpk3-3", "gpk3-4", "gpk3-5", "gpk3-6";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <3>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		eint0: ext-int0 {
diff --git a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
index 56f4669..8e6115a 100644
--- a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
@@ -586,196 +586,196 @@
 			samsung,pins = "gpk0-0";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <0>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd0_cmd: sd0-cmd {
 			samsung,pins = "gpk0-1";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <0>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd0_cd: sd0-cd {
 			samsung,pins = "gpk0-2";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <3>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd0_bus1: sd0-bus-width1 {
 			samsung,pins = "gpk0-3";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <3>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd0_bus4: sd0-bus-width4 {
 			samsung,pins = "gpk0-3", "gpk0-4", "gpk0-5", "gpk0-6";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <3>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd0_bus8: sd0-bus-width8 {
 			samsung,pins = "gpk1-3", "gpk1-4", "gpk1-5", "gpk1-6";
 			samsung,pin-function = <3>;
 			samsung,pin-pud = <3>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd4_clk: sd4-clk {
 			samsung,pins = "gpk0-0";
 			samsung,pin-function = <3>;
 			samsung,pin-pud = <0>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd4_cmd: sd4-cmd {
 			samsung,pins = "gpk0-1";
 			samsung,pin-function = <3>;
 			samsung,pin-pud = <0>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd4_cd: sd4-cd {
 			samsung,pins = "gpk0-2";
 			samsung,pin-function = <3>;
 			samsung,pin-pud = <3>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd4_bus1: sd4-bus-width1 {
 			samsung,pins = "gpk0-3";
 			samsung,pin-function = <3>;
 			samsung,pin-pud = <3>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd4_bus4: sd4-bus-width4 {
 			samsung,pins = "gpk0-3", "gpk0-4", "gpk0-5", "gpk0-6";
 			samsung,pin-function = <3>;
 			samsung,pin-pud = <3>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd4_bus8: sd4-bus-width8 {
 			samsung,pins = "gpk1-3", "gpk1-4", "gpk1-5", "gpk1-6";
 			samsung,pin-function = <3>;
 			samsung,pin-pud = <4>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd1_clk: sd1-clk {
 			samsung,pins = "gpk1-0";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <0>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd1_cmd: sd1-cmd {
 			samsung,pins = "gpk1-1";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <0>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd1_cd: sd1-cd {
 			samsung,pins = "gpk1-2";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <3>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd1_bus1: sd1-bus-width1 {
 			samsung,pins = "gpk1-3";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <3>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd1_bus4: sd1-bus-width4 {
 			samsung,pins = "gpk1-3", "gpk1-4", "gpk1-5", "gpk1-6";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <3>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd2_clk: sd2-clk {
 			samsung,pins = "gpk2-0";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <0>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd2_cmd: sd2-cmd {
 			samsung,pins = "gpk2-1";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <0>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd2_cd: sd2-cd {
 			samsung,pins = "gpk2-2";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <3>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd2_bus1: sd2-bus-width1 {
 			samsung,pins = "gpk2-3";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <3>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd2_bus4: sd2-bus-width4 {
 			samsung,pins = "gpk2-3", "gpk2-4", "gpk2-5", "gpk2-6";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <3>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd2_bus8: sd2-bus-width8 {
 			samsung,pins = "gpk3-3", "gpk3-4", "gpk3-5", "gpk3-6";
 			samsung,pin-function = <3>;
 			samsung,pin-pud = <3>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd3_clk: sd3-clk {
 			samsung,pins = "gpk3-0";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <0>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd3_cmd: sd3-cmd {
 			samsung,pins = "gpk3-1";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <0>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd3_cd: sd3-cd {
 			samsung,pins = "gpk3-2";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <3>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd3_bus1: sd3-bus-width1 {
 			samsung,pins = "gpk3-3";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <3>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		sd3_bus4: sd3-bus-width4 {
 			samsung,pins = "gpk3-3", "gpk3-4", "gpk3-5", "gpk3-6";
 			samsung,pin-function = <2>;
 			samsung,pin-pud = <3>;
-			samsung,pin-drv = <0>;
+			samsung,pin-drv = <3>;
 		};
 
 		keypad_col0: keypad-col0 {
-- 
1.8.0
