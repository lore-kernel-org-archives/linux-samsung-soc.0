From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: SAMSUNG: Remove unnecessary exynos4_default_sdhci*()
Date: Mon, 19 Aug 2013 05:24:10 +0900
Message-ID: <52112D6A.9090102@samsung.com>
References: <004d01ce80f1$33533d90$99f9b8b0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:43371 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754710Ab3HRUYN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 18 Aug 2013 16:24:13 -0400
Received: by mail-pa0-f44.google.com with SMTP id fz6so3843097pac.17
        for <linux-samsung-soc@vger.kernel.org>; Sun, 18 Aug 2013 13:24:13 -0700 (PDT)
In-Reply-To: <004d01ce80f1$33533d90$99f9b8b0$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org

On 07/15/13 09:21, Jingoo Han wrote:
> Commit 17397a2("ARM: EXYNOS: Remove platform device initialization")
> removes calling exynos4_default_sdhci*() functions; thus, these are
> not necessary any more.
>
> Signed-off-by: Jingoo Han<jg1.han@samsung.com>
> ---
>   arch/arm/plat-samsung/include/plat/sdhci.h |   38 ----------------------------
>   1 file changed, 38 deletions(-)
>
> diff --git a/arch/arm/plat-samsung/include/plat/sdhci.h b/arch/arm/plat-samsung/include/plat/sdhci.h
> index ce1d0f7..bf65021 100644
> --- a/arch/arm/plat-samsung/include/plat/sdhci.h
> +++ b/arch/arm/plat-samsung/include/plat/sdhci.h
> @@ -260,44 +260,6 @@ static inline void s5pv210_default_sdhci3(void) { }
>
>   #endif /* CONFIG_S5PV210_SETUP_SDHCI */
>
> -/* EXYNOS4 SDHCI setup */
> -#ifdef CONFIG_EXYNOS4_SETUP_SDHCI
> -static inline void exynos4_default_sdhci0(void)
> -{
> -#ifdef CONFIG_S3C_DEV_HSMMC
> -	s3c_hsmmc0_def_platdata.cfg_gpio = exynos4_setup_sdhci0_cfg_gpio;
> -#endif
> -}
> -
> -static inline void exynos4_default_sdhci1(void)
> -{
> -#ifdef CONFIG_S3C_DEV_HSMMC1
> -	s3c_hsmmc1_def_platdata.cfg_gpio = exynos4_setup_sdhci1_cfg_gpio;
> -#endif
> -}
> -
> -static inline void exynos4_default_sdhci2(void)
> -{
> -#ifdef CONFIG_S3C_DEV_HSMMC2
> -	s3c_hsmmc2_def_platdata.cfg_gpio = exynos4_setup_sdhci2_cfg_gpio;
> -#endif
> -}
> -
> -static inline void exynos4_default_sdhci3(void)
> -{
> -#ifdef CONFIG_S3C_DEV_HSMMC3
> -	s3c_hsmmc3_def_platdata.cfg_gpio = exynos4_setup_sdhci3_cfg_gpio;
> -#endif
> -}
> -
> -#else
> -static inline void exynos4_default_sdhci0(void) { }
> -static inline void exynos4_default_sdhci1(void) { }
> -static inline void exynos4_default_sdhci2(void) { }
> -static inline void exynos4_default_sdhci3(void) { }
> -
> -#endif /* CONFIG_EXYNOS4_SETUP_SDHCI */
> -
>   static inline void s3c_sdhci_setname(int id, char *name)
>   {
>   	switch (id) {

Looks good to me, applied.

Thanks,
Kukjin
