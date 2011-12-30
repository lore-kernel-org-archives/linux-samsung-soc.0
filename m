From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S3C64XX: Fix build of Cragganmore after SPI changes
Date: Fri, 30 Dec 2011 11:00:05 +0900
Message-ID: <02cb01ccc696$c0088680$40199380$%kim@samsung.com>
References: <1325073936-10936-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:14463 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754354Ab1L3CAJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Dec 2011 21:00:09 -0500
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LWZ003IYUW7N4B0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 30 Dec 2011 11:00:08 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LWZ00L6NUW54S30@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 30 Dec 2011 11:00:07 +0900 (KST)
In-reply-to: 
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Padmavathi Venna' <padma.v@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com

Kukjin Kim wrote:
> 
> Mark Brown wrote:
> >
> > Commit 875a59 (ARM: SAMSUNG: Consolidation of SPI platform devices to
> > plat-samsung) replaced the function s3c64xx_spi_set_info() with
> > s3c64xx_spiN_set_platdata() but did not update all the machines, with
> > Cragganmore being left. Fix that.
> >
> > Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> > ---
> >  arch/arm/mach-s3c64xx/mach-crag6410.c |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/arch/arm/mach-s3c64xx/mach-crag6410.c b/arch/arm/mach-
> > s3c64xx/mach-crag6410.c
> > index 3600998..b77331e 100644
> > --- a/arch/arm/mach-s3c64xx/mach-crag6410.c
> > +++ b/arch/arm/mach-s3c64xx/mach-crag6410.c
> > @@ -736,7 +736,7 @@ static void __init crag6410_machine_init(void)
> >  	i2c_register_board_info(1, i2c_devs1, ARRAY_SIZE(i2c_devs1));
> >
> >  	samsung_keypad_set_platdata(&crag6410_keypad_data);
> > -        s3c64xx_spi_set_info(0, 0, 1);
> > +	s3c64xx_spi0_set_platdata(NULL, 0, 1);
> >
> >  	platform_add_devices(crag6410_devices,
> > ARRAY_SIZE(crag6410_devices));
> >
> > --
> > 1.7.7.3
> 
> Yeah, some machines can be missed to update.
> Thanks, will apply.
> 
Hi Mark,

I couldn't look at the line of 's3c64xx_spi_set_info(...);' which is deleted
in this patch in my tree. So I couldn't apply this.

Do you want to apply this just to add 's3c64xx_spi0_set_platdata()'?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
