From: jhbird.choi@gmail.com
Subject: [PATCH] ARM: SAMSUNG: Remove unusued variable 'running'
Date: Fri, 27 Apr 2012 18:13:22 -0400
Message-ID: <1335564802-31937-1-git-send-email-jhbird.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f51.google.com ([209.85.210.51]:55675 "EHLO
	mail-pz0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751620Ab2D0WNb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Apr 2012 18:13:31 -0400
Received: by dadz8 with SMTP id z8so1524877dad.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Apr 2012 15:13:31 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Jonghwan Choi <jhbird.choi@samsung.com>

From: Jonghwan Choi <jhbird.choi@samsung.com>

This variable is indeed no longer in use.

Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
---
 arch/arm/plat-samsung/pwm.c |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/arch/arm/plat-samsung/pwm.c b/arch/arm/plat-samsung/pwm.c
index c559d84..d358305 100644
--- a/arch/arm/plat-samsung/pwm.c
+++ b/arch/arm/plat-samsung/pwm.c
@@ -36,7 +36,6 @@ struct pwm_device {
 	unsigned int		 duty_ns;
 
 	unsigned char		 tcon_base;
-	unsigned char		 running;
 	unsigned char		 use_count;
 	unsigned char		 pwm_id;
 };
@@ -116,7 +115,6 @@ int pwm_enable(struct pwm_device *pwm)
 
 	local_irq_restore(flags);
 
-	pwm->running = 1;
 	return 0;
 }
 
@@ -134,8 +132,6 @@ void pwm_disable(struct pwm_device *pwm)
 	__raw_writel(tcon, S3C2410_TCON);
 
 	local_irq_restore(flags);
-
-	pwm->running = 0;
 }
 
 EXPORT_SYMBOL(pwm_disable);
-- 
1.7.0.4
