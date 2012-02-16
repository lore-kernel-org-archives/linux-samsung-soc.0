From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: Hook up G2D PD to generic PD infrastructure
Date: Thu, 16 Feb 2012 21:32:37 +0900
Message-ID: <4F3CF765.4040802@samsung.com>
References: <1329278462-30851-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:38918 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750944Ab2BPMcn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Feb 2012 07:32:43 -0500
Received: by pbcun15 with SMTP id un15so2462862pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Feb 2012 04:32:43 -0800 (PST)
In-Reply-To: <1329278462-30851-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, rjw@sisk.pl, thomas.abraham@linaro.org, patches@linaro.org

On 02/15/12 13:01, Sachin Kamat wrote:
> Add G2D power domain (PD) to generic power domain infrastructure.
>
> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
> ---
>   arch/arm/mach-exynos/pm_domains.c |    3 +++
>   1 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-exynos/pm_domains.c
> index 0b04af2..a84df72 100644
> --- a/arch/arm/mach-exynos/pm_domains.c
> +++ b/arch/arm/mach-exynos/pm_domains.c
> @@ -183,6 +183,9 @@ static __init int exynos4_pm_init_power_domain(void)
>   #ifdef CONFIG_S5P_DEV_CSIS1
>   	exynos_pm_add_dev_to_genpd(&s5p_device_mipi_csis1,&exynos4_pd_cam);
>   #endif
> +#ifdef CONFIG_S5P_DEV_G2D
> +	exynos_pm_add_dev_to_genpd(&s5p_device_g2d,&exynos4_pd_lcd0);
> +#endif
>   	return 0;
>   }
>   arch_initcall(exynos4_pm_init_power_domain);

Hi Sachin,

OK, will apply after pick up other regarding G2D patches for arch/arm/ 
Samsung stuff.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
