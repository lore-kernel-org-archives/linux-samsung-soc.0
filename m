From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH v2 09/11] ARM: S3C24XX: modify s3c2443 irq init to initialize all irqs
Date: Tue, 1 Jan 2013 22:58:32 +0100
Message-ID: <201301012258.32479.heiko@sntech.de>
References: <201301012251.15899.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:56909 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752460Ab3AAV6j (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Jan 2013 16:58:39 -0500
In-Reply-To: <201301012251.15899.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: ben-linux@fluff.org, Thomas Abraham <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Previously the irq init used s3c24xx_init_irq and an additional
arch_initcall to add the cpu specific irqs.

To be able to simplyfy the irq init later, create a new function
s3c2443_init_irq, which then calls s3c24xx_init_irq but also adds
the cpu specific irqs.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/mach-s3c24xx/mach-smdk2443.c        |    2 +-
 arch/arm/plat-s3c24xx/irq.c                  |   22 ++++------------------
 arch/arm/plat-samsung/include/plat/s3c2443.h |    2 ++
 3 files changed, 7 insertions(+), 19 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/mach-smdk2443.c b/arch/arm/mach-s3c24xx/mach-smdk2443.c
index 2568656..ddabfdf 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2443.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2443.c
@@ -141,7 +141,7 @@ MACHINE_START(SMDK2443, "SMDK2443")
 	/* Maintainer: Ben Dooks <ben-linux@fluff.org> */
 	.atag_offset	= 0x100,
 
-	.init_irq	= s3c24xx_init_irq,
+	.init_irq	= s3c2443_init_irq,
 	.map_io		= smdk2443_map_io,
 	.init_machine	= smdk2443_machine_init,
 	.timer		= &s3c24xx_timer,
diff --git a/arch/arm/plat-s3c24xx/irq.c b/arch/arm/plat-s3c24xx/irq.c
index e021c44..97c1907 100644
--- a/arch/arm/plat-s3c24xx/irq.c
+++ b/arch/arm/plat-s3c24xx/irq.c
@@ -1011,10 +1011,11 @@ static int s3c2443_add_sub(unsigned int base,
 	return 0;
 }
 
-static int s3c2443_irq_add(struct device *dev,
-				  struct subsys_interface *sif)
+void __init s3c2443_init_irq(void)
 {
-	printk("S3C2443: IRQ Support\n");
+	pr_info("S3C2443: IRQ Support\n");
+
+	s3c24xx_init_irq();
 
 	s3c2443_add_sub(IRQ_CAM, s3c2443_irq_demux_cam, &s3c2443_irq_cam,
 			IRQ_S3C2440_CAM_C, IRQ_S3C2440_CAM_P);
@@ -1032,20 +1033,5 @@ static int s3c2443_irq_add(struct device *dev,
 	s3c2443_add_sub(IRQ_WDT, s3c2443_irq_demux_wdtac97,
 			&s3c2443_irq_wdtac97,
 			IRQ_S3C2443_WDT, IRQ_S3C2443_AC97);
-
-	return 0;
-}
-
-static struct subsys_interface s3c2443_irq_interface = {
-	.name		= "s3c2443_irq",
-	.subsys		= &s3c2443_subsys,
-	.add_dev	= s3c2443_irq_add,
-};
-
-static int __init s3c2443_irq_init(void)
-{
-	return subsys_interface_register(&s3c2443_irq_interface);
 }
-
-arch_initcall(s3c2443_irq_init);
 #endif
diff --git a/arch/arm/plat-samsung/include/plat/s3c2443.h b/arch/arm/plat-samsung/include/plat/s3c2443.h
index a5b794f..71b88ec 100644
--- a/arch/arm/plat-samsung/include/plat/s3c2443.h
+++ b/arch/arm/plat-samsung/include/plat/s3c2443.h
@@ -25,6 +25,8 @@ extern void s3c2443_init_clocks(int xtal);
 extern  int s3c2443_baseclk_add(void);
 
 extern void s3c2443_restart(char mode, const char *cmd);
+
+extern void s3c2443_init_irq(void);
 #else
 #define s3c2443_init_clocks NULL
 #define s3c2443_init_uarts NULL
-- 
1.7.2.3
