From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2] ARM: EXYNOS: Use platform device name as power domain
 name
Date: Wed, 11 Mar 2015 18:56:22 +0900
Message-ID: <55001146.3040304@samsung.com>
References: <1426067672-21589-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:45224 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751732AbbCKJ4Y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Mar 2015 05:56:24 -0400
In-reply-to: <1426067672-21589-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>

On 03/11/2015 06:54 PM, Krzysztof Kozlowski wrote:
> The power domain nodes in DTS may be very generic (e.g. "power-domain"
> for Exynos 5420) making it very hard to debug:
> 
> $ cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
>     domain                      status         slaves
> power-domain                    on
> 
> Use platform device name instead so the names will be a little more user
> friendly:
>     domain                      status         slaves
> 100440e0.power-domain           on
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Suggested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> Suggested-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> ---
> 
> Notes:
>     Changes since v1:
>     1. Add Javier's reviewed-by.
> 
>  arch/arm/mach-exynos/pm_domains.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-exynos/pm_domains.c
> index 37266a826437..84e1d9f4d76c 100644
> --- a/arch/arm/mach-exynos/pm_domains.c
> +++ b/arch/arm/mach-exynos/pm_domains.c
> @@ -125,7 +125,7 @@ static __init int exynos4_pm_init_power_domain(void)
>  			return -ENOMEM;
>  		}
>  
> -		pd->pd.name = kstrdup(np->name, GFP_KERNEL);
> +		pd->pd.name = kstrdup(dev_name(dev), GFP_KERNEL);
>  		pd->name = pd->pd.name;
>  		pd->base = of_iomap(np, 0);
>  		pd->pd.power_off = exynos_pd_power_off;
> 

Looks good to me. This patch is very useful for debug.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

Thanks,
Chanwoo Choi
