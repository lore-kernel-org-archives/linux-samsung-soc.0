From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH 3/3] ARM: dts: Add clock property for mfc_pd in 5420
Date: Fri, 23 May 2014 11:04:48 +0530
Message-ID: <1400823288-26449-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f42.google.com ([209.85.160.42]:55395 "EHLO
	mail-pb0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751960AbaEWFe5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 May 2014 01:34:57 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: t.figa@samsung.com, kgene.kim@samsung.com, mark.rutland@arm.com, pawel.moll@arm.com, swarren@wwwdotorg.org, prathyush.k@samsung.com, abrestic@chromium.org, arunkk.samsung@gmail.com

Adding the optional clock property for the mfc_pd for
handling the re-parenting while pd on/off.

Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
---
Corrected a typo error. Sorry for the noise.
---
 arch/arm/boot/dts/exynos5420.dtsi |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 5a85896..d1170db 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -260,6 +260,9 @@
 	mfc_pd: power-domain@10044060 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10044060 0x20>;
+		clocks = <&clock CLK_FIN_PLL>, <&clock CLK_MOUT_SW_ACLK333>,
+			<&clock CLK_MOUT_USER_ACLK333>;
+		clock-names = "oscclk", "pclk0", "clk0";
 	};
 
 	disp_pd: power-domain@100440C0 {
-- 
1.7.9.5
