From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH V5 12/20] ARM: exynos: cpuidle: Encapsulate boot vector code into a function
Date: Fri, 11 Apr 2014 12:40:07 +0200
Message-ID: <1397212815-16068-13-git-send-email-daniel.lezcano@linaro.org>
References: <1397212815-16068-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f169.google.com ([74.125.82.169]:51060 "EHLO
	mail-we0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756632AbaDKKkO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Apr 2014 06:40:14 -0400
Received: by mail-we0-f169.google.com with SMTP id w62so5227694wes.14
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Apr 2014 03:40:13 -0700 (PDT)
In-Reply-To: <1397212815-16068-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, linaro-kernel@lists.linaro.org, rjw@rjwysocki.net

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 arch/arm/mach-exynos/cpuidle.c |   11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
index 169db74..f66ee4d 100644
--- a/arch/arm/mach-exynos/cpuidle.c
+++ b/arch/arm/mach-exynos/cpuidle.c
@@ -45,13 +45,16 @@ static void exynos_set_wakeupmask(long mask)
 	__raw_writel(mask, S5P_WAKEUP_MASK);
 }
 
+static void exynos_cpu_set_boot_vector(long flags)
+{
+	__raw_writel(virt_to_phys(exynos_cpu_resume), REG_DIRECTGO_ADDR);
+	__raw_writel(flags, REG_DIRECTGO_FLAG);
+}
+
 static int idle_finisher(unsigned long flags)
 {
 	exynos_set_wakeupmask(0x0000ff3e);
-
-	__raw_writel(virt_to_phys(s3c_cpu_resume), REG_DIRECTGO_ADDR);
-	__raw_writel(S5P_CHECK_AFTR, REG_DIRECTGO_FLAG);
-
+	exynos_cpu_set_boot_vector(S5P_CHECK_AFTR);
 	/* Set value of power down register for aftr mode */
 	exynos_sys_powerdown_conf(SYS_AFTR);
 
-- 
1.7.9.5
