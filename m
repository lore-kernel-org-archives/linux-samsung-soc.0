From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V2] watchdog: s3c2410_wdt: remove the global variables
Date: Mon, 22 Jul 2013 19:38:44 +0200
Message-ID: <1531670.9zTKCdO4Nx@amdc1227>
References: <1374473649-20050-1-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:36755 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755147Ab3GVRiu convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Jul 2013 13:38:50 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MQC007BOMCFQ140@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Jul 2013 18:38:48 +0100 (BST)
In-reply-to: <1374473649-20050-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, dianders@chromium.org, jg1.han@samsung.com

Hi Leela Krishna,

Looks mostly good, but see some comments inline.

On Monday 22 of July 2013 11:44:09 Leela Krishna Amudala wrote:
> This patch removes the global variables in the driver file and
> group them into a structure.
>=20
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>  Note: This patch is rebased on kgene's for-next branch and tested on
> SMDK5420.
>=20
>  Changes since V1:
> 	- changed the patch subject.
> 	- indentation correction in s3c2410_watchdog structure.
>=20
>  drivers/watchdog/s3c2410_wdt.c |  204
> +++++++++++++++++++++++----------------- 1 file changed, 119
> insertions(+), 85 deletions(-)
>=20
> diff --git a/drivers/watchdog/s3c2410_wdt.c
> b/drivers/watchdog/s3c2410_wdt.c index 6a22cf5..de679d0 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -84,13 +84,20 @@ MODULE_PARM_DESC(soft_noboot, "Watchdog action, s=
et
> to 1 to ignore reboots, " "0 to reboot (default 0)");
>  MODULE_PARM_DESC(debug, "Watchdog debug, set to >1 for debug (defaul=
t
> 0)");
>=20
> -static struct device    *wdt_dev;	/* platform device attached to */
> -static struct resource	*wdt_mem;
> -static struct resource	*wdt_irq;
> -static struct clk	*wdt_clock;
> -static void __iomem	*wdt_base;
> -static unsigned int	 wdt_count;
> -static DEFINE_SPINLOCK(wdt_lock);
> +struct s3c2410_watchdog {
> +	struct device		*dev;	/* platform device attached to */
> +	struct clk		*clock;
> +	void __iomem		*reg_base;
> +	unsigned int		count;
> +	spinlock_t		lock;
> +	struct watchdog_device	wdt_device;
> +	struct notifier_block	freq_transition;
> +};
> +
> +#define to_s3c2410_watchdog(wdd)	\
> +		container_of(wdd, struct s3c2410_watchdog, wdt_device)
> +#define freq_to_wdt(_n)			\
> +		container_of(_n, struct s3c2410_watchdog, freq_transition)

Please use static inlines here.

>  /* watchdog control routines */
>=20
> @@ -104,27 +111,31 @@ do {							\
>=20
>  static int s3c2410wdt_keepalive(struct watchdog_device *wdd)
>  {
> -	spin_lock(&wdt_lock);
> -	writel(wdt_count, wdt_base + S3C2410_WTCNT);
> -	spin_unlock(&wdt_lock);
> +	struct s3c2410_watchdog *wdt =3D to_s3c2410_watchdog(wdd);
> +
> +	spin_lock(&wdt->lock);
> +	writel(wdt->count, wdt->reg_base + S3C2410_WTCNT);
> +	spin_unlock(&wdt->lock);
>=20
>  	return 0;
>  }
>=20
> -static void __s3c2410wdt_stop(void)
> +static void __s3c2410wdt_stop(struct s3c2410_watchdog *wdt)
>  {
>  	unsigned long wtcon;
>=20
> -	wtcon =3D readl(wdt_base + S3C2410_WTCON);
> +	wtcon =3D readl(wdt->reg_base + S3C2410_WTCON);
>  	wtcon &=3D ~(S3C2410_WTCON_ENABLE | S3C2410_WTCON_RSTEN);
> -	writel(wtcon, wdt_base + S3C2410_WTCON);
> +	writel(wtcon, wdt->reg_base + S3C2410_WTCON);
>  }
>=20
>  static int s3c2410wdt_stop(struct watchdog_device *wdd)
>  {
> -	spin_lock(&wdt_lock);
> -	__s3c2410wdt_stop();
> -	spin_unlock(&wdt_lock);
> +	struct s3c2410_watchdog *wdt =3D to_s3c2410_watchdog(wdd);
> +
> +	spin_lock(&wdt->lock);
> +	__s3c2410wdt_stop(wdt);
> +	spin_unlock(&wdt->lock);
>=20
>  	return 0;
>  }
> @@ -133,11 +144,13 @@ static int s3c2410wdt_start(struct watchdog_dev=
ice
> *wdd) {
>  	unsigned long wtcon;
>=20

Stray blank line.

> -	spin_lock(&wdt_lock);
> +	struct s3c2410_watchdog *wdt =3D to_s3c2410_watchdog(wdd);
> +
> +	spin_lock(&wdt->lock);
>=20
> -	__s3c2410wdt_stop();
> +	__s3c2410wdt_stop(wdt);
>=20
> -	wtcon =3D readl(wdt_base + S3C2410_WTCON);
> +	wtcon =3D readl(wdt->reg_base + S3C2410_WTCON);
>  	wtcon |=3D S3C2410_WTCON_ENABLE | S3C2410_WTCON_DIV128;
>=20
>  	if (soft_noboot) {
> @@ -148,25 +161,26 @@ static int s3c2410wdt_start(struct watchdog_dev=
ice
> *wdd) wtcon |=3D S3C2410_WTCON_RSTEN;
>  	}
>=20
> -	DBG("%s: wdt_count=3D0x%08x, wtcon=3D%08lx\n",
> -	    __func__, wdt_count, wtcon);
> +	DBG("%s: count=3D0x%08x, wtcon=3D%08lx\n",
> +	    __func__, wdt->count, wtcon);
>=20
> -	writel(wdt_count, wdt_base + S3C2410_WTDAT);
> -	writel(wdt_count, wdt_base + S3C2410_WTCNT);
> -	writel(wtcon, wdt_base + S3C2410_WTCON);
> -	spin_unlock(&wdt_lock);
> +	writel(wdt->count, wdt->reg_base + S3C2410_WTDAT);
> +	writel(wdt->count, wdt->reg_base + S3C2410_WTCNT);
> +	writel(wtcon, wdt->reg_base + S3C2410_WTCON);
> +	spin_unlock(&wdt->lock);
>=20
>  	return 0;
>  }
>=20
> -static inline int s3c2410wdt_is_running(void)
> +static inline int s3c2410wdt_is_running(struct s3c2410_watchdog *wdt=
)
>  {
> -	return readl(wdt_base + S3C2410_WTCON) & S3C2410_WTCON_ENABLE;
> +	return readl(wdt->reg_base + S3C2410_WTCON) & S3C2410_WTCON_ENABLE;
>  }
>=20
>  static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
> unsigned timeout) {
> -	unsigned long freq =3D clk_get_rate(wdt_clock);
> +	struct s3c2410_watchdog *wdt =3D to_s3c2410_watchdog(wdd);
> +	unsigned long freq =3D clk_get_rate(wdt->clock);
>  	unsigned int count;
>  	unsigned int divisor =3D 1;
>  	unsigned long wtcon;
> @@ -192,7 +206,7 @@ static int s3c2410wdt_set_heartbeat(struct
> watchdog_device *wdd, unsigned timeou }
>=20
>  		if ((count / divisor) >=3D 0x10000) {
> -			dev_err(wdt_dev, "timeout %d too big\n", timeout);
> +			dev_err(wdt->dev, "timeout %d too big\n", timeout);
>  			return -EINVAL;
>  		}
>  	}
> @@ -201,15 +215,15 @@ static int s3c2410wdt_set_heartbeat(struct
> watchdog_device *wdd, unsigned timeou __func__, timeout, divisor, cou=
nt,
> count/divisor);
>=20
>  	count /=3D divisor;
> -	wdt_count =3D count;
> +	wdt->count =3D count;
>=20
>  	/* update the pre-scaler */
> -	wtcon =3D readl(wdt_base + S3C2410_WTCON);
> +	wtcon =3D readl(wdt->reg_base + S3C2410_WTCON);
>  	wtcon &=3D ~S3C2410_WTCON_PRESCALE_MASK;
>  	wtcon |=3D S3C2410_WTCON_PRESCALE(divisor-1);
>=20
> -	writel(count, wdt_base + S3C2410_WTDAT);
> -	writel(wtcon, wdt_base + S3C2410_WTCON);
> +	writel(count, wdt->reg_base + S3C2410_WTDAT);
> +	writel(wtcon, wdt->reg_base + S3C2410_WTCON);
>=20
>  	wdd->timeout =3D (count * divisor) / freq;
>=20
> @@ -242,21 +256,22 @@ static struct watchdog_device s3c2410_wdd =3D {
>=20
>  static irqreturn_t s3c2410wdt_irq(int irqno, void *param)
>  {
> -	dev_info(wdt_dev, "watchdog timer expired (irq)\n");
> +	struct s3c2410_watchdog *wdt =3D platform_get_drvdata(param);

Please separate variables from code with a blank line.

> +	dev_info(wdt->dev, "watchdog timer expired (irq)\n");
>=20
> -	s3c2410wdt_keepalive(&s3c2410_wdd);
> +	s3c2410wdt_keepalive(&wdt->wdt_device);
>  	return IRQ_HANDLED;
>  }
>=20
> -
>  #ifdef CONFIG_CPU_FREQ
>=20
>  static int s3c2410wdt_cpufreq_transition(struct notifier_block *nb,
>  					  unsigned long val, void *data)
>  {
>  	int ret;
> +	struct s3c2410_watchdog *wdt =3D freq_to_wdt(nb);
>=20
> -	if (!s3c2410wdt_is_running())
> +	if (!s3c2410wdt_is_running(wdt))
>  		goto done;
>=20
>  	if (val =3D=3D CPUFREQ_PRECHANGE) {
> @@ -265,14 +280,15 @@ static int s3c2410wdt_cpufreq_transition(struct
> notifier_block *nb, * the watchdog is running.
>  		 */
>=20
> -		s3c2410wdt_keepalive(&s3c2410_wdd);
> +		s3c2410wdt_keepalive(&wdt->wdt_device);
>  	} else if (val =3D=3D CPUFREQ_POSTCHANGE) {
> -		s3c2410wdt_stop(&s3c2410_wdd);
> +		s3c2410wdt_stop(&wdt->wdt_device);
>=20
> -		ret =3D s3c2410wdt_set_heartbeat(&s3c2410_wdd, s3c2410_wdd.timeout=
);
> +		ret =3D s3c2410wdt_set_heartbeat(&wdt->wdt_device,
> +						wdt->wdt_device.timeout);
>=20
>  		if (ret >=3D 0)
> -			s3c2410wdt_start(&s3c2410_wdd);
> +			s3c2410wdt_start(&wdt->wdt_device);
>  		else
>  			goto err;
>  	}
> @@ -281,8 +297,8 @@ done:
>  	return 0;
>=20
>   err:
> -	dev_err(wdt_dev, "cannot set new value for timeout %d\n",
> -				s3c2410_wdd.timeout);
> +	dev_err(wdt->dev, "cannot set new value for timeout %d\n",
> +				wdt->wdt_device.timeout);
>  	return ret;
>  }
>=20
> @@ -290,25 +306,30 @@ static struct notifier_block
> s3c2410wdt_cpufreq_transition_nb =3D { .notifier_call	=3D
> s3c2410wdt_cpufreq_transition,
>  };

I think the above notifier_block is no longer used after your changes, =
as=20
the compiler complains:

drivers/watchdog/s3c2410_wdt.c:305:30: warning:=20
=E2=80=98s3c2410wdt_cpufreq_transition_nb=E2=80=99 defined but not used

>=20
> -static inline int s3c2410wdt_cpufreq_register(void)
> +static inline int s3c2410wdt_cpufreq_register(struct s3c2410_watchdo=
g
> *wdt) {
> -	return cpufreq_register_notifier(&s3c2410wdt_cpufreq_transition_nb,
> +	wdt->freq_transition.notifier_call =3D s3c2410wdt_cpufreq_transitio=
n;
> +
> +	return cpufreq_register_notifier(&wdt->freq_transition,
>  					 CPUFREQ_TRANSITION_NOTIFIER);
>  }
>=20
> -static inline void s3c2410wdt_cpufreq_deregister(void)
> +static inline void s3c2410wdt_cpufreq_deregister(struct s3c2410_watc=
hdog
> *wdt) {
> -	cpufreq_unregister_notifier(&s3c2410wdt_cpufreq_transition_nb,
> +	wdt->freq_transition.notifier_call =3D s3c2410wdt_cpufreq_transitio=
n;
> +
> +	cpufreq_unregister_notifier(&wdt->freq_transition,
>  				    CPUFREQ_TRANSITION_NOTIFIER);
>  }
>=20
>  #else
> -static inline int s3c2410wdt_cpufreq_register(void)
> +
> +static inline int s3c2410wdt_cpufreq_register(struct s3c2410_watchdo=
g
> *wdt) {
>  	return 0;
>  }
>=20
> -static inline void s3c2410wdt_cpufreq_deregister(void)
> +static inline void s3c2410wdt_cpufreq_deregister(struct s3c2410_watc=
hdog
> *wdt) {
>  }
>  #endif
> @@ -316,6 +337,9 @@ static inline void
> s3c2410wdt_cpufreq_deregister(void) static int s3c2410wdt_probe(struc=
t
> platform_device *pdev)
>  {
>  	struct device *dev;
> +	struct s3c2410_watchdog *wdt;
> +	struct resource *wdt_mem;
> +	struct resource *wdt_irq;
>  	unsigned int wtcon;
>  	int started =3D 0;
>  	int ret;
> @@ -323,8 +347,14 @@ static int s3c2410wdt_probe(struct platform_devi=
ce
> *pdev) DBG("%s: probe=3D%p\n", __func__, pdev);
>=20
>  	dev =3D &pdev->dev;
> -	wdt_dev =3D &pdev->dev;
>=20
> +	wdt =3D devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
> +	if (!wdt)
> +		return -ENOMEM;
> +
> +	wdt->dev =3D &pdev->dev;
> +	spin_lock_init(&wdt->lock);
> +	wdt->wdt_device =3D s3c2410_wdd;
>  	wdt_mem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	if (wdt_mem =3D=3D NULL) {
>  		dev_err(dev, "no memory resource specified\n");
> @@ -339,24 +369,24 @@ static int s3c2410wdt_probe(struct platform_dev=
ice
> *pdev) }
>=20
>  	/* get the memory region for the watchdog timer */
> -	wdt_base =3D devm_ioremap_resource(dev, wdt_mem);
> -	if (IS_ERR(wdt_base)) {
> -		ret =3D PTR_ERR(wdt_base);
> +	wdt->reg_base =3D devm_ioremap_resource(dev, wdt_mem);
> +	if (IS_ERR(wdt->reg_base)) {
> +		ret =3D PTR_ERR(wdt->reg_base);
>  		goto err;
>  	}
>=20
> -	DBG("probe: mapped wdt_base=3D%p\n", wdt_base);
> +	DBG("probe: mapped reg_base=3D%p\n", wdt->reg_base);
>=20
> -	wdt_clock =3D devm_clk_get(dev, "watchdog");
> -	if (IS_ERR(wdt_clock)) {
> +	wdt->clock =3D devm_clk_get(dev, "watchdog");
> +	if (IS_ERR(wdt->clock)) {
>  		dev_err(dev, "failed to find watchdog clock source\n");
> -		ret =3D PTR_ERR(wdt_clock);
> +		ret =3D PTR_ERR(wdt->clock);
>  		goto err;
>  	}
>=20
> -	clk_prepare_enable(wdt_clock);
> +	clk_prepare_enable(wdt->clock);
>=20
> -	ret =3D s3c2410wdt_cpufreq_register();
> +	ret =3D s3c2410wdt_cpufreq_register(wdt);
>  	if (ret < 0) {
>  		dev_err(dev, "failed to register cpufreq\n");
>  		goto err_clk;
> @@ -365,9 +395,10 @@ static int s3c2410wdt_probe(struct platform_devi=
ce
> *pdev) /* see if we can actually set the requested timer margin, and =
if
> * not, try the default value */
>=20
> -	watchdog_init_timeout(&s3c2410_wdd, tmr_margin,  &pdev->dev);
> -	if (s3c2410wdt_set_heartbeat(&s3c2410_wdd, s3c2410_wdd.timeout)) {
> -		started =3D s3c2410wdt_set_heartbeat(&s3c2410_wdd,
> +	watchdog_init_timeout(&wdt->wdt_device, tmr_margin, &pdev->dev);
> +	if (s3c2410wdt_set_heartbeat(&wdt->wdt_device,
> +					wdt->wdt_device.timeout)) {

	ret =3D s3c2410wdt_set_heartbeat(&wdt->wdt_device,
										wdt->wdt_device.timeout);
	if (ret) {

> +		started =3D s3c2410wdt_set_heartbeat(&wdt->wdt_device,
>  					CONFIG_S3C2410_WATCHDOG_DEFAULT_TIME);
>=20
>  		if (started =3D=3D 0)
> @@ -386,9 +417,9 @@ static int s3c2410wdt_probe(struct platform_devic=
e
> *pdev) goto err_cpufreq;
>  	}
>=20
> -	watchdog_set_nowayout(&s3c2410_wdd, nowayout);
> +	watchdog_set_nowayout(&wdt->wdt_device, nowayout);
>=20
> -	ret =3D watchdog_register_device(&s3c2410_wdd);
> +	ret =3D watchdog_register_device(&wdt->wdt_device);
>  	if (ret) {
>  		dev_err(dev, "cannot register watchdog (%d)\n", ret);
>  		goto err_cpufreq;
> @@ -396,18 +427,20 @@ static int s3c2410wdt_probe(struct platform_dev=
ice
> *pdev)
>=20
>  	if (tmr_atboot && started =3D=3D 0) {
>  		dev_info(dev, "starting watchdog timer\n");
> -		s3c2410wdt_start(&s3c2410_wdd);
> +		s3c2410wdt_start(&wdt->wdt_device);
>  	} else if (!tmr_atboot) {
>  		/* if we're not enabling the watchdog, then ensure it is
>  		 * disabled if it has been left running from the bootloader
>  		 * or other source */
>=20
> -		s3c2410wdt_stop(&s3c2410_wdd);
> +		s3c2410wdt_stop(&wdt->wdt_device);
>  	}
>=20
> +	platform_set_drvdata(pdev, wdt);
> +
>  	/* print out a statement of readiness */
>=20
> -	wtcon =3D readl(wdt_base + S3C2410_WTCON);
> +	wtcon =3D readl(wdt->reg_base + S3C2410_WTCON);
>=20
>  	dev_info(dev, "watchdog %sactive, reset %sabled, irq %sabled\n",
>  		 (wtcon & S3C2410_WTCON_ENABLE) ?  "" : "in",
> @@ -417,35 +450,33 @@ static int s3c2410wdt_probe(struct platform_dev=
ice
> *pdev) return 0;
>=20
>   err_cpufreq:
> -	s3c2410wdt_cpufreq_deregister();
> +	s3c2410wdt_cpufreq_deregister(wdt);
>=20
>   err_clk:
> -	clk_disable_unprepare(wdt_clock);
> -	wdt_clock =3D NULL;
> +	clk_disable_unprepare(wdt->clock);
> +	wdt->clock =3D NULL;
>=20
>   err:
> -	wdt_irq =3D NULL;
> -	wdt_mem =3D NULL;
>  	return ret;
>  }
>=20
>  static int s3c2410wdt_remove(struct platform_device *dev)
>  {
> -	watchdog_unregister_device(&s3c2410_wdd);
> +	struct s3c2410_watchdog *wdt =3D platform_get_drvdata(dev);

+ Blank line.

> +	watchdog_unregister_device(&wdt->wdt_device);
>=20
> -	s3c2410wdt_cpufreq_deregister();
> +	s3c2410wdt_cpufreq_deregister(wdt);
>=20
> -	clk_disable_unprepare(wdt_clock);
> -	wdt_clock =3D NULL;
> +	clk_disable_unprepare(wdt->clock);
> +	wdt->clock =3D NULL;
>=20
> -	wdt_irq =3D NULL;
> -	wdt_mem =3D NULL;
>  	return 0;
>  }
>=20
>  static void s3c2410wdt_shutdown(struct platform_device *dev)
>  {
> -	s3c2410wdt_stop(&s3c2410_wdd);
> +	struct s3c2410_watchdog *wdt =3D platform_get_drvdata(dev);

+ Blank line.

> +	s3c2410wdt_stop(&wdt->wdt_device);
>  }
>=20
>  #ifdef CONFIG_PM_SLEEP

Please also move the two save variables that are here to the structure.=
=2E.

> @@ -455,23 +486,26 @@ static unsigned long wtdat_save;
>=20
>  static int s3c2410wdt_suspend(struct device *dev)
>  {
> +	struct s3c2410_watchdog *wdt =3D dev_get_drvdata(dev);
>  	/* Save watchdog state, and turn it off. */
> -	wtcon_save =3D readl(wdt_base + S3C2410_WTCON);
> -	wtdat_save =3D readl(wdt_base + S3C2410_WTDAT);
> +	wtcon_save =3D readl(wdt->reg_base + S3C2410_WTCON);
> +	wtdat_save =3D readl(wdt->reg_base + S3C2410_WTDAT);

=2E..and use them here instead those global ones.

>  	/* Note that WTCNT doesn't need to be saved. */
> -	s3c2410wdt_stop(&s3c2410_wdd);
> +	s3c2410wdt_stop(&wdt->wdt_device);
>=20
>  	return 0;
>  }
>=20
>  static int s3c2410wdt_resume(struct device *dev)
>  {
> +	struct s3c2410_watchdog *wdt =3D dev_get_drvdata(dev);
> +
>  	/* Restore watchdog state. */
>=20
> -	writel(wtdat_save, wdt_base + S3C2410_WTDAT);
> -	writel(wtdat_save, wdt_base + S3C2410_WTCNT); /* Reset count */
> -	writel(wtcon_save, wdt_base + S3C2410_WTCON);
> +	writel(wtdat_save, wdt->reg_base + S3C2410_WTDAT);
> +	writel(wtdat_save, wdt->reg_base + S3C2410_WTCNT); /* Reset count *=
/
> +	writel(wtcon_save, wdt->reg_base + S3C2410_WTCON);

And here.

Best regards,
Tomasz
