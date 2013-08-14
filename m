From: Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>
Subject: [PATCH 2/2] ARM: dts: Add dwmmc nodes in SOC specific dts file
Date: Wed, 14 Aug 2013 17:48:59 +0530
Message-ID: <1376482739-1994-2-git-send-email-yuvaraj.cd@samsung.com>
References: <1376482739-1994-1-git-send-email-yuvaraj.cd@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:63753 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752803Ab3HNMTM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 08:19:12 -0400
Received: by mail-pb0-f46.google.com with SMTP id rq2so9346016pbb.33
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Aug 2013 05:19:11 -0700 (PDT)
In-Reply-To: <1376482739-1994-1-git-send-email-yuvaraj.cd@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com
Cc: Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>

Exynos5 series SOC's have different versions of DWMMC controller.
So dwmmc device nodes moved from Exynos5 SOC's common dts file to
SOC specific dts file.

Signed-off-by: Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 88589b7..ae0d852 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -385,18 +385,30 @@
 	};
 
 	dwmmc_0: dwmmc0@12200000 {
+		compatible = "samsung,exynos5250-dw-mshc";
+		interrupts = <0 75 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 		reg = <0x12200000 0x1000>;
 		clocks = <&clock 280>, <&clock 139>;
 		clock-names = "biu", "ciu";
 	};
 
 	dwmmc_1: dwmmc1@12210000 {
+		compatible = "samsung,exynos5250-dw-mshc";
+		interrupts = <0 76 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 		reg = <0x12210000 0x1000>;
 		clocks = <&clock 281>, <&clock 140>;
 		clock-names = "biu", "ciu";
 	};
 
 	dwmmc_2: dwmmc2@12220000 {
+		compatible = "samsung,exynos5250-dw-mshc";
+		interrupts = <0 77 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 		reg = <0x12220000 0x1000>;
 		clocks = <&clock 282>, <&clock 141>;
 		clock-names = "biu", "ciu";
-- 
1.7.9.5
