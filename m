From: Julia Lawall <julia@diku.dk>
Subject: [PATCH 5/10] arch/arm/mach-s5pv210/cpufreq.c: add missing clk_put
Date: Wed,  1 Jun 2011 19:10:08 +0200
Message-ID: <1306948213-20767-5-git-send-email-julia@diku.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Russell King <linux@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

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

---
 arch/arm/mach-s5pv210/cpufreq.c |   25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-s5pv210/cpufreq.c b/arch/arm/mach-s5pv210/cpufreq.c
index 22046e2..97a29e1 100644
--- a/arch/arm/mach-s5pv210/cpufreq.c
+++ b/arch/arm/mach-s5pv210/cpufreq.c
@@ -414,6 +414,7 @@ static int check_mem_type(void __iomem *dmc_reg)
 static int __init s5pv210_cpu_init(struct cpufreq_policy *policy)
 {
 	unsigned long mem_type;
+	int ret;
 
 	cpu_clk = clk_get(NULL, "armclk");
 	if (IS_ERR(cpu_clk))
@@ -421,19 +422,20 @@ static int __init s5pv210_cpu_init(struct cpufreq_policy *policy)
 
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
@@ -443,7 +445,8 @@ static int __init s5pv210_cpu_init(struct cpufreq_policy *policy)
 
 	if ((mem_type != LPDDR) && (mem_type != LPDDR2)) {
 		printk(KERN_ERR "CPUFreq doesn't support this memory type\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out_dmc1;
 	}
 
 	/* Find current refresh counter and frequency each DMC */
@@ -460,6 +463,12 @@ static int __init s5pv210_cpu_init(struct cpufreq_policy *policy)
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
