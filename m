From: Domenico Andreoli <cavokz@gmail.com>
Subject: [PATCH v2] Fix s3c24xx build errors if !CONFIG_PM
Date: Fri, 21 Oct 2011 15:50:23 +0200
Message-ID: <20111021135023.GA30167@glitch>
References: <20111018105215.GA10230@glitch>
 <016f01cc8fd5$0dbe40c0$293ac240$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:52029 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754363Ab1JUNu3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Oct 2011 09:50:29 -0400
Received: by eye27 with SMTP id 27so3870685eye.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Oct 2011 06:50:28 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <016f01cc8fd5$0dbe40c0$293ac240$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

From: Domenico Andreoli <cavokz@gmail.com>

v2:
- register_syscore_ops(&s3c24xx_irq_syscore_ops) does not need to be
  conditionally compiled out, it is already optimized out on !CONFIG_PM
- fix also s3c2412 and s3c2416 affected by the same build issue

v1:
s3c2440.c fails to build if !CONFIG_PM because in such case
s3c2410_pm_syscore_ops is not defined. Same error should happen also
in s3c2410.c and s3c2442.c

Signed-off-by: Domenico Andreoli <cavokz@gmail.com>

---
 arch/arm/mach-s3c2410/s3c2410.c |    2 ++
 arch/arm/mach-s3c2412/s3c2412.c |    2 ++
 arch/arm/mach-s3c2416/s3c2416.c |    2 ++
 arch/arm/mach-s3c2440/s3c2440.c |    2 ++
 arch/arm/mach-s3c2440/s3c2442.c |    2 ++
 5 files changed, 10 insertions(+)

Index: b/arch/arm/mach-s3c2410/s3c2410.c
===================================================================
--- a/arch/arm/mach-s3c2410/s3c2410.c
+++ b/arch/arm/mach-s3c2410/s3c2410.c
@@ -170,7 +170,9 @@ int __init s3c2410_init(void)
 {
 	printk("S3C2410: Initialising architecture\n");
 
+#ifdef CONFIG_PM
 	register_syscore_ops(&s3c2410_pm_syscore_ops);
+#endif
 	register_syscore_ops(&s3c24xx_irq_syscore_ops);
 
 	return sysdev_register(&s3c2410_sysdev);
Index: b/arch/arm/mach-s3c2412/s3c2412.c
===================================================================
--- a/arch/arm/mach-s3c2412/s3c2412.c
+++ b/arch/arm/mach-s3c2412/s3c2412.c
@@ -245,7 +245,9 @@ int __init s3c2412_init(void)
 {
 	printk("S3C2412: Initialising architecture\n");
 
+#ifdef CONFIG_PM
 	register_syscore_ops(&s3c2412_pm_syscore_ops);
+#endif
 	register_syscore_ops(&s3c24xx_irq_syscore_ops);
 
 	return sysdev_register(&s3c2412_sysdev);
Index: b/arch/arm/mach-s3c2416/s3c2416.c
===================================================================
--- a/arch/arm/mach-s3c2416/s3c2416.c
+++ b/arch/arm/mach-s3c2416/s3c2416.c
@@ -97,7 +97,9 @@ int __init s3c2416_init(void)
 
 	s3c_fb_setname("s3c2443-fb");
 
+#ifdef CONFIG_PM
 	register_syscore_ops(&s3c2416_pm_syscore_ops);
+#endif
 	register_syscore_ops(&s3c24xx_irq_syscore_ops);
 
 	return sysdev_register(&s3c2416_sysdev);
Index: b/arch/arm/mach-s3c2440/s3c2440.c
===================================================================
--- a/arch/arm/mach-s3c2440/s3c2440.c
+++ b/arch/arm/mach-s3c2440/s3c2440.c
@@ -55,7 +55,9 @@ int __init s3c2440_init(void)
 
 	/* register suspend/resume handlers */
 
+#ifdef CONFIG_PM
 	register_syscore_ops(&s3c2410_pm_syscore_ops);
+#endif
 	register_syscore_ops(&s3c244x_pm_syscore_ops);
 	register_syscore_ops(&s3c24xx_irq_syscore_ops);
 
Index: b/arch/arm/mach-s3c2440/s3c2442.c
===================================================================
--- a/arch/arm/mach-s3c2440/s3c2442.c
+++ b/arch/arm/mach-s3c2440/s3c2442.c
@@ -169,7 +169,9 @@ int __init s3c2442_init(void)
 {
 	printk("S3C2442: Initialising architecture\n");
 
+#ifdef CONFIG_PM
 	register_syscore_ops(&s3c2410_pm_syscore_ops);
+#endif
 	register_syscore_ops(&s3c244x_pm_syscore_ops);
 	register_syscore_ops(&s3c24xx_irq_syscore_ops);
 
