From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: Remove static of S5P SoCs sysclass
Date: Tue, 11 May 2010 09:56:37 +0900
Message-ID: <1273539397-13046-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:48514 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755754Ab0EKBAE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 May 2010 21:00:04 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch removes static of s5p6440_sysclass, s5p6442_sysclass,
and s5pv210_sysclass for defintion as extern.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5p6440/cpu.c              |    2 +-
 arch/arm/mach-s5p6442/cpu.c              |    2 +-
 arch/arm/mach-s5pv210/cpu.c              |    2 +-
 arch/arm/plat-samsung/include/plat/cpu.h |    3 +++
 4 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-s5p6440/cpu.c b/arch/arm/mach-s5p6440/cpu.c
index 1794131..ca3b320 100644
--- a/arch/arm/mach-s5p6440/cpu.c
+++ b/arch/arm/mach-s5p6440/cpu.c
@@ -88,7 +88,7 @@ void __init s5p6440_init_irq(void)
 	s5p_init_irq(vic, ARRAY_SIZE(vic));
 }
 
-static struct sysdev_class s5p6440_sysclass = {
+struct sysdev_class s5p6440_sysclass = {
 	.name	= "s5p6440-core",
 };
 
diff --git a/arch/arm/mach-s5p6442/cpu.c b/arch/arm/mach-s5p6442/cpu.c
index bc2524d..a48fb55 100644
--- a/arch/arm/mach-s5p6442/cpu.c
+++ b/arch/arm/mach-s5p6442/cpu.c
@@ -95,7 +95,7 @@ void __init s5p6442_init_irq(void)
 	s5p_init_irq(vic, ARRAY_SIZE(vic));
 }
 
-static struct sysdev_class s5p6442_sysclass = {
+struct sysdev_class s5p6442_sysclass = {
 	.name	= "s5p6442-core",
 };
 
diff --git a/arch/arm/mach-s5pv210/cpu.c b/arch/arm/mach-s5pv210/cpu.c
index 0e0f8fd..2b776eb 100644
--- a/arch/arm/mach-s5pv210/cpu.c
+++ b/arch/arm/mach-s5pv210/cpu.c
@@ -100,7 +100,7 @@ void __init s5pv210_init_irq(void)
 	s5p_init_irq(vic, ARRAY_SIZE(vic));
 }
 
-static struct sysdev_class s5pv210_sysclass = {
+struct sysdev_class s5pv210_sysclass = {
 	.name	= "s5pv210-core",
 };
 
diff --git a/arch/arm/plat-samsung/include/plat/cpu.h b/arch/arm/plat-samsung/include/plat/cpu.h
index d316b4a..c54f318 100644
--- a/arch/arm/plat-samsung/include/plat/cpu.h
+++ b/arch/arm/plat-samsung/include/plat/cpu.h
@@ -78,6 +78,9 @@ extern struct sysdev_class s3c2442_sysclass;
 extern struct sysdev_class s3c2443_sysclass;
 extern struct sysdev_class s3c6410_sysclass;
 extern struct sysdev_class s3c64xx_sysclass;
+extern struct sysdev_class s5p6440_sysclass;
+extern struct sysdev_class s5p6442_sysclass;
+extern struct sysdev_class s5pv210_sysclass;
 
 extern void (*s5pc1xx_idle)(void);
 
-- 
1.6.2.5
