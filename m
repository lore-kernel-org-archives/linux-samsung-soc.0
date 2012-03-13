From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH 2/3] ARM: Exynos: Add DRM core device support for Universal
 C210 board
Date: Tue, 13 Mar 2012 15:14:20 +0100
Message-ID: <031601cd0123$9626a2d0$c273e870$%szyprowski@samsung.com>
References: <1331291105-18152-1-git-send-email-m.szyprowski@samsung.com>
 <1331291105-18152-3-git-send-email-m.szyprowski@samsung.com>
 <CAK9yfHyHoDucPwvZbb_ireRTohkd9hCDf3ER_yp3Rv_7BmNwhg@mail.gmail.com>
 <CAH9JG2UWE1CNOrHVtMawS9TrPHHZrgpbVwvgmXb4OiLObnxdsA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ks_c_5601-1987
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:11045 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754879Ab2CMOO2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Mar 2012 10:14:28 -0400
Received: from euspt1 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0M0T0070UU7YHK@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Mar 2012 14:14:22 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M0T00MNQU82BS@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Mar 2012 14:14:26 +0000 (GMT)
In-reply-to: <CAH9JG2UWE1CNOrHVtMawS9TrPHHZrgpbVwvgmXb4OiLObnxdsA@mail.gmail.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Sachin Kamat' <sachin.kamat@linaro.org>, =?ks_c_5601-1987?B?J7TrwM6x4ic=?= <inki.dae@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Joonyoung Shim' <jy0922.shim@samsung.com>

Hello,

On Tuesday, March 13, 2012 5:39 AM Kyungmin Park wrote:

> On 3/13/12, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> > Hi Marek,
> > Thanks for the patch.
> >
> > On 09/03/2012, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> >> Add core DRM device and alternative platform device data for FIMD DRM
> >> subdriver. Based on the initial patch by Joonyoung Shim
> >> <jy0922.shim@samsung.com>
> >>
> >> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> >> ---
> >>  arch/arm/mach-exynos/Kconfig               |    1 +
> >>  arch/arm/mach-exynos/mach-universal_c210.c |   31
> >> ++++++++++++++++++++++++++++
> >>  2 files changed, 32 insertions(+), 0 deletions(-)
> >>
> >> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> >> index 5a26944..c73eeba 100644
> >> --- a/arch/arm/mach-exynos/Kconfig
> >> +++ b/arch/arm/mach-exynos/Kconfig
> >> @@ -257,6 +257,7 @@ config MACH_UNIVERSAL_C210
> >>  	select S5P_DEV_ONENAND
> >>  	select S5P_DEV_TV
> >>  	select EXYNOS4_DEV_DMA
> >> +	select EXYNOS_DEV_DRM
> >>  	select EXYNOS4_SETUP_FIMD0
> >>  	select EXYNOS4_SETUP_I2C1
> >>  	select EXYNOS4_SETUP_I2C3
> >> diff --git a/arch/arm/mach-exynos/mach-universal_c210.c
> >> b/arch/arm/mach-exynos/mach-universal_c210.c
> >> index 322b272..30a3ff3 100644
> >> --- a/arch/arm/mach-exynos/mach-universal_c210.c
> >> +++ b/arch/arm/mach-exynos/mach-universal_c210.c
> >> @@ -23,6 +23,7 @@
> >>  #include <linux/i2c-gpio.h>
> >>  #include <linux/i2c/mcs.h>
> >>  #include <linux/i2c/atmel_mxt_ts.h>
> >> +#include <drm/exynos_drm.h>
> >>
> >>  #include <asm/mach/arch.h>
> >>  #include <asm/hardware/gic.h>
> >> @@ -811,6 +812,27 @@ static struct i2c_board_info i2c1_devs[] __initdata =
> >> {
> >>  	/* Gyro, To be updated */
> >>  };
> >>
> >> +#ifdef CONFIG_DRM_EXYNOS
> >> +static struct exynos_drm_fimd_pdata drm_fimd_pdata = {
> >> +	.timing	= {
> >> +		.left_margin	= 16,
> >> +		.right_margin	= 16,
> >> +		.upper_margin	= 2,
> >> +		.lower_margin	= 28,
> >> +		.hsync_len	= 2,
> >> +		.vsync_len	= 1,
> >> +		.xres		= 480,
> >> +		.yres		= 800,
> >> +		.refresh	= 55,
> >> +	},
> >
> > Shouldn't this be:
> Right, recently we added the panel information. It should be drm-next soon.

I'm sorry for the confusion, I've sent patches which were based on 3.3-rc5 without 
drm-next/fixes. I've just sent v2 patchset which reflects latest changes in drm-next/fixes
branches.

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
