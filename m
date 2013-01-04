From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 3/5] ARM: exynos: replace cpumask by the corresponding macro
Date: Fri,  4 Jan 2013 17:59:57 +0100
Message-ID: <1357318799-24378-3-git-send-email-daniel.lezcano@linaro.org>
References: <1357318799-24378-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f46.google.com ([74.125.82.46]:48701 "EHLO
	mail-wg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754984Ab3ADRAH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Jan 2013 12:00:07 -0500
Received: by mail-wg0-f46.google.com with SMTP id dr13so7488658wgb.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Jan 2013 09:00:06 -0800 (PST)
In-Reply-To: <1357318799-24378-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@linaro.org, linaro-dev@lists.linaro.org

A trivial patch to replace for_each_cpu(cpu_id, cpu_online_mask) by
the corresponding macro.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 arch/arm/mach-exynos/cpuidle.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
index a5fe194..6e90bed 100644
--- a/arch/arm/mach-exynos/cpuidle.c
+++ b/arch/arm/mach-exynos/cpuidle.c
@@ -205,7 +205,7 @@ static int __init exynos4_init_cpuidle(void)
 		return ret;
 	}
 
-	for_each_cpu(cpu_id, cpu_online_mask) {
+	for_each_online_cpu(cpu_id) {
 		device = &per_cpu(exynos4_cpuidle_device, cpu_id);
 		device->cpu = cpu_id;
 
-- 
1.7.9.5
