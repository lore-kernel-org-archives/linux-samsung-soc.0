From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] ARM: EXYNOS: call scu_enable() only in case of cortex-A9 processor
Date: Fri, 31 May 2013 08:14:22 -0700
Message-ID: <CAD=FV=WvRydOHZTciwOEbQ6--+sd4qYSdiypUDwm2hWGDHZSKw@mail.gmail.com>
References: <1369993395-6185-1-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f45.google.com ([209.85.215.45]:37635 "EHLO
	mail-la0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753409Ab3EaPOY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 31 May 2013 11:14:24 -0400
Received: by mail-la0-f45.google.com with SMTP id fr10so1475606lab.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 May 2013 08:14:23 -0700 (PDT)
In-Reply-To: <1369993395-6185-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Olof Johansson <olof@lixom.net>

Leela,

On Fri, May 31, 2013 at 2:43 AM, Leela Krishna Amudala
<l.krishna@samsung.com> wrote:
> This patch reads the cpuid part number and if it matches with
> cortex-A9, calls scu_enable()
>
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>  arch/arm/mach-exynos/platsmp.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
> index a0e8ff7..d9c6d0a 100644
> --- a/arch/arm/mach-exynos/platsmp.c
> +++ b/arch/arm/mach-exynos/platsmp.c
> @@ -200,7 +200,7 @@ static void __init exynos_smp_prepare_cpus(unsigned int max_cpus)
>  {
>         int i;
>
> -       if (!(soc_is_exynos5250() || soc_is_exynos5440()))
> +       if (read_cpuid_part_number() == ARM_CPU_PART_CORTEX_A9)
>                 scu_enable(scu_base_addr());
>
>         /*

Thanks for sending upstream.  For reference, our local version is here
<https://gerrit.chromium.org/gerrit/#/c/56804/>.

This is much better than listing every single non-A9 exynos in a big
"if" test.  ;)

Reviewed-by: Doug Anderson <dianders@chromium.org>
