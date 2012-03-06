From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 3/3] ARM: Exynos: fix touchscreen IRQ setup on Universal
 C210 board
Date: Tue, 06 Mar 2012 02:08:05 -0800
Message-ID: <4F55E205.9090404@samsung.com>
References: <1330591221-31458-1-git-send-email-m.szyprowski@samsung.com> <1330591221-31458-4-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:59491 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758083Ab2CFKIJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Mar 2012 05:08:09 -0500
Received: by pbcun15 with SMTP id un15so3900256pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Mar 2012 02:08:09 -0800 (PST)
In-Reply-To: <1330591221-31458-4-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

On 03/01/12 00:40, Marek Szyprowski wrote:
> From: Bartlomiej Zolnierkiewicz<b.zolnierkie@samsung.com>
>
> Fixes atmel_mxt_ts freeze on Universal C210.
>
> Signed-off-by: Bartlomiej Zolnierkiewicz<b.zolnierkie@samsung.com>
> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
> Signed-off-by: Marek Szyprowski<m.szyprowski@samsung.com>
> ---
>   arch/arm/mach-exynos/mach-universal_c210.c |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/mach-universal_c210.c b/arch/arm/mach-exynos/mach-universal_c210.c
> index 7cd738c..e0cd5bb 100644
> --- a/arch/arm/mach-exynos/mach-universal_c210.c
> +++ b/arch/arm/mach-exynos/mach-universal_c210.c
> @@ -13,6 +13,7 @@
>   #include<linux/i2c.h>
>   #include<linux/gpio_keys.h>
>   #include<linux/gpio.h>
> +#include<linux/interrupt.h>
>   #include<linux/fb.h>
>   #include<linux/mfd/max8998.h>
>   #include<linux/regulator/machine.h>
> @@ -604,6 +605,7 @@ static struct mxt_platform_data qt602240_platform_data = {
>   	.threshold	= 0x28,
>   	.voltage	= 2800000,		/* 2.8V */
>   	.orient		= MXT_DIAGONAL,
> +	.irqflags	= IRQF_TRIGGER_FALLING,
>   };
>
>   static struct i2c_board_info i2c3_devs[] __initdata = {

Looks ok, will apply into fixes-4.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
