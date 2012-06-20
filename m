From: Dimitris Papastamos <dp@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ARM: S3C64XX: Add IRQ mapping for wm0010 on Cragganmore
Date: Wed, 20 Jun 2012 17:02:10 +0100
Message-ID: <20120620160210.GA27145@opensource.wolfsonmicro.com>
References: <1339775065-13211-1-git-send-email-dp@opensource.wolfsonmicro.com> <028c01cd4e9d$16c0f9b0$4442ed10$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:60221 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756949Ab2FTQCN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jun 2012 12:02:13 -0400
Content-Disposition: inline
In-Reply-To: <028c01cd4e9d$16c0f9b0$4442ed10$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com

On Wed, Jun 20, 2012 at 01:28:06PM +0900, Kukjin Kim wrote:
> Kukjin Kim wrote:
> > 
> > Dimitris Papastamos wrote:
> > >
> > > Signed-off-by: Dimitris Papastamos <dp@opensource.wolfsonmicro.com>
> > > ---
> > >  arch/arm/mach-s3c64xx/mach-crag6410-module.c |    1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/arch/arm/mach-s3c64xx/mach-crag6410-module.c
> > b/arch/arm/mach-
> > > s3c64xx/mach-crag6410-module.c
> > > index f347336..7c8ea3c 100644
> > > --- a/arch/arm/mach-s3c64xx/mach-crag6410-module.c
> > > +++ b/arch/arm/mach-s3c64xx/mach-crag6410-module.c
> > > @@ -47,6 +47,7 @@ static struct spi_board_info wm1253_devs[] = {
> > >  		.bus_num	= 0,
> > >  		.chip_select	= 0,
> > >  		.mode		= SPI_MODE_0,
> > > +		.irq            = S3C_EINT(5),
>                     ^^^^^^^^^^^^
> If there is no reason, using tab is better at the mark ^

Oops, yes tabs there, will re-send.

> > >  		.controller_data = &wm0010_spi_csinfo,
> > >  		.platform_data = &wm0010_crag_pdata,
> 
> I can't find platform_data in my tree (just v3.5-rc3), there is another
> patch?
> 
> Now, just applying this patch is ok?

Applying this patch should be fine.

Thanks,
Dimitris
