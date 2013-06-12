From: Amit Daniel Kachhap <amit.daniel@samsung.com>
Subject: [PATCH V2 2/2] ARM: EXYNOS: cpuidle: Allow C1 state only in supported SOC's.
Date: Wed, 12 Jun 2013 16:58:46 +0530
Message-ID: <1371036526-16589-3-git-send-email-amit.daniel@samsung.com>
References: <1371036526-16589-1-git-send-email-amit.daniel@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:63824 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751217Ab3FLL3T (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Jun 2013 07:29:19 -0400
Received: by mail-pd0-f169.google.com with SMTP id y10so9814977pdj.28
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jun 2013 04:29:19 -0700 (PDT)
In-Reply-To: <1371036526-16589-1-git-send-email-amit.daniel@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, Thomas Abraham <thomas.abraham@linaro.org>, Abhilash Kesavan <a.kesavan@samsung.com>

This patch registers the basic C0 state for all exynos SOC's but
limits the C1(AFTR -Arm off top running) state in only the supported
SOC's(ie. EXYNOS 4210, 4212, 4412 and 5250).

Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
---
 arch/arm/mach-exynos/cpuidle.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
index 2d071c6..ccb2b48 100644
--- a/arch/arm/mach-exynos/cpuidle.c
+++ b/arch/arm/mach-exynos/cpuidle.c
@@ -176,7 +176,9 @@ static int __init exynos4_init_cpuidle(void)
 		device->cpu = cpu_id;
 
 		/* Support IDLE only */
-		if (cpu_id != 0)
+		if (!(soc_is_exynos4210() || soc_is_exynos4212() ||
+			soc_is_exynos4412() || soc_is_exynos5250()) ||
+			cpu_id != 0)
 			device->state_count = 1;
 
 		ret = cpuidle_register_device(device);
-- 
1.7.1
