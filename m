From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: dts: Removing pdma for SSDK5440
Date: Tue, 11 Jun 2013 17:02:19 +0900
Message-ID: <109601ce6679$fef2e410$fcd8ac30$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:44804 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752649Ab3FKICV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Jun 2013 04:02:21 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MO70059FYBDW350@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 11 Jun 2013 17:02:19 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Giridhar Maruthy' <giridhar.m@samsung.com>

From: Giridhar Maruthy <giridhar.m@samsung.com>

Since the pdma works only in secure mode, accessing the same
in hypervisor mode gives an abort. As we are not using pdma
anywhere (including spi), removing the same.

Signed-off-by: Giridhar Maruthy <giridhar.m@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/boot/dts/exynos5440.dtsi |   24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
index 871ebad..b08449e 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -105,8 +105,6 @@
 		compatible = "samsung,exynos4210-spi";
 		reg = <0xD0000 0x1000>;
 		interrupts = <0 4 0>;
-		tx-dma-channel = <&pdma0 5>; /* preliminary */
-		rx-dma-channel = <&pdma0 4>; /* preliminary */
 		#address-cells = <1>;
 		#size-cells = <0>;
 		clocks = <&clock 21>, <&clock 16>;
@@ -184,28 +182,6 @@
 		compatible = "arm,amba-bus";
 		interrupt-parent = <&gic>;
 		ranges;
-
-		pdma0: pdma@00121000 {
-			compatible = "arm,pl330", "arm,primecell";
-			reg = <0x121000 0x1000>;
-			interrupts = <0 46 0>;
-			clocks = <&clock 8>;
-			clock-names = "apb_pclk";
-			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
-		};
-
-		pdma1: pdma@00120000 {
-			compatible = "arm,pl330", "arm,primecell";
-			reg = <0x120000 0x1000>;
-			interrupts = <0 47 0>;
-			clocks = <&clock 8>;
-			clock-names = "apb_pclk";
-			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
-		};
 	};
 
 	rtc {
-- 
1.7.10.4
