From: Shailendra Verma <shailendra.capricorn@gmail.com>
Subject: [PATCH] cpufreq:exynos-cpufreq - Fix for memory leak in case SOC name does not match.
Date: Thu, 21 May 2015 23:59:41 +0530
Message-ID: <1432232981-3917-1-git-send-email-shailendra.capricorn@gmail.com>
Return-path: <linux-pm-owner@vger.kernel.org>
Sender: linux-pm-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Shailendra Verma <shailendra.capricorn@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

During probe free the memory allocated to "exynos_info" in case of unknown
SOC type.

Signed-off-by: Shailendra Verma <shailendra.capricorn@gmail.com>
---
 drivers/cpufreq/exynos-cpufreq.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/exynos-cpufreq.c b/drivers/cpufreq/exynos-cpufreq.c
index 82d2fbb..b77923a 100644
--- a/drivers/cpufreq/exynos-cpufreq.c
+++ b/drivers/cpufreq/exynos-cpufreq.c
@@ -182,6 +182,7 @@ static int exynos_cpufreq_probe(struct platform_device *pdev)
 		ret = exynos5250_cpufreq_init(exynos_info);
 	} else {
 		pr_err("%s: Unknown SoC type\n", __func__);
+		kfree(exynos_info);
 		return -ENODEV;
 	}
 
-- 
1.7.9.5

