From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: S3C24XX: Fix warnings in irq-s3c2416.c
Date: Thu, 10 Jan 2013 16:47:40 +0530
Message-ID: <1357816660-18224-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:52558 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751752Ab3AJLZ5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Jan 2013 06:25:57 -0500
Received: by mail-pa0-f46.google.com with SMTP id bh2so298938pad.33
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jan 2013 03:25:57 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Fixes the following warnings:
arch/arm/mach-s3c24xx/irq-s3c2416.c:226:17: warning:
symbol 's3c2416_irq_second' was not declared. Should it be static?
arch/arm/mach-s3c24xx/irq-s3c2416.c:332:5: warning:
symbol 's3c2416_irq_suspend' was not declared. Should it be static?
arch/arm/mach-s3c24xx/irq-s3c2416.c:339:6: warning:
symbol 's3c2416_irq_resume' was not declared. Should it be static?

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-s3c24xx/irq-s3c2416.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/irq-s3c2416.c b/arch/arm/mach-s3c24xx/irq-s3c2416.c
index ff141b0..f282670 100644
--- a/arch/arm/mach-s3c24xx/irq-s3c2416.c
+++ b/arch/arm/mach-s3c24xx/irq-s3c2416.c
@@ -223,7 +223,7 @@ static void s3c2416_irq_unmask_second(struct irq_data *data)
 	__raw_writel(mask, S3C2416_INTMSK2);
 }
 
-struct irq_chip s3c2416_irq_second = {
+static struct irq_chip s3c2416_irq_second = {
 	.irq_ack	= s3c2416_irq_ack_second,
 	.irq_mask	= s3c2416_irq_mask_second,
 	.irq_unmask	= s3c2416_irq_unmask_second,
@@ -329,14 +329,14 @@ static struct sleep_save irq_save[] = {
 	SAVE_ITEM(S3C2416_INTMSK2),
 };
 
-int s3c2416_irq_suspend(void)
+static int s3c2416_irq_suspend(void)
 {
 	s3c_pm_do_save(irq_save, ARRAY_SIZE(irq_save));
 
 	return 0;
 }
 
-void s3c2416_irq_resume(void)
+static void s3c2416_irq_resume(void)
 {
 	s3c_pm_do_restore(irq_save, ARRAY_SIZE(irq_save));
 }
-- 
1.7.4.1
