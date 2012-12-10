From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: EXYNOS: fix GIC using for EXYNOS5440
Date: Mon, 10 Dec 2012 10:07:58 +0900
Message-ID: <030c01cdd672$cb1b6b40$615241c0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:65332 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750960Ab2LJBIA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 9 Dec 2012 20:08:00 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MES00IQPJ4JPBB0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Dec 2012 10:07:58 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MES00KARJ5A9PA0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Dec 2012 10:07:58 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org


Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos/common.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 0eb3b9a..9ecda37 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -684,7 +684,8 @@ void __init exynos5_init_irq(void)
 	 * Theses parameters should be NULL and 0 because EXYNOS4
 	 * uses GIC instead of VIC.
 	 */
-	s5p_init_irq(NULL, 0);
+	if (!of_machine_is_compatible("samsung,exynos5440"))
+		s5p_init_irq(NULL, 0);
 
 	gic_arch_extn.irq_set_wake = s3c_irq_wake;
 }
-- 
1.7.4.1
