From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 1/3] ARM: EXYNOS: pm_domain: Detect domain state on
 registration from DT
Date: Sat, 8 Sep 2012 13:36:36 +0530
Message-ID: <CAJuYYwTtBmqZZNjPL-Z=9EOtEVMnFei-qYd4SL6Cx3nUqLRXvw@mail.gmail.com>
References: <1346924286-9584-1-git-send-email-t.figa@samsung.com>
	<1346924286-9584-2-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:63836 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751712Ab2IHIGh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 8 Sep 2012 04:06:37 -0400
Received: by vbbff1 with SMTP id ff1so403779vbb.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 08 Sep 2012 01:06:36 -0700 (PDT)
In-Reply-To: <1346924286-9584-2-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, rjw@sisk.pl

On 6 September 2012 15:08, Tomasz Figa <t.figa@samsung.com> wrote:
> Initial state of power domains might vary on different boards and with
> different bootloaders. This patch adds detection of initial state of
> power domains when being registered from DT.
>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  Documentation/devicetree/bindings/arm/exynos/power_domain.txt | 4 ----
>  arch/arm/mach-exynos/pm_domains.c                             | 8 +++++---
>  2 files changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
> index 6528e21..843b546 100644
> --- a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
> +++ b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
> @@ -9,10 +9,6 @@ Required Properties:
>  - reg: physical base address of the controller and length of memory mapped
>      region.
>
> -Optional Properties:
> -- samsung,exynos4210-pd-off: Specifies that the power domain is in turned-off
> -    state during boot and remains to be turned-off until explicitly turned-on.
> -
>  Example:
>
>         lcd0: power-domain-lcd0 {
> diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-exynos/pm_domains.c
> index c0bc83a..d1abc1a 100644
> --- a/arch/arm/mach-exynos/pm_domains.c
> +++ b/arch/arm/mach-exynos/pm_domains.c
> @@ -89,6 +89,7 @@ static __init int exynos_pm_dt_parse_domains(void)
>
>         for_each_compatible_node(np, NULL, "samsung,exynos4210-pd") {
>                 struct exynos_pm_domain *pd;
> +               int on;
>
>                 pd = kzalloc(sizeof(*pd), GFP_KERNEL);
>                 if (!pd) {
> @@ -97,14 +98,15 @@ static __init int exynos_pm_dt_parse_domains(void)
>                         return -ENOMEM;
>                 }
>
> -               if (of_get_property(np, "samsung,exynos4210-pd-off", NULL))
> -                       pd->is_off = true;
>                 pd->name = np->name;
>                 pd->base = of_iomap(np, 0);
>                 pd->pd.power_off = exynos_pd_power_off;
>                 pd->pd.power_on = exynos_pd_power_on;
>                 pd->pd.of_node = np;
> -               pm_genpd_init(&pd->pd, NULL, false);
> +
> +               on = __raw_readl(pd->base + 0x4) & S5P_INT_LOCAL_PWR_EN;
> +
> +               pm_genpd_init(&pd->pd, NULL, !on);
>         }
>         return 0;
>  }

Acked-by: Thomas Abraham <thomas.abraham@linaro.org>
