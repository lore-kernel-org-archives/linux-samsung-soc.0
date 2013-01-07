From: Chen Gang <gang.chen@asianux.com>
Subject: [PATCH v2] arch/arm/mach-s5pv210: adding ifdef CONFIG_CPU_S5PV210
 to fix compiling issue
Date: Mon, 07 Jan 2013 20:31:18 +0800
Message-ID: <50EAC016.6090707@asianux.com>
References: <50EA972E.3040404@asianux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from intranet.asianux.com ([58.214.24.6]:36146 "EHLO
	intranet.asianux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754203Ab3AGMal (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Jan 2013 07:30:41 -0500
In-Reply-To: <50EA972E.3040404@asianux.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux@arm.linux.org.uk
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org


  if not define CONFIG_CPU_S5PV210

    it will define NULL in common.h for:
      s5pv210_map_io, s5pv210_init_clocks, s5pv210_init, s5pv210_init_uarts

    so need using #ifdef CONFIG_CPU_S5PV210 for them too, in common.c.
      or compiling issue will occur.


Signed-off-by: Chen Gang <gang.chen@asianux.com>
---
 arch/arm/mach-s5pv210/common.c |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/mach-s5pv210/common.c b/arch/arm/mach-s5pv210/common.c
index 9dfe93e..5c88f88 100644
--- a/arch/arm/mach-s5pv210/common.c
+++ b/arch/arm/mach-s5pv210/common.c
@@ -167,6 +167,8 @@ void __init s5pv210_init_io(struct map_desc *mach_desc, int size)
 	s3c_init_cpu(samsung_cpu_id, cpu_ids, ARRAY_SIZE(cpu_ids));
 }
 
+#ifdef CONFIG_CPU_S5PV210
+
 void __init s5pv210_map_io(void)
 {
 	/* initialise device information early */
@@ -209,6 +211,9 @@ void __init s5pv210_init_clocks(int xtal)
 	s5pv210_setup_clocks();
 }
 
+#endif /* CONFIG_CPU_S5PV210 */
+
+
 void __init s5pv210_init_irq(void)
 {
 	u32 vic[4];	/* S5PV210 supports 4 VIC */
@@ -227,6 +232,8 @@ struct bus_type s5pv210_subsys = {
 	.dev_name	= "s5pv210-core",
 };
 
+#ifdef CONFIG_CPU_S5PV210
+
 static struct device s5pv210_dev = {
 	.bus	= &s5pv210_subsys,
 };
@@ -249,3 +256,5 @@ void __init s5pv210_init_uarts(struct s3c2410_uartcfg *cfg, int no)
 {
 	s3c24xx_init_uartdevs("s5pv210-uart", s5p_uart_resources, cfg, no);
 }
+
+#endif /* CONFIG_CPU_S5PV210 */
-- 
1.7.10.4
