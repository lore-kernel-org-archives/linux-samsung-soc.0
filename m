From: Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>
Subject: [PATCH] ARM: dts: Fix mmc node on exynos5250 snow board
Date: Thu,  5 Dec 2013 15:36:14 +0530
Message-ID: <1386237974-2255-1-git-send-email-yuvaraj.cd@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f50.google.com ([209.85.160.50]:33712 "EHLO
	mail-pb0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752402Ab3LEKG1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Dec 2013 05:06:27 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ian.campbell@citrix.com, devicetree@vger.kernel.org
Cc: t.figa@samsung.com, alim.akhtar@samsung.com, sonnyrao@chromium.org, dianders@chromium.org, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>

Commits 64c138a ("ARM: dts: Move fifo-depth property from exynos5250
board dts") and 0c3de788 ("ARM: dts: change status property of dwmmc
nodes for exynos5250") missed out handling the exynos5250 snow dts file.
Delete the fifo-depth property and enable the mmc node in the snow dts
file.

Signed-off-by : Abhilash Kesavan <a.kesavan@samsung.com>

Signed-off-by: Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>
---
 arch/arm/boot/dts/cros5250-common.dtsi |    7 -------
 arch/arm/boot/dts/exynos5250-snow.dts  |    9 +++++++++
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/cros5250-common.dtsi b/arch/arm/boot/dts/cros5250-common.dtsi
index 6470536..2dd70e9 100644
--- a/arch/arm/boot/dts/cros5250-common.dtsi
+++ b/arch/arm/boot/dts/cros5250-common.dtsi
@@ -233,7 +233,6 @@
 		num-slots = <1>;
 		supports-highspeed;
 		broken-cd;
-		fifo-depth = <0x80>;
 		card-detect-delay = <200>;
 		samsung,dw-mshc-ciu-div = <3>;
 		samsung,dw-mshc-sdr-timing = <2 3>;
@@ -247,14 +246,9 @@
 		};
 	};
 
-	mmc@12210000 {
-		status = "disabled";
-	};
-
 	mmc@12220000 {
 		num-slots = <1>;
 		supports-highspeed;
-		fifo-depth = <0x80>;
 		card-detect-delay = <200>;
 		samsung,dw-mshc-ciu-div = <3>;
 		samsung,dw-mshc-sdr-timing = <2 3>;
@@ -273,7 +267,6 @@
 		num-slots = <1>;
 		supports-highspeed;
 		broken-cd;
-		fifo-depth = <0x80>;
 		card-detect-delay = <200>;
 		samsung,dw-mshc-ciu-div = <3>;
 		samsung,dw-mshc-sdr-timing = <2 3>;
diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index a9395c4..67484d1 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -171,11 +171,20 @@
 		};
 	};
 
+	mmc@12200000 {
+		status = "okay";
+	};
+
+	mmc@12220000 {
+		status = "okay";
+	};
+
 	/*
 	 * On Snow we've got SIP WiFi and so can keep drive strengths low to
 	 * reduce EMI.
 	 */
 	mmc@12230000 {
+		status = "okay";
 		slot@0 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&sd3_clk &sd3_cmd &sd3_bus4>;
-- 
1.7.9.5
