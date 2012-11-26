From: Heiko =?iso-8859-15?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 1/2] ARM: S3C2443: introduce soc_is_s3c2443 macro
Date: Mon, 26 Nov 2012 10:02:31 +0100
Message-ID: <201211261002.32043.heiko@sntech.de>
References: <1353919203-24798-1-git-send-email-fenixk19@mail.ru>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:58646 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753713Ab2KZJCf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Nov 2012 04:02:35 -0500
In-Reply-To: <1353919203-24798-1-git-send-email-fenixk19@mail.ru>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexander Varnin <fenixk19@mail.ru>
Cc: linux-samsung-soc@vger.kernel.org, kgene@kernel.org

Am Montag, 26. November 2012, 09:40:02 schrieb Alexander Varnin:
> Signed-off-by: Alexander Varnin <fenixk19@mail.ru>

Acked-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  arch/arm/plat-samsung/include/plat/cpu.h |   10 ++++++++++
>  1 files changed, 10 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/include/plat/cpu.h
> b/arch/arm/plat-samsung/include/plat/cpu.h index ace4451..613f492 100644
> --- a/arch/arm/plat-samsung/include/plat/cpu.h
> +++ b/arch/arm/plat-samsung/include/plat/cpu.h
> @@ -23,6 +23,9 @@ extern unsigned long samsung_cpu_id;
>  #define S3C24XX_CPU_ID		0x32400000
>  #define S3C24XX_CPU_MASK	0xFFF00000
> 
> +#define S3C2443_CPU_ID		0x32443001
> +#define S3C2443_CPU_MASK	0xFFFFFFFF
> +
>  #define S3C6400_CPU_ID		0x36400000
>  #define S3C6410_CPU_ID		0x36410000
>  #define S3C64XX_CPU_MASK	0xFFFFF000
> @@ -52,6 +55,7 @@ static inline int is_samsung_##name(void)	\
>  }
> 
>  IS_SAMSUNG_CPU(s3c24xx, S3C24XX_CPU_ID, S3C24XX_CPU_MASK)
> +IS_SAMSUNG_CPU(s3c2443, S3C2443_CPU_ID, S3C2443_CPU_MASK)
>  IS_SAMSUNG_CPU(s3c6400, S3C6400_CPU_ID, S3C64XX_CPU_MASK)
>  IS_SAMSUNG_CPU(s3c6410, S3C6410_CPU_ID, S3C64XX_CPU_MASK)
>  IS_SAMSUNG_CPU(s5p6440, S5P6440_CPU_ID, S5P64XX_CPU_MASK)
> @@ -72,6 +76,12 @@ IS_SAMSUNG_CPU(exynos5250, EXYNOS5250_SOC_ID,
> EXYNOS5_SOC_MASK) # define soc_is_s3c24xx()	0
>  #endif
> 
> +#if defined(CONFIG_CPU_S3C2443)
> +# define soc_is_s3c2443()	is_samsung_s3c2443()
> +#else
> +# define soc_is_s3c2443()	0
> +#endif
> +
>  #if defined(CONFIG_CPU_S3C6400) || defined(CONFIG_CPU_S3C6410)
>  # define soc_is_s3c64xx()	(is_samsung_s3c6400() || is_samsung_s3c6410())
>  #else
