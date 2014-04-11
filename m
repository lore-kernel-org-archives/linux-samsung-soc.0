From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V4 10/20] ARM: exynos: cpuidle: Move clock setup to pm.c
Date: Fri, 11 Apr 2014 10:49:14 +0200
Message-ID: <5347AC8A.7090006@samsung.com>
References: <1397123751-1957-1-git-send-email-daniel.lezcano@linaro.org>
 <1397123751-1957-11-git-send-email-daniel.lezcano@linaro.org>
 <5346A367.2070107@samsung.com> <5346A958.1030302@linaro.org>
 <5346BA09.9020708@samsung.com> <5347A816.4020609@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=------------070903010009080007060308
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:35401 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754011AbaDKItW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Apr 2014 04:49:22 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N3U00G1SZ5YFS10@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 11 Apr 2014 09:49:10 +0100 (BST)
In-reply-to: <5347A816.4020609@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, b.zolnierkie@samsung.com, sachin.kamat@linaro.org, viresh.kumar@linaro.org, rjw@rjwysocki.net

This is a multi-part message in MIME format.
--------------070903010009080007060308
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11.04.2014 10:30, Daniel Lezcano wrote:
> On 04/10/2014 05:34 PM, Tomasz Figa wrote:
>> On 10.04.2014 16:23, Daniel Lezcano wrote:
>>> On 04/10/2014 03:57 PM, Tomasz Figa wrote:
>>>> Hi Daniel,
>>>>
>>>> On 10.04.2014 11:55, Daniel Lezcano wrote:
>>>>> One more step is moving the clock ratio setting at idle time in pm.c
>>>>>
>>>>> The macro names have been changed to be consistent with the other
>>>>> macros
>>>>> name in the file.
>>>>>
>>>>> Note, the clock divider was working only when cpuidle was enabled
>>>>> because it
>>>>> was in its init routine. With this change, the clock divider is set in
>>>>> the pm's
>>>>> init routine, so it will also operate when the cpuidle driver is not
>>>>> set, which
>>>>> is good.
>>>>>
>>>>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>>>>> Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
>>>>> Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>>>>> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
>>>>> ---
>>>>>   arch/arm/mach-exynos/cpuidle.c  |   54
>>>>> ---------------------------------------
>>>>>   arch/arm/mach-exynos/pm.c       |   35 +++++++++++++++++++++++++
>>>>>   arch/arm/mach-exynos/regs-pmu.h |   19 ++++++++++++++
>>>>>   3 files changed, 54 insertions(+), 54 deletions(-)
>>>>
>>>> Sorry that I didn't mention that before, but now I recall that there
>>>> was
>>>> already a similar patch moving this code to Exynos5250 clock driver,
>>>> which is the best place for setup of any CMU registers and a step
>>>> towards removing one more static IO mapping.
>>>
>>> Yes, Bartlomiej mentioned it.
>>>
>>> Is it possible to merge this mentioned patch or to give a pointer to it
>>> so I can integrate it into the patchset ?
>>
>> http://marc.info/?l=linux-arm-kernel&m=138147021207626&w=2
>>
>> I wonder if it still applies cleanly, though...
>
> Ok, if I refer to the date, this patch has been lost in the limbus. So I
> can integrate it with my patchset without conflicting with any tree.
> Right ?
>

As I suspected, it doesn't apply onto current sources. I have attached a 
rebased version. Feel free to send it as a part of next version of your 
series.

Best regards,
Tomasz

--------------070903010009080007060308
Content-Type: text/x-patch;
 name="0001-ARM-EXYNOS-Move-arm-core-power-down-clock-to-exynos5.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-ARM-EXYNOS-Move-arm-core-power-down-clock-to-exynos5.pa";
 filename*1="tch"

>From 31d02976c517c1e8d00a0c1296e5fa132af78880 Mon Sep 17 00:00:00 2001
From: Amit Daniel Kachhap <amit.daniel@samsung.com>
Date: Fri, 11 Oct 2013 11:12:14 +0530
Subject: [PATCH] ARM: EXYNOS: Move arm core power down clock to exynos5250
 common clock

Now with common clock support added for exynos5250 it is necessary to move
this code to exynos5250 common clock driver as clock registers should be
handled there. This change is tested in exynos5250 based arndale platform.

