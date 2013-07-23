From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: Re: [PATCH V2] watchdog: s3c2410_wdt: remove the global variables
Date: Tue, 23 Jul 2013 14:10:56 +0530
Message-ID: <CAL1wa8e_zzxfx0T5OTuVqrCD2+WwHtvUfkf_U64RvqL0kQPr_Q@mail.gmail.com>
References: <1374473649-20050-1-git-send-email-l.krishna@samsung.com> <1531670.9zTKCdO4Nx@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f44.google.com ([209.85.212.44]:46659 "EHLO
	mail-vb0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754236Ab3GWIlT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Jul 2013 04:41:19 -0400
Received: by mail-vb0-f44.google.com with SMTP id e15so5377798vbg.17
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jul 2013 01:41:18 -0700 (PDT)
In-Reply-To: <1531670.9zTKCdO4Nx@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Leela Krishna Amudala <l.krishna@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Jingoo Han <jg1.han@samsung.com>

Hello Tomas Figa,

Thanks for reviewing the patch.

On Mon, Jul 22, 2013 at 11:08 PM, Tomasz Figa <t.figa@samsung.com> wrot=
e:
> Hi Leela Krishna,
>
> Looks mostly good, but see some comments inline.
>
> On Monday 22 of July 2013 11:44:09 Leela Krishna Amudala wrote:
>> This patch removes the global variables in the driver file and
>> group them into a structure.
>>
>> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
>> ---
>>  Note: This patch is rebased on kgene's for-next branch and tested o=
n
>> SMDK5420.
>>
>>  Changes since V1:
>>       - changed the patch subject.
>>       - indentation correction in s3c2410_watchdog structure.
>>
>>  drivers/watchdog/s3c2410_wdt.c |  204
>> +++++++++++++++++++++++----------------- 1 file changed, 119
>> insertions(+), 85 deletions(-)
>>
>> diff --git a/drivers/watchdog/s3c2410_wdt.c
>> b/drivers/watchdog/s3c2410_wdt.c index 6a22cf5..de679d0 100644
>> --- a/drivers/watchdog/s3c2410_wdt.c
>> +++ b/drivers/watchdog/s3c2410_wdt.c
>> @@ -84,13 +84,20 @@ MODULE_PARM_DESC(soft_noboot, "Watchdog action, =
set
>> to 1 to ignore reboots, " "0 to reboot (default 0)");
>>  MODULE_PARM_DESC(debug, "Watchdog debug, set to >1 for debug (defau=
lt
>> 0)");
>>
>> -static struct device    *wdt_dev;    /* platform device attached to=
 */
>> -static struct resource       *wdt_mem;
>> -static struct resource       *wdt_irq;
>> -static struct clk    *wdt_clock;
>> -static void __iomem  *wdt_base;
>> -static unsigned int   wdt_count;
>> -static DEFINE_SPINLOCK(wdt_lock);
>> +struct s3c2410_watchdog {
>> +     struct device           *dev;   /* platform device attached to=
 */
>> +     struct clk              *clock;
>> +     void __iomem            *reg_base;
>> +     unsigned int            count;
>> +     spinlock_t              lock;
>> +     struct watchdog_device  wdt_device;
>> +     struct notifier_block   freq_transition;
>> +};
>> +
>> +#define to_s3c2410_watchdog(wdd)     \
>> +             container_of(wdd, struct s3c2410_watchdog, wdt_device)
>> +#define freq_to_wdt(_n)                      \
>> +             container_of(_n, struct s3c2410_watchdog, freq_transit=
ion)
>
> Please use static inlines here.
>

Done

>>  /* watchdog control routines */
>>
>> @@ -104,27 +111,31 @@ do {                                          =
          \
>>
>>  static int s3c2410wdt_keepalive(struct watchdog_device *wdd)
>>  {
>> -     spin_lock(&wdt_lock);
>> -     writel(wdt_count, wdt_base + S3C2410_WTCNT);
>> -     spin_unlock(&wdt_lock);
>> +     struct s3c2410_watchdog *wdt =3D to_s3c2410_watchdog(wdd);
>> +
>> +     spin_lock(&wdt->lock);
>> +     writel(wdt->count, wdt->reg_base + S3C2410_WTCNT);
>> +     spin_unlock(&wdt->lock);
>>
>>       return 0;
>>  }
>>
>> -static void __s3c2410wdt_stop(void)
>> +static void __s3c2410wdt_stop(struct s3c2410_watchdog *wdt)
>>  {
>>       unsigned long wtcon;
>>
>> -     wtcon =3D readl(wdt_base + S3C2410_WTCON);
>> +     wtcon =3D readl(wdt->reg_base + S3C2410_WTCON);
>>       wtcon &=3D ~(S3C2410_WTCON_ENABLE | S3C2410_WTCON_RSTEN);
>> -     writel(wtcon, wdt_base + S3C2410_WTCON);
>> +     writel(wtcon, wdt->reg_base + S3C2410_WTCON);
>>  }
>>
>>  static int s3c2410wdt_stop(struct watchdog_device *wdd)
>>  {
>> -     spin_lock(&wdt_lock);
>> -     __s3c2410wdt_stop();
>> -     spin_unlock(&wdt_lock);
>> +     struct s3c2410_watchdog *wdt =3D to_s3c2410_watchdog(wdd);
>> +
>> +     spin_lock(&wdt->lock);
>> +     __s3c2410wdt_stop(wdt);
>> +     spin_unlock(&wdt->lock);
>>
>>       return 0;
>>  }
>> @@ -133,11 +144,13 @@ static int s3c2410wdt_start(struct watchdog_de=
vice
>> *wdd) {
>>       unsigned long wtcon;
>>
>
> Stray blank line.
>

Done

>> -     spin_lock(&wdt_lock);
>> +     struct s3c2410_watchdog *wdt =3D to_s3c2410_watchdog(wdd);
>> +
>> +     spin_lock(&wdt->lock);
>>
>> -     __s3c2410wdt_stop();
>> +     __s3c2410wdt_stop(wdt);
>>
>> -     wtcon =3D readl(wdt_base + S3C2410_WTCON);
>> +     wtcon =3D readl(wdt->reg_base + S3C2410_WTCON);
>>       wtcon |=3D S3C2410_WTCON_ENABLE | S3C2410_WTCON_DIV128;
>>
>>       if (soft_noboot) {
>> @@ -148,25 +161,26 @@ static int s3c2410wdt_start(struct watchdog_de=
vice
>> *wdd) wtcon |=3D S3C2410_WTCON_RSTEN;
>>       }
>>
>> -     DBG("%s: wdt_count=3D0x%08x, wtcon=3D%08lx\n",
>> -         __func__, wdt_count, wtcon);
>> +     DBG("%s: count=3D0x%08x, wtcon=3D%08lx\n",
>> +         __func__, wdt->count, wtcon);
>>
>> -     writel(wdt_count, wdt_base + S3C2410_WTDAT);
>> -     writel(wdt_count, wdt_base + S3C2410_WTCNT);
>> -     writel(wtcon, wdt_base + S3C2410_WTCON);
>> -     spin_unlock(&wdt_lock);
>> +     writel(wdt->count, wdt->reg_base + S3C2410_WTDAT);
>> +     writel(wdt->count, wdt->reg_base + S3C2410_WTCNT);
>> +     writel(wtcon, wdt->reg_base + S3C2410_WTCON);
>> +     spin_unlock(&wdt->lock);
>>
>>       return 0;
>>  }
>>
>> -static inline int s3c2410wdt_is_running(void)
>> +static inline int s3c2410wdt_is_running(struct s3c2410_watchdog *wd=
t)
>>  {
>> -     return readl(wdt_base + S3C2410_WTCON) & S3C2410_WTCON_ENABLE;
>> +     return readl(wdt->reg_base + S3C2410_WTCON) & S3C2410_WTCON_EN=
ABLE;
>>  }
>>
>>  static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
>> unsigned timeout) {
>> -     unsigned long freq =3D clk_get_rate(wdt_clock);
>> +     struct s3c2410_watchdog *wdt =3D to_s3c2410_watchdog(wdd);
>> +     unsigned long freq =3D clk_get_rate(wdt->clock);
>>       unsigned int count;
>>       unsigned int divisor =3D 1;
>>       unsigned long wtcon;
>> @@ -192,7 +206,7 @@ static int s3c2410wdt_set_heartbeat(struct
>> watchdog_device *wdd, unsigned timeou }
>>
>>               if ((count / divisor) >=3D 0x10000) {
>> -                     dev_err(wdt_dev, "timeout %d too big\n", timeo=
ut);
>> +                     dev_err(wdt->dev, "timeout %d too big\n", time=
out);
>>                       return -EINVAL;
>>               }
>>       }
>> @@ -201,15 +215,15 @@ static int s3c2410wdt_set_heartbeat(struct
>> watchdog_device *wdd, unsigned timeou __func__, timeout, divisor, co=
unt,
>> count/divisor);
>>
>>       count /=3D divisor;
>> -     wdt_count =3D count;
>> +     wdt->count =3D count;
>>
>>       /* update the pre-scaler */
>> -     wtcon =3D readl(wdt_base + S3C2410_WTCON);
>> +     wtcon =3D readl(wdt->reg_base + S3C2410_WTCON);
>>       wtcon &=3D ~S3C2410_WTCON_PRESCALE_MASK;
>>       wtcon |=3D S3C2410_WTCON_PRESCALE(divisor-1);
>>
>> -     writel(count, wdt_base + S3C2410_WTDAT);
>> -     writel(wtcon, wdt_base + S3C2410_WTCON);
>> +     writel(count, wdt->reg_base + S3C2410_WTDAT);
>> +     writel(wtcon, wdt->reg_base + S3C2410_WTCON);
>>
>>       wdd->timeout =3D (count * divisor) / freq;
>>
>> @@ -242,21 +256,22 @@ static struct watchdog_device s3c2410_wdd =3D =
{
>>
>>  static irqreturn_t s3c2410wdt_irq(int irqno, void *param)
>>  {
>> -     dev_info(wdt_dev, "watchdog timer expired (irq)\n");
>> +     struct s3c2410_watchdog *wdt =3D platform_get_drvdata(param);
>
> Please separate variables from code with a blank line.
>

Done

>> +     dev_info(wdt->dev, "watchdog timer expired (irq)\n");
>>
>> -     s3c2410wdt_keepalive(&s3c2410_wdd);
>> +     s3c2410wdt_keepalive(&wdt->wdt_device);
>>       return IRQ_HANDLED;
>>  }
>>
>> -
>>  #ifdef CONFIG_CPU_FREQ
>>
>>  static int s3c2410wdt_cpufreq_transition(struct notifier_block *nb,
>>                                         unsigned long val, void *dat=
a)
>>  {
>>       int ret;
>> +     struct s3c2410_watchdog *wdt =3D freq_to_wdt(nb);
>>
>> -     if (!s3c2410wdt_is_running())
>> +     if (!s3c2410wdt_is_running(wdt))
>>               goto done;
>>
>>       if (val =3D=3D CPUFREQ_PRECHANGE) {
>> @@ -265,14 +280,15 @@ static int s3c2410wdt_cpufreq_transition(struc=
t
>> notifier_block *nb, * the watchdog is running.
>>                */
>>
>> -             s3c2410wdt_keepalive(&s3c2410_wdd);
>> +             s3c2410wdt_keepalive(&wdt->wdt_device);
>>       } else if (val =3D=3D CPUFREQ_POSTCHANGE) {
>> -             s3c2410wdt_stop(&s3c2410_wdd);
>> +             s3c2410wdt_stop(&wdt->wdt_device);
>>
>> -             ret =3D s3c2410wdt_set_heartbeat(&s3c2410_wdd, s3c2410=
_wdd.timeout);
>> +             ret =3D s3c2410wdt_set_heartbeat(&wdt->wdt_device,
>> +                                             wdt->wdt_device.timeou=
t);
>>
>>               if (ret >=3D 0)
>> -                     s3c2410wdt_start(&s3c2410_wdd);
>> +                     s3c2410wdt_start(&wdt->wdt_device);
>>               else
>>                       goto err;
>>       }
>> @@ -281,8 +297,8 @@ done:
>>       return 0;
>>
>>   err:
>> -     dev_err(wdt_dev, "cannot set new value for timeout %d\n",
>> -                             s3c2410_wdd.timeout);
>> +     dev_err(wdt->dev, "cannot set new value for timeout %d\n",
>> +                             wdt->wdt_device.timeout);
>>       return ret;
>>  }
>>
>> @@ -290,25 +306,30 @@ static struct notifier_block
>> s3c2410wdt_cpufreq_transition_nb =3D { .notifier_call   =3D
>> s3c2410wdt_cpufreq_transition,
>>  };
>
> I think the above notifier_block is no longer used after your changes=
, as
> the compiler complains:
>
> drivers/watchdog/s3c2410_wdt.c:305:30: warning:
> =91s3c2410wdt_cpufreq_transition_nb=92 defined but not used
>

Yes, removed

>>
>> -static inline int s3c2410wdt_cpufreq_register(void)
>> +static inline int s3c2410wdt_cpufreq_register(struct s3c2410_watchd=
og
>> *wdt) {
>> -     return cpufreq_register_notifier(&s3c2410wdt_cpufreq_transitio=
n_nb,
>> +     wdt->freq_transition.notifier_call =3D s3c2410wdt_cpufreq_tran=
sition;
>> +
>> +     return cpufreq_register_notifier(&wdt->freq_transition,
>>                                        CPUFREQ_TRANSITION_NOTIFIER);
>>  }
>>
>> -static inline void s3c2410wdt_cpufreq_deregister(void)
>> +static inline void s3c2410wdt_cpufreq_deregister(struct s3c2410_wat=
chdog
>> *wdt) {
>> -     cpufreq_unregister_notifier(&s3c2410wdt_cpufreq_transition_nb,
>> +     wdt->freq_transition.notifier_call =3D s3c2410wdt_cpufreq_tran=
sition;
>> +
>> +     cpufreq_unregister_notifier(&wdt->freq_transition,
>>                                   CPUFREQ_TRANSITION_NOTIFIER);
>>  }
>>
>>  #else
>> -static inline int s3c2410wdt_cpufreq_register(void)
>> +
>> +static inline int s3c2410wdt_cpufreq_register(struct s3c2410_watchd=
og
>> *wdt) {
>>       return 0;
>>  }
>>
>> -static inline void s3c2410wdt_cpufreq_deregister(void)
>> +static inline void s3c2410wdt_cpufreq_deregister(struct s3c2410_wat=
chdog
>> *wdt) {
>>  }
>>  #endif
>> @@ -316,6 +337,9 @@ static inline void
>> s3c2410wdt_cpufreq_deregister(void) static int s3c2410wdt_probe(stru=
ct
>> platform_device *pdev)
>>  {
>>       struct device *dev;
>> +     struct s3c2410_watchdog *wdt;
>> +     struct resource *wdt_mem;
>> +     struct resource *wdt_irq;
>>       unsigned int wtcon;
>>       int started =3D 0;
>>       int ret;
>> @@ -323,8 +347,14 @@ static int s3c2410wdt_probe(struct platform_dev=
ice
>> *pdev) DBG("%s: probe=3D%p\n", __func__, pdev);
>>
>>       dev =3D &pdev->dev;
>> -     wdt_dev =3D &pdev->dev;
>>
>> +     wdt =3D devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
>> +     if (!wdt)
>> +             return -ENOMEM;
>> +
>> +     wdt->dev =3D &pdev->dev;
>> +     spin_lock_init(&wdt->lock);
>> +     wdt->wdt_device =3D s3c2410_wdd;
>>       wdt_mem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>       if (wdt_mem =3D=3D NULL) {
>>               dev_err(dev, "no memory resource specified\n");
>> @@ -339,24 +369,24 @@ static int s3c2410wdt_probe(struct platform_de=
vice
>> *pdev) }
>>
>>       /* get the memory region for the watchdog timer */
>> -     wdt_base =3D devm_ioremap_resource(dev, wdt_mem);
>> -     if (IS_ERR(wdt_base)) {
>> -             ret =3D PTR_ERR(wdt_base);
>> +     wdt->reg_base =3D devm_ioremap_resource(dev, wdt_mem);
>> +     if (IS_ERR(wdt->reg_base)) {
>> +             ret =3D PTR_ERR(wdt->reg_base);
>>               goto err;
>>       }
>>
>> -     DBG("probe: mapped wdt_base=3D%p\n", wdt_base);
>> +     DBG("probe: mapped reg_base=3D%p\n", wdt->reg_base);
>>
>> -     wdt_clock =3D devm_clk_get(dev, "watchdog");
>> -     if (IS_ERR(wdt_clock)) {
>> +     wdt->clock =3D devm_clk_get(dev, "watchdog");
>> +     if (IS_ERR(wdt->clock)) {
>>               dev_err(dev, "failed to find watchdog clock source\n")=
;
>> -             ret =3D PTR_ERR(wdt_clock);
>> +             ret =3D PTR_ERR(wdt->clock);
>>               goto err;
>>       }
>>
>> -     clk_prepare_enable(wdt_clock);
>> +     clk_prepare_enable(wdt->clock);
>>
>> -     ret =3D s3c2410wdt_cpufreq_register();
>> +     ret =3D s3c2410wdt_cpufreq_register(wdt);
>>       if (ret < 0) {
>>               dev_err(dev, "failed to register cpufreq\n");
>>               goto err_clk;
>> @@ -365,9 +395,10 @@ static int s3c2410wdt_probe(struct platform_dev=
ice
>> *pdev) /* see if we can actually set the requested timer margin, and=
 if
>> * not, try the default value */
>>
>> -     watchdog_init_timeout(&s3c2410_wdd, tmr_margin,  &pdev->dev);
>> -     if (s3c2410wdt_set_heartbeat(&s3c2410_wdd, s3c2410_wdd.timeout=
)) {
>> -             started =3D s3c2410wdt_set_heartbeat(&s3c2410_wdd,
>> +     watchdog_init_timeout(&wdt->wdt_device, tmr_margin, &pdev->dev=
);
>> +     if (s3c2410wdt_set_heartbeat(&wdt->wdt_device,
>> +                                     wdt->wdt_device.timeout)) {
>
>         ret =3D s3c2410wdt_set_heartbeat(&wdt->wdt_device,
>                                                                      =
           wdt->wdt_device.timeout);
>         if (ret) {
>

Done

>> +             started =3D s3c2410wdt_set_heartbeat(&wdt->wdt_device,
>>                                       CONFIG_S3C2410_WATCHDOG_DEFAUL=
T_TIME);
>>
>>               if (started =3D=3D 0)
>> @@ -386,9 +417,9 @@ static int s3c2410wdt_probe(struct platform_devi=
ce
>> *pdev) goto err_cpufreq;
>>       }
>>
>> -     watchdog_set_nowayout(&s3c2410_wdd, nowayout);
>> +     watchdog_set_nowayout(&wdt->wdt_device, nowayout);
>>
>> -     ret =3D watchdog_register_device(&s3c2410_wdd);
>> +     ret =3D watchdog_register_device(&wdt->wdt_device);
>>       if (ret) {
>>               dev_err(dev, "cannot register watchdog (%d)\n", ret);
>>               goto err_cpufreq;
>> @@ -396,18 +427,20 @@ static int s3c2410wdt_probe(struct platform_de=
vice
>> *pdev)
>>
>>       if (tmr_atboot && started =3D=3D 0) {
>>               dev_info(dev, "starting watchdog timer\n");
>> -             s3c2410wdt_start(&s3c2410_wdd);
>> +             s3c2410wdt_start(&wdt->wdt_device);
>>       } else if (!tmr_atboot) {
>>               /* if we're not enabling the watchdog, then ensure it =
is
>>                * disabled if it has been left running from the bootl=
oader
>>                * or other source */
>>
>> -             s3c2410wdt_stop(&s3c2410_wdd);
>> +             s3c2410wdt_stop(&wdt->wdt_device);
>>       }
>>
>> +     platform_set_drvdata(pdev, wdt);
>> +
>>       /* print out a statement of readiness */
>>
>> -     wtcon =3D readl(wdt_base + S3C2410_WTCON);
>> +     wtcon =3D readl(wdt->reg_base + S3C2410_WTCON);
>>
>>       dev_info(dev, "watchdog %sactive, reset %sabled, irq %sabled\n=
",
>>                (wtcon & S3C2410_WTCON_ENABLE) ?  "" : "in",
>> @@ -417,35 +450,33 @@ static int s3c2410wdt_probe(struct platform_de=
vice
>> *pdev) return 0;
>>
>>   err_cpufreq:
>> -     s3c2410wdt_cpufreq_deregister();
>> +     s3c2410wdt_cpufreq_deregister(wdt);
>>
>>   err_clk:
>> -     clk_disable_unprepare(wdt_clock);
>> -     wdt_clock =3D NULL;
>> +     clk_disable_unprepare(wdt->clock);
>> +     wdt->clock =3D NULL;
>>
>>   err:
>> -     wdt_irq =3D NULL;
>> -     wdt_mem =3D NULL;
>>       return ret;
>>  }
>>
>>  static int s3c2410wdt_remove(struct platform_device *dev)
>>  {
>> -     watchdog_unregister_device(&s3c2410_wdd);
>> +     struct s3c2410_watchdog *wdt =3D platform_get_drvdata(dev);
>
> + Blank line.
>

Done

>> +     watchdog_unregister_device(&wdt->wdt_device);
>>
>> -     s3c2410wdt_cpufreq_deregister();
>> +     s3c2410wdt_cpufreq_deregister(wdt);
>>
>> -     clk_disable_unprepare(wdt_clock);
>> -     wdt_clock =3D NULL;
>> +     clk_disable_unprepare(wdt->clock);
>> +     wdt->clock =3D NULL;
>>
>> -     wdt_irq =3D NULL;
>> -     wdt_mem =3D NULL;
>>       return 0;
>>  }
>>
>>  static void s3c2410wdt_shutdown(struct platform_device *dev)
>>  {
>> -     s3c2410wdt_stop(&s3c2410_wdd);
>> +     struct s3c2410_watchdog *wdt =3D platform_get_drvdata(dev);
>
> + Blank line.
>

Done

>> +     s3c2410wdt_stop(&wdt->wdt_device);
>>  }
>>
>>  #ifdef CONFIG_PM_SLEEP
>
> Please also move the two save variables that are here to the structur=
e...
>

Yes, moved to structure

>> @@ -455,23 +486,26 @@ static unsigned long wtdat_save;
>>
>>  static int s3c2410wdt_suspend(struct device *dev)
>>  {
>> +     struct s3c2410_watchdog *wdt =3D dev_get_drvdata(dev);
>>       /* Save watchdog state, and turn it off. */
>> -     wtcon_save =3D readl(wdt_base + S3C2410_WTCON);
>> -     wtdat_save =3D readl(wdt_base + S3C2410_WTDAT);
>> +     wtcon_save =3D readl(wdt->reg_base + S3C2410_WTCON);
>> +     wtdat_save =3D readl(wdt->reg_base + S3C2410_WTDAT);
>
> ...and use them here instead those global ones.
>

Done

>>       /* Note that WTCNT doesn't need to be saved. */
>> -     s3c2410wdt_stop(&s3c2410_wdd);
>> +     s3c2410wdt_stop(&wdt->wdt_device);
>>
>>       return 0;
>>  }
>>
>>  static int s3c2410wdt_resume(struct device *dev)
>>  {
>> +     struct s3c2410_watchdog *wdt =3D dev_get_drvdata(dev);
>> +
>>       /* Restore watchdog state. */
>>
>> -     writel(wtdat_save, wdt_base + S3C2410_WTDAT);
>> -     writel(wtdat_save, wdt_base + S3C2410_WTCNT); /* Reset count *=
/
>> -     writel(wtcon_save, wdt_base + S3C2410_WTCON);
>> +     writel(wtdat_save, wdt->reg_base + S3C2410_WTDAT);
>> +     writel(wtdat_save, wdt->reg_base + S3C2410_WTCNT); /* Reset co=
unt */
>> +     writel(wtcon_save, wdt->reg_base + S3C2410_WTCON);
>
> And here.
>

Done

Best Wishes,
Leela Krishna Amudala

> Best regards,
> Tomasz
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
