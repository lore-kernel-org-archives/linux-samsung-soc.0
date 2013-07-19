From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH] watchdog: s3c2410_wdt: code clean up
Date: Fri, 19 Jul 2013 14:28:08 +0530
Message-ID: <1374224288-18963-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:12118 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755412Ab3GSIfR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Jul 2013 04:35:17 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQ6006VWD6ON2S0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Jul 2013 17:35:12 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, dianders@chromium.org

This patch removes the global variables in the driver file and
group them into a structure.

Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
---
 Note: This patch is rebased on kgene's for-next branch and tested on SMDK5420.

 drivers/watchdog/s3c2410_wdt.c |  204 +++++++++++++++++++++++-----------------
 1 file changed, 119 insertions(+), 85 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 6a22cf5..5e66a66 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -84,13 +84,20 @@ MODULE_PARM_DESC(soft_noboot, "Watchdog action, set to 1 to ignore reboots, "
 			"0 to reboot (default 0)");
 MODULE_PARM_DESC(debug, "Watchdog debug, set to >1 for debug (default 0)");
 
-static struct device    *wdt_dev;	/* platform device attached to */
-static struct resource	*wdt_mem;
-static struct resource	*wdt_irq;
-static struct clk	*wdt_clock;
-static void __iomem	*wdt_base;
-static unsigned int	 wdt_count;
-static DEFINE_SPINLOCK(wdt_lock);
+struct s3c2410_watchdog {
+struct device		*dev;	/* platform device attached to */
+struct clk		*clock;
+void __iomem		*reg_base;
+unsigned int		count;
+spinlock_t		lock;
+struct watchdog_device	wdt_device;
+struct notifier_block	freq_transition;
+};
+
+#define to_s3c2410_watchdog(wdd)	\
+		container_of(wdd, struct s3c2410_watchdog, wdt_device)
+#define freq_to_wdt(_n)			\
+		container_of(_n, struct s3c2410_watchdog, freq_transition)
 
 /* watchdog control routines */
 
