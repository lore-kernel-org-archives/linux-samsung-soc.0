From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: Hook up JPEG PD to generic PD infrastructure
Date: Sat, 10 Mar 2012 02:55:40 -0800
Message-ID: <4F5B332C.3080609@samsung.com>
References: <1329716702-9337-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:39573 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754636Ab2CJKzn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 10 Mar 2012 05:55:43 -0500
Received: by iagz16 with SMTP id z16so3670175iag.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Mar 2012 02:55:43 -0800 (PST)
In-Reply-To: <1329716702-9337-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

On 02/19/12 21:45, Sachin Kamat wrote:
> Add JPEG power domain (PD) to generic power domain infrastructure.
>
> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
> ---
> Hi Kukjin,
> Please apply this over the JPEG platform suport patches for Exynos.
>
OK, applied.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> ---
>   arch/arm/mach-exynos/pm_domains.c |    3 +++
>   1 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-exynos/pm_domains.c
> index 0b04af2..4e8340f 100644
> --- a/arch/arm/mach-exynos/pm_domains.c
> +++ b/arch/arm/mach-exynos/pm_domains.c
> @@ -183,6 +183,9 @@ static __init int exynos4_pm_init_power_domain(void)
>   #ifdef CONFIG_S5P_DEV_CSIS1
>   	exynos_pm_add_dev_to_genpd(&s5p_device_mipi_csis1,&exynos4_pd_cam);
>   #endif
> +#ifdef CONFIG_S5P_DEV_JPEG
> +	exynos_pm_add_dev_to_genpd(&s5p_device_jpeg,&exynos4_pd_cam);
> +#endif
>   	return 0;
>   }
>   arch_initcall(exynos4_pm_init_power_domain);

-- 
