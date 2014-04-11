From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH V5 14/20] ARM: exynos: cpuidle: Encapsulate the AFTR code into a function
Date: Fri, 11 Apr 2014 12:40:09 +0200
Message-ID: <1397212815-16068-15-git-send-email-daniel.lezcano@linaro.org>
References: <1397212815-16068-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49]:38592 "EHLO
	mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934724AbaDKKkR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Apr 2014 06:40:17 -0400
Received: by mail-wg0-f49.google.com with SMTP id a1so5177433wgh.8
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Apr 2014 03:40:15 -0700 (PDT)
In-Reply-To: <1397212815-16068-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, linaro-kernel@lists.linaro.org, rjw@rjwysocki.net

Let's encapsulate the AFTR state specific call into a single function.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 arch/arm/mach-exynos/cpuidle.c |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
index 95313ea..fe35fba 100644
--- a/arch/arm/mach-exynos/cpuidle.c
+++ b/arch/arm/mach-exynos/cpuidle.c
@@ -51,13 +51,17 @@ static void exynos_cpu_set_boot_vector(long flags)
 	__raw_writel(flags, REG_DIRECTGO_FLAG);
 }
 
-static int idle_finisher(unsigned long flags)
+static void exynos_enter_aftr(void)
 {
 	exynos_set_wakeupmask(0x0000ff3e);
 	exynos_cpu_set_boot_vector(S5P_CHECK_AFTR);
 	/* Set value of power down register for aftr mode */
 	exynos_sys_powerdown_conf(SYS_AFTR);
+}
 
+static int idle_finisher(unsigned long flags)
+{
+	exynos_enter_aftr();
 	cpu_do_idle();
 
 	return 1;
-- 
1.7.9.5