@@ -104,27 +111,31 @@ do {							\
 
 static int s3c2410wdt_keepalive(struct watchdog_device *wdd)
 {
-	spin_lock(&wdt_lock);
-	writel(wdt_count, wdt_base + S3C2410_WTCNT);
-	spin_unlock(&wdt_lock);
+	struct s3c2410_watchdog *wdt = to_s3c2410_watchdog(wdd);
+
+	spin_lock(&wdt->lock);
+	writel(wdt->count, wdt->reg_base + S3C2410_WTCNT);
+	spin_unlock(&wdt->lock);
 
 	return 0;
 }
 
-static void __s3c2410wdt_stop(void)
+static void __s3c2410wdt_stop(struct s3c2410_watchdog *wdt)
 {
 	unsigned long wtcon;
 
-	wtcon = readl(wdt_base + S3C2410_WTCON);
+	wtcon = readl(wdt->reg_base + S3C2410_WTCON);
 	wtcon &= ~(S3C2410_WTCON_ENABLE | S3C2410_WTCON_RSTEN);
-	writel(wtcon, wdt_base + S3C2410_WTCON);
+	writel(wtcon, wdt->reg_base + S3C2410_WTCON);
 }
 
 static int s3c2410wdt_stop(struct watchdog_device *wdd)
 {
-	spin_lock(&wdt_lock);
-	__s3c2410wdt_stop();
-	spin_unlock(&wdt_lock);
+	struct s3c2410_watchdog *wdt = to_s3c2410_watchdog(wdd);
+
+	spin_lock(&wdt->lock);
+	__s3c2410wdt_stop(wdt);
+	spin_unlock(&wdt->lock);
 
 	return 0;
 }
@@ -133,11 +144,13 @@ static int s3c2410wdt_start(struct watchdog_device *wdd)
 {
 	unsigned long wtcon;
 
-	spin_lock(&wdt_lock);
+	struct s3c2410_watchdog *wdt = to_s3c2410_watchdog(wdd);
+
+	spin_lock(&wdt->lock);
 
-	__s3c2410wdt_stop();
+	__s3c2410wdt_stop(wdt);
 
-	wtcon = readl(wdt_base + S3C2410_WTCON);
+	wtcon = readl(wdt->reg_base + S3C2410_WTCON);
 	wtcon |= S3C2410_WTCON_ENABLE | S3C2410_WTCON_DIV128;
 
 	if (soft_noboot) {
@@ -148,25 +161,26 @@ static int s3c2410wdt_start(struct watchdog_device *wdd)
 		wtcon |= S3C2410_WTCON_RSTEN;
 	}
 
-	DBG("%s: wdt_count=0x%08x, wtcon=%08lx\n",
-	    __func__, wdt_count, wtcon);
+	DBG("%s: count=0x%08x, wtcon=%08lx\n",
+	    __func__, wdt->count, wtcon);
 
-	writel(wdt_count, wdt_base + S3C2410_WTDAT);
-	writel(wdt_count, wdt_base + S3C2410_WTCNT);
-	writel(wtcon, wdt_base + S3C2410_WTCON);
-	spin_unlock(&wdt_lock);
+	writel(wdt->count, wdt->reg_base + S3C2410_WTDAT);
+	writel(wdt->count, wdt->reg_base + S3C2410_WTCNT);
+	writel(wtcon, wdt->reg_base + S3C2410_WTCON);
+	spin_unlock(&wdt->lock);
 
 	return 0;
 }
 
-static inline int s3c2410wdt_is_running(void)
+static inline int s3c2410wdt_is_running(struct s3c2410_watchdog *wdt)
 {
-	return readl(wdt_base + S3C2410_WTCON) & S3C2410_WTCON_ENABLE;
+	return readl(wdt->reg_base + S3C2410_WTCON) & S3C2410_WTCON_ENABLE;
 }
 
 static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd, unsigned timeout)
 {
-	unsigned long freq = clk_get_rate(wdt_clock);
+	struct s3c2410_watchdog *wdt = to_s3c2410_watchdog(wdd);
+	unsigned long freq = clk_get_rate(wdt->clock);
 	unsigned int count;
 	unsigned int divisor = 1;
 	unsigned long wtcon;
@@ -192,7 +206,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd, unsigned timeou
 		}
 
 		if ((count / divisor) >= 0x10000) {
-			dev_err(wdt_dev, "timeout %d too big\n", timeout);
+			dev_err(wdt->dev, "timeout %d too big\n", timeout);
 			return -EINVAL;
 		}
 	}
@@ -201,15 +215,15 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd, unsigned timeou
 	    __func__, timeout, divisor, count, count/divisor);
 
 	count /= divisor;
-	wdt_count = count;
+	wdt->count = count;
 
 	/* update the pre-scaler */
-	wtcon = readl(wdt_base + S3C2410_WTCON);
+	wtcon = readl(wdt->reg_base + S3C2410_WTCON);
 	wtcon &= ~S3C2410_WTCON_PRESCALE_MASK;
 	wtcon |= S3C2410_WTCON_PRESCALE(divisor-1);
 
-	writel(count, wdt_base + S3C2410_WTDAT);
-	writel(wtcon, wdt_base + S3C2410_WTCON);
+	writel(count, wdt->reg_base + S3C2410_WTDAT);
+	writel(wtcon, wdt->reg_base + S3C2410_WTCON);
 
 	wdd->timeout = (count * divisor) / freq;
 
