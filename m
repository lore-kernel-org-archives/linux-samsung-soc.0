From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM: dts: exynos5422-odroidxu3*: use peripheral mode for dwc3_1
Date: Thu, 19 Nov 2015 12:51:22 +0100
Message-ID: <1447933882-3030-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:58200 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758492AbbKSLvk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Nov 2015 06:51:40 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NY2006IC8Y1ERB0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 19 Nov 2015 11:51:37 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

DWC3 device found on Exynos SoCs cannot work in OTG mode alone, because
it lacks some OTG related control part. OTG mode operation is possible
only with external hardware logic (usually GPIO-based) specific to
the board. Right now, however, there is no driver for such logic and no
bindings, so the OTG mode is disfunctional at all (this means that it
doesn't work as a peripheral nor as a host). This patch sets the operation
mode to peripheral to get DWC3_1 device at least somehow working. This can
be later updated, when proper OTG driver and bindings get developed.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos5422-odroidxu3-lite.dts | 2 +-
 arch/arm/boot/dts/exynos5422-odroidxu3.dts      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-lite.dts b/arch/arm/boot/dts/exynos5422-odroidxu3-lite.dts
index b1b3608..2ae1cf4 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-lite.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-lite.dts
@@ -67,5 +67,5 @@
 };
 
 &usbdrd_dwc3_1 {
-	dr_mode = "otg";
+	dr_mode = "peripheral";
 };
diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
index 0c0bbdb..432406d 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
@@ -98,5 +98,5 @@
 };
 
 &usbdrd_dwc3_1 {
-	dr_mode = "otg";
+	dr_mode = "peripheral";
 };
-- 
1.9.2
