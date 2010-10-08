From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S5P64X0: fix gpio rbank support
Date: Fri, 08 Oct 2010 17:05:56 +0900
Message-ID: <000001cb66bf$a5f5d7d0$f1e18770$%kim@samsung.com>
References: <1286425239-11632-1-git-send-email-sbkim73@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:55364 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755495Ab0JHIFl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Oct 2010 04:05:41 -0400
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9Y009WZP5GGS70@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Oct 2010 17:05:40 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9Y001RRP5GSS@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Oct 2010 17:05:40 +0900 (KST)
In-reply-to: <1286425239-11632-1-git-send-email-sbkim73@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sangbeom Kim' <sbkim73@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, 'Atul Dahiya' <atul.dahiya@samsung.com>

Sangbeom Kim wrote:
> 
> From: Atul Dahiya <atul.dahiya@samsung.com>
> 
> The patch removes s3c_gpio_lock/unlock to avoid acquiring the lock
> recursively as lock is already acquired by calling function.
> 
> Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>
> Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
> ---
>  arch/arm/mach-s5p64x0/gpio.c |    4 ----
>  1 files changed, 0 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/mach-s5p64x0/gpio.c b/arch/arm/mach-s5p64x0/gpio.c
> index 3073ed0..533c1a3 100644
> --- a/arch/arm/mach-s5p64x0/gpio.c
> +++ b/arch/arm/mach-s5p64x0/gpio.c
> @@ -158,15 +158,11 @@ int s5p64x0_gpio_setcfg_4bit_rbank(struct
> s3c_gpio_chip *chip,
>  		cfg <<= shift;
>  	}
> 
> -	s3c_gpio_lock(chip, flags);
> -
>  	con = __raw_readl(reg);
>  	con &= ~(0xf << shift);
>  	con |= cfg;
>  	__raw_writel(con, reg);
> 
> -	s3c_gpio_unlock(chip, flags);
> -
>  	return 0;
>  }
> 
> --

Right...will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