Cc: Abhilash Kesavan <a.kesavan@samsung.com>
Cc: Thomas Abraham <thomas.abraham@linaro.org>
Acked-by: Kukjin Kim <kgene.kim@samsugn.com>
Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
[t.figa: Rebased onto current kernel sources.]
Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/mach-exynos/cpuidle.c       | 54 ------------------------------------
 drivers/clk/samsung/clk-exynos5250.c | 42 ++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+), 54 deletions(-)

diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
index c57cae0..8125a15 100644
--- a/arch/arm/mach-exynos/cpuidle.c
+++ b/arch/arm/mach-exynos/cpuidle.c
@@ -41,25 +41,6 @@
 
 #define S5P_CHECK_AFTR		0xFCBA0D10
 
-#define EXYNOS5_PWR_CTRL1			(S5P_VA_CMU + 0x01020)
-#define EXYNOS5_PWR_CTRL2			(S5P_VA_CMU + 0x01024)
-
-#define PWR_CTRL1_CORE2_DOWN_RATIO		(7 << 28)
-#define PWR_CTRL1_CORE1_DOWN_RATIO		(7 << 16)
-#define PWR_CTRL1_DIV2_DOWN_EN			(1 << 9)
-#define PWR_CTRL1_DIV1_DOWN_EN			(1 << 8)
-#define PWR_CTRL1_USE_CORE1_WFE			(1 << 5)
-#define PWR_CTRL1_USE_CORE0_WFE			(1 << 4)
-#define PWR_CTRL1_USE_CORE1_WFI			(1 << 1)
-#define PWR_CTRL1_USE_CORE0_WFI			(1 << 0)
-
-#define PWR_CTRL2_DIV2_UP_EN			(1 << 25)
-#define PWR_CTRL2_DIV1_UP_EN			(1 << 24)
-#define PWR_CTRL2_DUR_STANDBY2_VAL		(1 << 16)
-#define PWR_CTRL2_DUR_STANDBY1_VAL		(1 << 8)
-#define PWR_CTRL2_CORE2_UP_RATIO		(1 << 4)
-#define PWR_CTRL2_CORE1_UP_RATIO		(1 << 0)
-
 static int exynos4_enter_lowpower(struct cpuidle_device *dev,
 				struct cpuidle_driver *drv,
 				int index);
@@ -182,46 +163,11 @@ static int exynos4_enter_lowpower(struct cpuidle_device *dev,
 		return exynos4_enter_core0_aftr(dev, drv, new_index);
 }
 
