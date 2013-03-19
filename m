From: Doug Anderson <dianders@chromium.org>
Subject: [PATCH 2/2] arm: exynos: Clear ENABLE_WAKEUP_SW bit when entering suspend
Date: Tue, 19 Mar 2013 09:51:40 -0700
Message-ID: <1363711900-25560-3-git-send-email-dianders@chromium.org>
References: <1363711900-25560-1-git-send-email-dianders@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1363711900-25560-1-git-send-email-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Jongpill Lee <boyko.lee@samsung.com>, Jaecheol Lee <jc.lee@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Olof Johansson <olof@lixom.net>, Jonathan Kliegman <kliegs@chromium.org>, Michael Spang <spang@chromium.org>, Doug Anderson <dianders@chromium.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Jonathan Kliegman <kliegs@chromium.org>

Setting this bit to 0 causes the system to wait until suspended
to use the wakeup masks.  With it being set high previously,
masked interrupts were being received and processed before the
EINT_WAKEUP_MASK was configured.

Signed-off-by: Jonathan Kliegman <kliegs@chromium.org>
Signed-off-by: Doug Anderson <dianders@chromium.org>
Reviewed-by: Doug Anderson <dianders@chromium.org>
---
 arch/arm/mach-exynos/include/mach/pm-core.h | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/arm/mach-exynos/include/mach/pm-core.h b/arch/arm/mach-exynos/include/mach/pm-core.h
index 9d8da51e3..7dbbfec 100644
--- a/arch/arm/mach-exynos/include/mach/pm-core.h
+++ b/arch/arm/mach-exynos/include/mach/pm-core.h
@@ -27,13 +27,8 @@ static inline void s3c_pm_debug_init_uart(void)
 
 static inline void s3c_pm_arch_prepare_irqs(void)
 {
-	unsigned int tmp;
-	tmp = __raw_readl(S5P_WAKEUP_MASK);
-	tmp &= ~(1 << 31);
-	__raw_writel(tmp, S5P_WAKEUP_MASK);
-
-	__raw_writel(s3c_irqwake_intmask, S5P_WAKEUP_MASK);
 	__raw_writel(s3c_irqwake_eintmask, S5P_EINT_WAKEUP_MASK);
+	__raw_writel(s3c_irqwake_intmask & ~(1 << 31), S5P_WAKEUP_MASK);
 }
 
 static inline void s3c_pm_arch_stop_clocks(void)
-- 
1.8.1.3
