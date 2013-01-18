From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH 3/4] ARM: dts: Add #dma-cells for generic dma binding support
Date: Fri, 18 Jan 2013 17:03:43 +0530
Message-ID: <1358508824-20352-4-git-send-email-padma.v@samsung.com>
References: <1358508824-20352-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:46639 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752064Ab3ARLih (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Jan 2013 06:38:37 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGT0073TKC6WQ01@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jan 2013 20:38:36 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MGT00M2KK3GTU10@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jan 2013 20:38:35 +0900 (KST)
In-reply-to: <1358508824-20352-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: padma.v@samsung.com, padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org
Cc: sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, vinod.koul@intel.com, grant.likely@secretlab.ca, swarren@nvidia.com, boojin.kim@samsung.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, thomas.abraham@linaro.org

This patch adds #dma-cells property to PL330 DMA controller
nodes for supporting generic dma dt bindings on samsung
exynos5250 platform.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 .../devicetree/bindings/dma/arm-pl330.txt          |    9 ++++++---
 arch/arm/boot/dts/exynos5250.dtsi                  |    4 ++++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/arm-pl330.txt b/Documentation/devicetree/bindings/dma/arm-pl330.txt
index 36e27d5..457a233 100644
--- a/Documentation/devicetree/bindings/dma/arm-pl330.txt
+++ b/Documentation/devicetree/bindings/dma/arm-pl330.txt
@@ -8,6 +8,8 @@ Required properties:
   - reg: physical base address of the controller and length of memory mapped
     region.
   - interrupts: interrupt number to the cpu.
+  - #dma-cells: must be at least 1. used to represent the number of integer
+    cells in the dmas property of client device.
 
 Optional properties:
 - dma-coherent      : Present if dma operations are coherent
@@ -18,6 +20,7 @@ Example:
 		compatible = "arm,pl330", "arm,primecell";
 		reg = <0x12680000 0x1000>;
 		interrupts = <99>;
+		#dma-cells = <1>;
 	};
 
 Client drivers (device nodes requiring dma transfers from dev-to-mem or
@@ -27,7 +30,7 @@ as shown below.
   [property name]  = <[phandle of the dma controller] [dma request id]>;
 
       where 'dma request id' is the dma request number which is connected
-      to the client controller. The 'property name' is recommended to be
-      of the form <name>-dma-channel.
+      to the client controller. The 'property name' is 'dmas' as recommended
+      by the generic dma device tree binding helpers.
 
-  Example:  tx-dma-channel = <&pdma0 12>;
+  Example:  dmas = <&pdma0 12>;
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 30485de..46bae01 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -286,24 +286,28 @@
 			compatible = "arm,pl330", "arm,primecell";
 			reg = <0x121A0000 0x1000>;
 			interrupts = <0 34 0>;
+			#dma-cells = <1>;
 		};
 
 		pdma1: pdma@121B0000 {
 			compatible = "arm,pl330", "arm,primecell";
 			reg = <0x121B0000 0x1000>;
 			interrupts = <0 35 0>;
+			#dma-cells = <1>;
 		};
 
 		mdma0: mdma@10800000 {
 			compatible = "arm,pl330", "arm,primecell";
 			reg = <0x10800000 0x1000>;
 			interrupts = <0 33 0>;
+			#dma-cells = <1>;
 		};
 
 		mdma1: mdma@11C10000 {
 			compatible = "arm,pl330", "arm,primecell";
 			reg = <0x11C10000 0x1000>;
 			interrupts = <0 124 0>;
+			#dma-cells = <1>;
 		};
 	};
 
-- 
1.7.4.4
