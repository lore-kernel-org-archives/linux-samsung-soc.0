From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 14/27] ARM: dts: exynos3250: Add device tree nodes for clock
 controllers
Date: Thu, 10 Apr 2014 19:06:04 +0900
Message-ID: <1397124377-16969-6-git-send-email-cw00.choi@samsung.com>
References: <1397122658-16013-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1397122658-16013-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kgene.kim@samsung.com, t.figa@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: kyungmin.park@samsung.com, cw00.choi@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, hyunhee.kim@samsung.com, yj44.cho@samsung.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Tomasz Figa <t.figa@samsung.com>

This patch add dt node of clock controllers to support Exynos3250 SoC.
Exynos3250's clock drvier divide into two scope for clock controller as following:
- 'cmu' clock-controller includes CMU_LEFTBUS/RIGHTBUS/TOP/CPU/ISP/ACP clocks

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
[Modify base address of clock and remove unnecessary dt node by Chanwoo Choi]
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
[Include exynos3250 clock header file by Hyunhee Kim]
Signed-off-by: Hyunhee Kim <hyunhee.kim@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos3250.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index dba3218..758913e 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -19,6 +19,7 @@
 
 #include "skeleton.dtsi"
 #include "exynos3250-pinctrl.dtsi"
+#include <dt-bindings/clock/exynos3250.h>
 
 / {
 	compatible = "samsung,exynos3250";
@@ -39,6 +40,12 @@
 		reg = <0x10010000 0x400>;
 	};
 
+	cmu: clock-controller@10030000 {
+		compatible = "samsung,exynos3250-cmu";
+		reg = <0x10030000 0x20000>;
+		#clock-cells = <1>;
+	};
+
 	gic: interrupt-controller@10481000 {
 		compatible = "arm,cortex-a7-gic";
 		#interrupt-cells = <3>;
-- 
1.8.0