-static void __init exynos5_core_down_clk(void)
-{
-	unsigned int tmp;
-
-	/*
-	 * Enable arm clock down (in idle) and set arm divider
-	 * ratios in WFI/WFE state.
-	 */
-	tmp = PWR_CTRL1_CORE2_DOWN_RATIO | \
-	      PWR_CTRL1_CORE1_DOWN_RATIO | \
-	      PWR_CTRL1_DIV2_DOWN_EN	 | \
-	      PWR_CTRL1_DIV1_DOWN_EN	 | \
-	      PWR_CTRL1_USE_CORE1_WFE	 | \
-	      PWR_CTRL1_USE_CORE0_WFE	 | \
-	      PWR_CTRL1_USE_CORE1_WFI	 | \
-	      PWR_CTRL1_USE_CORE0_WFI;
-	__raw_writel(tmp, EXYNOS5_PWR_CTRL1);
-
-	/*
-	 * Enable arm clock up (on exiting idle). Set arm divider
-	 * ratios when not in idle along with the standby duration
-	 * ratios.
-	 */
-	tmp = PWR_CTRL2_DIV2_UP_EN	 | \
-	      PWR_CTRL2_DIV1_UP_EN	 | \
-	      PWR_CTRL2_DUR_STANDBY2_VAL | \
-	      PWR_CTRL2_DUR_STANDBY1_VAL | \
-	      PWR_CTRL2_CORE2_UP_RATIO	 | \
-	      PWR_CTRL2_CORE1_UP_RATIO;
-	__raw_writel(tmp, EXYNOS5_PWR_CTRL2);
-}
-
 static int exynos_cpuidle_probe(struct platform_device *pdev)
 {
 	int cpu_id, ret;
 	struct cpuidle_device *device;
 
-	if (soc_is_exynos5250())
-		exynos5_core_down_clk();
-
 	if (soc_is_exynos5440())
 		exynos4_idle_driver.state_count = 1;
 
diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index e7ee442..2bb4625 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -24,6 +24,8 @@
 #define APLL_CON0		0x100
 #define SRC_CPU			0x200
 #define DIV_CPU0		0x500
+#define PWR_CTRL1		0x1020
+#define PWR_CTRL2		0x1024
 #define MPLL_LOCK		0x4000
 #define MPLL_CON0		0x4100
 #define SRC_CORE1		0x4204
@@ -80,6 +82,23 @@
 #define SRC_CDREX		0x20200
 #define PLL_DIV2_SEL		0x20a24
 
+/*Below definitions are used for PWR_CTRL settings*/
+#define PWR_CTRL1_CORE2_DOWN_RATIO		(7 << 28)
+#define PWR_CTRL1_CORE1_DOWN_RATIO		(7 << 16)
+#define PWR_CTRL1_DIV2_DOWN_EN			(1 << 9)
+#define PWR_CTRL1_DIV1_DOWN_EN			(1 << 8)
+#define PWR_CTRL1_USE_CORE1_WFE			(1 << 5)
+#define PWR_CTRL1_USE_CORE0_WFE			(1 << 4)
+#define PWR_CTRL1_USE_CORE1_WFI			(1 << 1)
+#define PWR_CTRL1_USE_CORE0_WFI			(1 << 0)
+
+#define PWR_CTRL2_DIV2_UP_EN			(1 << 25)
+#define PWR_CTRL2_DIV1_UP_EN			(1 << 24)
+#define PWR_CTRL2_DUR_STANDBY2_VAL		(1 << 16)
+#define PWR_CTRL2_DUR_STANDBY1_VAL		(1 << 8)
+#define PWR_CTRL2_CORE2_UP_RATIO		(1 << 4)
+#define PWR_CTRL2_CORE1_UP_RATIO		(1 << 0)
+
 /* list of PLLs to be registered */
 enum exynos5250_plls {
 	apll, mpll, cpll, epll, vpll, gpll, bpll,
@@ -98,6 +117,8 @@ static struct samsung_clk_reg_dump *exynos5250_save;
 static unsigned long exynos5250_clk_regs[] __initdata = {
 	SRC_CPU,
 	DIV_CPU0,
+	PWR_CTRL1,
+	PWR_CTRL2,
 	SRC_CORE1,
 	SRC_TOP0,
 	SRC_TOP2,
@@ -686,6 +707,7 @@ static struct of_device_id ext_clk_match[] __initdata = {
 /* register exynox5250 clocks */
 static void __init exynos5250_clk_init(struct device_node *np)
 {
+	unsigned int tmp;
 	if (np) {
 		reg_base = of_iomap(np, 0);
 		if (!reg_base)
@@ -722,6 +744,26 @@ static void __init exynos5250_clk_init(struct device_node *np)
 	samsung_clk_register_gate(exynos5250_gate_clks,
 			ARRAY_SIZE(exynos5250_gate_clks));
 
+	/*
+	 * Enable arm clock down (in idle) and set arm divider
+	 * ratios in WFI/WFE state.
+	 */
+	tmp = (PWR_CTRL1_CORE2_DOWN_RATIO | PWR_CTRL1_CORE1_DOWN_RATIO |
+		PWR_CTRL1_DIV2_DOWN_EN | PWR_CTRL1_DIV1_DOWN_EN |
+		PWR_CTRL1_USE_CORE1_WFE | PWR_CTRL1_USE_CORE0_WFE |
+		PWR_CTRL1_USE_CORE1_WFI | PWR_CTRL1_USE_CORE0_WFI);
+	__raw_writel(tmp, reg_base + PWR_CTRL1);
+
+	/*
+	 * Enable arm clock up (on exiting idle). Set arm divider
+	 * ratios when not in idle along with the standby duration
+	 * ratios.
+	 */
+	tmp = (PWR_CTRL2_DIV2_UP_EN | PWR_CTRL2_DIV1_UP_EN |
+		PWR_CTRL2_DUR_STANDBY2_VAL | PWR_CTRL2_DUR_STANDBY1_VAL |
+		PWR_CTRL2_CORE2_UP_RATIO | PWR_CTRL2_CORE1_UP_RATIO);
+	__raw_writel(tmp, reg_base + PWR_CTRL2);
+
 	exynos5250_clk_sleep_init();
 
 	pr_info("Exynos5250: clock setup completed, armclk=%ld\n",
-- 
1.9.1


--------------070903010009080007060308--
