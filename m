From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH] Fix compile failures by syscore_ops change on s3c2416
Date: Mon, 30 May 2011 22:34:35 +0200
Message-ID: <201105302234.35749.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:47274 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750783Ab1E3Uej (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 May 2011 16:34:39 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>

s3c24xx_irq_syscore_ops is only defined in mach-s3c2410/irq.c which is
not used by s3c2416.
Also s3c2410_dma_chan needs a struct prefix
---
It feels wrong to put a double of s3c24xx_irq_syscore_ops in another
file, but I haven't found a better place for the whole thing yet.
Might plat-s3c24xx/irq-pm.c be better suited to host
s3c24xx_irq_syscore_ops for all s3c-socs?

 arch/arm/mach-s3c2416/irq.c |    6 ++++++
 arch/arm/plat-s3c24xx/dma.c |    2 +-
 2 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s3c2416/irq.c b/arch/arm/mach-s3c2416/irq.c
index 28ad20d..a2c49fa 100644
--- a/arch/arm/mach-s3c2416/irq.c
+++ b/arch/arm/mach-s3c2416/irq.c
@@ -27,6 +27,7 @@
 #include <linux/ioport.h>
 #include <linux/sysdev.h>
 #include <linux/io.h>
+#include <linux/syscore_ops.h>
 
 #include <mach/hardware.h>
 #include <asm/irq.h>
@@ -238,6 +239,11 @@ static struct sysdev_driver s3c2416_irq_driver = {
 	.add		= s3c2416_irq_add,
 };
 
+struct syscore_ops s3c24xx_irq_syscore_ops = {
+	.suspend	= s3c24xx_irq_suspend,
+	.resume		= s3c24xx_irq_resume,
+};
+
 static int __init s3c2416_irq_init(void)
 {
 	return sysdev_driver_register(&s3c2416_sysclass, &s3c2416_irq_driver);
diff --git a/arch/arm/plat-s3c24xx/dma.c b/arch/arm/plat-s3c24xx/dma.c
index c10d10c..2abf966 100644
--- a/arch/arm/plat-s3c24xx/dma.c
+++ b/arch/arm/plat-s3c24xx/dma.c
@@ -1199,7 +1199,7 @@ EXPORT_SYMBOL(s3c2410_dma_getposition);
 
 #ifdef CONFIG_PM
 
-static void s3c2410_dma_suspend_chan(s3c2410_dma_chan *cp)
+static void s3c2410_dma_suspend_chan(struct s3c2410_dma_chan *cp)
 {
 	printk(KERN_DEBUG "suspending dma channel %d\n", cp->number);
 
-- 
1.7.2.3
