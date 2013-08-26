From: Amit Daniel Kachhap <amit.daniel@samsung.com>
Subject: [PATCH V2] ARM: EXYNOS: cpuidle: Skip C1 cpuidle state for exynos5440
Date: Mon, 26 Aug 2013 17:46:03 +0530
Message-ID: <1377519363-23077-1-git-send-email-amit.daniel@samsung.com>
References: <4070794.XxjluIqBpK@amdc1032>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f181.google.com ([209.85.192.181]:34662 "EHLO
	mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751554Ab3HZMQT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Aug 2013 08:16:19 -0400
Received: by mail-pd0-f181.google.com with SMTP id g10so3363317pdj.40
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Aug 2013 05:16:18 -0700 (PDT)
In-Reply-To: <4070794.XxjluIqBpK@amdc1032>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

This patch skips the deep C1(AFTR -Arm off top running) state for exynos5440
soc as this soc does not support this state. The cpu's only allows the basic
C0 state. The C1 state is filtered by re-initialising the driver state_count
value to 1.

Cc: Kukjin Kim <kgene@kernel.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
---

Changes in V2:
* Used driver state_count variable to filter the C1 state
 instead of device state count variable. Although this V2 patch is also
 not complete as there are suggestions to make this driver platform driver.

 arch/arm/mach-exynos/cpuidle.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
index 225ee84..ac13922 100644
--- a/arch/arm/mach-exynos/cpuidle.c
+++ b/arch/arm/mach-exynos/cpuidle.c
@@ -200,6 +200,9 @@ static int __init exynos4_init_cpuidle(void)
 	if (soc_is_exynos5250())
 		exynos5_core_down_clk();
 
+	if (soc_is_exynos5440())
+		exynos4_idle_driver.state_count = 1;
+
 	ret = cpuidle_register_driver(&exynos4_idle_driver);
 	if (ret) {
 		printk(KERN_ERR "CPUidle failed to register driver\n");
-- 
1.7.1
