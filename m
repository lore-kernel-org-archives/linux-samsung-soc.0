From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: Constify iomem address passed to s5p_init_cpu
Date: Tue, 05 Jul 2016 15:56:54 +0200
Message-ID: <1467727014-14684-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The iomem passed to s5p_init_cpu is used as read-only.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/plat-samsung/cpu.c              | 2 +-
 arch/arm/plat-samsung/include/plat/cpu.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/plat-samsung/cpu.c b/arch/arm/plat-samsung/cpu.c
index bd12a55401e0..a107b3a0b095 100644
--- a/arch/arm/plat-samsung/cpu.c
+++ b/arch/arm/plat-samsung/cpu.c
@@ -44,7 +44,7 @@ void __init s3c64xx_init_cpu(void)
 	pr_info("Samsung CPU ID: 0x%08lx\n", samsung_cpu_id);
 }
 
-void __init s5p_init_cpu(void __iomem *cpuid_addr)
+void __init s5p_init_cpu(const void __iomem *cpuid_addr)
 {
 	samsung_cpu_id = readl_relaxed(cpuid_addr);
 	samsung_cpu_rev = samsung_cpu_id & 0xFF;
diff --git a/arch/arm/plat-samsung/include/plat/cpu.h b/arch/arm/plat-samsung/include/plat/cpu.h
index 4f8a6221dc6d..b7b702a72cac 100644
--- a/arch/arm/plat-samsung/include/plat/cpu.h
+++ b/arch/arm/plat-samsung/include/plat/cpu.h
@@ -113,7 +113,7 @@ extern void s3c_init_cpu(unsigned long idcode,
 extern void s3c24xx_init_io(struct map_desc *mach_desc, int size);
 
 extern void s3c64xx_init_cpu(void);
-extern void s5p_init_cpu(void __iomem *cpuid_addr);
+extern void s5p_init_cpu(const void __iomem *cpuid_addr);
 
 extern unsigned int samsung_rev(void);
 
-- 
1.9.1
