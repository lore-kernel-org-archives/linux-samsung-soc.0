From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] ARM: dts: Add fixed-voltage regulator for vmmc supply on SMDK5420
Date: Fri, 25 Oct 2013 17:13:25 +0530
Message-ID: <1382701405-28589-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f50.google.com ([209.85.160.50]:35161 "EHLO
	mail-pb0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751691Ab3JYLof (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Oct 2013 07:44:35 -0400
Received: by mail-pb0-f50.google.com with SMTP id uo5so1311705pbc.37
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Oct 2013 04:44:35 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

Add vmmc regulator node, required for mmc driver.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/boot/dts/exynos5420-smdk5420.dts |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index fb5a1e2..f9ca17f 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -120,4 +120,16 @@
 			reg = <0x50>;
 		};
 	};
+
+	regulators {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		mmc_reg: regulator@0 {
+			compatible = "regulator-fixed";
+			reg = <0>;
+			regulator-name = "vmmc";
+		};
+	};
 };
-- 
1.7.9.5
