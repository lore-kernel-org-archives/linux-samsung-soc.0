From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH v5 1/7] cpufreq: cpufreq-cpu0: allow use of optional boost mode frequencies
Date: Fri, 23 May 2014 19:57:34 +0530
Message-ID: <1400855260-6807-2-git-send-email-thomas.ab@samsung.com>
References: <1400855260-6807-1-git-send-email-thomas.ab@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:46827 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752403AbaEWO2D (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 May 2014 10:28:03 -0400
In-Reply-To: <1400855260-6807-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, shawn.guo@linaro.org, kgene.kim@samsung.com, t.figa@samsung.com, l.majewski@samsung.com, viresh.kumar@linaro.org, thomas.ab@samsung.com, heiko@sntech.de

From: Thomas Abraham <thomas.ab@samsung.com>

Lookup for the optional boost-frequency property in cpu0 node and if
available, enable support for boost mode frequencies. The frequencies
usable in boost mode are determined while preparing the cpufreq table
from the list of operating points available.

Cc: Shawn Guo <shawn.guo@linaro.org>
Cc: Lukasz Majewski <l.majewski@samsung.com>
Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 .../devicetree/bindings/cpufreq/cpufreq-cpu0.txt   |    2 ++
 drivers/cpufreq/Kconfig                            |    1 +
 drivers/cpufreq/cpufreq-cpu0.c                     |    3 +++
 3 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-cpu0.txt b/Documentation/devicetree/bindings/cpufreq/cpufreq-cpu0.txt
index f055515..60f321a 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-cpu0.txt
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-cpu0.txt
@@ -19,6 +19,8 @@ Optional properties:
 - cooling-min-level:
 - cooling-max-level:
      Please refer to Documentation/devicetree/bindings/thermal/thermal.txt.
+- boost-frequency:
+     Please refer to Documentation/devicetree/bindings/cpufreq/cpufreq-boost.txt
 
 Examples:
 
diff --git a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
index 1fbe11f..52741b9 100644
--- a/drivers/cpufreq/Kconfig
+++ b/drivers/cpufreq/Kconfig
@@ -187,6 +187,7 @@ config GENERIC_CPUFREQ_CPU0
 	tristate "Generic CPU0 cpufreq driver"
 	depends on HAVE_CLK && REGULATOR && OF && THERMAL && CPU_THERMAL
 	select PM_OPP
+	select CPU_FREQ_BOOST_SW
 	help
 	  This adds a generic cpufreq driver for CPU0 frequency management.
 	  It supports both uniprocessor (UP) and symmetric multiprocessor (SMP)
diff --git a/drivers/cpufreq/cpufreq-cpu0.c b/drivers/cpufreq/cpufreq-cpu0.c
index 1bf6bba..93d3d6d 100644
--- a/drivers/cpufreq/cpufreq-cpu0.c
+++ b/drivers/cpufreq/cpufreq-cpu0.c
@@ -194,6 +194,9 @@ static int cpu0_cpufreq_probe(struct platform_device *pdev)
 			transition_latency += ret * 1000;
 	}
 
+	if (of_find_property(cpu_dev->of_node, "boost-frequencies", NULL))
+		cpu0_cpufreq_driver.boost_supported = true;
+
 	ret = cpufreq_register_driver(&cpu0_cpufreq_driver);
 	if (ret) {
 		pr_err("failed register driver: %d\n", ret);
-- 
1.7.9.5
