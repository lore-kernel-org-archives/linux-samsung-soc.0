From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 1/1] Revert "ARM: dts: add display power domain for exynos5250"
Date: Mon, 23 Mar 2015 11:49:59 +0100
Message-ID: <1427107800-21668-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:33306 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752033AbbCWKuX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Mar 2015 06:50:23 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Olof Johansson <olof@lixom.net>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Doug Anderson <dianders@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

This reverts commit 2d2c9a8d0a4f90e298315d2f4a282d8bd5d45e5c
("ARM: dts: add display power domain for exynos5250").

The mentioned commit added a domain definition for the DISP1
power domain and references to it in the appropriate devices
but this change breaks the display in at least the Exynos5250
based Snow and Spring Chromebooks.

On these machines, the boot-loader enables the DISP1 domain and
before the mentioned commit, the kernel didn't know about it so
the power domain remained always enabled.

But after that commit when the exynos-dp probe is deferred,
the DISP1 domain is powered off and on again but the exynos-dp
driver fails to configure the video showing the following error:

exynos-dp 145b0000.dp-controller: Timeout of video streamclk ok
exynos-dp 145b0000.dp-controller: unable to config video

The same issue happens when the display is turned off and on
again using DPMS.

So, it seems the DISP1 power domain definition is not complete
since the display works with the initialization made by the boot
loader but it does not work when the power domain is enabled by
the kernel.

Having the definition in the DTS makes the power domain to be
powered on when needed and powered off when not needed which is
better in terms of power consumption but for now is safer to just
revert the commit to avoid adding a regression in some machines.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 arch/arm/boot/dts/exynos5250.dtsi | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 77f656eb8e6b..482fa97c6b3a 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -105,12 +105,6 @@
 		#power-domain-cells = <0>;
 	};
 
-	pd_disp1: disp1-power-domain@100440A0 {
-		compatible = "samsung,exynos4210-pd";
-		reg = <0x100440A0 0x20>;
-		#power-domain-cells = <0>;
-	};
-
 	clock: clock-controller@10010000 {
 		compatible = "samsung,exynos5250-clock";
 		reg = <0x10010000 0x30000>;
@@ -752,7 +746,6 @@
 	hdmi: hdmi {
 		compatible = "samsung,exynos4212-hdmi";
 		reg = <0x14530000 0x70000>;
-		power-domains = <&pd_disp1>;
 		interrupts = <0 95 0>;
 		clocks = <&clock CLK_HDMI>, <&clock CLK_SCLK_HDMI>,
 			 <&clock CLK_SCLK_PIXEL>, <&clock CLK_SCLK_HDMIPHY>,
@@ -765,7 +758,6 @@
 	mixer {
 		compatible = "samsung,exynos5250-mixer";
 		reg = <0x14450000 0x10000>;
-		power-domains = <&pd_disp1>;
 		interrupts = <0 94 0>;
 		clocks = <&clock CLK_MIXER>, <&clock CLK_HDMI>,
 			 <&clock CLK_SCLK_HDMI>;
@@ -779,7 +771,6 @@
 	};
 
 	dp: dp-controller@145B0000 {
-		power-domains = <&pd_disp1>;
 		clocks = <&clock CLK_DP>;
 		clock-names = "dp";
 		phys = <&dp_phy>;
@@ -787,7 +778,6 @@
 	};
 
 	fimd: fimd@14400000 {
-		power-domains = <&pd_disp1>;
 		clocks = <&clock CLK_SCLK_FIMD1>, <&clock CLK_FIMD1>;
 		clock-names = "sclk_fimd", "fimd";
 	};
-- 
2.1.4
