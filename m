From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V2] ARM: dts: Correct the base address of pinctrl_3 on
 Exynos5250
Date: Tue, 28 May 2013 15:24:01 +0530
Message-ID: <1369734841-9900-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:55286 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751017Ab3E1Jyy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 May 2013 05:54:54 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MNI00J4666WFD60@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 28 May 2013 18:54:32 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: sbkim73@samsung.com, broonie@kernel.org, kgene.kim@samsung.com

This patch corrects the base address of pinctrl_3 on Exynos5250
platform.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
Changes since V1:
	- Added platform name in the subject line.

 arch/arm/boot/dts/exynos5250-pinctrl.dtsi |    2 +-
 arch/arm/boot/dts/exynos5250.dtsi         |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
index d1650fb..ded558b 100644
--- a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
@@ -763,7 +763,7 @@
 		};
 	};
 
-	pinctrl@03680000 {
+	pinctrl@03860000 {
 		gpz: gpz {
 			gpio-controller;
 			#gpio-cells = <2>;
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 7154e3d..e9bfd13 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -169,9 +169,9 @@
 		interrupts = <0 50 0>;
 	};
 
-	pinctrl_3: pinctrl@03680000 {
+	pinctrl_3: pinctrl@03860000 {
 		compatible = "samsung,exynos5250-pinctrl";
-		reg = <0x0368000 0x1000>;
+		reg = <0x03860000 0x1000>;
 		interrupts = <0 47 0>;
 	};
 
-- 
1.7.4.4
