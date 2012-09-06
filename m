From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 2/3] ARM: EXYNOS: pm_domain: Fix power domain name
 initialization
Date: Thu, 06 Sep 2012 11:38:05 +0200
Message-ID: <1346924286-9584-3-git-send-email-t.figa@samsung.com>
References: <1346924286-9584-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:64761 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756877Ab2IFJiY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Sep 2012 05:38:24 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9X00EBP9FBPF50@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Sep 2012 18:38:23 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9X00K2L9FLF240@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Sep 2012 18:38:23 +0900 (KST)
In-reply-to: <1346924286-9584-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, kgene.kim@samsung.com, thomas.abraham@linaro.org, rjw@sisk.pl, Tomasz Figa <t.figa@samsung.com>

This patch adds initialization of name field in generic power domain
struct.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/pm_domains.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-exynos/pm_domains.c
index d1abc1a..5b7ce7e 100644
--- a/arch/arm/mach-exynos/pm_domains.c
+++ b/arch/arm/mach-exynos/pm_domains.c
@@ -98,7 +98,8 @@ static __init int exynos_pm_dt_parse_domains(void)
 			return -ENOMEM;
 		}
 
-		pd->name = np->name;
+		pd->pd.name = kstrdup(np->name, GFP_KERNEL);
+		pd->name = pd->pd.name;
 		pd->base = of_iomap(np, 0);
 		pd->pd.power_off = exynos_pd_power_off;
 		pd->pd.power_on = exynos_pd_power_on;
-- 
1.7.12
