From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 4/4] ARM: dts: exynos4210-universal_c210: add external sd
 card node
Date: Thu, 22 May 2014 07:52:17 +0200
Message-ID: <1400737937-7368-5-git-send-email-m.szyprowski@samsung.com>
References: <1400737937-7368-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:38010 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750958AbaEVFwz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 01:52:55 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N5Y002IHOBV7U70@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 22 May 2014 06:52:43 +0100 (BST)
In-reply-to: <1400737937-7368-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

This patch enables support external SD card slot.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/boot/dts/exynos4210-universal_c210.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index 91bcf3249243..d50eb3aa708e 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -83,6 +83,16 @@
 		status = "okay";
 	};
 
+	sdhci_sd: sdhci@12530000 {
+		bus-width = <4>;
+		pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus4>;
+		pinctrl-names = "default";
+		vmmc-supply = <&ldo5_reg>;
+		cd-gpios = <&gpx3 4 0>;
+		cd-inverted;
+		status = "okay";
+	};
+
 	ehci@12580000 {
 		status = "okay";
 		port@0 {
-- 
1.9.2
