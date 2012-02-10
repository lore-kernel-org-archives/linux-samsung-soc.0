From: Jingoo Han <jg1.han@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: Add alias name of 'fimd' clock for 'lcd' clock
Date: Fri, 10 Feb 2012 19:34:45 +0900
Message-ID: <001801cce7df$9b1d8c70$d158a550$%han@samsung.com>
References: <000101ccd693$71185b60$53491220$%han@samsung.com>
 <CAH9JG2UGvc42AzCSPSKwNT1UrnPy8RG7Snoe+vULoAMW1GQckA@mail.gmail.com>
 <4F34BA65.7030108@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:59155 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758839Ab2BJKeq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Feb 2012 05:34:46 -0500
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZ6009T7APF5ZT0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Feb 2012 19:34:44 +0900 (KST)
Received: from DOJG1HAN02 ([12.23.119.56])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZ6007R6APWY460@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 10 Feb 2012 19:34:44 +0900 (KST)
In-reply-to: 
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Evgeny Voevodin' <e.voevodin@samsung.com>, 'Kyungmin Park' <kmpark@infradead.org>
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, 'Jonghwan Choi' <jhbird.choi@samsung.com>, 'Tushar Behera' <tushar.behera@linaro.org>, 'Dmitry Solodkiy' <d.solodkiy@samsung.com>, 'Jingoo Han' <jg1.han@samsung.com>


