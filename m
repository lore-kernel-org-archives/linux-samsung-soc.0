From: Shaik Ameer Basha <shaik.ameer@samsung.com>
Subject: [PATCH v2 3/3] ARM: dts: Add clock property for mfc_pd in 5420
Date: Mon, 26 May 2014 17:26:24 +0530
Message-ID: <1401105384-8678-4-git-send-email-shaik.ameer@samsung.com>
References: <1401105384-8678-1-git-send-email-shaik.ameer@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:54546 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751549AbaEZL6n (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 May 2014 07:58:43 -0400
In-reply-to: <1401105384-8678-1-git-send-email-shaik.ameer@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, tomasz.figa@gmail.com, mark.rutland@arm.com, pawel.moll@arm.com, swarren@wwwdotorg.org, prathyush.k@samsung.com, abrestic@chromium.org, arunkk.samsung@gmail.com, joshi@samsung.com, Arun Kumar K <arun.kk@samsung.com>, Shaik Ameer Basha <shaik.ameer@samsung.com>

From: Arun Kumar K <arun.kk@samsung.com>

Adding the optional clock property for the mfc_pd for
handling the re-parenting while pd on/off.

Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
Reviewed-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index e385322..049c5d9 100644
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
