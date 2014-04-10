From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH V4 14/20] ARM: exynos: cpuidle: Encapsulate the AFTR code into a function
Date: Thu, 10 Apr 2014 11:55:45 +0200
Message-ID: <1397123751-1957-15-git-send-email-daniel.lezcano@linaro.org>
References: <1397123751-1957-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f169.google.com ([74.125.82.169]:43863 "EHLO
	mail-we0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965660AbaDJJzy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Apr 2014 05:55:54 -0400
Received: by mail-we0-f169.google.com with SMTP id w62so3747300wes.28
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Apr 2014 02:55:53 -0700 (PDT)
In-Reply-To: <1397123751-1957-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, linaro-kernel@lists.linaro.org, b.zolnierkie@samsung.com, sachin.kamat@linaro.org, viresh.kumar@linaro.org, rjw@rjwysocki.net

Let's encapsulate the AFTR state specific call into a single function.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 arch/arm/mach-exynos/cpuidle.c |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
index d7091e0..0d3c839 100644
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
