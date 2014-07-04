From: Sachin Kamat <spk.linux@gmail.com>
Subject: Re: [PATCH] ARM: EXYNOS: Fix the check for non-smp configuration
Date: Fri, 4 Jul 2014 14:27:27 +0530
Message-ID: <CAK5sBcEicy++xayNEXipQEd_4ZzpaD8MRnwxS74qi3RA4R-mpA@mail.gmail.com>
References: <1404363812-26307-1-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f182.google.com ([209.85.217.182]:50675 "EHLO
	mail-lb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753236AbaGDI52 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Jul 2014 04:57:28 -0400
Received: by mail-lb0-f182.google.com with SMTP id c11so968879lbj.13
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Jul 2014 01:57:27 -0700 (PDT)
In-Reply-To: <1404363812-26307-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <a.kesavan@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, kesavan.abhilash@gmail.com

On Thu, Jul 3, 2014 at 10:33 AM, Abhilash Kesavan <a.kesavan@samsung.com> wrote:
> Commit 1754c42e3db5("ARM: exynos: move sysram info to exynos.c") missed
> out the CONFIG_ prefix causing exynos_sysram_init() to get called twice
> for SMP configurations.
>
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> ---
>  arch/arm/mach-exynos/exynos.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
> index f38cf7c..95cad25 100644
> --- a/arch/arm/mach-exynos/exynos.c
> +++ b/arch/arm/mach-exynos/exynos.c
> @@ -297,7 +297,7 @@ static void __init exynos_dt_machine_init(void)
>          * This is called from smp_prepare_cpus if we've built for SMP, but
>          * we still need to set it up for PM and firmware ops if not.
>          */
> -       if (!IS_ENABLED(SMP))
> +       if (!IS_ENABLED(CONFIG_SMP))
>                 exynos_sysram_init();
>
>         exynos_cpuidle_init();

If it's not too late
Reviewed-by: Sachin Kamat <sachin.kamat@samsug.com>

-- 
Regards,
Sachin.
