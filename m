From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH] ARM: SAMSUNG: remove unneeded s3c24xx_init_cpu()
Date: Sun, 12 Jan 2014 21:34:29 +0100
Message-ID: <3865198.Kyn1P03kbU@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:33842 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751062AbaALUe5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 12 Jan 2014 15:34:57 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

The function is nearly empty and samsung_cpu_rev is static so already 0
making the function obsolete, therefore remove it.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/mach-s3c24xx/common.c           |    1 -
 arch/arm/plat-samsung/cpu.c              |    7 -------
 arch/arm/plat-samsung/include/plat/cpu.h |    1 -
 3 files changed, 9 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/common.c b/arch/arm/mach-s3c24xx/common.c
index bf57d4c..97edd4d 100644
--- a/arch/arm/mach-s3c24xx/common.c
+++ b/arch/arm/mach-s3c24xx/common.c
@@ -232,7 +232,6 @@ void __init s3c24xx_init_io(struct map_desc *mach_desc, int size)
 	} else {
 		samsung_cpu_id = s3c24xx_read_idcode_v4();
 	}
-	s3c24xx_init_cpu();
 
 	s3c_init_cpu(samsung_cpu_id, cpu_ids, ARRAY_SIZE(cpu_ids));
 
diff --git a/arch/arm/plat-samsung/cpu.c b/arch/arm/plat-samsung/cpu.c
index 46b426e..364963a 100644
--- a/arch/arm/plat-samsung/cpu.c
+++ b/arch/arm/plat-samsung/cpu.c
@@ -28,13 +28,6 @@ unsigned int samsung_rev(void)
 }
 EXPORT_SYMBOL(samsung_rev);
 
-void __init s3c24xx_init_cpu(void)
-{
-	/* nothing here yet */
-
-	samsung_cpu_rev = 0;
-}
-
 void __init s3c64xx_init_cpu(void)
 {
 	samsung_cpu_id = __raw_readl(S3C_VA_SYS + 0x118);
diff --git a/arch/arm/plat-samsung/include/plat/cpu.h b/arch/arm/plat-samsung/include/plat/cpu.h
index 8f09488..262ef86 100644
--- a/arch/arm/plat-samsung/include/plat/cpu.h
+++ b/arch/arm/plat-samsung/include/plat/cpu.h
@@ -207,7 +207,6 @@ extern void s5p_init_irq(u32 *vic, u32 num_vic);
 
 extern void s3c24xx_init_io(struct map_desc *mach_desc, int size);
 
-extern void s3c24xx_init_cpu(void);
 extern void s3c64xx_init_cpu(void);
 extern void s5p_init_cpu(void __iomem *cpuid_addr);
 
-- 
1.7.10.4
