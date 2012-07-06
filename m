From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH] ARM: EXYNOS: Make combiner_init function static
Date: Fri,  6 Jul 2012 17:09:03 +0530
Message-ID: <1341574743-3897-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:55301 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030257Ab2GFLva (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Jul 2012 07:51:30 -0400
Received: by pbbrp8 with SMTP id rp8so14511279pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Jul 2012 04:51:29 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Fixes the following warning:
arch/arm/mach-exynos/common.c:543:13:
warning: symbol 'combiner_init' was not declared. Should it be static?

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/common.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 0ec1a91..66d71ba 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -540,7 +540,8 @@ static struct irq_domain_ops combiner_irq_domain_ops = {
 	.map	= combiner_irq_domain_map,
 };
 
-void __init combiner_init(void __iomem *combiner_base, struct device_node *np)
+static void __init combiner_init(void __iomem *combiner_base,
+				struct device_node *np)
 {
 	int i, irq, irq_base;
 	unsigned int max_nr, nr_irq;
-- 
1.7.4.1
