From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH] clocksource: samsung_pwm_timer: Do not request PWM mem region
Date: Thu, 13 Jun 2013 21:22:44 +0200
Message-ID: <1371151364-8121-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f177.google.com ([209.85.215.177]:62474 "EHLO
	mail-ea0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756785Ab3FMTWw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Jun 2013 15:22:52 -0400
Received: by mail-ea0-f177.google.com with SMTP id j14so7936025eak.22
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Jun 2013 12:22:51 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, john.stultz@linaro.org, tglx@linutronix.de, Tomasz Figa <tomasz.figa@gmail.com>

PWM registers are shared between clocksource and PWM drivers and so can
not be claimed for exclusive use.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 drivers/clocksource/samsung_pwm_timer.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/clocksource/samsung_pwm_timer.c b/drivers/clocksource/samsung_pwm_timer.c
index 0234c8d..553115b 100644
--- a/drivers/clocksource/samsung_pwm_timer.c
+++ b/drivers/clocksource/samsung_pwm_timer.c
@@ -404,7 +404,6 @@ void __init samsung_pwm_clocksource_init(void __iomem *base,
 static void __init samsung_pwm_alloc(struct device_node *np,
 				     const struct samsung_pwm_variant *variant)
 {
-	struct resource res;
 	struct property *prop;
 	const __be32 *cur;
 	u32 val;
@@ -423,17 +422,9 @@ static void __init samsung_pwm_alloc(struct device_node *np,
 		pwm.variant.output_mask |= 1 << val;
 	}
 
-	of_address_to_resource(np, 0, &res);
-	if (!request_mem_region(res.start,
-				resource_size(&res), "samsung-pwm")) {
-		pr_err("%s: failed to request IO mem region\n", __func__);
-		return;
-	}
-
-	pwm.base = ioremap(res.start, resource_size(&res));
+	pwm.base = of_iomap(np, 0);
 	if (!pwm.base) {
 		pr_err("%s: failed to map PWM registers\n", __func__);
-		release_mem_region(res.start, resource_size(&res));
 		return;
 	}
 
-- 
1.8.2.1
