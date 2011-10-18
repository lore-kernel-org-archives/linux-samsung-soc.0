From: Domenico Andreoli <cavokz@gmail.com>
Subject: [PATCH] Fix s3c24xx build error if !CONFIG_PM
Date: Tue, 18 Oct 2011 12:52:15 +0200
Message-ID: <20111018105215.GA10230@glitch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:47805 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754132Ab1JRKwU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Oct 2011 06:52:20 -0400
Received: by eye27 with SMTP id 27so412219eye.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Oct 2011 03:52:19 -0700 (PDT)
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

s3c2440.c fails to build if !CONFIG_PM because in such case
s3c2410_pm_syscore_ops is not defined. Same error should happen also
in s3c2410.c and s3c2442.c

This patch fixes all of them.

Signed-off-by: Domenico Andreoli <cavokz@gmail.com>

---
 arch/arm/mach-s3c2410/s3c2410.c |    2 ++
 arch/arm/mach-s3c2440/s3c2440.c |    2 ++
 arch/arm/mach-s3c2440/s3c2442.c |    2 ++
 3 files changed, 6 insertions(+)

Index: b/arch/arm/mach-s3c2410/s3c2410.c
===================================================================
--- a/arch/arm/mach-s3c2410/s3c2410.c
+++ b/arch/arm/mach-s3c2410/s3c2410.c
@@ -170,8 +170,10 @@ int __init s3c2410_init(void)
 {
 	printk("S3C2410: Initialising architecture\n");
 
+#ifdef CONFIG_PM
 	register_syscore_ops(&s3c2410_pm_syscore_ops);
 	register_syscore_ops(&s3c24xx_irq_syscore_ops);
+#endif
 
 	return sysdev_register(&s3c2410_sysdev);
 }
Index: b/arch/arm/mach-s3c2440/s3c2440.c
===================================================================
--- a/arch/arm/mach-s3c2440/s3c2440.c
+++ b/arch/arm/mach-s3c2440/s3c2440.c
@@ -55,9 +55,11 @@ int __init s3c2440_init(void)
 
 	/* register suspend/resume handlers */
 
+#ifdef CONFIG_PM
 	register_syscore_ops(&s3c2410_pm_syscore_ops);
 	register_syscore_ops(&s3c244x_pm_syscore_ops);
 	register_syscore_ops(&s3c24xx_irq_syscore_ops);
+#endif
 
 	/* register our system device for everything else */
 
Index: b/arch/arm/mach-s3c2440/s3c2442.c
===================================================================
--- a/arch/arm/mach-s3c2440/s3c2442.c
+++ b/arch/arm/mach-s3c2440/s3c2442.c
@@ -169,9 +169,11 @@ int __init s3c2442_init(void)
 {
 	printk("S3C2442: Initialising architecture\n");
 
+#ifdef CONFIG_PM
 	register_syscore_ops(&s3c2410_pm_syscore_ops);
 	register_syscore_ops(&s3c244x_pm_syscore_ops);
 	register_syscore_ops(&s3c24xx_irq_syscore_ops);
+#endif
 
 	return sysdev_register(&s3c2442_sysdev);
 }
