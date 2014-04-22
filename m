From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] ARM: dts: Remove mau_pd node for Exynos5420
Date: Tue, 22 Apr 2014 11:09:15 +0530
Message-ID: <1398145155-4615-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:40663 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751166AbaDVFkU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Apr 2014 01:40:20 -0400
Received: by mail-pd0-f169.google.com with SMTP id fp1so4500173pdb.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Apr 2014 22:40:20 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

MAU powerdomain provides clocks for Audio sub-system block. This block
comprises of the I2S audio controller, audio DMA blocks and Audio
sub-system clock registers.

Right now, there is no way to hook up power-domains with clock providers.
During late boot when this power-domain gets disabled, we get following
external abort.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/boot/dts/exynos5420.dtsi |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index c3a9a66..68e0f24 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -219,11 +219,6 @@
 		reg = <0x100440C0 0x20>;
 	};
 
-	mau_pd: power-domain@100440E0 {
-		compatible = "samsung,exynos4210-pd";
-		reg = <0x100440E0 0x20>;
-	};
-
 	g2d_pd: power-domain@10044100 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10044100 0x20>;
-- 
1.7.9.5
