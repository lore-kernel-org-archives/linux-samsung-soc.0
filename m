From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v4 8/9] ARM: EXYNOS: rearrange static and non-static
 functions of PMU driver
Date: Thu, 12 Nov 2015 13:39:02 +0900
Message-ID: <564417E6.8070905@samsung.com>
References: <1447155784-12667-1-git-send-email-pankaj.dubey@samsung.com>
 <1447155784-12667-9-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:23204 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753203AbbKLEjF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Nov 2015 23:39:05 -0500
In-reply-to: <1447155784-12667-9-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, thomas.ab@samsung.com, amitdanielk@gmail.com, olof@lixom.net, khilman@linaro.org, arnd@arndb.de

On 10.11.2015 20:43, Pankaj Dubey wrote:
> This patch moves exynos_sys_powerdown_conf function above all
> static functions.

Please (always) describe the reason, the answer to "why?". In this case
I know why, but other reviewers may not and other people grepping
through history definitely won't know.

Best regards,
Krzysztof

> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  arch/arm/mach-exynos/pmu.c | 34 +++++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/pmu.c b/arch/arm/mach-exynos/pmu.c
> index e01bdf1..f300ac9 100644
> --- a/arch/arm/mach-exynos/pmu.c
> +++ b/arch/arm/mach-exynos/pmu.c
> @@ -39,23 +39,6 @@ u32 pmu_raw_readl(u32 offset)
>  	return readl_relaxed(pmu_base_addr + offset);
>  }
>  
> -static void exynos_power_off(void)
> -{
> -	unsigned int tmp;
> -
> -	pr_info("Power down.\n");
> -	tmp = pmu_raw_readl(EXYNOS_PS_HOLD_CONTROL);
> -	tmp ^= (1 << 8);
> -	pmu_raw_writel(tmp, EXYNOS_PS_HOLD_CONTROL);
> -
> -	/* Wait a little so we don't give a false warning below */
> -	mdelay(100);
> -
> -	pr_err("Power down failed, please power off system manually.\n");
> -	while (1)
> -		;
> -}
> -
>  void exynos_sys_powerdown_conf(enum sys_powerdown mode)
>  {
>  	unsigned int i;
> @@ -85,6 +68,23 @@ void exynos_sys_powerdown_conf(enum sys_powerdown mode)
>  	}
>  }
>  
> +static void exynos_power_off(void)
> +{
> +	unsigned int tmp;
> +
> +	pr_info("Power down.\n");
> +	tmp = pmu_raw_readl(EXYNOS_PS_HOLD_CONTROL);
> +	tmp ^= (1 << 8);
> +	pmu_raw_writel(tmp, EXYNOS_PS_HOLD_CONTROL);
> +
> +	/* Wait a little so we don't give a false warning below */
> +	mdelay(100);
> +
> +	pr_err("Power down failed, please power off system manually.\n");
> +	while (1)
> +		;
> +}
> +
>  static int pmu_restart_notify(struct notifier_block *this,
>  		unsigned long code, void *unused)
>  {
> 
