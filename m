From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH] ARM: Samsung: change suspend/resume code to depend on CONFIG_SUSPEND
Date: Fri, 4 Mar 2011 10:59:51 +0900
Message-ID: <AANLkTikODhjPh0JRH_3KO3uETjfDZM=3RETvSx3mpzk0@mail.gmail.com>
References: <1297761309-12801-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:63693 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758917Ab1CDB7x convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Mar 2011 20:59:53 -0500
Received: by wyg36 with SMTP id 36so1690504wyg.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Mar 2011 17:59:52 -0800 (PST)
In-Reply-To: <1297761309-12801-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, ben-linux@fluff.org, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, =?UTF-8?B?7ZWo66qF7KO8?= <myungjoo.ham@samsung.com>

Marek,

Can you rebase the patch on the for-exynos4?

Or kgene fix it since it's posted before the renamefrom s5pv310 to exyn=
os4.

To Kgene,

It's required for test the runtime PM on exynos4.
Another one, when we expect the PM feature for exynos4? Please specify
the date instead of plan.

Thank you,
Kyungmin Park

On Tue, Feb 15, 2011 at 6:15 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Most suspend/resume code depends on CONFIG_PM. This causes problems
> if one wants to enable Runtime PM (to control power domains for examp=
le),
> but doesn't need system suspend/resume feature. This also enables to =
use
> Runtime PM feature on S5PV310 which doesn't implement system suspend/=
resume
> callbacks yet.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
> =A0arch/arm/mach-s3c2410/mach-bast.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A02 +-
> =A0arch/arm/mach-s3c2412/mach-jive.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A02 +-
> =A0arch/arm/mach-s3c2440/mach-osiris.c =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0=
2 +-
> =A0arch/arm/mach-s3c2440/s3c244x.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A02 +-
> =A0arch/arm/mach-s3c64xx/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A06 +++---
> =A0arch/arm/mach-s5pv210/cpufreq.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A04 ++--
> =A0arch/arm/mach-s5pv310/cpufreq.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A04 ++--
> =A0arch/arm/mach-s5pv310/irq-eint.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A02 +-
> =A0arch/arm/plat-s3c24xx/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A06 +++---
> =A0arch/arm/plat-s3c24xx/cpu-freq.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A02 +-
> =A0arch/arm/plat-s3c24xx/dma.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A02 +-
> =A0arch/arm/plat-s3c24xx/include/plat/irq.h =A0 =A0 =A0 | =A0 =A02 +-
> =A0arch/arm/plat-s5p/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A04 ++--
> =A0arch/arm/plat-s5p/irq-eint.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A04 ++--
> =A0arch/arm/plat-samsung/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A04 ++--
> =A0arch/arm/plat-samsung/adc.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A02 +-
> =A0arch/arm/plat-samsung/gpio.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A02 +-
> =A0arch/arm/plat-samsung/include/plat/gpio-core.h | =A0 =A06 +++---
> =A0arch/arm/plat-samsung/include/plat/pm.h =A0 =A0 =A0 =A0| =A0 =A04 =
++--
> =A0arch/arm/plat-samsung/pwm.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A02 +-
> =A020 files changed, 32 insertions(+), 32 deletions(-)
>
> diff --git a/arch/arm/mach-s3c2410/mach-bast.c b/arch/arm/mach-s3c241=
0/mach-bast.c
> index 2970ea9..18187a4 100644
> --- a/arch/arm/mach-s3c2410/mach-bast.c
> +++ b/arch/arm/mach-s3c2410/mach-bast.c
> @@ -213,7 +213,7 @@ static struct s3c2410_uartcfg bast_uartcfgs[] __i=
nitdata =3D {
>
> =A0/* NAND Flash on BAST board */
>
> -#ifdef CONFIG_PM
> +#ifdef CONFIG_SUSPEND
> =A0static int bast_pm_suspend(struct sys_device *sd, pm_message_t sta=
te)
> =A0{
> =A0 =A0 =A0 =A0/* ensure that an nRESET is not generated on resume. *=
/
> diff --git a/arch/arm/mach-s3c2412/mach-jive.c b/arch/arm/mach-s3c241=
2/mach-jive.c
> index 923e01b..10643ef8 100644
> --- a/arch/arm/mach-s3c2412/mach-jive.c
> +++ b/arch/arm/mach-s3c2412/mach-jive.c
> @@ -485,7 +485,7 @@ static struct s3c2410_udc_mach_info jive_udc_cfg =
__initdata =3D {
>
> =A0/* Jive power management device */
>
> -#ifdef CONFIG_PM
> +#ifdef CONFIG_SUSPEND
> =A0static int jive_pm_suspend(struct sys_device *sd, pm_message_t sta=
te)
> =A0{
> =A0 =A0 =A0 =A0/* Write the magic value u-boot uses to check for resu=
me into
> diff --git a/arch/arm/mach-s3c2440/mach-osiris.c b/arch/arm/mach-s3c2=
440/mach-osiris.c
> index 14dc678..06d115a 100644
> --- a/arch/arm/mach-s3c2440/mach-osiris.c
> +++ b/arch/arm/mach-s3c2440/mach-osiris.c
> @@ -281,7 +281,7 @@ static struct platform_device osiris_pcmcia =3D {
>
> =A0/* Osiris power management device */
>
> -#ifdef CONFIG_PM
> +#ifdef CONFIG_SUSPEND
> =A0static unsigned char pm_osiris_ctrl0;
>
> =A0static int osiris_pm_suspend(struct sys_device *sd, pm_message_t s=
tate)
> diff --git a/arch/arm/mach-s3c2440/s3c244x.c b/arch/arm/mach-s3c2440/=
s3c244x.c
> index 90c1707..7e693a0 100644
> --- a/arch/arm/mach-s3c2440/s3c244x.c
> +++ b/arch/arm/mach-s3c2440/s3c244x.c
> @@ -134,7 +134,7 @@ void __init s3c244x_init_clocks(int xtal)
> =A0 =A0 =A0 =A0s3c2410_baseclk_add();
> =A0}
>
> -#ifdef CONFIG_PM
> +#ifdef CONFIG_SUSPEND
>
> =A0static struct sleep_save s3c244x_sleep[] =3D {
> =A0 =A0 =A0 =A0SAVE_ITEM(S3C2440_DSC0),
> diff --git a/arch/arm/mach-s3c64xx/Makefile b/arch/arm/mach-s3c64xx/M=
akefile
> index 4657363..183ebb3 100644
> --- a/arch/arm/mach-s3c64xx/Makefile
> +++ b/arch/arm/mach-s3c64xx/Makefile
> @@ -43,9 +43,9 @@ obj-$(CONFIG_S3C64XX_SETUP_SDHCI_GPIO) +=3D setup-s=
dhci-gpio.o
>
> =A0# PM
>
> -obj-$(CONFIG_PM) =A0 =A0 =A0 =A0 =A0 =A0 =A0 +=3D pm.o
> -obj-$(CONFIG_PM) =A0 =A0 =A0 =A0 =A0 =A0 =A0 +=3D sleep.o
> -obj-$(CONFIG_PM) =A0 =A0 =A0 =A0 =A0 =A0 =A0 +=3D irq-pm.o
> +obj-$(CONFIG_SUSPEND) =A0 =A0 =A0 =A0 =A0+=3D pm.o
> +obj-$(CONFIG_SUSPEND) =A0 =A0 =A0 =A0 =A0+=3D sleep.o
> +obj-$(CONFIG_SUSPEND) =A0 =A0 =A0 =A0 =A0+=3D irq-pm.o
>
> =A0# Machine support
>
> diff --git a/arch/arm/mach-s5pv210/cpufreq.c b/arch/arm/mach-s5pv210/=
cpufreq.c
> index a6f2292..7e697cd 100644
> --- a/arch/arm/mach-s5pv210/cpufreq.c
> +++ b/arch/arm/mach-s5pv210/cpufreq.c
> @@ -389,7 +389,7 @@ static int s5pv210_target(struct cpufreq_policy *=
policy,
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> -#ifdef CONFIG_PM
> +#ifdef CONFIG_SUSPEND
> =A0static int s5pv210_cpufreq_suspend(struct cpufreq_policy *policy,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 p=
m_message_t pmsg)
> =A0{
> @@ -470,7 +470,7 @@ static struct cpufreq_driver s5pv210_driver =3D {
> =A0 =A0 =A0 =A0.get =A0 =A0 =A0 =A0 =A0 =A0=3D s5pv210_getspeed,
> =A0 =A0 =A0 =A0.init =A0 =A0 =A0 =A0 =A0 =3D s5pv210_cpu_init,
> =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =A0 =3D "s5pv210",
> -#ifdef CONFIG_PM
> +#ifdef CONFIG_SUSPEND
> =A0 =A0 =A0 =A0.suspend =A0 =A0 =A0 =A0=3D s5pv210_cpufreq_suspend,
> =A0 =A0 =A0 =A0.resume =A0 =A0 =A0 =A0 =3D s5pv210_cpufreq_resume,
> =A0#endif
> diff --git a/arch/arm/mach-s5pv310/cpufreq.c b/arch/arm/mach-s5pv310/=
cpufreq.c
> index b04cbc7..8493b6d 100644
> --- a/arch/arm/mach-s5pv310/cpufreq.c
> +++ b/arch/arm/mach-s5pv310/cpufreq.c
> @@ -457,7 +457,7 @@ static int s5pv310_target(struct cpufreq_policy *=
policy,
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> -#ifdef CONFIG_PM
> +#ifdef CONFIG_SUSPEND
> =A0static int s5pv310_cpufreq_suspend(struct cpufreq_policy *policy,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 p=
m_message_t pmsg)
> =A0{
> @@ -497,7 +497,7 @@ static struct cpufreq_driver s5pv310_driver =3D {
> =A0 =A0 =A0 =A0.get =A0 =A0 =A0 =A0 =A0 =A0=3D s5pv310_getspeed,
> =A0 =A0 =A0 =A0.init =A0 =A0 =A0 =A0 =A0 =3D s5pv310_cpufreq_cpu_init=
,
> =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =A0 =3D "s5pv310_cpufreq",
> -#ifdef CONFIG_PM
> +#ifdef CONFIG_SUSPEND
> =A0 =A0 =A0 =A0.suspend =A0 =A0 =A0 =A0=3D s5pv310_cpufreq_suspend,
> =A0 =A0 =A0 =A0.resume =A0 =A0 =A0 =A0 =3D s5pv310_cpufreq_resume,
> =A0#endif
> diff --git a/arch/arm/mach-s5pv310/irq-eint.c b/arch/arm/mach-s5pv310=
/irq-eint.c
> index 477bd9e..39c7f7b 100644
> --- a/arch/arm/mach-s5pv310/irq-eint.c
> +++ b/arch/arm/mach-s5pv310/irq-eint.c
> @@ -152,7 +152,7 @@ static struct irq_chip s5pv310_irq_eint =3D {
> =A0 =A0 =A0 =A0.irq_mask_ack =A0 =3D s5pv310_irq_eint_maskack,
> =A0 =A0 =A0 =A0.irq_ack =A0 =A0 =A0 =A0=3D s5pv310_irq_eint_ack,
> =A0 =A0 =A0 =A0.irq_set_type =A0 =3D s5pv310_irq_eint_set_type,
> -#ifdef CONFIG_PM
> +#ifdef CONFIG_SUSPEND
> =A0 =A0 =A0 =A0.irq_set_wake =A0 =3D s3c_irqext_wake,
> =A0#endif
> =A0};
> diff --git a/arch/arm/plat-s3c24xx/Makefile b/arch/arm/plat-s3c24xx/M=
akefile
> index c2064c3..763b7bb 100644
> --- a/arch/arm/plat-s3c24xx/Makefile
> +++ b/arch/arm/plat-s3c24xx/Makefile
> @@ -26,9 +26,9 @@ obj-$(CONFIG_CPU_FREQ_S3C24XX_DEBUGFS) +=3D cpu-fre=
q-debugfs.o
> =A0# Architecture dependant builds
>
> =A0obj-$(CONFIG_PM_SIMTEC) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D pm-sim=
tec.o
> -obj-$(CONFIG_PM) =A0 =A0 =A0 =A0 =A0 =A0 =A0 +=3D pm.o
> -obj-$(CONFIG_PM) =A0 =A0 =A0 =A0 =A0 =A0 =A0 +=3D irq-pm.o
> -obj-$(CONFIG_PM) =A0 =A0 =A0 =A0 =A0 =A0 =A0 +=3D sleep.o
> +obj-$(CONFIG_SUSPEND) =A0 =A0 =A0 =A0 =A0+=3D pm.o
> +obj-$(CONFIG_SUSPEND) =A0 =A0 =A0 =A0 =A0+=3D irq-pm.o
> +obj-$(CONFIG_SUSPEND) =A0 =A0 =A0 =A0 =A0+=3D sleep.o
> =A0obj-$(CONFIG_S3C2410_CLOCK) =A0 =A0+=3D s3c2410-clock.o
> =A0obj-$(CONFIG_S3C2443_CLOCK) =A0 =A0+=3D s3c2443-clock.o
> =A0obj-$(CONFIG_S3C2410_DMA) =A0 =A0 =A0+=3D dma.o
> diff --git a/arch/arm/plat-s3c24xx/cpu-freq.c b/arch/arm/plat-s3c24xx=
/cpu-freq.c
> index 25a8fc7..1d38db5 100644
> --- a/arch/arm/plat-s3c24xx/cpu-freq.c
> +++ b/arch/arm/plat-s3c24xx/cpu-freq.c
> @@ -429,7 +429,7 @@ static int s3c_cpufreq_verify(struct cpufreq_poli=
cy *policy)
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> -#ifdef CONFIG_PM
> +#ifdef CONFIG_SUSPEND
> =A0static struct cpufreq_frequency_table suspend_pll;
> =A0static unsigned int suspend_freq;
>
> diff --git a/arch/arm/plat-s3c24xx/dma.c b/arch/arm/plat-s3c24xx/dma.=
c
> index 6ad274e..6199b6e 100644
> --- a/arch/arm/plat-s3c24xx/dma.c
> +++ b/arch/arm/plat-s3c24xx/dma.c
> @@ -1202,7 +1202,7 @@ static inline struct s3c2410_dma_chan *to_dma_c=
han(struct sys_device *dev)
>
> =A0/* system device class */
>
> -#ifdef CONFIG_PM
> +#ifdef CONFIG_SUSPEND
>
> =A0static int s3c2410_dma_suspend(struct sys_device *dev, pm_message_=
t state)
> =A0{
> diff --git a/arch/arm/plat-s3c24xx/include/plat/irq.h b/arch/arm/plat=
-s3c24xx/include/plat/irq.h
> index ec087d6..ca6354f 100644
> --- a/arch/arm/plat-s3c24xx/include/plat/irq.h
> +++ b/arch/arm/plat-s3c24xx/include/plat/irq.h
> @@ -106,7 +106,7 @@ s3c_irqsub_ack(unsigned int irqno, unsigned int p=
arentmask, unsigned int group)
>
> =A0/* exported for use in arch/arm/mach-s3c2410 */
>
> -#ifdef CONFIG_PM
> +#ifdef CONFIG_SUSPEND
> =A0extern int s3c_irq_wake(struct irq_data *data, unsigned int state)=
;
> =A0#else
> =A0#define s3c_irq_wake NULL
> diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
> index 4bd5cf9..ce5a0a7 100644
> --- a/arch/arm/plat-s5p/Makefile
> +++ b/arch/arm/plat-s5p/Makefile
> @@ -20,8 +20,8 @@ obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 +=3D irq.o
> =A0obj-$(CONFIG_S5P_EXT_INT) =A0 =A0 =A0+=3D irq-eint.o
> =A0obj-$(CONFIG_S5P_GPIO_INT) =A0 =A0 +=3D irq-gpioint.o
> =A0obj-$(CONFIG_S5P_SYSTEM_MMU) =A0 +=3D sysmmu.o
> -obj-$(CONFIG_PM) =A0 =A0 =A0 =A0 =A0 =A0 =A0 +=3D pm.o
> -obj-$(CONFIG_PM) =A0 =A0 =A0 =A0 =A0 =A0 =A0 +=3D irq-pm.o
> +obj-$(CONFIG_SUSPEND) =A0 =A0 =A0 =A0 =A0+=3D pm.o
> +obj-$(CONFIG_SUSPEND) =A0 =A0 =A0 =A0 =A0+=3D irq-pm.o
>
> =A0# devices
>
> diff --git a/arch/arm/plat-s5p/irq-eint.c b/arch/arm/plat-s5p/irq-ein=
t.c
> index 225aa25..e203a65 100644
> --- a/arch/arm/plat-s5p/irq-eint.c
> +++ b/arch/arm/plat-s5p/irq-eint.c
> @@ -125,7 +125,7 @@ static struct irq_chip s5p_irq_eint =3D {
> =A0 =A0 =A0 =A0.irq_mask_ack =A0 =3D s5p_irq_eint_maskack,
> =A0 =A0 =A0 =A0.irq_ack =A0 =A0 =A0 =A0=3D s5p_irq_eint_ack,
> =A0 =A0 =A0 =A0.irq_set_type =A0 =3D s5p_irq_eint_set_type,
> -#ifdef CONFIG_PM
> +#ifdef CONFIG_SUSPEND
> =A0 =A0 =A0 =A0.irq_set_wake =A0 =3D s3c_irqext_wake,
> =A0#endif
> =A0};
> @@ -195,7 +195,7 @@ static struct irq_chip s5p_irq_vic_eint =3D {
> =A0 =A0 =A0 =A0.irq_mask_ack =A0 =3D s5p_irq_vic_eint_maskack,
> =A0 =A0 =A0 =A0.irq_ack =A0 =A0 =A0 =A0=3D s5p_irq_vic_eint_ack,
> =A0 =A0 =A0 =A0.irq_set_type =A0 =3D s5p_irq_eint_set_type,
> -#ifdef CONFIG_PM
> +#ifdef CONFIG_SUSPEND
> =A0 =A0 =A0 =A0.irq_set_wake =A0 =3D s3c_irqext_wake,
> =A0#endif
> =A0};
> diff --git a/arch/arm/plat-samsung/Makefile b/arch/arm/plat-samsung/M=
akefile
> index 29932f8..7e92457 100644
> --- a/arch/arm/plat-samsung/Makefile
> +++ b/arch/arm/plat-samsung/Makefile
> @@ -68,8 +68,8 @@ obj-$(CONFIG_S3C_PL330_DMA) =A0 +=3D s3c-pl330.o
>
> =A0# PM support
>
> -obj-$(CONFIG_PM) =A0 =A0 =A0 =A0 =A0 =A0 =A0 +=3D pm.o
> -obj-$(CONFIG_PM) =A0 =A0 =A0 =A0 =A0 =A0 =A0 +=3D pm-gpio.o
> +obj-$(CONFIG_SUSPEND) =A0 =A0 =A0 =A0 =A0+=3D pm.o
> +obj-$(CONFIG_SUSPEND) =A0 =A0 =A0 =A0 =A0+=3D pm-gpio.o
> =A0obj-$(CONFIG_SAMSUNG_PM_CHECK) +=3D pm-check.o
>
> =A0obj-$(CONFIG_SAMSUNG_WAKEMASK) +=3D wakeup-mask.o
> diff --git a/arch/arm/plat-samsung/adc.c b/arch/arm/plat-samsung/adc.=
c
> index e8f2be2..d818405 100644
> --- a/arch/arm/plat-samsung/adc.c
> +++ b/arch/arm/plat-samsung/adc.c
> @@ -412,7 +412,7 @@ static int __devexit s3c_adc_remove(struct platfo=
rm_device *pdev)
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> -#ifdef CONFIG_PM
> +#ifdef CONFIG_SUSPEND
> =A0static int s3c_adc_suspend(struct platform_device *pdev, pm_messag=
e_t state)
> =A0{
> =A0 =A0 =A0 =A0struct adc_device *adc =3D platform_get_drvdata(pdev);
> diff --git a/arch/arm/plat-samsung/gpio.c b/arch/arm/plat-samsung/gpi=
o.c
> index 7743c4b..4f3700f 100644
> --- a/arch/arm/plat-samsung/gpio.c
> +++ b/arch/arm/plat-samsung/gpio.c
> @@ -143,7 +143,7 @@ __init void s3c_gpiolib_add(struct s3c_gpio_chip =
*chip)
> =A0 =A0 =A0 =A0if (!gc->get)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gc->get =3D s3c_gpiolib_get;
>
> -#ifdef CONFIG_PM
> +#ifdef CONFIG_SUSPEND
> =A0 =A0 =A0 =A0if (chip->pm !=3D NULL) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!chip->pm->save || !chip->pm->resu=
me)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_ERR "gpio:=
 %s has missing PM functions\n",
> diff --git a/arch/arm/plat-samsung/include/plat/gpio-core.h b/arch/ar=
m/plat-samsung/include/plat/gpio-core.h
> index dac35d0..8b5209b 100644
> --- a/arch/arm/plat-samsung/include/plat/gpio-core.h
> +++ b/arch/arm/plat-samsung/include/plat/gpio-core.h
> @@ -68,7 +68,7 @@ struct s3c_gpio_chip {
> =A0 =A0 =A0 =A0int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 irq_base;
> =A0 =A0 =A0 =A0int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 group;
> =A0 =A0 =A0 =A0spinlock_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 lock;
> -#ifdef CONFIG_PM
> +#ifdef CONFIG_SUSPEND
> =A0 =A0 =A0 =A0u32 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pm_save[4]=
;
> =A0#endif
> =A0};
> @@ -153,7 +153,7 @@ static inline struct s3c_gpio_chip *s3c_gpiolib_g=
etchip(unsigned int chip)
> =A0static inline void s3c_gpiolib_track(struct s3c_gpio_chip *chip) {=
 }
> =A0#endif
>
> -#ifdef CONFIG_PM
> +#ifdef CONFIG_SUSPEND
> =A0extern struct s3c_gpio_pm s3c_gpio_pm_1bit;
> =A0extern struct s3c_gpio_pm s3c_gpio_pm_2bit;
> =A0extern struct s3c_gpio_pm s3c_gpio_pm_4bit;
> @@ -164,7 +164,7 @@ extern struct s3c_gpio_pm s3c_gpio_pm_4bit;
> =A0#define s3c_gpio_pm_4bit NULL
> =A0#define __gpio_pm(x) NULL
>
> -#endif /* CONFIG_PM */
> +#endif /* CONFIG_SUSPEND */
>
> =A0/* locking wrappers to deal with multiple access to the same gpio =
bank */
> =A0#define s3c_gpio_lock(_oc, _fl) spin_lock_irqsave(&(_oc)->lock, _f=
l)
> diff --git a/arch/arm/plat-samsung/include/plat/pm.h b/arch/arm/plat-=
samsung/include/plat/pm.h
> index 30518cc..69f4cc8 100644
> --- a/arch/arm/plat-samsung/include/plat/pm.h
> +++ b/arch/arm/plat-samsung/include/plat/pm.h
> @@ -19,7 +19,7 @@
>
> =A0struct sys_device;
>
> -#ifdef CONFIG_PM
> +#ifdef CONFIG_SUSPEND
>
> =A0extern __init int s3c_pm_init(void);
>
> @@ -103,7 +103,7 @@ extern void s3c_pm_do_save(struct sleep_save *ptr=
, int count);
> =A0extern void s3c_pm_do_restore(struct sleep_save *ptr, int count);
> =A0extern void s3c_pm_do_restore_core(struct sleep_save *ptr, int cou=
nt);
>
> -#ifdef CONFIG_PM
> +#ifdef CONFIG_SUSPEND
> =A0extern int s3c_irqext_wake(struct irq_data *data, unsigned int sta=
te);
> =A0extern int s3c24xx_irq_suspend(struct sys_device *dev, pm_message_=
t state);
> =A0extern int s3c24xx_irq_resume(struct sys_device *dev);
> diff --git a/arch/arm/plat-samsung/pwm.c b/arch/arm/plat-samsung/pwm.=
c
> index 2eeb49f..926f08d 100644
> --- a/arch/arm/plat-samsung/pwm.c
> +++ b/arch/arm/plat-samsung/pwm.c
> @@ -380,7 +380,7 @@ static int __devexit s3c_pwm_remove(struct platfo=
rm_device *pdev)
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> -#ifdef CONFIG_PM
> +#ifdef CONFIG_SUSPEND
> =A0static int s3c_pwm_suspend(struct platform_device *pdev, pm_messag=
e_t state)
> =A0{
> =A0 =A0 =A0 =A0struct pwm_device *pwm =3D platform_get_drvdata(pdev);
> --
> 1.7.1.569.g6f426
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
