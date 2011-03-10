From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: [PATCH] ARM: S3C64XX: Fix section mismatch from cpufreq init
Date: Thu, 10 Mar 2011 14:58:13 +0000
Message-ID: <1299769093-14516-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:54089 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751847Ab1CJO6P (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Mar 2011 09:58:15 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com, Mark Brown <broonie@opensource.wolfsonmicro.com>

The cpufreq init function is referenced from the driver structure and
we don't appear to have annotations which allow us to mark that it'll
never be called after system init, causing the linker consistency
infrastructure to complain. Just remove the __init annotation to avoid
noise from the build.

Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
---
 arch/arm/mach-s3c64xx/cpufreq.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/cpufreq.c b/arch/arm/mach-s3c64xx/cpufreq.c
index 74c0e83..4375b97 100644
--- a/arch/arm/mach-s3c64xx/cpufreq.c
+++ b/arch/arm/mach-s3c64xx/cpufreq.c
@@ -181,7 +181,7 @@ static void __init s3c64xx_cpufreq_config_regulator(void)
 }
 #endif
 
-static int __init s3c64xx_cpufreq_driver_init(struct cpufreq_policy *policy)
+static int s3c64xx_cpufreq_driver_init(struct cpufreq_policy *policy)
 {
 	int ret;
 	struct cpufreq_frequency_table *freq;
-- 
1.7.2.3
