From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 3/3] arm: s5pv210: GONI: add support for MAX8998 PMIC
Date: Wed, 14 Jul 2010 14:06:49 +0900
Message-ID: <006201cb2312$646b05b0$2d411110$%kim@samsung.com>
References: <1278321416-32524-1-git-send-email-m.szyprowski@samsung.com>
 <1278321416-32524-4-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:37176 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750983Ab0GNFGx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Jul 2010 01:06:53 -0400
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L5J00L1Z7JFRG20@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 14 Jul 2010 14:06:51 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L5J00MAG7JF66@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 14 Jul 2010 14:06:51 +0900 (KST)
In-reply-to: <1278321416-32524-4-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kyungmin.park@samsung.com, ben-linux@fluff.org

Marek Szyprowski wrote:
> 
> This patch adds required platform definitions for MAX8998 PMIC driver.
Power
> regulators for LDO and BUCK outputs has been defined as well as a simple
> gpio-keys button for power key (to enable wakeup functionality with
> external interrupt).

Almost same with previous patch...except ldo7_data, ldo17_data and
name...Hmm...
See the previous comments...

> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-s5pv210/mach-goni.c |  323
> +++++++++++++++++++++++++++++++++++++
>  1 files changed, 323 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv210/mach-goni.c
b/arch/arm/mach-s5pv210/mach-
> goni.c
> index 05b4a1a..f0eaf86 100644
> --- a/arch/arm/mach-s5pv210/mach-goni.c
> +++ b/arch/arm/mach-s5pv210/mach-goni.c
> @@ -13,8 +13,13 @@
>  #include <linux/init.h>
>  #include <linux/serial_core.h>
>  #include <linux/fb.h>
> +#include <linux/i2c.h>
> +#include <linux/i2c-gpio.h>
> +#include <linux/mfd/max8998.h>
>  #include <linux/delay.h>
>  #include <linux/clk.h>
> +#include <linux/gpio_keys.h>
> +#include <linux/input.h>
> 
No need inclusion linux/gpio.h and plat/gpio-cfg.h?

>  #include <asm/mach/arch.h>
>  #include <asm/mach/map.h>
> @@ -107,9 +112,323 @@ static struct s3c_fb_platdata goni_lcd_pdata
__initdata
> = {
>  	.setup_gpio		= s5pv210_fb_gpio_setup_24bpp,
>  };
> 

(snip)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
