From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: SAMSUNG: Fix on s5p_gpio_[get,set]_drvstr
Date: Mon, 30 Aug 2010 18:52:24 +0900
Message-ID: <005201cb4829$0fbaf200$2f30d600$%kim@samsung.com>
References: <1283139071-25374-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:54679 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751747Ab0H3JwP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Aug 2010 05:52:15 -0400
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L7Y0061GM31KL60@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 30 Aug 2010 18:52:13 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L7Y00H1QM30S0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 30 Aug 2010 18:52:13 +0900 (KST)
In-reply-to: <1283139071-25374-1-git-send-email-kgene.kim@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, jc.lee@samsung.com

Kukjin Kim wrote:
> 
> This patch fixes bug on gpio drive strength helper function.
> 
> The offset should be like follwoing.
> -       off = chip->chip.base - pin;
> +       off = pin - chip->chip.base;
> 
> In the s5p_gpio_get_drvstr(),
> the second line is unnecessary, because overwrite drvstr.
>         drvstr = __raw_readl(reg);
> -       drvstr = 0xffff & (0x3 << shift);
> 
> And need 2bit masking before return the drvstr value.
>         drvstr = drvstr >> shift;
> +       drvstr &= 0x3;
> 
> In the s5p_gpio_set_drvstr(), need relevant bit clear.
>         tmp = __raw_readl(reg);
> +       tmp &= ~(0x3 << shift);
>         tmp |= drvstr << shift;
> 
> Reported-by: Janghyuck Kim <janghyuck.kim@samsung.com>

Sorry I confused, should be 'Reported-by: Jaecheol Lee <jc.lee@samsung.com>'

> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/plat-samsung/gpio-config.c |    7 ++++---
>  1 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/gpio-config.c
b/arch/arm/plat-samsung/gpio-
> config.c
> index 57b68a5..e3d41ea 100644
> --- a/arch/arm/plat-samsung/gpio-config.c
> +++ b/arch/arm/plat-samsung/gpio-config.c
> @@ -273,13 +273,13 @@ s5p_gpio_drvstr_t s5p_gpio_get_drvstr(unsigned int
pin)
>  	if (!chip)
>  		return -EINVAL;
> 
> -	off = chip->chip.base - pin;
> +	off = pin - chip->chip.base;
>  	shift = off * 2;
>  	reg = chip->base + 0x0C;
> 
>  	drvstr = __raw_readl(reg);
> -	drvstr = 0xffff & (0x3 << shift);
>  	drvstr = drvstr >> shift;
> +	drvstr &= 0x3;
> 
>  	return (__force s5p_gpio_drvstr_t)drvstr;
>  }
> @@ -296,11 +296,12 @@ int s5p_gpio_set_drvstr(unsigned int pin,
> s5p_gpio_drvstr_t drvstr)
>  	if (!chip)
>  		return -EINVAL;
> 
> -	off = chip->chip.base - pin;
> +	off = pin - chip->chip.base;
>  	shift = off * 2;
>  	reg = chip->base + 0x0C;
> 
>  	tmp = __raw_readl(reg);
> +	tmp &= ~(0x3 << shift);
>  	tmp |= drvstr << shift;
> 
>  	__raw_writel(tmp, reg);
> --
> 1.6.2.5


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