> -----Original Message-----
> From: Jingoo Han [mailto:jg1.han@samsung.com]
> Sent: Friday, February 10, 2012 4:17 PM
> To: 'Evgeny Voevodin'; 'Kyungmin Park'
> Cc: 'Kukjin Kim'; 'linux-samsung-soc@vger.kernel.org'; 'Jonghwan Choi'; 'Tushar Behera'; 'Dmitry
> Solodkiy'
> Subject: RE: [PATCH] ARM: EXYNOS: Add alias name of 'fimd' clock for 'lcd' clock
> 
> 
> Hi, Evgeny Voevodin.
> > -----Original Message-----
> > From: linux-samsung-soc-owner@vger.kernel.org [mailto:linux-samsung-soc-owner@vger.kernel.org] On
> Behalf
> > Of Evgeny Voevodin
> > Sent: Friday, February 10, 2012 3:34 PM
> > To: Kyungmin Park
> > Cc: Jingoo Han; Kukjin Kim; linux-samsung-soc@vger.kernel.org; Jonghwan Choi; Tushar Behera; Dmitry
> > Solodkiy
> > Subject: Re: [PATCH] ARM: EXYNOS: Add alias name of 'fimd' clock for 'lcd' clock
> >
> > On 01/20/2012 04:53 AM, Kyungmin Park wrote:
> > > On 1/19/12, Jingoo Han<jg1.han@samsung.com>  wrote:
> > >> This patch adds alias name of 'fimd' clock for 'lcd' clock. While 'lcd'
> > >> clock is used for s3c-fb driver, 'fimd' clock is defined for Exynos fimd
> > >> ip. Therefore, 'fimd' clock can be called by using clk_add_alias().
> > > Hi,
> > >
> > > Doesn't it better to add common.c?
> > > Are there any reason to add each board files?
> > >
> > > Thank you,
> > > Kyungmin Park
> > >> Cc: Jonghwan Choi<jhbird.choi@samsung.com>
> > >> Signed-off-by: Jingoo Han<jg1.han@samsung.com>
> > >> ---
> > >>   arch/arm/mach-exynos/mach-nuri.c           |    2 ++
> > >>   arch/arm/mach-exynos/mach-origen.c         |    2 ++
> > >>   arch/arm/mach-exynos/mach-smdkv310.c       |    2 ++
> > >>   arch/arm/mach-exynos/mach-universal_c210.c |    3 +++
> > >>   4 files changed, 9 insertions(+), 0 deletions(-)
> > >>
> > >> diff --git a/arch/arm/mach-exynos/mach-nuri.c
> > >> b/arch/arm/mach-exynos/mach-nuri.c
> > >> index 3df8bf4..06c22e0 100644
> > >> --- a/arch/arm/mach-exynos/mach-nuri.c
> > >> +++ b/arch/arm/mach-exynos/mach-nuri.c
> > >> @@ -1310,6 +1310,8 @@ static void __init nuri_machine_init(void)
> > >>   	i2c9_devs[I2C9_MAX17042].irq = gpio_to_irq(EXYNOS4_GPX2(3));
> > >>   	i2c_register_board_info(9, i2c9_devs, ARRAY_SIZE(i2c9_devs));
> > >>
> > >> +	dev_set_name(&s5p_device_fimd0.dev, "exynos4-fb.0");
> > >> +	clk_add_alias("lcd", "exynos4-fb.0", "fimd",&s5p_device_fimd0.dev);
> > >>   	s5p_fimd0_set_platdata(&nuri_fb_pdata);
> > >>
> > >>   	nuri_camera_init();
> > >> diff --git a/arch/arm/mach-exynos/mach-origen.c
> > >> b/arch/arm/mach-exynos/mach-origen.c
> > >> index b453464..7cea0be 100644
> > >> --- a/arch/arm/mach-exynos/mach-origen.c
> > >> +++ b/arch/arm/mach-exynos/mach-origen.c
> > >> @@ -722,6 +722,8 @@ static void __init origen_machine_init(void)
> > >>   	s5p_tv_setup();
> > >>   	s5p_i2c_hdmiphy_set_platdata(NULL);
> > >>
> > >> +	dev_set_name(&s5p_device_fimd0.dev, "exynos4-fb.0");
> > >> +	clk_add_alias("lcd", "exynos4-fb.0", "fimd",&s5p_device_fimd0.dev);
> > >>   	s5p_fimd0_set_platdata(&origen_lcd_pdata);
> > >>
> > >>   	platform_add_devices(origen_devices, ARRAY_SIZE(origen_devices));
> > >> diff --git a/arch/arm/mach-exynos/mach-smdkv310.c
> > >> b/arch/arm/mach-exynos/mach-smdkv310.c
> > >> index bf2094e..eccd96d 100644
> > >> --- a/arch/arm/mach-exynos/mach-smdkv310.c
> > >> +++ b/arch/arm/mach-exynos/mach-smdkv310.c
> > >> @@ -370,6 +370,8 @@ static void __init smdkv310_machine_init(void)
> > >>   	samsung_keypad_set_platdata(&smdkv310_keypad_data);
> > >>
> > >>   	samsung_bl_set(&smdkv310_bl_gpio_info,&smdkv310_bl_data);
> > >> +	dev_set_name(&s5p_device_fimd0.dev, "exynos4-fb.0");
> > >> +	clk_add_alias("lcd", "exynos4-fb.0", "fimd",&s5p_device_fimd0.dev);
> > >>   	s5p_fimd0_set_platdata(&smdkv310_lcd0_pdata);
> > >>
> > >>   	smdkv310_ehci_init();
> > >> diff --git a/arch/arm/mach-exynos/mach-universal_c210.c
> > >> b/arch/arm/mach-exynos/mach-universal_c210.c
> > >> index c38e18d..fe554f1 100644
> > >> --- a/arch/arm/mach-exynos/mach-universal_c210.c
> > >> +++ b/arch/arm/mach-exynos/mach-universal_c210.c
> > >> @@ -31,6 +31,7 @@
> > >>   #include<plat/cpu.h>
> > >>   #include<plat/devs.h>
> > >>   #include<plat/iic.h>
> > >> +#include<plat/clock.h>
> > >>   #include<plat/gpio-cfg.h>
> > >>   #include<plat/fb.h>
> > >>   #include<plat/mfc.h>
> > >> @@ -1029,6 +1030,8 @@ static void __init universal_machine_init(void)
> > >>   	s5p_i2c_hdmiphy_set_platdata(NULL);
> > >>   	i2c_register_board_info(5, i2c5_devs, ARRAY_SIZE(i2c5_devs));
> > >>
> > >> +	dev_set_name(&s5p_device_fimd0.dev, "exynos4-fb.0");
> > >> +	clk_add_alias("lcd", "exynos4-fb.0", "fimd",&s5p_device_fimd0.dev);
> > >>   	s5p_fimd0_set_platdata(&universal_lcd_pdata);
> > >>
> > >>   	universal_touchkey_init();
> > >> --
> > >> 1.7.1
> > >>
> > >>
> > >> --
> > >> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc"
> > >> in
> > >> the body of a message to majordomo@vger.kernel.org
> > >> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > >>
> >
> > Still no appropriate support of frame buffer in the kernel...
> OK, I will send the new patch.
I cannot find good place in common.c.
If someone has idea, please let me know good place in common.c.

Or, Tushar's patch would be better.
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg07795.html
I test this patch, it resolve the lcd clock problem, too.

Thanks.
> >
> > --
> > Kind regards,
> > Evgeny Voevodin,
> > Leading Software Engineer,
> > ASWG, Moscow R&D center, Samsung Electronics
> > e-mail: e.voevodin@samsung.com
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
