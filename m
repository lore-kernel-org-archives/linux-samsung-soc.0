From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v3 02/12] ARM: EXYNOS: Move cpufreq and cpuidle device
 registration to init_machine
Date: Wed, 30 Apr 2014 14:17:27 +0900
Message-ID: <1398835057-3860-3-git-send-email-pankaj.dubey@samsung.com>
References: <1398835057-3860-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1398835057-3860-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, t.figa@samsung.com, chow.kim@samsung.com, yg1004.jang@samsung.com, vikas.sajjan@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

As exynos_cpuidle_init and exynos_cpufreq_init function have just one lines
of code for registering platform devices. We can move these lines to
exynos_dt_machine_init and delete exynos_cpuidle_init and exynos_cpufreq_init
function. This will help in reducing lines of code in exynos.c, making it
more cleaner.

Suggested-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 arch/arm/mach-exynos/exynos.c |   19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index 06dcce5..9315bd8 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -226,19 +226,6 @@ static struct platform_device exynos_cpuidle = {
 	.id                = -1,
 };
 
-void __init exynos_cpuidle_init(void)
-{
-	if (soc_is_exynos5440())
-		return;
-
-	platform_device_register(&exynos_cpuidle);
-}
-
-void __init exynos_cpufreq_init(void)
-{
-	platform_device_register_simple("exynos-cpufreq", -1, NULL, 0);
-}
-
 static void __init exynos_init_late(void)
 {
 	if (of_machine_is_compatible("samsung,exynos5440"))
@@ -367,8 +354,10 @@ static void __init exynos_dt_machine_init(void)
 		}
 	}
 
-	exynos_cpuidle_init();
-	exynos_cpufreq_init();
+	if (!soc_is_exynos5440())
+		platform_device_register(&exynos_cpuidle);
+
+	platform_device_register_simple("exynos-cpufreq", -1, NULL, 0);
 
 	of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
 }
-- 
1.7.10.4
