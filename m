From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] [CPUFREQ] s5pv210-cpufreq.c: Add missing clk_put
Date: Mon,  6 Jun 2011 18:59:02 -0700
Message-ID: <1307411942-20711-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:38625 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754406Ab1FGB7M (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Jun 2011 21:59:12 -0400
Received: by pwi15 with SMTP id 15so2438537pwi.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jun 2011 18:59:12 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Julia Lawall <julia@diku.dk>, Dave Jones <davej@redhat.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Julia Lawall <julia@diku.dk>

The successive calls to clk_get each call clk_put in the case of failure,
but this is not done for subsequent error handling code.  The calls to
clk_get are moved to the end of the function, and appropriate gotos are
added.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r exists@
expression e1,e2;
statement S;
@@

e1 = clk_get@p1(...);
... when != e1 = e2
    when != clk_put(e1)
    when any
if (...) { ... when != clk_put(e1)
               when != if (...) { ... clk_put(e1) ... }
* return@p3 ...;
 } else S
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
Cc: Dave Jones <davej@redhat.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---

Hi Dave,

Could you please pick this up in your tree?

 drivers/cpufreq/s5pv210-cpufreq.c |   25 +++++++++++++++++--------
 1 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
index c482fc8..58fe06a 100644
--- a/drivers/cpufreq/s5pv210-cpufreq.c
+++ b/drivers/cpufreq/s5pv210-cpufreq.c
@@ -413,6 +413,7 @@ static int check_mem_type(void __iomem *dmc_reg)
 static int __init s5pv210_cpu_init(struct cpufreq_policy *policy)
 {
 	unsigned long mem_type;
+	int ret;
 
 	cpu_clk = clk_get(NULL, "armclk");
 	if (IS_ERR(cpu_clk))
@@ -420,19 +421,20 @@ static int __init s5pv210_cpu_init(struct cpufreq_policy *policy)
 
 	dmc0_clk = clk_get(NULL, "sclk_dmc0");
 	if (IS_ERR(dmc0_clk)) {
-		clk_put(cpu_clk);
-		return PTR_ERR(dmc0_clk);
+		ret = PTR_ERR(dmc0_clk);
+		goto out_dmc0;
 	}
 
 	dmc1_clk = clk_get(NULL, "hclk_msys");
 	if (IS_ERR(dmc1_clk)) {
-		clk_put(dmc0_clk);
-		clk_put(cpu_clk);
-		return PTR_ERR(dmc1_clk);
+		ret = PTR_ERR(dmc1_clk);
+		goto out_dmc1;
 	}
 
-	if (policy->cpu != 0)
-		return -EINVAL;
+	if (policy->cpu != 0) {
+		ret = -EINVAL;
+		goto out_dmc1;
+	}
 
 	/*
 	 * check_mem_type : This driver only support LPDDR & LPDDR2.
@@ -442,7 +444,8 @@ static int __init s5pv210_cpu_init(struct cpufreq_policy *policy)
 
 	if ((mem_type != LPDDR) && (mem_type != LPDDR2)) {
 		printk(KERN_ERR "CPUFreq doesn't support this memory type\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out_dmc1;
 	}
 
 	/* Find current refresh counter and frequency each DMC */
@@ -459,6 +462,12 @@ static int __init s5pv210_cpu_init(struct cpufreq_policy *policy)
 	policy->cpuinfo.transition_latency = 40000;
 
 	return cpufreq_frequency_table_cpuinfo(policy, s5pv210_freq_table);
+
+out_dmc1:
+	clk_put(dmc0_clk);
+out_dmc0:
+	clk_put(cpu_clk);
+	return ret;
 }
 
 static struct cpufreq_driver s5pv210_driver = {
-- 
1.7.4.4
