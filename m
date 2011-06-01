From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH v2 2/3] Move s3c24xx_irq_syscore_ops to plat-s3c24xx/irq.c
Date: Wed, 1 Jun 2011 18:25:17 +0200
Message-ID: <201106011825.18032.heiko@sntech.de>
References: <201106011821.38091.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:58892 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757611Ab1FAQZX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Jun 2011 12:25:23 -0400
In-Reply-To: <201106011821.38091.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>

s3c24xx_irq_syscore_ops was only defined for s3c2410 cpus leading
to compile errors on for example 2412 and 2416.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/mach-s3c2410/irq.c |    5 -----
 arch/arm/plat-s3c24xx/irq.c |    6 ++++++
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-s3c2410/irq.c b/arch/arm/mach-s3c2410/irq.c
index 2854129..4428695 100644
--- a/arch/arm/mach-s3c2410/irq.c
+++ b/arch/arm/mach-s3c2410/irq.c
@@ -27,8 +27,3 @@
 
 #include <plat/cpu.h>
 #include <plat/pm.h>
-
-struct syscore_ops s3c24xx_irq_syscore_ops = {
-       .suspend        = s3c24xx_irq_suspend,
-       .resume         = s3c24xx_irq_resume,
-};
diff --git a/arch/arm/plat-s3c24xx/irq.c b/arch/arm/plat-s3c24xx/irq.c
index 9aee7e1..fc8c5f8 100644
--- a/arch/arm/plat-s3c24xx/irq.c
+++ b/arch/arm/plat-s3c24xx/irq.c
@@ -23,6 +23,7 @@
 #include <linux/interrupt.h>
 #include <linux/ioport.h>
 #include <linux/sysdev.h>
+#include <linux/syscore_ops.h>
 
 #include <asm/irq.h>
 #include <asm/mach/irq.h>
@@ -668,3 +669,8 @@ void __init s3c24xx_init_irq(void)
 
        irqdbf("s3c2410: registered interrupt handlers\n");
 }
+
+struct syscore_ops s3c24xx_irq_syscore_ops = {
+       .suspend        = s3c24xx_irq_suspend,
+       .resume         = s3c24xx_irq_resume,
+};
-- 
1.7.1
