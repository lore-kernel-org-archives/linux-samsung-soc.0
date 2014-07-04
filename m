From: Jonghwan Choi <jhbird.choi@samsung.com>
Subject: [PATCH] thermal: Add missing cpumask_clear
Date: Fri, 04 Jul 2014 19:22:40 +0900
Message-ID: <000001cf9771$e2f465c0$a8dd3140$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:33320 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752705AbaGDKWn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Jul 2014 06:22:43 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N86003UNNHTVV30@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 Jul 2014 19:22:41 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Eduardo Valentin' <eduardo.valentin@ti.com>, 'Jonghwa Lee' <jonghwa3.lee@samsung.com>, 'Lukasz Majewski' <l.majewski@samsung.com>, 'Naveen Krishna Chatradhi' <ch.naveen@samsung.com>

Cpumasks should be cleared before using.

Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
---
 drivers/thermal/db8500_cpufreq_cooling.c        |    1 +
 drivers/thermal/imx_thermal.c                   |    1 +
 drivers/thermal/samsung/exynos_thermal_common.c |    1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/thermal/db8500_cpufreq_cooling.c b/drivers/thermal/db8500_cpufreq_cooling.c
index 786d192..1fa46ff 100644
--- a/drivers/thermal/db8500_cpufreq_cooling.c
+++ b/drivers/thermal/db8500_cpufreq_cooling.c
@@ -34,6 +34,7 @@ static int db8500_cpufreq_cooling_probe(struct platform_device *pdev)
 	if (!cpufreq_frequency_get_table(0))
 		return -EPROBE_DEFER;
 
+	cpumask_clear(&mask_val);
 	cpumask_set_cpu(0, &mask_val);
 	cdev = cpufreq_cooling_register(&mask_val);
 
diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.c
index a99c631..a21acf8 100644
--- a/drivers/thermal/imx_thermal.c
+++ b/drivers/thermal/imx_thermal.c
@@ -449,6 +449,7 @@ static int imx_thermal_probe(struct platform_device *pdev)
 	regmap_write(map, MISC0 + REG_SET, MISC0_REFTOP_SELBIASOFF);
 	regmap_write(map, TEMPSENSE0 + REG_SET, TEMPSENSE0_POWER_DOWN);
 
+	cpumask_clear(&clip_cpus);
 	cpumask_set_cpu(0, &clip_cpus);
 	data->cdev = cpufreq_cooling_register(&clip_cpus);
 	if (IS_ERR(data->cdev)) {
diff --git a/drivers/thermal/samsung/exynos_thermal_common.c b/drivers/thermal/samsung/exynos_thermal_common.c
index 3f5ad25..47efa4c 100644
--- a/drivers/thermal/samsung/exynos_thermal_common.c
+++ b/drivers/thermal/samsung/exynos_thermal_common.c
@@ -361,6 +361,7 @@ int exynos_register_thermal(struct thermal_sensor_conf *sensor_conf)
 		return -ENOMEM;
 
 	th_zone->sensor_conf = sensor_conf;
+	cpumask_clear(&mask_val);
 	/*
 	 * TODO: 1) Handle multiple cooling devices in a thermal zone
 	 *	 2) Add a flag/name in cooling info to map to specific
-- 
1.7.10.4
