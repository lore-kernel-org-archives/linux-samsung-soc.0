From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] ARM: exynos_defconfig: increase CONFIG_NR_CPUS value to 8
Date: Thu, 21 Nov 2013 13:06:06 +0100
Message-ID: <1511364.Pd4tSi34z7@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:55785 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753177Ab3KUMGP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Nov 2013 07:06:15 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MWM00GPP4AE9P10@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Nov 2013 21:06:14 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Current CONFIG_NR_CPUS value (2) is too small for:
- EXYNOS4412 (4 cores)
- EXYNOS5440 (4 cores)
- EXYNOS5410 (8 cores)
- EXYNOS5420 (8 cores)

Set CONFIG_NR_CPUS to 8 so it is correct for all currently
supported SoCs.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 arch/arm/configs/exynos_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index ad7dfbb..aec8a3e 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -13,7 +13,7 @@ CONFIG_S3C24XX_PWM=y
 CONFIG_ARCH_EXYNOS5=y
 CONFIG_MACH_EXYNOS4_DT=y
 CONFIG_SMP=y
-CONFIG_NR_CPUS=2
+CONFIG_NR_CPUS=8
 CONFIG_PREEMPT=y
 CONFIG_AEABI=y
 CONFIG_HIGHMEM=y
-- 
1.8.2.3
