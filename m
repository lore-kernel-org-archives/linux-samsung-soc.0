From: Byungho An <bh74.an@samsung.com>
Subject: [PATCH v2] ARM: dts: Add node for GMAC for exynos5440
Date: Thu, 31 Jan 2013 15:10:17 -0800
Message-ID: <029201ce0008$237372b0$6a5a5810$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ks_c_5601-1987
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:15194 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751523Ab3AaXKY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jan 2013 18:10:24 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHI00C09J159U30@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 01 Feb 2013 08:10:22 +0900 (KST)
Received: from VISITOR6LAB ([105.128.18.8])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHI006ATJ18QM20@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 01 Feb 2013 08:10:22 +0900 (KST)
Content-language: en-zw
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: =?ks_c_5601-1987?B?seixucH4?= <kgene.kim@samsung.com>


This patch adds node for GMAC for exynos5440
EXYNOS5440 SoC supported by GMAC driver.

Signed-off-by: Byungho An <bh74.an@samsung.com>
---
 arch/arm/boot/dts/exynos5440.dtsi |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5440.dtsi
b/arch/arm/boot/dts/exynos5440.dtsi
index 1e7a2b0..7267842 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -151,4 +151,15 @@
 		reg = <0x130000 0x1000>;
 		interrupts = <0 17 0>, <0 16 0>;
 	};
+
+	gmac: ethernet@00230000 {
+		compatible = "snps,dwmac-3.70a";
+		reg = <0x00230000 0x8000>;
+		interrupt-parent = <&gic>;
+		interrupts = <0 31 0>;
+		interrupt-names = "macirq";
+		phy-mode = "sgmii";
+		clocks = <&clock 12>;
+		clock-names = "stmmaceth";
+	};
 };
-- 
1.7.10.4
