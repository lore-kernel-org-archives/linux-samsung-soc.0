From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH] clocksource: exynos_mct: remove unwanted header file
 inclusion
Date: Thu, 13 Feb 2014 17:15:52 +0900
Message-ID: <52FC7F38.1060603@samsung.com>
References: <1389314025-2890-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:33076 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752002AbaBMIAG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Feb 2014 03:00:06 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N0X00BFWCW3HN80@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Feb 2014 17:00:03 +0900 (KST)
In-reply-to: <1389314025-2890-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, thomas.ab@samsung.com

On 01/10/2014 09:33 AM, Pankaj Dubey wrote:
> remove unwanted header file inclusion "asm/mach/time.h" from exynos_mct.c
>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>   drivers/clocksource/exynos_mct.c |    2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
> index 48f76bc..ed49b25 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -25,8 +25,6 @@
>   #include <linux/of_address.h>
>   #include <linux/clocksource.h>
>   
> -#include <asm/mach/time.h>
> -
>   #define EXYNOS4_MCTREG(x)		(x)
>   #define EXYNOS4_MCT_G_CNT_L		EXYNOS4_MCTREG(0x100)
>   #define EXYNOS4_MCT_G_CNT_U		EXYNOS4_MCTREG(0x104)

Ping.

Thanks,
Pankaj Dubey
