From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH 02/16] ARM: EXYNOS: use generic API to enable SCU
Date: Mon, 14 Nov 2016 10:31:57 +0530
Message-ID: <1479099731-28108-3-git-send-email-pankaj.dubey@samsung.com>
References: <1479099731-28108-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1479099731-28108-1-git-send-email-pankaj.dubey@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, arnd@arndb.de, geert+renesas@glider.be, vireshk@kernel.org, magnus.damm@gmail.com, krzk@kernel.org, rmk+kernel@armlinux.org.uk, horms@verge.net.au, thomas.ab@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>, shiraz.linux.kernel@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

Now as we have of_scu_enable which takes care of mapping
scu base from DT, lets use it.

This patch also fixes build failure in case !SMP caused
by commit SHA ID: 94210b1abb2 which is already merged in
krzk/for-next branch

CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: linux-samsung-soc@vger.kernel.org
Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 arch/arm/mach-exynos/common.h  |  1 -
 arch/arm/mach-exynos/platsmp.c | 30 ++++--------------------------
 arch/arm/mach-exynos/pm.c      |  4 ++--
 arch/arm/mach-exynos/suspend.c | 14 ++++----------
 4 files changed, 10 insertions(+), 39 deletions(-)

diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
index fb12d11..d19064b 100644
--- a/arch/arm/mach-exynos/common.h
+++ b/arch/arm/mach-exynos/common.h
@@ -156,7 +156,6 @@ extern void exynos_cpu_restore_register(void);
 extern void exynos_pm_central_suspend(void);
 extern int exynos_pm_central_resume(void);
 extern void exynos_enter_aftr(void);
-extern int exynos_scu_enable(void);
 
 extern struct cpuidle_exynos_data cpuidle_coupled_exynos_data;
 
diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
index 94405c7..2e5ecc1 100644
--- a/arch/arm/mach-exynos/platsmp.c
+++ b/arch/arm/mach-exynos/platsmp.c
@@ -168,27 +168,6 @@ int exynos_cluster_power_state(int cluster)
 		S5P_CORE_LOCAL_PWR_EN);
 }
 
-/**
- * exynos_scu_enable : enables SCU for Cortex-A9 based system
- * returns 0 on success else non-zero error code
- */
-int exynos_scu_enable(void)
-{
-	struct device_node *np;
-	void __iomem *scu_base;
-
-	np = of_find_compatible_node(NULL, NULL, "arm,cortex-a9-scu");
-	scu_base = of_iomap(np, 0);
-	of_node_put(np);
-	if (!scu_base) {
-		pr_err("%s failed to map scu_base\n", __func__);
-		return -ENOMEM;
-	}
-	scu_enable(scu_base);
-	iounmap(scu_base);
-	return 0;
-}
-
 static void __iomem *cpu_boot_reg_base(void)
 {
 	if (soc_is_exynos4210() && samsung_rev() == EXYNOS4210_REV_1_1)
@@ -409,11 +388,10 @@ static void __init exynos_smp_prepare_cpus(unsigned int max_cpus)
 
 	exynos_set_delayed_reset_assertion(true);
 
-	if (read_cpuid_part() == ARM_CPU_PART_CORTEX_A9) {
-		/* if exynos_scu_enable fails, return */
-		if (exynos_scu_enable())
-			return;
-	}
+	/* if of_scu_enable fails, return */
+	if (scu_a9_has_base() && of_scu_enable())
+		return;
+
 	/*
 	 * Write the address of secondary startup into the
 	 * system-wide flags register. The boot monitor waits
diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
index c0b46c3..9678438 100644
--- a/arch/arm/mach-exynos/pm.c
+++ b/arch/arm/mach-exynos/pm.c
@@ -174,8 +174,8 @@ void exynos_enter_aftr(void)
 
 	cpu_suspend(0, exynos_aftr_finisher);
 
-	if (read_cpuid_part() == ARM_CPU_PART_CORTEX_A9) {
-		exynos_scu_enable();
+	if (scu_a9_has_base()) {
+		of_scu_enable();
 		if (call_firmware_op(resume) == -ENOSYS)
 			exynos_cpu_restore_register();
 	}
diff --git a/arch/arm/mach-exynos/suspend.c b/arch/arm/mach-exynos/suspend.c
index 73df9f3..5414282 100644
--- a/arch/arm/mach-exynos/suspend.c
+++ b/arch/arm/mach-exynos/suspend.c
@@ -451,19 +451,16 @@ static void exynos_pm_release_retention(void)
 
 static void exynos_pm_resume(void)
 {
-	u32 cpuid = read_cpuid_part();
-
 	if (exynos_pm_central_resume())
 		goto early_wakeup;
 
 	/* For release retention */
 	exynos_pm_release_retention();
 
-	if (cpuid == ARM_CPU_PART_CORTEX_A9)
-		exynos_scu_enable();
+	if (scu_a9_has_base())
+		of_scu_enable();
 
-	if (call_firmware_op(resume) == -ENOSYS
-	    && cpuid == ARM_CPU_PART_CORTEX_A9)
+	if (call_firmware_op(resume) == -ENOSYS && scu_a9_has_base())
 		exynos_cpu_restore_register();
 
 early_wakeup:
@@ -475,8 +472,6 @@ static void exynos_pm_resume(void)
 
 static void exynos3250_pm_resume(void)
 {
-	u32 cpuid = read_cpuid_part();
-
 	if (exynos_pm_central_resume())
 		goto early_wakeup;
 
@@ -485,8 +480,7 @@ static void exynos3250_pm_resume(void)
 
 	pmu_raw_writel(S5P_USE_STANDBY_WFI_ALL, S5P_CENTRAL_SEQ_OPTION);
 
-	if (call_firmware_op(resume) == -ENOSYS
-	    && cpuid == ARM_CPU_PART_CORTEX_A9)
+	if (call_firmware_op(resume) == -ENOSYS && scu_a9_has_base())
 		exynos_cpu_restore_register();
 
 early_wakeup:
-- 
2.7.4
