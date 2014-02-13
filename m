From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] clocksource: exynos_mct: remove unwanted header file
 inclusion
Date: Fri, 14 Feb 2014 07:23:59 +0900
Message-ID: <52FD45FF.7030100@samsung.com>
References: <1389314025-2890-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:38429 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751218AbaBMWYG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Feb 2014 17:24:06 -0500
Received: by mail-pa0-f43.google.com with SMTP id rd3so11345097pab.16
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Feb 2014 14:24:05 -0800 (PST)
In-Reply-To: <1389314025-2890-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, thomas.ab@samsung.com

On 01/10/14 09:33, Pankaj Dubey wrote:
> remove unwanted header file inclusion "asm/mach/time.h" from exynos_mct.c
>
> Signed-off-by: Pankaj Dubey<pankaj.dubey@samsung.com>
> ---
>   drivers/clocksource/exynos_mct.c |    2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
> index 48f76bc..ed49b25 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -25,8 +25,6 @@
>   #include<linux/of_address.h>
>   #include<linux/clocksource.h>
>
> -#include<asm/mach/time.h>
> -
>   #define EXYNOS4_MCTREG(x)		(x)
>   #define EXYNOS4_MCT_G_CNT_L		EXYNOS4_MCTREG(0x100)
>   #define EXYNOS4_MCT_G_CNT_U		EXYNOS4_MCTREG(0x104)

Looks good, applied.

Thanks,
Kukjin
