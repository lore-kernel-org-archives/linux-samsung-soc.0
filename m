From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 1/2] ARM: dts: Fix the number of DMA channels for Exynos3250
Date: Wed, 12 Nov 2014 11:41:07 +0900
Message-ID: <1415760068-765-2-git-send-email-cw00.choi@samsung.com>
References: <1415760068-765-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:51235 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755220AbaKLClQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Nov 2014 21:41:16 -0500
In-reply-to: <1415760068-765-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: ben-linux@fluff.org, kyungmin.park@samsung.com, cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

This patch fix the numer for DMA channels for Exynos3250 because DMA controller
of Exynos3250 can support 16 channels simultaneously.

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 arch/arm/boot/dts/exynos3250.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 242ddda..5c14e3e 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -292,7 +292,7 @@
 				clocks = <&cmu CLK_PDMA0>;
 				clock-names = "apb_pclk";
 				#dma-cells = <1>;
-				#dma-channels = <8>;
+				#dma-channels = <16>;
 				#dma-requests = <32>;
 			};
 
@@ -303,7 +303,7 @@
 				clocks = <&cmu CLK_PDMA1>;
 				clock-names = "apb_pclk";
 				#dma-cells = <1>;
-				#dma-channels = <8>;
+				#dma-channels = <16;
 				#dma-requests = <32>;
 			};
 		};
-- 
1.8.5.5
