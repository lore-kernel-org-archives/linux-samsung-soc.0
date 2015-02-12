From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 2/9] ARM: s3c64xx: fix building without CONFIG_PM_SLEEP
Date: Thu, 12 Feb 2015 20:35:39 +0100
Message-ID: <1423769746-582629-3-git-send-email-arnd@arndb.de>
References: <1423769746-582629-1-git-send-email-arnd@arndb.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:64073 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751982AbbBLTgM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Feb 2015 14:36:12 -0500
In-Reply-To: <1423769746-582629-1-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, arm@kernel.org, Arnd Bergmann <arnd@arndb.de>

arch/arm/mach-s3c64xx/built-in.o: In function `s3c_pm_restore_core':
:(.text+0x5d0): undefined reference to `s3c_pm_do_restore_core'
:(.text+0x5d4): undefined reference to `s3c_pm_do_restore'
arch/arm/mach-s3c64xx/built-in.o: In function `s3c_pm_save_core':
:(.text+0x60c): undefined reference to `s3c_pm_do_save'
arch/arm/mach-s3c64xx/built-in.o: In function `s3c64xx_irq_pm_resume':
:(.text+0x670): undefined reference to `s3c_pm_do_restore'
arch/arm/mach-s3c64xx/built-in.o: In function `s3c64xx_irq_pm_suspend':
:(.text+0x6d8): undefined reference to `s3c_pm_do_save'
arch/arm/mach-s3c64xx/built-in.o: In function `s3c_cpu_resume':
:(.text+0x71c): undefined reference to `cpu_resume'

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-s3c64xx/Makefile          | 3 ++-
 arch/arm/mach-s3c64xx/pm.c              | 2 ++
 arch/arm/plat-samsung/include/plat/pm.h | 2 +-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/Makefile b/arch/arm/mach-s3c64xx/Makefile
index 12f67b61ca5f..17f4b07ec763 100644
--- a/arch/arm/mach-s3c64xx/Makefile
+++ b/arch/arm/mach-s3c64xx/Makefile
@@ -16,7 +16,8 @@ obj-$(CONFIG_CPU_S3C6410)	+= s3c6410.o
 
 # PM
 
-obj-$(CONFIG_PM)		+= pm.o irq-pm.o sleep.o
+obj-$(CONFIG_PM)		+= pm.o
+obj-$(CONFIG_PM_SLEEP)		+= irq-pm.o sleep.o
 obj-$(CONFIG_CPU_IDLE)		+= cpuidle.o
 
 # DMA support
diff --git a/arch/arm/mach-s3c64xx/pm.c b/arch/arm/mach-s3c64xx/pm.c
index aaf7bea4032f..75b14e756383 100644
--- a/arch/arm/mach-s3c64xx/pm.c
+++ b/arch/arm/mach-s3c64xx/pm.c
@@ -194,6 +194,7 @@ void s3c_pm_debug_smdkled(u32 set, u32 clear)
 }
 #endif
 
+#ifdef CONFIG_PM_SLEEP
 static struct sleep_save core_save[] = {
 	SAVE_ITEM(S3C64XX_MEM0DRVCON),
 	SAVE_ITEM(S3C64XX_MEM1DRVCON),
@@ -238,6 +239,7 @@ void s3c_pm_save_core(void)
 	s3c_pm_do_save(misc_save, ARRAY_SIZE(misc_save));
 	s3c_pm_do_save(core_save, ARRAY_SIZE(core_save));
 }
+#endif
 
 /* since both s3c6400 and s3c6410 share the same sleep pm calls, we
  * put the per-cpu code in here until any new cpu comes along and changes
diff --git a/arch/arm/plat-samsung/include/plat/pm.h b/arch/arm/plat-samsung/include/plat/pm.h
index e17d871b934c..e5a046dc22f5 100644
--- a/arch/arm/plat-samsung/include/plat/pm.h
+++ b/arch/arm/plat-samsung/include/plat/pm.h
@@ -58,7 +58,7 @@ extern unsigned long s3c_pm_flags;
 
 extern int s3c2410_cpu_suspend(unsigned long);
 
-#ifdef CONFIG_SAMSUNG_PM
+#ifdef CONFIG_PM_SLEEP
 extern int s3c_irq_wake(struct irq_data *data, unsigned int state);
 extern int s3c_irqext_wake(struct irq_data *data, unsigned int state);
 extern void s3c_cpu_resume(void);
-- 
2.1.0.rc2
