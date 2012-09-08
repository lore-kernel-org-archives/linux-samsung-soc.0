From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 2/3] ARM: EXYNOS: pm_domain: Fix power domain name initialization
Date: Sat, 8 Sep 2012 13:37:59 +0530
Message-ID: <CAJuYYwQWEN3FiNwQdugeKRV53cA65WdW79trcmP2kqqOPbz+sg@mail.gmail.com>
References: <1346924286-9584-1-git-send-email-t.figa@samsung.com>
	<1346924286-9584-3-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:64455 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751712Ab2IHIIA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 8 Sep 2012 04:08:00 -0400
Received: by vbbff1 with SMTP id ff1so405122vbb.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 08 Sep 2012 01:07:59 -0700 (PDT)
In-Reply-To: <1346924286-9584-3-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, rjw@sisk.pl

On 6 September 2012 15:08, Tomasz Figa <t.figa@samsung.com> wrote:
> This patch adds initialization of name field in generic power domain
> struct.
>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos/pm_domains.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-exynos/pm_domains.c
> index d1abc1a..5b7ce7e 100644
> --- a/arch/arm/mach-exynos/pm_domains.c
> +++ b/arch/arm/mach-exynos/pm_domains.c
> @@ -98,7 +98,8 @@ static __init int exynos_pm_dt_parse_domains(void)
>                         return -ENOMEM;
>                 }
>
> -               pd->name = np->name;
> +               pd->pd.name = kstrdup(np->name, GFP_KERNEL);
> +               pd->name = pd->pd.name;

Since device tree blob is always resident, why not just use np->name
instead of copying it to a new place?

>                 pd->base = of_iomap(np, 0);
>                 pd->pd.power_off = exynos_pd_power_off;
>                 pd->pd.power_on = exynos_pd_power_on;
> --
> 1.7.12
>