@@ -242,21 +256,22 @@ static struct watchdog_device s3c2410_wdd = {
 
 static irqreturn_t s3c2410wdt_irq(int irqno, void *param)
 {
-	dev_info(wdt_dev, "watchdog timer expired (irq)\n");
+	struct s3c2410_watchdog *wdt = platform_get_drvdata(param);
+	dev_info(wdt->dev, "watchdog timer expired (irq)\n");
 
-	s3c2410wdt_keepalive(&s3c2410_wdd);
+	s3c2410wdt_keepalive(&wdt->wdt_device);
 	return IRQ_HANDLED;
 }
 
-
 #ifdef CONFIG_CPU_FREQ
 
 static int s3c2410wdt_cpufreq_transition(struct notifier_block *nb,
 					  unsigned long val, void *data)
 {
 	int ret;
+	struct s3c2410_watchdog *wdt = freq_to_wdt(nb);
 
-	if (!s3c2410wdt_is_running())
+	if (!s3c2410wdt_is_running(wdt))
 		goto done;
 
 	if (val == CPUFREQ_PRECHANGE) {
@@ -265,14 +280,15 @@ static int s3c2410wdt_cpufreq_transition(struct notifier_block *nb,
 		 * the watchdog is running.
 		 */
 
-		s3c2410wdt_keepalive(&s3c2410_wdd);
+		s3c2410wdt_keepalive(&wdt->wdt_device);
 	} else if (val == CPUFREQ_POSTCHANGE) {
-		s3c2410wdt_stop(&s3c2410_wdd);
+		s3c2410wdt_stop(&wdt->wdt_device);
 
-		ret = s3c2410wdt_set_heartbeat(&s3c2410_wdd, s3c2410_wdd.timeout);
+		ret = s3c2410wdt_set_heartbeat(&wdt->wdt_device,
+						wdt->wdt_device.timeout);
 
 		if (ret >= 0)
-			s3c2410wdt_start(&s3c2410_wdd);
+			s3c2410wdt_start(&wdt->wdt_device);
 		else
 			goto err;
 	}
@@ -281,8 +297,8 @@ done:
 	return 0;
 
  err:
-	dev_err(wdt_dev, "cannot set new value for timeout %d\n",
-				s3c2410_wdd.timeout);
+	dev_err(wdt->dev, "cannot set new value for timeout %d\n",
+				wdt->wdt_device.timeout);
 	return ret;
 }
 
@@ -290,25 +306,30 @@ static struct notifier_block s3c2410wdt_cpufreq_transition_nb = {
 	.notifier_call	= s3c2410wdt_cpufreq_transition,
 };
 
-static inline int s3c2410wdt_cpufreq_register(void)
+static inline int s3c2410wdt_cpufreq_register(struct s3c2410_watchdog *wdt)
 {
-	return cpufreq_register_notifier(&s3c2410wdt_cpufreq_transition_nb,
+	wdt->freq_transition.notifier_call = s3c2410wdt_cpufreq_transition;
+
+	return cpufreq_register_notifier(&wdt->freq_transition,
 					 CPUFREQ_TRANSITION_NOTIFIER);
 }
 
-static inline void s3c2410wdt_cpufreq_deregister(void)
+static inline void s3c2410wdt_cpufreq_deregister(struct s3c2410_watchdog *wdt)
 {
-	cpufreq_unregister_notifier(&s3c2410wdt_cpufreq_transition_nb,
+	wdt->freq_transition.notifier_call = s3c2410wdt_cpufreq_transition;
+
+	cpufreq_unregister_notifier(&wdt->freq_transition,
 				    CPUFREQ_TRANSITION_NOTIFIER);
 }
 
 #else
-static inline int s3c2410wdt_cpufreq_register(void)
+
+static inline int s3c2410wdt_cpufreq_register(struct s3c2410_watchdog *wdt)
 {
 	return 0;
 }
 
-static inline void s3c2410wdt_cpufreq_deregister(void)
+static inline void s3c2410wdt_cpufreq_deregister(struct s3c2410_watchdog *wdt)
 {
 }
 #endif
@@ -316,6 +337,9 @@ static inline void s3c2410wdt_cpufreq_deregister(void)
 static int s3c2410wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev;
+	struct s3c2410_watchdog *wdt;
+	struct resource *wdt_mem;
+	struct resource *wdt_irq;
 	unsigned int wtcon;
 	int started = 0;
 	int ret;
@@ -323,8 +347,14 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	DBG("%s: probe=%p\n", __func__, pdev);
 
 	dev = &pdev->dev;
-	wdt_dev = &pdev->dev;
 
+	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
+	if (!wdt)
+		return -ENOMEM;
+
+	wdt->dev = &pdev->dev;
+	spin_lock_init(&wdt->lock);
+	wdt->wdt_device = s3c2410_wdd;
 	wdt_mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (wdt_mem == NULL) {
 		dev_err(dev, "no memory resource specified\n");
@@ -339,24 +369,24 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	}
 
 	/* get the memory region for the watchdog timer */
-	wdt_base = devm_ioremap_resource(dev, wdt_mem);
-	if (IS_ERR(wdt_base)) {
-		ret = PTR_ERR(wdt_base);
+	wdt->reg_base = devm_ioremap_resource(dev, wdt_mem);
+	if (IS_ERR(wdt->reg_base)) {
+		ret = PTR_ERR(wdt->reg_base);
 		goto err;
 	}
 
-	DBG("probe: mapped wdt_base=%p\n", wdt_base);
+	DBG("probe: mapped reg_base=%p\n", wdt->reg_base);
 
-	wdt_clock = devm_clk_get(dev, "watchdog");
-	if (IS_ERR(wdt_clock)) {
+	wdt->clock = devm_clk_get(dev, "watchdog");
+	if (IS_ERR(wdt->clock)) {
 		dev_err(dev, "failed to find watchdog clock source\n");
-		ret = PTR_ERR(wdt_clock);
+		ret = PTR_ERR(wdt->clock);
 		goto err;
 	}
 
-	clk_prepare_enable(wdt_clock);
+	clk_prepare_enable(wdt->clock);
 
-	ret = s3c2410wdt_cpufreq_register();
+	ret = s3c2410wdt_cpufreq_register(wdt);
 	if (ret < 0) {
 		dev_err(dev, "failed to register cpufreq\n");
 		goto err_clk;
@@ -365,9 +395,10 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	/* see if we can actually set the requested timer margin, and if
 	 * not, try the default value */
 
-	watchdog_init_timeout(&s3c2410_wdd, tmr_margin,  &pdev->dev);
-	if (s3c2410wdt_set_heartbeat(&s3c2410_wdd, s3c2410_wdd.timeout)) {
-		started = s3c2410wdt_set_heartbeat(&s3c2410_wdd,
+	watchdog_init_timeout(&wdt->wdt_device, tmr_margin, &pdev->dev);
+	if (s3c2410wdt_set_heartbeat(&wdt->wdt_device,
+					wdt->wdt_device.timeout)) {
+		started = s3c2410wdt_set_heartbeat(&wdt->wdt_device,
 					CONFIG_S3C2410_WATCHDOG_DEFAULT_TIME);
 
 		if (started == 0)
@@ -386,9 +417,9 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 		goto err_cpufreq;
 	}
 
-	watchdog_set_nowayout(&s3c2410_wdd, nowayout);
+	watchdog_set_nowayout(&wdt->wdt_device, nowayout);
 
-	ret = watchdog_register_device(&s3c2410_wdd);
+	ret = watchdog_register_device(&wdt->wdt_device);
 	if (ret) {
 		dev_err(dev, "cannot register watchdog (%d)\n", ret);
 		goto err_cpufreq;
@@ -396,18 +427,20 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 
 	if (tmr_atboot && started == 0) {
 		dev_info(dev, "starting watchdog timer\n");
-		s3c2410wdt_start(&s3c2410_wdd);
+		s3c2410wdt_start(&wdt->wdt_device);
 	} else if (!tmr_atboot) {
 		/* if we're not enabling the watchdog, then ensure it is
 		 * disabled if it has been left running from the bootloader
 		 * or other source */
 
-		s3c2410wdt_stop(&s3c2410_wdd);
+		s3c2410wdt_stop(&wdt->wdt_device);
 	}
 
+	platform_set_drvdata(pdev, wdt);
+
 	/* print out a statement of readiness */
 
-	wtcon = readl(wdt_base + S3C2410_WTCON);
+	wtcon = readl(wdt->reg_base + S3C2410_WTCON);
 
 	dev_info(dev, "watchdog %sactive, reset %sabled, irq %sabled\n",
 		 (wtcon & S3C2410_WTCON_ENABLE) ?  "" : "in",
@@ -417,35 +450,33 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	return 0;
 
  err_cpufreq:
-	s3c2410wdt_cpufreq_deregister();
+	s3c2410wdt_cpufreq_deregister(wdt);
 
  err_clk:
-	clk_disable_unprepare(wdt_clock);
-	wdt_clock = NULL;
+	clk_disable_unprepare(wdt->clock);
+	wdt->clock = NULL;
 
  err:
-	wdt_irq = NULL;
-	wdt_mem = NULL;
 	return ret;
 }
 
 static int s3c2410wdt_remove(struct platform_device *dev)
 {
-	watchdog_unregister_device(&s3c2410_wdd);
+	struct s3c2410_watchdog *wdt = platform_get_drvdata(dev);
+	watchdog_unregister_device(&wdt->wdt_device);
 
-	s3c2410wdt_cpufreq_deregister();
+	s3c2410wdt_cpufreq_deregister(wdt);
 
-	clk_disable_unprepare(wdt_clock);
-	wdt_clock = NULL;
+	clk_disable_unprepare(wdt->clock);
+	wdt->clock = NULL;
 
-	wdt_irq = NULL;
-	wdt_mem = NULL;
 	return 0;
 }
 
 static void s3c2410wdt_shutdown(struct platform_device *dev)
 {
-	s3c2410wdt_stop(&s3c2410_wdd);
+	struct s3c2410_watchdog *wdt = platform_get_drvdata(dev);
+	s3c2410wdt_stop(&wdt->wdt_device);
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -455,23 +486,26 @@ static unsigned long wtdat_save;
 
 static int s3c2410wdt_suspend(struct device *dev)
 {
+	struct s3c2410_watchdog *wdt = dev_get_drvdata(dev);
 	/* Save watchdog state, and turn it off. */
-	wtcon_save = readl(wdt_base + S3C2410_WTCON);
-	wtdat_save = readl(wdt_base + S3C2410_WTDAT);
+	wtcon_save = readl(wdt->reg_base + S3C2410_WTCON);
+	wtdat_save = readl(wdt->reg_base + S3C2410_WTDAT);
 
 	/* Note that WTCNT doesn't need to be saved. */
-	s3c2410wdt_stop(&s3c2410_wdd);
+	s3c2410wdt_stop(&wdt->wdt_device);
 
 	return 0;
 }
 
 static int s3c2410wdt_resume(struct device *dev)
 {
+	struct s3c2410_watchdog *wdt = dev_get_drvdata(dev);
+
 	/* Restore watchdog state. */
 
-	writel(wtdat_save, wdt_base + S3C2410_WTDAT);
-	writel(wtdat_save, wdt_base + S3C2410_WTCNT); /* Reset count */
-	writel(wtcon_save, wdt_base + S3C2410_WTCON);
+	writel(wtdat_save, wdt->reg_base + S3C2410_WTDAT);
+	writel(wtdat_save, wdt->reg_base + S3C2410_WTCNT); /* Reset count */
+	writel(wtcon_save, wdt->reg_base + S3C2410_WTCON);
 
 	dev_info(dev, "watchdog %sabled\n",
 		(wtcon_save & S3C2410_WTCON_ENABLE) ? "en" : "dis");
-- 
1.7.9.5
