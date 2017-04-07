From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v9 02/12] ARM: EXYNOS: remove usage of soc_is_exynosMMMM
 from pm.c
Date: Fri, 7 Apr 2017 10:24:41 +0200
Message-ID: <CAJKOXPcDO_4JonsxoywQq_D_AcWQsP8NnAsFMw1VsAhOgjLW0g@mail.gmail.com>
References: <CGME20170330131421epcas5p40b0ad9c1003d3ab807667ae2b05d25bc@epcas5p4.samsung.com>
 <1490879826-16754-1-git-send-email-pankaj.dubey@samsung.com> <1490879826-16754-3-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:36204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753730AbdDGIYp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 7 Apr 2017 04:24:45 -0400
Received: from mail.kernel.org (localhost [127.0.0.1])
        by mail.kernel.org (Postfix) with ESMTP id 8ECDD202A1
        for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Apr 2017 08:24:43 +0000 (UTC)
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com [209.85.214.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3DDFA2024C
        for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Apr 2017 08:24:42 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id a140so39266427ita.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Apr 2017 01:24:42 -0700 (PDT)
In-Reply-To: <1490879826-16754-3-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arnd@arndb.de, Marek Szyprowski <m.szyprowski@samsung.com>, kgene@kernel.org, m.reichl@fivetechno.de, a.hajda@samsung.com, cwchoi00@gmail.com, Javier Martinez Canillas <javier@osg.samsung.com>

On Thu, Mar 30, 2017 at 3:16 PM, Pankaj Dubey <pankaj.dubey@samsung.com> wrote:
> soc_is_exynosMMMM is staged for removal after adopting to exynos-chipid
> driver, so let's remove/minimize usage of any such helper function usage
> from pm.c.
>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  arch/arm/mach-exynos/pm.c                   | 22 ++++++++++++----------
>  include/linux/soc/samsung/exynos-regs-pmu.h |  3 +++
>  2 files changed, 15 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
> index 1a7e5b5..4a73b02 100644
> --- a/arch/arm/mach-exynos/pm.c
> +++ b/arch/arm/mach-exynos/pm.c
> @@ -123,11 +123,13 @@ int exynos_pm_central_resume(void)
>  }
>
>  /* Ext-GIC nIRQ/nFIQ is the only wakeup source in AFTR */
> -static void exynos_set_wakeupmask(long mask)
> +static void exynos_set_wakeupmask(void)
>  {
> -       pmu_raw_writel(mask, S5P_WAKEUP_MASK);
> -       if (soc_is_exynos3250())
> +       if (of_machine_is_compatible("samsung,exynos3250")) {
> +               pmu_raw_writel(EXYNOS3_WAKEUP_MASK_VAL, S5P_WAKEUP_MASK);
>                 pmu_raw_writel(0x0, S5P_WAKEUP_MASK2);
> +       } else
> +               pmu_raw_writel(EXYNOS_WAKEUP_MASK_VAL, S5P_WAKEUP_MASK);

You need {} around this too. Checkpatch should complain about it as
well so be sure to run it.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
