From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: EXYNOS: Make combiner_of_init function static
Date: Wed,  7 Nov 2012 15:24:18 +0530
Message-ID: <1352282058-13868-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:47223 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754561Ab2KGJ7y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Nov 2012 04:59:54 -0500
Received: by mail-pb0-f46.google.com with SMTP id rr4so1100215pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Nov 2012 01:59:54 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Silences the following warning:
arch/arm/mach-exynos/common.c:576:12: warning:
symbol 'combiner_of_init' was not declared. Should it be static?

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/common.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 4e577f6..5b35d71 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -573,7 +573,8 @@ static void __init combiner_init(void __iomem *combiner_base,
 }
 
 #ifdef CONFIG_OF
-int __init combiner_of_init(struct device_node *np, struct device_node *parent)
+static int __init combiner_of_init(struct device_node *np,
+				   struct device_node *parent)
 {
 	void __iomem *combiner_base;
 
-- 
1.7.4.1
