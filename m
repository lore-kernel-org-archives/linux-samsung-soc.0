From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v3 4/8] ARM: dts: exynos4412-odroidx: correct memory size
Date: Mon, 14 Jul 2014 14:48:22 +0200
Message-ID: <1405342106-10585-5-git-send-email-m.szyprowski@samsung.com>
References: <1405342106-10585-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:11148 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755299AbaGNMsk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Jul 2014 08:48:40 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N8P00J81CWXRQ70@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 Jul 2014 13:48:33 +0100 (BST)
In-reply-to: <1405342106-10585-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Kamil Debski <k.debski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>

Last megabyte of RAM is used by secure firmware and should not be accessed
by Linux kernel, so correct available memory size in DTS file.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4412-odroidx.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroidx.dts
index 4c853fbf7202..bcf331543fb0 100644
--- a/arch/arm/boot/dts/exynos4412-odroidx.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
@@ -19,7 +19,7 @@
 	compatible = "hardkernel,odroid-x", "samsung,exynos4412", "samsung,exynos4";
 
 	memory {
-		reg = <0x40000000 0x40000000>;
+		reg = <0x40000000 0x3FF00000>;
 	};
 
 	firmware@0204F000 {
-- 
1.9.2
