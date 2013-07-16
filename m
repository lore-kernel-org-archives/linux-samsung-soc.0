From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: EXYNOS: skip pm support on exynos5440
Date: Tue, 16 Jul 2013 12:27:51 +0900
Message-ID: <027501ce81d4$73a0a200$5ae1e600$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:49011 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757532Ab3GPD1y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Jul 2013 23:27:54 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQ000J5EEYFG0K0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 16 Jul 2013 12:27:52 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Kukjin Kim' <kgene@kernel.org>


EXYNOS5440 doesn't support PM and current single image for EXYNOS
will be break without this patch. Actually, SSDK5440 cannot boot
without this so this should be merged during -rc.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos/pm.c |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
index 41c2069..c679db5 100644
--- a/arch/arm/mach-exynos/pm.c
+++ b/arch/arm/mach-exynos/pm.c
@@ -217,6 +217,9 @@ static __init int exynos_pm_drvinit(void)
 	struct clk *pll_base;
 	unsigned int tmp;
 
+	if (soc_is_exynos5440())
+		return 0;
+
 	s3c_pm_init();
 
 	/* All wakeup disable */
@@ -340,6 +343,9 @@ static struct syscore_ops exynos_pm_syscore_ops = {
 
 static __init int exynos_pm_syscore_init(void)
 {
+	if (soc_is_exynos5440())
+		return 0;
+
 	register_syscore_ops(&exynos_pm_syscore_ops);
 	return 0;
 }
-- 
1.7.10.4
