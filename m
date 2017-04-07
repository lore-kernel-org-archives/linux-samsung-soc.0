From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v9 01/12] ARM: EXYNOS: refactor firmware specific routines
Date: Fri, 7 Apr 2017 09:45:23 +0200
Message-ID: <CAJKOXPfvD+Rm+pxvOMe8TefWsYZW4gvj0ZnXNtwOovkjzKFGCQ@mail.gmail.com>
References: <CGME20170330131419epcas5p4ac36250d3a9225643e327e60f47956c2@epcas5p4.samsung.com>
 <1490879826-16754-1-git-send-email-pankaj.dubey@samsung.com> <1490879826-16754-2-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:59202 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754189AbdDGHp2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 7 Apr 2017 03:45:28 -0400
Received: from mail.kernel.org (localhost [127.0.0.1])
        by mail.kernel.org (Postfix) with ESMTP id 4EEEB2022A
        for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Apr 2017 07:45:26 +0000 (UTC)
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com [209.85.214.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 509AF20272
        for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Apr 2017 07:45:24 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id 19so18902500itj.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Apr 2017 00:45:24 -0700 (PDT)
In-Reply-To: <1490879826-16754-2-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arnd@arndb.de, Marek Szyprowski <m.szyprowski@samsung.com>, kgene@kernel.org, m.reichl@fivetechno.de, a.hajda@samsung.com, cwchoi00@gmail.com, Javier Martinez Canillas <javier@osg.samsung.com>

On Thu, Mar 30, 2017 at 3:16 PM, Pankaj Dubey <pankaj.dubey@samsung.com> wrote:
> To remove dependency on soc_is_exynosMMMM macros and remove multiple
> checks for such macros, let's refactor code in firmware.c file.
> SoC specific firmware_ops are separated and registered during
> exynos_firmware_init based on matching machine compatible.
>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  arch/arm/mach-exynos/firmware.c | 114 +++++++++++++++++++++++++++++++---------
>  1 file changed, 89 insertions(+), 25 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/firmware.c b/arch/arm/mach-exynos/firmware.c
> index e81a78b..b04c47a 100644
> --- a/arch/arm/mach-exynos/firmware.c
> +++ b/arch/arm/mach-exynos/firmware.c
> @@ -35,6 +35,25 @@ static void exynos_save_cp15(void)
>              : : "cc");
>  }
>
> +static int exynos3250_do_idle(unsigned long mode)
> +{
> +       switch (mode) {
> +       case FW_DO_IDLE_AFTR:
> +               writel_relaxed(virt_to_phys(exynos_cpu_resume_ns),
> +                              sysram_ns_base_addr + 0x24);
> +               writel_relaxed(EXYNOS_AFTR_MAGIC, sysram_ns_base_addr + 0x20);
> +               flush_cache_all();
> +               exynos_smc(SMC_CMD_SAVE, OP_TYPE_CORE,
> +                               SMC_POWERSTATE_IDLE, 0);
> +               exynos_smc(SMC_CMD_SHUTDOWN, OP_TYPE_CLUSTER,
> +                               SMC_POWERSTATE_IDLE, 0);
> +               break;
> +       case FW_DO_IDLE_SLEEP:
> +               exynos_smc(SMC_CMD_SLEEP, 0, 0, 0);
> +       }
> +       return 0;
> +}
> +
>  static int exynos_do_idle(unsigned long mode)
>  {
>         switch (mode) {
> @@ -44,14 +63,7 @@ static int exynos_do_idle(unsigned long mode)
>                 writel_relaxed(__pa_symbol(exynos_cpu_resume_ns),
>                                sysram_ns_base_addr + 0x24);
>                 writel_relaxed(EXYNOS_AFTR_MAGIC, sysram_ns_base_addr + 0x20);
> -               if (soc_is_exynos3250()) {
> -                       flush_cache_all();
> -                       exynos_smc(SMC_CMD_SAVE, OP_TYPE_CORE,
> -                                  SMC_POWERSTATE_IDLE, 0);
> -                       exynos_smc(SMC_CMD_SHUTDOWN, OP_TYPE_CLUSTER,
> -                                  SMC_POWERSTATE_IDLE, 0);
> -               } else
> -                       exynos_smc(SMC_CMD_CPU0AFTR, 0, 0, 0);
> +               exynos_smc(SMC_CMD_CPU0AFTR, 0, 0, 0);
>                 break;
>         case FW_DO_IDLE_SLEEP:
>                 exynos_smc(SMC_CMD_SLEEP, 0, 0, 0);
> @@ -59,28 +71,25 @@ static int exynos_do_idle(unsigned long mode)
>         return 0;
>  }
>
> -static int exynos_cpu_boot(int cpu)
> +static int exynos4212_cpu_boot(int cpu)
>  {
>         /*
> -        * Exynos3250 doesn't need to send smc command for secondary CPU boot
> -        * because Exynos3250 removes WFE in secure mode.
> -        */
> -       if (soc_is_exynos3250())
> -               return 0;
> -
> -       /*
>          * The second parameter of SMC_CMD_CPU1BOOT command means CPU id.
>          * But, Exynos4212 has only one secondary CPU so second parameter
>          * isn't used for informing secure firmware about CPU id.
>          */
> -       if (soc_is_exynos4212())
> -               cpu = 0;
> +       cpu = 0;

The comment above is clear enough so I think there is no need for this
assignment. Just use 0 as argument in exynos_smc().

Rest looks good so with this change:
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
