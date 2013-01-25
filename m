From: Byungho An <bh74.an@samsung.com>
Subject: [PATCH] ARM: dts: Add node for GMAC for exynos5440
Date: Fri, 25 Jan 2013 14:28:16 -0800
Message-ID: <014101cdfb4b$466426a0$d32c73e0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:24625 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753116Ab3AYW2U (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jan 2013 17:28:20 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MH700D5BD37OB20@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 26 Jan 2013 07:28:19 +0900 (KST)
Received: from VISITOR6LAB ([105.128.18.8])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MH7006OUD35OU10@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 26 Jan 2013 07:28:19 +0900 (KST)
Content-language: en-zw
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com


This patch adds node for GMAC for exynos5440
EXYNOS5440 SoC supported by GMAC driver.

Signed-off-by: Byungho An <bh74.an@samsung.com>
---
 arch/arm/boot/dts/exynos5440.dtsi |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5440.dtsi
b/arch/arm/boot/dts/exynos5440.dtsi
index 024269d..d8c215e 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -131,6 +131,17 @@
 		interrupts = <0 1 0>;
 	};
 
+	gmac: ethernet@00230000 {
+		compatible = "snps,dwmac-3.70a";
+		reg = <0x00230000 0x8000>;
+		interrupt-parent = <&gic>;
+		interrupts = <0 31 4>;
+		interrupt-names = "macirq";
+		phy-mode = "sgmii";
+		clocks = <&clock 12>;
+		clock-names = "stmmaceth";
+	};
+
 	amba {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
1.7.10.4
