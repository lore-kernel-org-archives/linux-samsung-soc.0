From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: pd: fix resource deallocation on error path
Date: Thu, 30 Jul 2015 08:37:07 +0900
Message-ID: <CAJKOXPeWgXR0SuRzZyXHSiewZDuuJXXFmjyWasXDFxDAQUzyqA@mail.gmail.com>
References: <1438200913-10532-1-git-send-email-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f182.google.com ([209.85.220.182]:36488 "EHLO
	mail-qk0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753800AbbG2XhI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Jul 2015 19:37:08 -0400
Received: by qkdv3 with SMTP id v3so12605458qkd.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jul 2015 16:37:08 -0700 (PDT)
In-Reply-To: <1438200913-10532-1-git-send-email-vz@mleia.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>

2015-07-30 5:15 GMT+09:00 Vladimir Zapolskiy <vz@mleia.com>:
> The change fixes a bug introduced by 2be2a3ff42a5, memory allocated
> by kstrdup_const() must be always deallocated with kfree_const(),
> otherwise there is a risk of kfree'ing ro memory.

This looks good. Can you provide also Cc-stable and fixes tags?

>
> Also remove unneeded of_node_put(), if for_each_compatible_node() body
> execution is not terminated, this prevents from double kfree() in
> OF_DYNAMIC build.

Each iteration of for_each_compatible_node() has a check:
(dn = of_find_compatible_node(dn, type, compatible))
this increases the references to 'np'. If loop continues then previous
'np' is not of_node_put().

Best regards,
Krzysztof

>
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
> ---
>  arch/arm/mach-exynos/pm_domains.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-exynos/pm_domains.c
> index 6001f1c..4a87e86 100644
> --- a/arch/arm/mach-exynos/pm_domains.c
> +++ b/arch/arm/mach-exynos/pm_domains.c
> @@ -146,9 +146,8 @@ static __init int exynos4_pm_init_power_domain(void)
>                 pd->base = of_iomap(np, 0);
>                 if (!pd->base) {
>                         pr_warn("%s: failed to map memory\n", __func__);
> -                       kfree(pd->pd.name);
> +                       kfree_const(pd->pd.name);
>                         kfree(pd);
> -                       of_node_put(np);
>                         continue;
>                 }
>
> --
> 2.1.4
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
