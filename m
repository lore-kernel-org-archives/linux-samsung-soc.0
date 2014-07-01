From: Tobias Jakobi <liquid.acid@gmx.net>
Subject: Re: [PATCH 4/7] Exynos: add support for 'domain-always-on' property
Date: Tue, 01 Jul 2014 10:52:14 +0200
Message-ID: <53B276BE.2090509@gmx.net>
References: <1404202211-15788-1-git-send-email-m.szyprowski@samsung.com> <1404202211-15788-5-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.15]:50381 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754762AbaGAIw0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Jul 2014 04:52:26 -0400
In-Reply-To: <1404202211-15788-5-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Daniel Drake <drake@endlessm.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>, Tomasz Figa <t.figa@samsung.com>

Hello Marek,

I think you had a similar patch in the tizen tree, but according to
Tomasz Figa, it was considered a hack. I don't quite see how this is
different.

Also, if I have been following the discussion correctly, then the
powerdomain issue essentially is about the question which SoC block
needs the LCD0 domain and how the proper power on/off sequences should
look like.

At least the mixer power issue, which I pointed out some time ago, seems
to be deal with now:
https://git.kernel.org/cgit/linux/kernel/git/daeinki/drm-exynos.git/commit/?h=exynos-drm-next&id=381be025ac1a6dc8efebdf146ced0d4a6007f77b

With best wishes,
Tobias




Marek Szyprowski wrote:
> This patch adds support for domain-always-on property to Exynos power
> domain driver. Domains with this property as always kept enabled.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  Documentation/devicetree/bindings/arm/exynos/power_domain.txt | 2 ++
>  arch/arm/mach-exynos/pm_domains.c                             | 6 +++++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
> index 5216b419016a..b25d9b1ce471 100644
> --- a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
> +++ b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
> @@ -8,6 +8,8 @@ Required Properties:
>      * samsung,exynos4210-pd - for exynos4210 type power domain.
>  - reg: physical base address of the controller and length of memory mapped
>      region.
> +Optional properties:
> +- domain-always-on:	keeps the domain always enabled
>  
>  Node of a device using power domains must have a samsung,power-domain property
>  defined with a phandle to respective power domain.
> diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-exynos/pm_domains.c
> index fe6570ebbdde..279b008de02f 100644
> --- a/arch/arm/mach-exynos/pm_domains.c
> +++ b/arch/arm/mach-exynos/pm_domains.c
> @@ -151,6 +151,7 @@ static __init int exynos4_pm_init_power_domain(void)
>  	struct device_node *np;
>  
>  	for_each_compatible_node(np, NULL, "samsung,exynos4210-pd") {
> +		struct dev_power_governor *gov = NULL;
>  		struct exynos_pm_domain *pd;
>  		int on;
>  
> @@ -163,6 +164,9 @@ static __init int exynos4_pm_init_power_domain(void)
>  			return -ENOMEM;
>  		}
>  
> +		if (of_property_read_bool(np, "domain-always-on"))
> +			gov = &pm_domain_always_on_gov;
> +
>  		pd->pd.name = kstrdup(np->name, GFP_KERNEL);
>  		pd->name = pd->pd.name;
>  		pd->base = of_iomap(np, 0);
> @@ -174,7 +178,7 @@ static __init int exynos4_pm_init_power_domain(void)
>  
>  		on = __raw_readl(pd->base + 0x4) & S5P_INT_LOCAL_PWR_EN;
>  
> -		pm_genpd_init(&pd->pd, NULL, !on);
> +		pm_genpd_init(&pd->pd, gov, !on);
>  	}
>  
>  	bus_register_notifier(&platform_bus_type, &platform_nb);
> 
