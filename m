From: Jonathan Kliegman <kliegs@chromium.org>
Subject: [PATCH 2/3] ARM: exynos: change local variable combiner_data to use unique name
Date: Fri, 20 Jul 2012 14:14:35 -0400
Message-ID: <1342808076-29985-2-git-send-email-kliegs@chromium.org>
References: <1342808076-29985-1-git-send-email-kliegs@chromium.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:39930 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752591Ab2GTSOw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Jul 2012 14:14:52 -0400
Received: by mail-yw0-f46.google.com with SMTP id m54so4268223yhm.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jul 2012 11:14:51 -0700 (PDT)
In-Reply-To: <1342808076-29985-1-git-send-email-kliegs@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, Jonathan Kliegman <kliegs@chromium.org>

combiner_data in combiner_base() has the same name as the global
combiner_data array.  Clean this up.

Signed-off-by: Jonathan Kliegman <kliegs@chromium.org>
---
 arch/arm/mach-exynos/common.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 1b28aa6..3627869 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -417,10 +417,10 @@ static unsigned int rt_max_combiner_nr;
 
 static inline void __iomem *combiner_base(struct irq_data *data)
 {
-	struct combiner_chip_data *combiner_data =
+	struct combiner_chip_data *irq_combiner_data =
 		irq_data_get_irq_chip_data(data);
 
-	return combiner_data->base;
+	return irq_combiner_data->base;
 }
 
 static void combiner_mask_irq(struct irq_data *data)
-- 
1.7.7.3
