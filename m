From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH v3] ARM: S5PC110: add support for S6E63M0 LCD controller on
 Goni board
Date: Mon, 04 Oct 2010 07:42:23 +0200
Message-ID: <011e01cb6386$f0487900$d0d96b00$%szyprowski@samsung.com>
References: <005b01cb5ee0$2d266f90$87734eb0$%kim@samsung.com>
 <1285679744-21621-1-git-send-email-m.szyprowski@samsung.com>
 <014801cb621e$3edd42e0$bc97c8a0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:50246 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752136Ab0JDFmk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Oct 2010 01:42:40 -0400
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9R00GT13V234D0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Oct 2010 14:42:38 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9R0026F3URME@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Oct 2010 14:42:39 +0900 (KST)
In-reply-to: <014801cb621e$3edd42e0$bc97c8a0$%kim@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, ben-linux@fluff.org

Hello,

On Saturday, October 02, 2010 12:41 PM Kukjin Kim wrote:

> Marek Szyprowski wrote:
> >
> > Add required platform definitions for S6E63M0 LCD controller on Samsung
> > Goni board.
> >
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > ---
> >
> > Changes since v2:
> > - removed defines for lcd pin names
> >
> >  arch/arm/mach-s5pv210/mach-goni.c |   66
> > +++++++++++++++++++++++++++++++++++++
> >  1 files changed, 66 insertions(+), 0 deletions(-)
> >
> > diff --git a/arch/arm/mach-s5pv210/mach-goni.c
> b/arch/arm/mach-s5pv210/mach-
> > goni.c
> > index b0ae208..ac6ebab 100644
> > --- a/arch/arm/mach-s5pv210/mach-goni.c
> > +++ b/arch/arm/mach-s5pv210/mach-goni.c
> 
> (snip)
> 
> > +static struct lcd_platform_data s6e63m0_platform_data = {
> > +	.reset			= reset_lcd,
> > +	.power_on		= lcd_power_on,
> > +	.lcd_enabled		= 0,
> > +	.reset_delay		= 120,	/* 120ms */
> > +	.power_on_delay		= 25,	/* 25ms */
> > +	.power_off_delay	= 200,	/* 200ms */
> > +};
> > +
> > +#define LCD_BUS_NUM	3
> > +static struct spi_board_info spi_board_info[] __initdata = {
> > +	{
> > +		.modalias	= "s6e63m0",
> > +		.platform_data	= &goni_lcd_platform_data,
> 
> Happened following build error.
> arch/arm/mach-s5pv210/mach-goni.c:153: error: 'goni_lcd_platform_data'
> undeclared here (not in a function)
> 
> should be 's6e63m0_platform_data'?..let me know your preferred name.
> Will apply with changing it.

goni_lcd_platform_data is ihmo more appropriate. I'm sorry again for a problem,
looks that I mixed something up and I've sent a patch before final cleaning.

> > +		.max_speed_hz	= 1200000,
> > +		.bus_num	= LCD_BUS_NUM,
> > +		.chip_select	= 0,
> > +		.mode		= SPI_MODE_3,
> > +		.controller_data = (void *)S5PV210_MP01(1), /* DISPLAY_CS */
> > +	},
> > +};
> 
> (snip)

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
