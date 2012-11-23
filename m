From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: dts: Add node for GMAC for exynos5440
Date: Fri, 23 Nov 2012 11:11:23 +0900
Message-ID: <110101cdc91f$d658b7c0$830a2740$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:15012 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758889Ab2KWCLZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Nov 2012 21:11:25 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDX000BV4QLL3N0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Nov 2012 11:11:24 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDX00DBY4QZUI00@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Nov 2012 11:11:24 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Byungho An' <bh74.an@samsung.com>, 'Kukjin Kim' <kgene.kim@samsung.com>

From: Byungho An <bh74.an@samsung.com>

This patch adds node for GMAC for exynos5440.

Signed-off-by: Byungho An <bh74.an@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/boot/dts/exynos5440.dtsi |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
index 024269d..b8de8e3 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -131,6 +131,15 @@
 		interrupts = <0 1 0>;
 	};
 
+	gmac: ethernet@00230000 {
+		compatible = "snps,dwmac-3.70a";
+		reg = <0x00230000 0x8000>;
+		interrupt-parent = <&gic>;
+		interrupts = <0 31 4>;
+		interrupt-name = "macirq";
+		phy-mode = "sgmii";
+	};
+
 	amba {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
1.7.9.5
