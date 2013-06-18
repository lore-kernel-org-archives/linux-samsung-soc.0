From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: [PATCH v4 10/10] ARM: Exynos: extend soft-reset support for Exynos5420
Date: Tue, 18 Jun 2013 11:59:22 +0530
Message-ID: <1371536962-13322-11-git-send-email-chander.kashyap@linaro.org>
References: <1371536962-13322-1-git-send-email-chander.kashyap@linaro.org>
Return-path: <linux-serial-owner@vger.kernel.org>
In-Reply-To: <1371536962-13322-1-git-send-email-chander.kashyap@linaro.org>
Sender: linux-serial-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com, s.nawrocki@samsung.com, mark.rutland@arm.com, thomas.ab@samsung.com, Chander Kashyap <chander.kashyap@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

Extend the soft reset support for Exynos5420 SoC.
Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
---
 arch/arm/mach-exynos/common.c |   11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 6f435da..4e6c227 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -330,10 +330,10 @@ void exynos5_restart(char mode, const char *cmd)
 	u32 val;
 	void __iomem *addr;
 
-	if (of_machine_is_compatible("samsung,exynos5250")) {
-		val = 0x1;
-		addr = EXYNOS_SWRESET;
-	} else if (of_machine_is_compatible("samsung,exynos5440")) {
+	val = 0x1;
+	addr = EXYNOS_SWRESET;
+
+	if (of_machine_is_compatible("samsung,exynos5440")) {
 		u32 status;
 		np = of_find_compatible_node(NULL, NULL, "samsung,exynos5440-clock");
 
@@ -344,9 +344,6 @@ void exynos5_restart(char mode, const char *cmd)
 		val = __raw_readl(addr);
 
 		val = (val & 0xffff0000) | (status & 0xffff);
-	} else {
-		pr_err("%s: cannot support non-DT\n", __func__);
-		return;
 	}
 
 	__raw_writel(val, addr);
-- 
1.7.9.5

