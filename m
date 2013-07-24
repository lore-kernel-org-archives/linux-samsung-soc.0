From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: dts: re-ordering exynos dtbs in Makefile
Date: Wed, 24 Jul 2013 13:36:47 +0900
Message-ID: <0e0c01ce8827$6850a220$38f1e660$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:44899 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750842Ab3GXEgt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 00:36:49 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQF00CL5BGFXOF0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Jul 2013 13:36:47 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Kukjin Kim' <kgene@kernel.org>


Re-ordering in alphabetical.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/boot/dts/Makefile |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 641b3c9..ad340e4 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -53,13 +53,13 @@ dtb-$(CONFIG_ARCH_EXYNOS) += exynos4210-origen.dtb \
 	exynos4210-trats.dtb \
 	exynos4210-universal_c210.dtb \
 	exynos4412-odroidx.dtb \
-	exynos4412-smdk4412.dtb \
 	exynos4412-origen.dtb \
+	exynos4412-smdk4412.dtb \
 	exynos5250-arndale.dtb \
-	exynos5440-sd5v1.dtb \
 	exynos5250-smdk5250.dtb \
 	exynos5250-snow.dtb \
 	exynos5420-smdk5420.dtb \
+	exynos5440-sd5v1.dtb \
 	exynos5440-ssdk5440.dtb
 dtb-$(CONFIG_ARCH_HIGHBANK) += highbank.dtb \
 	ecx-2000.dtb
-- 
1.7.10.4
