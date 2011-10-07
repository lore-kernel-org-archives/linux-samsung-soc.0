From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH V2 2/2] ARM: S3C2410: irq: Remove __init attributes to fix compilation warning
Date: Fri,  7 Oct 2011 17:25:13 +0530
Message-ID: <1317988513-20800-3-git-send-email-tushar.behera@linaro.org>
References: <1317988513-20800-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:53729 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759948Ab1JGMAP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Oct 2011 08:00:15 -0400
Received: by mail-qw0-f46.google.com with SMTP id b15so2644576qad.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Oct 2011 05:00:15 -0700 (PDT)
In-Reply-To: <1317988513-20800-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, linux@arm.linux.org.uk, linaro-dev@lists.linaro.org, patches@linaro.org

The structure *_irq_driver is passed as a parameter in
sysdev_driver_register(). This in turn would add this structure to a
list which may be traversed later.

Hence, even though the functions referenced through this structure have
__init attribute, we cannot possibly add __initdata attribute to it.

To remove compilation warnings, the functions referenced thorugh this
structure are also defined without __init attribute.

It removes following two warnings.

WARNING: vmlinux.o(.data+0x4f58): Section mismatch in reference from the
variable s3c2416_irq_driver to the function .init.text:s3c2416_irq_add()
The variable s3c2416_irq_driver references the function __init s3c2416_irq_add()

WARNING: vmlinux.o(.data+0x7c50): Section mismatch in reference from the
variable s3c2443_irq_driver to the function .init.text:s3c2443_irq_add()
The variable s3c2443_irq_driver references the function __init s3c2443_irq_add()

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-s3c2416/irq.c |    4 ++--
 arch/arm/mach-s3c2443/irq.c |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-s3c2416/irq.c b/arch/arm/mach-s3c2416/irq.c
index 28ad20d..53e8e57 100644
--- a/arch/arm/mach-s3c2416/irq.c
+++ b/arch/arm/mach-s3c2416/irq.c
@@ -194,7 +194,7 @@ static struct irq_chip s3c2416_irq_uart3 = {
 
 /* IRQ initialisation code */
 
-static int __init s3c2416_add_sub(unsigned int base,
+static int s3c2416_add_sub(unsigned int base,
 				   void (*demux)(unsigned int,
 						 struct irq_desc *),
 				   struct irq_chip *chip,
@@ -213,7 +213,7 @@ static int __init s3c2416_add_sub(unsigned int base,
 	return 0;
 }
 
-static int __init s3c2416_irq_add(struct sys_device *sysdev)
+static int s3c2416_irq_add(struct sys_device *sysdev)
 {
 	printk(KERN_INFO "S3C2416: IRQ Support\n");
 
diff --git a/arch/arm/mach-s3c2443/irq.c b/arch/arm/mach-s3c2443/irq.c
index 83ecb11..18585dd 100644
--- a/arch/arm/mach-s3c2443/irq.c
+++ b/arch/arm/mach-s3c2443/irq.c
@@ -222,7 +222,7 @@ static struct irq_chip s3c2443_irq_cam = {
 
 /* IRQ initialisation code */
 
-static int __init s3c2443_add_sub(unsigned int base,
+static int s3c2443_add_sub(unsigned int base,
 				   void (*demux)(unsigned int,
 						 struct irq_desc *),
 				   struct irq_chip *chip,
@@ -241,7 +241,7 @@ static int __init s3c2443_add_sub(unsigned int base,
 	return 0;
 }
 
-static int __init s3c2443_irq_add(struct sys_device *sysdev)
+static int s3c2443_irq_add(struct sys_device *sysdev)
 {
 	printk("S3C2443: IRQ Support\n");
 
-- 
1.7.4.1
