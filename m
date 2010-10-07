From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: Samsung: add a workaround for get_clock() for serial
 driver
Date: Thu, 07 Oct 2010 17:16:18 +0900
Message-ID: <009601cb65f7$f0ee2ee0$d2ca8ca0$%kim@samsung.com>
References: <1285769685-11849-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:30924 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753381Ab0JGIQJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Oct 2010 04:16:09 -0400
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9W00LKWUYVNK40@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Oct 2010 17:16:07 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9W00DFWUYV43@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Oct 2010 17:16:07 +0900 (KST)
In-reply-to: <1285769685-11849-1-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, ben-linux@fluff.org

Marek Szyprowski wrote:
> 
> Serial drivers call get_clock() very early, before platform bus
> has been set up, this requires a special check to let them get
> a proper clock. Without this patch, a serial console is broken
> on Universal C210 board.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/plat-samsung/clock.c |   25 ++++++++++++++++++++++++-
>  1 files changed, 24 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/clock.c b/arch/arm/plat-samsung/clock.c
> index 90a2051..da847f1 100644
> --- a/arch/arm/plat-samsung/clock.c
> +++ b/arch/arm/plat-samsung/clock.c
> @@ -48,6 +48,9 @@
>  #include <plat/clock.h>
>  #include <plat/cpu.h>
> 
> +#include <linux/serial_core.h>
> +#include <plat/regs-serial.h> /* for s3c24xx_uart_devs */
> +
>  /* clock information */
> 
>  static LIST_HEAD(clocks);
> @@ -65,6 +68,26 @@ static int clk_null_enable(struct clk *clk, int enable)
>  	return 0;
>  }
> 
> +static int dev_is_s3c_uart(struct device *dev)
> +{
> +	struct platform_device **pdev = s3c24xx_uart_devs;
> +	int i;
> +	for (i=0; i<ARRAY_SIZE(s3c24xx_uart_devs); i++, pdev++)
> +		if (*pdev && dev == &(*pdev)->dev)
> +			return 1;
> +	return 0;
> +}
> +
> +/* Serial drivers call get_clock() very early, before platform bus
> +   has been set up, this requires a special check to let them get
> +   a proper clock */
> +
> +static int dev_is_platform_device(struct device *dev)
> +{
> +	return dev->bus == &platform_bus_type ||
> +	       (dev->bus == NULL && dev_is_s3c_uart(dev));
> +}
> +
>  /* Clock API calls */
> 
>  struct clk *clk_get(struct device *dev, const char *id)
> @@ -73,7 +96,7 @@ struct clk *clk_get(struct device *dev, const char *id)
>  	struct clk *clk = ERR_PTR(-ENOENT);
>  	int idno;
> 
> -	if (dev == NULL || dev->bus != &platform_bus_type)
> +	if (dev == NULL || !dev_is_platform_device(dev))
>  		idno = -1;
>  	else
>  		idno = to_platform_device(dev)->id;
> --
Hi,

It works well on SMDKV310 and SMDKC210 with your patch.
But I'm not sure whether this is real solution for this situation.

Anyway I think we need to sort out this stuff in future time.

Ben,
If you're ok, I will apply this.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
