From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH 1/2] ARM: exynos: pl330: Add #dma-cells for generic dma binding
 support
Date: Mon, 04 Mar 2013 11:04:27 +0530
Message-ID: <1362375268-29405-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:23862 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751101Ab3CDFdq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Mar 2013 00:33:46 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MJ400I92FG8L8N0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Mar 2013 14:33:44 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MJ400185FFP2X80@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Mar 2013 14:33:44 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, padma.kvr@gmail.com, padma.v@samsung.com
Cc: sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, arnd@arndb.de, vinod.koul@intel.com, boojin.kim@samsung.com, robherring2@gmail.com, dinguyen@altera.com

This patch adds #dma-cells property to PL330 DMA controller
nodes for supporting generic dma dt bindings on samsung exynos
platforms. #dma-channels and #dma-requests are not required now
but added in advance.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---

Based on Torvalds tree

 arch/arm/boot/dts/exynos4.dtsi    |    9 +++++++++
 arch/arm/boot/dts/exynos5440.dtsi |    6 ++++++
 2 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index e1347fc..1a62bcf 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -275,18 +275,27 @@
 			compatible = "arm,pl330", "arm,primecell";
 			reg = <0x12680000 0x1000>;
 			interrupts = <0 35 0>;
+			#dma-cells = <1>;
+			#dma-channels = <8>;
+			#dma-requests = <32>;
 		};
 
 		pdma1: pdma@12690000 {
 			compatible = "arm,pl330", "arm,primecell";
 			reg = <0x12690000 0x1000>;
 			interrupts = <0 36 0>;
+			#dma-cells = <1>;
+			#dma-channels = <8>;
+			#dma-requests = <32>;
 		};
 
 		mdma1: mdma@12850000 {
 			compatible = "arm,pl330", "arm,primecell";
 			reg = <0x12850000 0x1000>;
 			interrupts = <0 34 0>;
+			#dma-cells = <1>;
+			#dma-channels = <8>;
+			#dma-requests = <1>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
index 5f3562a..9a99755 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -142,12 +142,18 @@
 			compatible = "arm,pl330", "arm,primecell";
 			reg = <0x120000 0x1000>;
 			interrupts = <0 34 0>;
+			#dma-cells = <1>;
+			#dma-channels = <8>;
+			#dma-requests = <32>;
 		};
 
 		pdma1: pdma@121B0000 {
 			compatible = "arm,pl330", "arm,primecell";
 			reg = <0x121000 0x1000>;
 			interrupts = <0 35 0>;
+			#dma-cells = <1>;
+			#dma-channels = <8>;
+			#dma-requests = <32>;
 		};
 	};
 
-- 
1.7.4.4
