From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3] ARM: S5PC110: add support for S6E63M0 LCD controller on
 Goni board
Date: Sat, 02 Oct 2010 19:40:31 +0900
Message-ID: <014801cb621e$3edd42e0$bc97c8a0$%kim@samsung.com>
References: <005b01cb5ee0$2d266f90$87734eb0$%kim@samsung.com>
 <1285679744-21621-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:63089 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754771Ab0JBKkQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 2 Oct 2010 06:40:16 -0400
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9N006JESB2W370@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 02 Oct 2010 19:40:14 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9N00FUTSB2JD@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 02 Oct 2010 19:40:14 +0900 (KST)
In-reply-to: <1285679744-21621-1-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, ben-linux@fluff.org

Marek Szyprowski wrote:
> 
> Add required platform definitions for S6E63M0 LCD controller on Samsung
> Goni board.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
> 
> Changes since v2:
> - removed defines for lcd pin names
> 
>  arch/arm/mach-s5pv210/mach-goni.c |   66
> +++++++++++++++++++++++++++++++++++++
>  1 files changed, 66 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv210/mach-goni.c
b/arch/arm/mach-s5pv210/mach-
> goni.c
> index b0ae208..ac6ebab 100644
> --- a/arch/arm/mach-s5pv210/mach-goni.c
> +++ b/arch/arm/mach-s5pv210/mach-goni.c

(snip)

> +static struct lcd_platform_data s6e63m0_platform_data = {
> +	.reset			= reset_lcd,
> +	.power_on		= lcd_power_on,
> +	.lcd_enabled		= 0,
> +	.reset_delay		= 120,	/* 120ms */
> +	.power_on_delay		= 25,	/* 25ms */
> +	.power_off_delay	= 200,	/* 200ms */
> +};
> +
> +#define LCD_BUS_NUM	3
> +static struct spi_board_info spi_board_info[] __initdata = {
> +	{
> +		.modalias	= "s6e63m0",
> +		.platform_data	= &goni_lcd_platform_data,

Happened following build error.
arch/arm/mach-s5pv210/mach-goni.c:153: error: 'goni_lcd_platform_data'
undeclared here (not in a function)

should be 's6e63m0_platform_data'?..let me know your preferred name.
Will apply with changing it.

> +		.max_speed_hz	= 1200000,
> +		.bus_num	= LCD_BUS_NUM,
> +		.chip_select	= 0,
> +		.mode		= SPI_MODE_3,
> +		.controller_data = (void *)S5PV210_MP01(1), /* DISPLAY_CS */
> +	},
> +};

(snip)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
