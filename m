From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH] ARM: SAMSUNG: Fix on default of s3c24xx_uart_devs
Date: Tue, 05 Oct 2010 15:32:31 +0200
Message-ID: <014301cb6491$c649ec40$52ddc4c0$%szyprowski@samsung.com>
References: <1286281736-29821-1-git-send-email-jc.lee@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:30121 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752779Ab0JENcj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Oct 2010 09:32:39 -0400
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9T00GBFKADXG80@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Oct 2010 22:32:37 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9T00756KA8W0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Oct 2010 22:32:37 +0900 (KST)
In-reply-to: <1286281736-29821-1-git-send-email-jc.lee@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jaecheol Lee' <jc.lee@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org

Hello,

On Tuesday, October 05, 2010 2:29 PM Jaecheol Lee wrote:

> This patch adds default dev->bus, platform_bus_type of s3c24xx_uart_devs.
> If there is no default dev->bus, we cannot get the proper clock 'id' from
> clk_get() in the console_initcall().
> This problem occurs when only defined 'uclk1' as uart clock.
> 
> Reported-by: Jongpill Lee <boyko.lee@samsung.com>
> Signed-off-by: Jaecheol Lee <jc.lee@samsung.com>
> ---
>  arch/arm/plat-samsung/dev-uart.c |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/dev-uart.c b/arch/arm/plat-samsung/dev-uart.c
> index 3776cd9..519e1bc 100644
> --- a/arch/arm/plat-samsung/dev-uart.c
> +++ b/arch/arm/plat-samsung/dev-uart.c
> @@ -19,18 +19,22 @@
> 
>  static struct platform_device s3c24xx_uart_device0 = {
>  	.id		= 0,
> +	.dev		= { .bus = &platform_bus_type },
>  };
> 
>  static struct platform_device s3c24xx_uart_device1 = {
>  	.id		= 1,
> +	.dev		= { .bus = &platform_bus_type },
>  };
> 
>  static struct platform_device s3c24xx_uart_device2 = {
>  	.id		= 2,
> +	.dev		= { .bus = &platform_bus_type },
>  };
> 
>  static struct platform_device s3c24xx_uart_device3 = {
>  	.id		= 3,
> +	.dev		= { .bus = &platform_bus_type },
>  };
> 
>  struct platform_device *s3c24xx_uart_src[4] = {

I've ran into the same problem and I considered the same approach to solve
this issue. However I found that such solution is an ugly hack rather a real
fix or workaround. Nobody can grant that platform device framework would
accept registering a device with .bus already set in the future version
of the kernel. This might also cause other strange problems in the future.

My proposition for a real workaround is in the patch named "[PATCH] ARM:
Samsung: add a workaround for get_clock() for serial driver" 
(see http://www.spinics.net/lists/linux-samsung-soc/msg03050.html ).

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
