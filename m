From: Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>
Subject: [PATCH 1/2] ARM: dts: Fix status property of mmc nodes for snow board
Date: Mon,  9 Dec 2013 12:08:37 +0530
Message-ID: <1386571118-17793-1-git-send-email-yuvaraj.cd@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f43.google.com ([209.85.160.43]:47436 "EHLO
	mail-pb0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755758Ab3LIGis (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Dec 2013 01:38:48 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ian.campbell@citrix.com, devicetree@vger.kernel.org, a.kesavan@samsung.com
Cc: t.figa@samsung.com, alim.akhtar@samsung.com, sonnyrao@chromium.org, dianders@chromium.org, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>

Commit 0c3de788 ("ARM: dts: change status property of dwmmc nodes
for exynos5250") missed out handling the exynos5250 snow dts file.

Signed-off-by : Abhilash Kesavan <a.kesavan@samsung.com>

Signed-off-by: Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>
---
 arch/arm/boot/dts/cros5250-common.dtsi |    4 ----
 arch/arm/boot/dts/exynos5250-snow.dts  |    9 +++++++++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/cros5250-common.dtsi b/arch/arm/boot/dts/cros5250-common.dtsi
index 6470536..1ceb62e 100644
--- a/arch/arm/boot/dts/cros5250-common.dtsi
+++ b/arch/arm/boot/dts/cros5250-common.dtsi
@@ -247,10 +247,6 @@
 		};
 	};
 
-	mmc@12210000 {
-		status = "disabled";
-	};
-
 	mmc@12220000 {
 		num-slots = <1>;
 		supports-highspeed;
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
