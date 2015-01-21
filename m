From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM: dts: exynos5422-odroidxu3: reduce total RAM by 22 MiB
Date: Wed, 21 Jan 2015 13:22:52 +0100
Message-ID: <1421842972-25807-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:22712 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751462AbbAUMXI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Jan 2015 07:23:08 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NIJ00GMA196VX40@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Jan 2015 12:27:06 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, jy0922.shim@samsung.com, Kevin Hilman <khilman@linaro.org>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>

Last 22 MiB is RAM is reserved by secure monitor code and cannot be
accessed from Linux kernel, so adjust total RAM size to 0x7EA00000
(2 GiB - 22 MiB). This fixes random 'imprecise kernel abort' kernel
failures.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos5422-odroidxu3.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
index f6fc9442f631..50843208860d 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
@@ -18,7 +18,7 @@
 	compatible = "hardkernel,odroid-xu3", "samsung,exynos5800", "samsung,exynos5";
 
 	memory {
-		reg = <0x40000000 0x80000000>;
+		reg = <0x40000000 0x7EA00000>;
 	};
 
 	chosen {
-- 
1.9.2
