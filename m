From: Yadwinder Singh Brar <yadi.brar@samsung.com>
Subject: [RFC 4/4] arm: exynos5: Register static platform device for ASV.
Date: Wed, 11 Sep 2013 16:44:08 +0530
Message-ID: <1378898048-25205-5-git-send-email-yadi.brar@samsung.com>
References: <1378898048-25205-1-git-send-email-yadi.brar@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1378898048-25205-1-git-send-email-yadi.brar@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Viresh Kumar <viresh.kumar@linaro.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Since ASV is not a hardware controller so we cann't add device tree node for
it. This patch registers a static platform device exynos ASV.

Signed-off-by: Yadwinder Singh Brar <yadi.brar@samsung.com>
---
 arch/arm/mach-exynos/mach-exynos5-dt.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index f874b77..5ce58e1 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -28,6 +28,7 @@ static void __init exynos5_dt_machine_init(void)
 	struct device_node *i2c_np;
 	const char *i2c_compat = "samsung,s3c2440-i2c";
 	unsigned int tmp;
+	struct platform_device_info devinfo = { .name = "exynos-asv", };
 
 	/*
 	 * Exynos5's legacy i2c controller and new high speed i2c
@@ -48,6 +49,8 @@ static void __init exynos5_dt_machine_init(void)
 	}
 
 	of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
+
+	platform_device_register_full(&devinfo);
 }
 
 static char const *exynos5_dt_compat[] __initdata = {
-- 
1.7.0.4
