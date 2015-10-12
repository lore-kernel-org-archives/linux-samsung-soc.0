From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH] ARM: EXYNOS: Fix double of_node_put() when parsing child
 power domains
Date: Tue, 13 Oct 2015 04:11:02 +0900
Message-ID: <561C05C6.6080105@kernel.org>
References: <1444613217-8926-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444613217-8926-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 10/12/15 10:26, Krzysztof Kozlowski wrote:
> On each next iteration of for_each_compatible_node() the reference
> counter for current device node is already decreased by the loop
> iterator. The manual call to of_node_get() is required only on loop
> break which is not happening here.
> 
> The double of_node_get() (with enabled CONFIG_OF_DYNAMIC) lead to
> decreasing the counter below expected, initial value.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Fixes: fe4034a3fad7 ("ARM: EXYNOS: Add missing of_node_put() when parsing power domains")
> ---
>  arch/arm/mach-exynos/pm_domains.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-exynos/pm_domains.c
> index 4a87e86dec45..7c21760f590f 100644
> --- a/arch/arm/mach-exynos/pm_domains.c
> +++ b/arch/arm/mach-exynos/pm_domains.c
> @@ -200,15 +200,15 @@ no_clk:
>  		args.args_count = 0;
>  		child_domain = of_genpd_get_from_provider(&args);
>  		if (IS_ERR(child_domain))
> -			goto next_pd;
> +			continue;
>  
>  		if (of_parse_phandle_with_args(np, "power-domains",
>  					 "#power-domain-cells", 0, &args) != 0)
> -			goto next_pd;
> +			continue;
>  
>  		parent_domain = of_genpd_get_from_provider(&args);
>  		if (IS_ERR(parent_domain))
> -			goto next_pd;
> +			continue;
>  
>  		if (pm_genpd_add_subdomain(parent_domain, child_domain))
>  			pr_warn("%s failed to add subdomain: %s\n",
> @@ -216,8 +216,6 @@ no_clk:
>  		else
>  			pr_info("%s has as child subdomain: %s.\n",
>  				parent_domain->name, child_domain->name);
> -next_pd:
> -		of_node_put(np);
>  	}
>  
>  	return 0;

Looks good to me, applied.

Thanks,
Kukjin
