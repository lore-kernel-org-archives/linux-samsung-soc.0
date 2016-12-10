From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v2 3/3] ARM: EXYNOS: add CPU_METHOD_OF_DECLARE for exynos SoCs
Date: Sat, 10 Dec 2016 16:16:02 +0530
Message-ID: <1481366762-26413-4-git-send-email-pankaj.dubey@samsung.com>
References: <1481366762-26413-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:52029 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752924AbcLJKnl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 10 Dec 2016 05:43:41 -0500
Received: from epcpsbgm1new.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OHY01EKXTSP3R80@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 10 Dec 2016 19:43:38 +0900 (KST)
In-reply-to: <1481366762-26413-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: krzk@kernel.org, kgene@kernel.org, javier@osg.samsung.com, thomas.ab@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

Add CPU_METHOD_OF_DECLARE to use enable_method property of
cpus node. To keep compatibility with older DTBs lets keep
older method of registering smp_ops via machine_descriptor.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 arch/arm/mach-exynos/platsmp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
index 94405c7..43eec10 100644
--- a/arch/arm/mach-exynos/platsmp.c
+++ b/arch/arm/mach-exynos/platsmp.c
@@ -474,3 +474,5 @@ const struct smp_operations exynos_smp_ops __initconst = {
 	.cpu_die		= exynos_cpu_die,
 #endif
 };
+
+CPU_METHOD_OF_DECLARE(exynos_smp, "samsung,exynos-smp", &exynos_smp_ops);
-- 
2.7.4
