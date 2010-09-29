From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCHv2 4/7] ARM: S5PC110: Add si470x radio device to the GONI
 board
Date: Wed, 29 Sep 2010 07:28:30 +0200
Message-ID: <00b601cb5f97$2a304ce0$7e90e6a0$%szyprowski@samsung.com>
References: <1284987337-15365-1-git-send-email-m.szyprowski@samsung.com>
 <1284987337-15365-5-git-send-email-m.szyprowski@samsung.com>
 <005f01cb5ee0$e16f63d0$a44e2b70$%kim@samsung.com>
 <007401cb5f0e$3b4e5000$b1eaf000$%szyprowski@samsung.com>
 <00c101cb5f16$1c5542a0$54ffc7e0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:46795 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750903Ab0I2F2r (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Sep 2010 01:28:47 -0400
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9H00EOVTVXI080@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 29 Sep 2010 14:28:45 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9H0016XTVKO3@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 29 Sep 2010 14:28:45 +0900 (KST)
In-reply-to: <00c101cb5f16$1c5542a0$54ffc7e0$%kim@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, ben-linux@fluff.org, 'Joonyoung Shim' <jy0922.shim@samsung.com>

Hello,

On Tuesday, September 28, 2010 4:05 PM Kukjin Kim wrote:

> > On Tuesday, September 28, 2010 9:44 AM Kukjin Kim wrote:
> >
> > > Marek Szyprowski wrote:
> > > >
> > > > Add required platform definitions for si470x radio device on Samsung
> > > > Goni board.
> > > >
> > > > Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> > > > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > > > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > > > ---
> > > >  arch/arm/mach-s5pv210/Kconfig     |    2 ++
> > > >  arch/arm/mach-s5pv210/mach-goni.c |   30
> > > > ++++++++++++++++++++++++++++++
> > > >  2 files changed, 32 insertions(+), 0 deletions(-)
> > > >
> > > > diff --git a/arch/arm/mach-s5pv210/Kconfig
> b/arch/arm/mach-s5pv210/Kconfig
> > > > index b46925b..b1f671d 100644
> > > > --- a/arch/arm/mach-s5pv210/Kconfig
> > > > +++ b/arch/arm/mach-s5pv210/Kconfig
> > > > @@ -83,9 +83,11 @@ config MACH_GONI
> > > >  	select S3C_DEV_HSMMC
> > > >  	select S3C_DEV_HSMMC1
> > > >  	select S3C_DEV_HSMMC2
> > > > +	select S3C_DEV_I2C1
> > > >  	select S5P_DEV_ONENAND
> > > >  	select SAMSUNG_DEV_KEYPAD
> > > >  	select S5PV210_SETUP_FB_24BPP
> > > > +	select S5PV210_SETUP_I2C1
> > > >  	select S5PV210_SETUP_KEYPAD
> > > >  	select S5PV210_SETUP_SDHCI
> > > >  	help
> > > > diff --git a/arch/arm/mach-s5pv210/mach-goni.c
> > > b/arch/arm/mach-s5pv210/mach-
> > > > goni.c
> > > > index b263f3a..5677c4d 100644
> > > > --- a/arch/arm/mach-s5pv210/mach-goni.c
> > > > +++ b/arch/arm/mach-s5pv210/mach-goni.c
> > > > @@ -38,6 +38,7 @@
> > > >  #include <plat/devs.h>
> > > >  #include <plat/cpu.h>
> > > >  #include <plat/fb.h>
> > > > +#include <plat/iic.h>
> > > >  #include <plat/keypad.h>
> > > >  #include <plat/sdhci.h>
> > > >
> > > > @@ -200,6 +201,27 @@ static struct samsung_keypad_platdata keypad_data
> > > > __initdata = {
> > > >  	.cols		= 3,
> > > >  };
> > > >
> > > > +/* Radio */
> > > > +static struct i2c_board_info i2c1_devs[] __initdata = {
> > > > +	{
> > > > +		I2C_BOARD_INFO("si470x", 0x10),
> > > > +	},
> > > > +};
> > > > +
> > > > +static void __init goni_radio_init(void)
> > > > +{
> > > > +	int gpio;
> > > > +
> > > > +	gpio = S5PV210_GPJ2(4);			/* XMSMDATA_4 */
> > > > +	gpio_request(gpio, "FM_INT");
> > >
> > > If returned fail?
> >
> > Then there is something seriously wrong either with the platform or
> machine
> > startup code.
> >
> > It is quite common to omit a check in the machine init code. Just take a
> look
> > at mach-s3c64xx/mach-smdk6410.c, smdk6410_machine_init() function. Lack of
> > checks here doesn't really have ANY impact on the stability of the kernel
> imho.
> >
> Yeah...right now in our codes, something checked the returning of
> gpio_request, and others not and the board designer already know where it is
> used.
> 
> Hmm...I'm not sure which is better to us...but is it better there is
> exception/error handling?
> Or...is it useless code?

IMHO such code is useless. If requesting a gpio fails then the kernel will throw
an ops or warning on the first use of that gpio pin, so the board designer will
know that something is really wrong there.

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
