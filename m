From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V1 1/2] ARM: dts: Add nodes for i2s controllers for Samsung
 Exynos5 platforms
Date: Thu, 27 Sep 2012 15:56:35 +0530
Message-ID: <1348741596-29451-2-git-send-email-padma.v@samsung.com>
References: <1348741596-29451-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:55995 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754494Ab2I0KVy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Sep 2012 06:21:54 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MB0000077GFCU21@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 27 Sep 2012 19:21:53 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MB000MWN7G70X10@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 27 Sep 2012 19:21:52 +0900 (KST)
In-reply-to: <1348741596-29451-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: padma.v@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org
Cc: sbkim73@samsung.com, sangsu4u.park@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com

Add device nodes for the three instances of i2s controllers in Exynos5
platforms. Enable instance i2s 0 for exynos5250 board and disable all
other i2s instances.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 arch/arm/boot/dts/exynos5250-smdk5250.dts |   15 +++++++++++++++
 arch/arm/boot/dts/exynos5250.dtsi         |   28 ++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 62e1039..ab0291d 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -109,4 +109,19 @@
 	spi_2: spi@12d40000 {
 		status = "disabled";
 	};
+
+	i2s_0: i2s@03830000 {
+		gpios = <&gpz 0 2 0 0>, <&gpz 1 2 0 0>, <&gpz 2 2 0 0>,
+			<&gpz 3 2 0 0>, <&gpz 4 2 0 0>, <&gpz 5 2 0 0>,
+			<&gpz 6 2 0 0>;
+		idma-addr = <0x03000000>;
+	};
+
+	i2s_1: i2s@12D60000 {
+		status = "disabled";
+	};
+
+	i2s_2: i2s@12D70000 {
+		status = "disabled";
+	};
 };
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index b55794b4..ac694d9 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -31,6 +31,9 @@
 		gsc1 = &gsc_1;
 		gsc2 = &gsc_2;
 		gsc3 = &gsc_3;
+		i2s0 = &i2s_0;
+		i2s1 = &i2s_1;
+		i2s2 = &i2s_2;
 	};
 
 	gic:interrupt-controller@10481000 {
@@ -186,6 +189,31 @@
 		#size-cells = <0>;
 	};
 
+	i2s_0: i2s@03830000 {
+		compatible = "samsung,samsung-i2s";
+		reg = <0x03830000 0x100>;
+		tx-dma-channel-secondary = <&pdma0 8>;
+		tx-dma-channel = <&pdma0 10>;
+		rx-dma-channel = <&pdma0 9>;
+		supports-6ch;
+		supports-rstclr;
+		supports-secdai;
+	};
+
+	i2s_1: i2s@12D60000 {
+		compatible = "samsung,samsung-i2s";
+		reg = <0x12D60000 0x100>;
+		tx-dma-channel = <&pdma1 12>;
+		rx-dma-channel = <&pdma1 11>;
+	};
+
+	i2s_2: i2s@12D70000 {
+		compatible = "samsung,samsung-i2s";
+		reg = <0x12D70000 0x100>;
+		tx-dma-channel = <&pdma0 12>;
+		rx-dma-channel = <&pdma0 11>;
+	};
+
 	amba {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
1.7.4.4
