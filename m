From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 1/1] ARM: dts: Use more descriptive names for Exynos5420 PDs
Date: Fri,  6 Feb 2015 18:37:38 +0100
Message-ID: <1423244258-24314-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:59923 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754838AbbBFRhw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Feb 2015 12:37:52 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

All the device nodes for the Exynos5420 power-domains have a quite
generic "power-domain" name. So in case of an error, the Exynos PD
driver shows the following (not very useful) message:

"Power domain power-domain disable failed"

Use descriptive names to know on which PD enable or disable failed.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 arch/arm/boot/dts/exynos5420.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index b63b569ca4b4..4642cec50c0d 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -247,19 +247,19 @@
 		};
 	};
 
-	gsc_pd: power-domain@10044000 {
+	gsc_pd: gsc-power-domain@10044000 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10044000 0x20>;
 		#power-domain-cells = <0>;
 	};
 
-	isp_pd: power-domain@10044020 {
+	isp_pd: isp-power-domain@10044020 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10044020 0x20>;
 		#power-domain-cells = <0>;
 	};
 
-	mfc_pd: power-domain@10044060 {
+	mfc_pd: mfc-power-domain@10044060 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10044060 0x20>;
 		clocks = <&clock CLK_FIN_PLL>, <&clock CLK_MOUT_SW_ACLK333>,
@@ -268,13 +268,13 @@
 		#power-domain-cells = <0>;
 	};
 
-	msc_pd: power-domain@10044120 {
+	msc_pd: msc-power-domain@10044120 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10044120 0x20>;
 		#power-domain-cells = <0>;
 	};
 
-	disp_pd: power-domain@100440C0 {
+	disp_pd: disp-power-domain@100440C0 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x100440C0 0x20>;
 		#power-domain-cells = <0>;
-- 
2.1.3
