From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM: dts: exynos4210-universal_c210: disable DMA for UARTs
Date: Mon, 16 Nov 2015 15:36:54 +0100
Message-ID: <1447684614-25336-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:17460 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750921AbbKPOhI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Nov 2015 09:37:08 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NXW006VKWLSS780@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 16 Nov 2015 14:37:04 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

PDMA for UART devices seems not to be working properly on Exynos 4210
revision 0 used in Universal C210 boards, so disable it to let one to
use UART devices (driver defaults to PIO mode if DMA is not present).

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4210-universal_c210.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index 81b7ec7..4f5d379 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -560,16 +560,24 @@
 
 &serial_0 {
 	status = "okay";
+	/delete-property/dmas;
+	/delete-property/dma-names;
 };
 
 &serial_1 {
 	status = "okay";
+	/delete-property/dmas;
+	/delete-property/dma-names;
 };
 
 &serial_2 {
 	status = "okay";
+	/delete-property/dmas;
+	/delete-property/dma-names;
 };
 
 &serial_3 {
 	status = "okay";
+	/delete-property/dmas;
+	/delete-property/dma-names;
 };
-- 
1.9.2
