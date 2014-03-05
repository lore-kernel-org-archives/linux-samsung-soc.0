From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 2/2] ARM: dts: Keep some essential LDOs enabled for Arndale-Octa
Date: Wed,  5 Mar 2014 13:39:07 +0530
Message-ID: <1394006947-26126-2-git-send-email-tushar.behera@linaro.org>
References: <1394006947-26126-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f54.google.com ([209.85.160.54]:44880 "EHLO
	mail-pb0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751441AbaCEIPF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Mar 2014 03:15:05 -0500
Received: by mail-pb0-f54.google.com with SMTP id ma3so761458pbc.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Mar 2014 00:15:05 -0800 (PST)
In-Reply-To: <1394006947-26126-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

LDO3 and LDO23 need to be enabled in order for soft-reset to work.

Additionally LDO9 needs to be enabled for USB operations.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/boot/dts/exynos5420-arndale-octa.dts |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index 810ec73..df975b5 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -113,6 +113,7 @@
 					regulator-name = "PVDD_APIO_MMCON_1V8";
 					regulator-min-microvolt = <1800000>;
 					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
 				};
 
 				ldo4_reg: LDO4 {
@@ -150,6 +151,7 @@
 					regulator-name = "PVDD_USB_3V3";
 					regulator-min-microvolt = <3000000>;
 					regulator-max-microvolt = <3000000>;
+					regulator-always-on;
 				};
 
 				ldo10_reg: LDO10 {
@@ -218,6 +220,7 @@
 					regulator-name = "PVDD_MIFS_1V1";
 					regulator-min-microvolt = <1200000>;
 					regulator-max-microvolt = <1200000>;
+					regulator-always-on;
 				};
 
 				ldo24_reg: LDO24 {
-- 
1.7.9.5
