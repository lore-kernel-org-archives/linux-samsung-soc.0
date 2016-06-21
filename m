From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [[PATCH v2] 02/11] ARM: Samsung: fixup endian issues in cpu detection
Date: Tue, 21 Jun 2016 11:20:23 +0100
Message-ID: <1466504432-24187-3-git-send-email-ben.dooks@codethink.co.uk>
References: <1466504432-24187-1-git-send-email-ben.dooks@codethink.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from 82-70-136-246.dsl.in-addr.zen.co.uk ([82.70.136.246]:49228 "EHLO
	rainbowdash.ducie.codethink.co.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751721AbcFUKUf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Jun 2016 06:20:35 -0400
In-Reply-To: <1466504432-24187-1-git-send-email-ben.dooks@codethink.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: matthew.leach@codethink.co.uk, k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@lists.codethink.co.uk, Ben Dooks <ben.dooks@codethink.co.uk>

If the system is built for big endian, then the cpu identificaiton register
will be read in the wrong order. Fix this by using readl_relaxed() on the
register.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/arm/plat-samsung/cpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/plat-samsung/cpu.c b/arch/arm/plat-samsung/cpu.c
index 71333bb..bd12a55 100644
--- a/arch/arm/plat-samsung/cpu.c
+++ b/arch/arm/plat-samsung/cpu.c
@@ -29,14 +29,14 @@ EXPORT_SYMBOL(samsung_rev);
 
 void __init s3c64xx_init_cpu(void)
 {
-	samsung_cpu_id = __raw_readl(S3C_VA_SYS + 0x118);
+	samsung_cpu_id = readl_relaxed(S3C_VA_SYS + 0x118);
 	if (!samsung_cpu_id) {
 		/*
 		 * S3C6400 has the ID register in a different place,
 		 * and needs a write before it can be read.
 		 */
-		__raw_writel(0x0, S3C_VA_SYS + 0xA1C);
-		samsung_cpu_id = __raw_readl(S3C_VA_SYS + 0xA1C);
+		writel_relaxed(0x0, S3C_VA_SYS + 0xA1C);
+		samsung_cpu_id = readl_relaxed(S3C_VA_SYS + 0xA1C);
 	}
 
 	samsung_cpu_rev = 0;
@@ -46,7 +46,7 @@ void __init s3c64xx_init_cpu(void)
 
 void __init s5p_init_cpu(void __iomem *cpuid_addr)
 {
-	samsung_cpu_id = __raw_readl(cpuid_addr);
+	samsung_cpu_id = readl_relaxed(cpuid_addr);
 	samsung_cpu_rev = samsung_cpu_id & 0xFF;
 
 	pr_info("Samsung CPU ID: 0x%08lx\n", samsung_cpu_id);
-- 
2.8.1
