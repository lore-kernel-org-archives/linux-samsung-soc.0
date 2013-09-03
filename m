From: Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>
Subject: [PATCH V4 3/4] ARM: dts: Move fifo-depth property from board dts
Date: Tue,  3 Sep 2013 11:34:23 +0530
Message-ID: <1378188264-22382-4-git-send-email-yuvaraj.cd@samsung.com>
References: <1378188264-22382-1-git-send-email-yuvaraj.cd@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f48.google.com ([209.85.160.48]:43932 "EHLO
	mail-pb0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754976Ab3ICGEt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Sep 2013 02:04:49 -0400
In-Reply-To: <1378188264-22382-1-git-send-email-yuvaraj.cd@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, devicetree@vger.kernel.org
Cc: rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ian.campbell@citrix.com, t.figa@samsung.com, dianders@chromium.org, cjb@laptop.org, thomas.abraham@linaro.org, ks.giri@samsung.com, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>

As fifo-depth property in dw_mmc device tree node is SOC
specific, move this property to exynos5250 SOC specific
file.

Signed-off-by: Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>
---
 arch/arm/boot/dts/exynos5250-arndale.dts  |    2 --
 arch/arm/boot/dts/exynos5250-smdk5250.dts |    2 --
 arch/arm/boot/dts/exynos5250.dtsi         |    4 ++++
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index a4dc784..176ef16 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -371,7 +371,6 @@
 		num-slots = <1>;
 		supports-highspeed;
 		broken-cd;
-		fifo-depth = <0x80>;
 		card-detect-delay = <200>;
 		samsung,dw-mshc-ciu-div = <3>;
 		samsung,dw-mshc-sdr-timing = <2 3>;
@@ -390,7 +389,6 @@
 		status = "okay";
 		num-slots = <1>;
 		supports-highspeed;
-		fifo-depth = <0x80>;
 		card-detect-delay = <200>;
 		samsung,dw-mshc-ciu-div = <3>;
 		samsung,dw-mshc-sdr-timing = <2 3>;
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index bd19d55d..5a4831d 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -145,7 +145,6 @@
 		num-slots = <1>;
 		supports-highspeed;
 		broken-cd;
-		fifo-depth = <0x80>;
 		card-detect-delay = <200>;
 		samsung,dw-mshc-ciu-div = <3>;
 		samsung,dw-mshc-sdr-timing = <2 3>;
@@ -163,7 +162,6 @@
 		status = "okay";
 		num-slots = <1>;
 		supports-highspeed;
-		fifo-depth = <0x80>;
 		card-detect-delay = <200>;
 		samsung,dw-mshc-ciu-div = <3>;
 		samsung,dw-mshc-sdr-timing = <2 3>;
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 300e4e6..fb28d21 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -395,6 +395,7 @@
 		reg = <0x12200000 0x1000>;
 		clocks = <&clock 280>, <&clock 139>;
 		clock-names = "biu", "ciu";
+		fifo-depth = <0x80>;
 		status = "disabled";
 	};
 
@@ -406,6 +407,7 @@
 		reg = <0x12210000 0x1000>;
 		clocks = <&clock 281>, <&clock 140>;
 		clock-names = "biu", "ciu";
+		fifo-depth = <0x80>;
 		status = "disabled";
 	};
 
@@ -417,6 +419,7 @@
 		reg = <0x12220000 0x1000>;
 		clocks = <&clock 282>, <&clock 141>;
 		clock-names = "biu", "ciu";
+		fifo-depth = <0x80>;
 		status = "disabled";
 	};
 
@@ -428,6 +431,7 @@
 		#size-cells = <0>;
 		clocks = <&clock 283>, <&clock 142>;
 		clock-names = "biu", "ciu";
+		fifo-depth = <0x80>;
 		status = "disabled";
 	};
 
-- 
1.7.9.5
