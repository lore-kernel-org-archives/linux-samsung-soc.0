From: Arun Kumar K <arun.kk@samsung.com>
Subject: [RESEND PATCHv2 3/3] ARM: dts: Add clock property for mfc_pd in 5420
Date: Tue,  8 Jul 2014 10:24:34 +0530
Message-ID: <1404795274-27307-4-git-send-email-arun.kk@samsung.com>
References: <1404795274-27307-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:42473 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751874AbaGHEyx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Jul 2014 00:54:53 -0400
In-Reply-To: <1404795274-27307-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, mark.rutland@arm.com, pawel.moll@arm.com, swarren@wwwdotorg.org, prathyush.k@samsung.com, abrestic@chromium.org, shaik.ameer@samsung.com, arunkk.samsung@gmail.com

Adding the optional clock property for the mfc_pd for
handling the re-parenting while pd on/off.

Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
Reviewed-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 79e9119..1595722 100644
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
