From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM: dts: exynos5422-odroid*: remove fimd node
Date: Tue, 10 Nov 2015 11:24:09 +0100
Message-ID: <1447151049-25370-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:43517 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752086AbbKJKYW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Nov 2015 05:24:22 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NXL007V1GWKNB50@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 10 Nov 2015 10:24:20 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

FIMD device is not used at all on Exynos5422-based Odroid XU3-lite and
XU4. XU3 board teorethically can support FIMD with DisplayPort
connector, but due to hw limitation/design it doesn't work in most
cases. It is also not even enabled in XU3 dts file.

FIMD node was enabled mainly due to limitation of early Exynos DRM
driver, which didn't initialize properly when no FIMD device was
available. This node can be now safetly removed from XU3-common dtsi and
added layer to Odroid XU3 dts, when Display Port driver gets enabled.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
index 1af5bdc..9134217 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
@@ -67,11 +67,6 @@
 			<19200000>;
 };
 
-&fimd {
-	status = "okay";
-};
-
-
 &hdmi {
 	status = "okay";
 	hpd-gpio = <&gpx3 7 GPIO_ACTIVE_HIGH>;
-- 
1.9.2
