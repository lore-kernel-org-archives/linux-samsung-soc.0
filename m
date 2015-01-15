From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v3 2/7] ARM: Exynos: add support for sub-power domains
Date: Thu, 15 Jan 2015 10:52:59 +0100
Message-ID: <54B78DFB.9010305@samsung.com>
References: <1421243091-10778-1-git-send-email-m.szyprowski@samsung.com>
 <1421243091-10778-3-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:52266 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751938AbbAOJxE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Jan 2015 04:53:04 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NI70048YQB5GR50@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 15 Jan 2015 09:57:05 +0000 (GMT)
In-reply-to: <1421243091-10778-3-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, kyungmin.park@samsung.com, Ulf Hansson <ulf.hansson@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Amit Daniel Kachhap <amit.daniel@samsung.com>

Hello All,

I'm sorry for missing some CC: in this patch, when I posted v3 to 
mailing list.
It looks that CC: lines got lost after git am + git format-patch.

Ulf, could you also ack this patch, so Kukjin can finally merge the whole
series to Samsung kernel tree?


On 2015-01-14 14:44, Marek Szyprowski wrote:
> This patch adds support for making one power domain a sub-domain of
> other domain. This is useful for modeling power dependences for devices
> like TV Mixer or Camera ISP, which needs to have more than one power
> domain enabled to be operational.
>
> Based on previous work by Amit Daniel Kachhap <amit.daniel@samsung.com>.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   .../bindings/arm/exynos/power_domain.txt           |  2 ++
>   arch/arm/mach-exynos/pm_domains.c                  | 28 ++++++++++++++++++++++
>   2 files changed, 30 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
> index f4445e5..1e09703 100644
> --- a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
> +++ b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
> @@ -22,6 +22,8 @@ Optional Properties:
>   	- pclkN, clkN: Pairs of parent of input clock and input clock to the
>   		devices in this power domain. Maximum of 4 pairs (N = 0 to 3)
>   		are supported currently.
> +- power-domains: phandle pointing to the parent power domain, for more details
> +		 see Documentation/devicetree/bindings/power/power_domain.txt
>   
>   Node of a device using power domains must have a power-domains property
>   defined with a phandle to respective power domain.
> diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-exynos/pm_domains.c
> index 20f2671..37266a8 100644
> --- a/arch/arm/mach-exynos/pm_domains.c
> +++ b/arch/arm/mach-exynos/pm_domains.c
> @@ -161,6 +161,34 @@ no_clk:
>   		of_genpd_add_provider_simple(np, &pd->pd);
>   	}
>   
> +	/* Assign the child power domains to their parents */
> +	for_each_compatible_node(np, NULL, "samsung,exynos4210-pd") {
> +		struct generic_pm_domain *child_domain, *parent_domain;
> +		struct of_phandle_args args;
> +
> +		args.np = np;
> +		args.args_count = 0;
> +		child_domain = of_genpd_get_from_provider(&args);
> +		if (!child_domain)
> +			continue;
> +
> +		if (of_parse_phandle_with_args(np, "power-domains",
> +					 "#power-domain-cells", 0, &args) != 0)
> +			continue;
> +
> +		parent_domain = of_genpd_get_from_provider(&args);
> +		if (!parent_domain)
> +			continue;
> +
> +		if (pm_genpd_add_subdomain(parent_domain, child_domain))
> +			pr_warn("%s failed to add subdomain: %s\n",
> +				parent_domain->name, child_domain->name);
> +		else
> +			pr_info("%s has as child subdomain: %s.\n",
> +				parent_domain->name, child_domain->name);
> +		of_node_put(np);
> +	}
> +
>   	return 0;
>   }
>   arch_initcall(exynos4_pm_init_power_domain);

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
