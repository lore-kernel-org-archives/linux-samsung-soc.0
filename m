From: Lukasz Majewski <l.majewski@samsung.com>
Subject: Re: [PATCH 6/6] ARM: EXYNOS: USB OTG support for Universal C210
Date: Mon, 13 Feb 2012 10:53:14 +0100
Message-ID: <20120213105314.7ddaa594@lmajewski.digital.local>
References: <1328870146-20312-1-git-send-email-l.majewski@samsung.com>
 <1328870146-20312-7-git-send-email-l.majewski@samsung.com>
 <4F38B43D.4080504@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:28837 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751062Ab2BMJxY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Feb 2012 04:53:24 -0500
Received: from euspt2 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LZB00F7SSSYPT@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 13 Feb 2012 09:53:22 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LZB005XXSSYXL@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 13 Feb 2012 09:53:22 +0000 (GMT)
In-reply-to: <4F38B43D.4080504@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

On Mon, 13 Feb 2012 12:27:01 +0530
Tushar Behera <tushar.behera@linaro.org> wrote:

> On 02/10/2012 04:05 PM, Lukasz Majewski wrote:
> > This patch adds platform data for using S3C-HSOTG driver at
> > Universal_C210 target.
> > 
> > Signed-off-by: Lukasz Majewski <l.majewski@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > ---
> >  arch/arm/mach-exynos/mach-universal_c210.c |    5 +++++
> >  1 files changed, 5 insertions(+), 0 deletions(-)
> > 
> > diff --git a/arch/arm/mach-exynos/mach-universal_c210.c
> > b/arch/arm/mach-exynos/mach-universal_c210.c index dd75101..3aaac61
> > 100644 --- a/arch/arm/mach-exynos/mach-universal_c210.c
> > +++ b/arch/arm/mach-exynos/mach-universal_c210.c
> > @@ -40,6 +40,7 @@
> >  #include <plat/fimc-core.h>
> >  #include <plat/camport.h>
> >  #include <plat/mipi_csis.h>
> > +#include <plat/udc-hs.h>
> >  
> >  #include <mach/map.h>
> >  
> > @@ -927,6 +928,9 @@ static struct gpio universal_camera_gpios[] = {
> >  	{ GPIO_CAM_MEGA_nRST,	GPIOF_OUT_INIT_LOW,
> > "CAM_8M_NRST" }, };
> >  
> > +/* USB OTG */
> > +static struct s3c_hsotg_plat universal_hsotg_pdata;
> > +
> >  static void universal_camera_init(void)
> >  {
> >  	s3c_set_platdata(&mipi_csis_platdata,
> > sizeof(mipi_csis_platdata), @@ -1037,6 +1041,7 @@ static void
> > __init universal_machine_init(void)
> > i2c_register_board_info(I2C_GPIO_BUS_12, i2c_gpio12_devs,
> > ARRAY_SIZE(i2c_gpio12_devs)); 
> > +	s3c_hsotg_set_platdata(&universal_hsotg_pdata);
> >  	universal_camera_init();
> >  
> >  	/* Last */
> 
> Are you not missing the device entry for &s3c_device_usb_hsotg?
> 
> 

Hi,

Yes, rebase error.
Thank you for spotting.

Correct patch under development.

-- 
Best regards,

Lukasz Majewski

Samsung Poland R&D Center
Platform Group
