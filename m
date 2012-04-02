From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: EXYNOS: use chip_id reg in uncompress to select uart
 base phys
Date: Mon,  2 Apr 2012 12:18:45 -0700
Message-ID: <1333394325-23422-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Dima Zavin <dima@android.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Dima Zavin <dima@android.com>

Signed-off-by: Dima Zavin <dima@android.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos/include/mach/uncompress.h |   17 ++++++++++++++++-
 1 files changed, 16 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/include/mach/uncompress.h b/arch/arm/mach-exynos/include/mach/uncompress.h
index 493f4f3..2979995 100644
--- a/arch/arm/mach-exynos/include/mach/uncompress.h
+++ b/arch/arm/mach-exynos/include/mach/uncompress.h
@@ -20,9 +20,24 @@ volatile u8 *uart_base;
 
 #include <plat/uncompress.h>
 
+static unsigned int __raw_readl(unsigned int ptr)
+{
+	return *((volatile unsigned int *)ptr);
+}
+
 static void arch_detect_cpu(void)
 {
-	if (machine_is_smdk5250())
+	u32 chip_id = __raw_readl(EXYNOS_PA_CHIPID);
+
+	/*
+	 * product_id is bits 31:12
+	 *    bits 23:20 describe the exynosX family
+	 *
+	 */
+	chip_id >>= 20;
+	chip_id &= 0xf;
+
+	if (chip_id == 0x5)
 		uart_base = (volatile u8 *)EXYNOS5_PA_UART + (S3C_UART_OFFSET * CONFIG_S3C_LOWLEVEL_UART_PORT);
 	else
 		uart_base = (volatile u8 *)EXYNOS4_PA_UART + (S3C_UART_OFFSET * CONFIG_S3C_LOWLEVEL_UART_PORT);
-- 
1.7.2.3
