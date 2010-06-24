From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/2] ARM: S5PV210: Fix GONI board UART FIFO mode
 configration
Date: Thu, 24 Jun 2010 21:57:00 +0900
Message-ID: <012d01cb139c$bf01c020$3d054060$%kim@samsung.com>
References: <1277354105-13097-1-git-send-email-jy0922.shim@samsung.com>
 <1277354105-13097-2-git-send-email-jy0922.shim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:43045 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752381Ab0FXM47 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Jun 2010 08:56:59 -0400
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L4I006BGRYY05D0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 24 Jun 2010 21:56:58 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L4I00728RYXX6@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 24 Jun 2010 21:56:58 +0900 (KST)
In-reply-to: <1277354105-13097-2-git-send-email-jy0922.shim@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Joonyoung Shim' <jy0922.shim@samsung.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, ben-linux@fluff.org

Joonyoung Shim wrote:
> 
> The GONI board uses max UART FIFO size to each UART channels.
> 
> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-s5pv210/mach-goni.c |   16 +++++++++-------
>  1 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv210/mach-goni.c
b/arch/arm/mach-s5pv210/mach-
> goni.c
> index 4863b13..0cfb8db 100644
> --- a/arch/arm/mach-s5pv210/mach-goni.c
> +++ b/arch/arm/mach-s5pv210/mach-goni.c
> @@ -36,9 +36,7 @@
> 
>  #define S5PV210_ULCON_DEFAULT	S3C2410_LCON_CS8
> 
> -#define S5PV210_UFCON_DEFAULT	(S3C2410_UFCON_FIFOMODE |	\
> -				 S5PV210_UFCON_TXTRIG4 |	\
> -				 S5PV210_UFCON_RXTRIG4)
> +#define S5PV210_UFCON_DEFAULT	S3C2410_UFCON_FIFOMODE
> 
>  static struct s3c2410_uartcfg goni_uartcfgs[] __initdata = {
>  	[0] = {
> @@ -46,28 +44,32 @@ static struct s3c2410_uartcfg goni_uartcfgs[]
__initdata = {
>  		.flags		= 0,
>  		.ucon		= S5PV210_UCON_DEFAULT,
>  		.ulcon		= S5PV210_ULCON_DEFAULT,
> -		.ufcon		= S5PV210_UFCON_DEFAULT,
> +		.ufcon		= S5PV210_UFCON_DEFAULT |
> +			S5PV210_UFCON_TXTRIG256 |
> S5PV210_UFCON_RXTRIG256,
>  	},
>  	[1] = {
>  		.hwport		= 1,
>  		.flags		= 0,
>  		.ucon		= S5PV210_UCON_DEFAULT,
>  		.ulcon		= S5PV210_ULCON_DEFAULT,
> -		.ufcon		= S5PV210_UFCON_DEFAULT,
> +		.ufcon		= S5PV210_UFCON_DEFAULT |
> +			S5PV210_UFCON_TXTRIG64 |
> S5PV210_UFCON_RXTRIG64,
>  	},
>  	[2] = {
>  		.hwport		= 2,
>  		.flags		= 0,
>  		.ucon		= S5PV210_UCON_DEFAULT,
>  		.ulcon		= S5PV210_ULCON_DEFAULT,
> -		.ufcon		= S5PV210_UFCON_DEFAULT,
> +		.ufcon		= S5PV210_UFCON_DEFAULT |
> +			S5PV210_UFCON_TXTRIG16 |
> S5PV210_UFCON_RXTRIG16,
>  	},
>  	[3] = {
>  		.hwport		= 3,
>  		.flags		= 0,
>  		.ucon		= S5PV210_UCON_DEFAULT,
>  		.ulcon		= S5PV210_ULCON_DEFAULT,
> -		.ufcon		= S5PV210_UFCON_DEFAULT,
> +		.ufcon		= S5PV210_UFCON_DEFAULT |
> +			S5PV210_UFCON_TXTRIG16 |
> S5PV210_UFCON_RXTRIG16,
>  	},
>  };
> 
> --

OK..will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
