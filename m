From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] ARM: dts: Add secure-firmware boot support for OrigenQaud board
Date: Tue, 23 Jul 2013 11:52:59 +0530
Message-ID: <1374560579-25084-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f172.google.com ([209.85.192.172]:54182 "EHLO
	mail-pd0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751497Ab3GWGjJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Jul 2013 02:39:09 -0400
Received: by mail-pd0-f172.google.com with SMTP id z10so7719437pdj.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jul 2013 23:39:08 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org

OrigenQuad board boots with secure firmware support. Enable support for
reading smc commands.

The binding has been updated as per the documentation provided in
Documentation/devicetree/bindings/arm/samsung-boards.txt.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/boot/dts/exynos4412-origen.dts |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index 7993641..8768b03 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -27,6 +27,11 @@
 		bootargs ="console=ttySAC2,115200";
 	};
 
+	firmware@0203F000 {
+		compatible = "samsung,secure-firmware";
+		reg = <0x0203F000 0x1000>;
+	};
+
 	mmc_reg: voltage-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "VMEM_VDD_2.8V";
-- 
1.7.9.5
