From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH 2/2] ARM: S5PV210: Add the GPIO lib
Date: Wed, 28 Jul 2010 10:09:16 +0200
Message-ID: <005501cb2e2c$304d4480$90e7cd80$%szyprowski@samsung.com>
References: <4C4F9E4D.4090608@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:60878 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751886Ab0G1IL0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Jul 2010 04:11:26 -0400
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L69004HTDECS490@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Jul 2010 17:11:00 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L6900DL7DDX85@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Jul 2010 17:11:00 +0900 (KST)
In-reply-to: <4C4F9E4D.4090608@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Chanwoo Choi' <cw00.choi@samsung.com>, 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>
Cc: alsa-devel@alsa-project.org, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Joonyoung Shim' <jy0922.shim@samsung.com>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Ben Dooks' <ben@simtec.co.uk>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Liam Girdwood' <lrg@slimlogic.co.uk>

Hello,

On Wednesday, July 28, 2010 5:05 AM Chanwoo Choi wrote:

> This patch add the definition of GPIO to support WM8994 audio codec on
> I2C bus.

I've already submitted similar patch that does this job correctly. See:
http://git.kernel.org/?p=linux/kernel/git/kgene/linux-samsung.git;a=commit;h=d67
d303c159aca6db11fb9a03068f52cbf7c145d




> Signed-off-by : Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by : Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-s5pv210/include/mach/gpio.h |   10 ++++++++--
>  1 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv210/include/mach/gpio.h b/arch/arm/mach-
> s5pv210/include/mach/gpio.h
> index d6461ba..33a9867 100644
> --- a/arch/arm/mach-s5pv210/include/mach/gpio.h
> +++ b/arch/arm/mach-s5pv210/include/mach/gpio.h
> @@ -52,6 +52,8 @@
>  #define S5PV210_GPIO_MP01_NR	(8)
>  #define S5PV210_GPIO_MP02_NR	(4)
>  #define S5PV210_GPIO_MP03_NR	(8)
> +#define S5PV210_GPIO_MP04_NR	(8)
> +#define S5PV210_GPIO_MP05_NR	(8)
> 
>  /* GPIO bank numbers */
> 
> @@ -94,6 +96,8 @@ enum s5p_gpio_number {
>  	S5PV210_GPIO_MP01_START	= S5PV210_GPIO_NEXT(S5PV210_GPIO_J4),
>  	S5PV210_GPIO_MP02_START	= S5PV210_GPIO_NEXT(S5PV210_GPIO_MP01),
>  	S5PV210_GPIO_MP03_START	= S5PV210_GPIO_NEXT(S5PV210_GPIO_MP02),
> +	S5PV210_GPIO_MP04_START	= S5PV210_GPIO_NEXT(S5PV210_GPIO_MP03),
> +	S5PV210_GPIO_MP05_START	= S5PV210_GPIO_NEXT(S5PV210_GPIO_MP04),
>  };
> 
>  /* S5PV210 GPIO number definitions */
> @@ -127,13 +131,15 @@ enum s5p_gpio_number {
>  #define S5PV210_MP01(_nr)	(S5PV210_GPIO_MP01_START + (_nr))
>  #define S5PV210_MP02(_nr)	(S5PV210_GPIO_MP02_START + (_nr))
>  #define S5PV210_MP03(_nr)	(S5PV210_GPIO_MP03_START + (_nr))
> +#define S5PV210_MP04(_nr)	(S5PV210_GPIO_MP04_START + (_nr))
> +#define S5PV210_MP05(_nr)	(S5PV210_GPIO_MP05_START + (_nr))
> 
>  /* the end of the S5PV210 specific gpios */
> -#define S5PV210_GPIO_END	(S5PV210_MP03(S5PV210_GPIO_MP03_NR) + 1)
> +#define S5PV210_GPIO_END	(S5PV210_MP05(S5PV210_GPIO_MP05_NR) + 1)
>  #define S3C_GPIO_END		S5PV210_GPIO_END
> 
>  /* define the number of gpios we need to the one after the MP03() range */
> -#define ARCH_NR_GPIOS		(S5PV210_MP03(S5PV210_GPIO_MP03_NR) +
\
> +#define ARCH_NR_GPIOS		(S5PV210_MP05(S5PV210_GPIO_MP05_NR) +
\
>  				 CONFIG_SAMSUNG_GPIO_EXTRA + 1)
> 
>  #include <asm-generic/gpio.h>
> 


Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
