From: =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
Subject: [PATCH] ARM: dts: exynos: Cleanup Security Subsystem nodes for
 Exynos5
Date: Thu, 23 Nov 2017 15:34:35 +0100
Message-ID: <20171123143435.30747-1-l.stelmach@samsung.com>
References: <CGME20171123143456eucas1p13a29e8e0c0c0bf63a3875e458cc76d72@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:52874 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752248AbdKWOe7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Nov 2017 09:34:59 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: krzk@kernel.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, b.zolnierkie@samsung.com, =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>

Move Security Subsystem nodes to exynos5.dtsi. Adjust clock entries for
Exynos 5250 and Exynos 54xx.

Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
---
 arch/arm/boot/dts/exynos5.dtsi    |  6 ++++++
 arch/arm/boot/dts/exynos5250.dtsi | 13 +++++--------
 arch/arm/boot/dts/exynos54xx.dtsi |  6 ------
 3 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index 66d22521c976..7da4a4285b24 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -204,5 +204,11 @@
 			#size-cells = <0>;
 			status = "disabled";
 		};
+
+		sss: sss@10830000 {
+			compatible = "samsung,exynos4210-secss";
+			reg = <0x10830000 0x300>;
+			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
+		};
 	};
 };
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 8dbeb873e99c..8032d7e567fc 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -731,14 +731,6 @@
 			status = "disabled";
 		};
 
-		sss@10830000 {
-			compatible = "samsung,exynos4210-secss";
-			reg = <0x10830000 0x300>;
-			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clock CLK_SSS>;
-			clock-names = "secss";
-		};
-
 		sysmmu_g2d: sysmmu@10A60000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x10A60000 0x1000>;
@@ -1084,4 +1076,9 @@
 	dma-names = "rx", "tx";
 };
 
+&sss {
+	clocks = <&clock CLK_SSS>;
+	clock-names = "secss";
+};
+
 #include "exynos5250-pinctrl.dtsi"
diff --git a/arch/arm/boot/dts/exynos54xx.dtsi b/arch/arm/boot/dts/exynos54xx.dtsi
index 0389e8a10d0b..d0124f45b66a 100644
--- a/arch/arm/boot/dts/exynos54xx.dtsi
+++ b/arch/arm/boot/dts/exynos54xx.dtsi
@@ -79,12 +79,6 @@
 			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		sss: sss@10830000 {
-			compatible = "samsung,exynos4210-secss";
-			reg = <0x10830000 0x300>;
-			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
-		};
-
 		/* i2c_0-3 are defined in exynos5.dtsi */
 		hsi2c_4: i2c@12ca0000 {
 			compatible = "samsung,exynos5250-hsi2c";
-- 
2.11.0
