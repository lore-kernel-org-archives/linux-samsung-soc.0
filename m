From: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH] ARM: EXYNOS4: ADD USB EHCI device to SMDKV310
Date: Wed, 07 Sep 2011 15:57:06 +0900
Message-ID: <000801cc6d2b$5b49db50$11dd91f0$%kim@samsung.com>
References: <1313564357-32331-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-reply-to: 
Content-language: ko
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: 'Kukjin Kim' <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Sachin Kamat' <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: 'Jingoo Han' <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Kukjin Kim wrote:
> 
> Sachin Kamat wrote:
> >
> > Signed-off-by: Bhuvana Kakunoori <bhuvana.kakunoori-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Signed-off-by: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > Signed-off-by: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  arch/arm/mach-exynos4/Kconfig         |    2 ++
> >  arch/arm/mach-exynos4/mach-smdkv310.c |   16 ++++++++++++++++
> >  2 files changed, 18 insertions(+), 0 deletions(-)
> >
> > diff --git a/arch/arm/mach-exynos4/Kconfig
b/arch/arm/mach-exynos4/Kconfig
> > index bb29d51..cc97d23 100644
> > --- a/arch/arm/mach-exynos4/Kconfig
> > +++ b/arch/arm/mach-exynos4/Kconfig
> > @@ -136,6 +136,7 @@ config MACH_SMDKV310
> >  	bool "SMDKV310"
> >  	select CPU_EXYNOS4210
> >  	select S5P_DEV_FIMD0
> > +	select S5P_DEV_USB_EHCI
> >  	select S3C_DEV_RTC
> >  	select S3C_DEV_WDT
> >  	select S3C_DEV_I2C1
> > @@ -151,6 +152,7 @@ config MACH_SMDKV310
> >  	select SAMSUNG_DEV_PWM
> >  	select EXYNOS4_DEV_SYSMMU
> >  	select EXYNOS4_SETUP_FIMD0
> > +	select EXYNOS4_SETUP_USB_PHY
> >  	select EXYNOS4_SETUP_I2C1
> >  	select EXYNOS4_SETUP_KEYPAD
> >  	select EXYNOS4_SETUP_SDHCI
> > diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-
> > exynos4/mach-smdkv310.c
> > index 5f62b2b..b6c28ea 100644
> > --- a/arch/arm/mach-exynos4/mach-smdkv310.c
> > +++ b/arch/arm/mach-exynos4/mach-smdkv310.c
> > @@ -33,6 +33,8 @@
> >  #include <plat/gpio-cfg.h>
> >  #include <plat/backlight.h>
> >  #include <plat/mfc.h>
> > +#include <plat/ehci.h>
> > +#include <plat/clock.h>
> >
> >  #include <mach/map.h>
> >
> > @@ -167,6 +169,16 @@ static struct i2c_board_info i2c_devs1[] __initdata
= {
> >  	{I2C_BOARD_INFO("wm8994", 0x1a),},
> >  };
> >
> > +/* USB EHCI */
> > +static struct s5p_ehci_platdata smdkv310_ehci_pdata;
> > +
> > +static void __init smdkv310_ehci_init(void)
> > +{
> > +	struct s5p_ehci_platdata *pdata = &smdkv310_ehci_pdata;
> > +
> > +	s5p_ehci_set_platdata(pdata);
> > +}
> > +
> >  static struct platform_device *smdkv310_devices[] __initdata = {
> >  	&s3c_device_hsmmc0,
> >  	&s3c_device_hsmmc1,
> > @@ -175,6 +187,7 @@ static struct platform_device *smdkv310_devices[]
> > __initdata = {
> >  	&s3c_device_i2c1,
> >  	&s3c_device_rtc,
> >  	&s3c_device_wdt,
> > +	&s5p_device_ehci,
> >  	&exynos4_device_ac97,
> >  	&exynos4_device_i2s0,
> >  	&samsung_device_keypad,
> > @@ -258,6 +271,9 @@ static void __init smdkv310_machine_init(void)
> >
> >  	samsung_bl_set(&smdkv310_bl_gpio_info, &smdkv310_bl_data);
> >
> > +	smdkv310_ehci_init();
> > +	clk_xusbxti.rate = 24000000;
> > +
> >  	platform_add_devices(smdkv310_devices,
> > ARRAY_SIZE(smdkv310_devices));
> >  	s5p_device_mfc.dev.parent = &exynos4_device_pd[PD_MFC].dev;
> >  }
> > --
> > 1.7.4.1
> 
> (Cc'ed Jingoo Han)
> 
> Well, this is same with Jingoo's patch on smdkc210 which has been
submitted at
> 12th Aug.
> 
> I requested to him to re-work this on smdkv310 on his patch just now...
> Hmm...I don't know :(
> 
> Let me think again...
> 
As I've heard, Jingoo talked you about this patch and you agreed to use
Jingoo's patch on SMDKV310. So I dropped this and will pick up his patch.

If any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
