From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v9 08/12] ARM: EXYNOS: move exynos_boot_vector_{addr,flag}
 ops to exynos_s2r_data
Date: Fri, 7 Apr 2017 12:32:48 +0200
Message-ID: <CAJKOXPeFhmcscCX-so5qSx9pdX8oEmC+-283HO+J3vJNvWr_Hg@mail.gmail.com>
References: <CGME20170330131436epcas1p4a4f8bf7b64b4a5ff9ee692adc4e7d001@epcas1p4.samsung.com>
 <1490879826-16754-1-git-send-email-pankaj.dubey@samsung.com> <1490879826-16754-9-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:56294 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753754AbdDGKcx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 7 Apr 2017 06:32:53 -0400
Received: from mail.kernel.org (localhost [127.0.0.1])
        by mail.kernel.org (Postfix) with ESMTP id E109120260
        for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Apr 2017 10:32:51 +0000 (UTC)
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com [209.85.214.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8658A2025B
        for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Apr 2017 10:32:49 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id a140so40552972ita.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Apr 2017 03:32:49 -0700 (PDT)
In-Reply-To: <1490879826-16754-9-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arnd@arndb.de, Marek Szyprowski <m.szyprowski@samsung.com>, kgene@kernel.org, m.reichl@fivetechno.de, a.hajda@samsung.com, cwchoi00@gmail.com, Javier Martinez Canillas <javier@osg.samsung.com>

On Thu, Mar 30, 2017 at 3:17 PM, Pankaj Dubey <pankaj.dubey@samsung.com> wrote:
> Various Exynos SoC needs different boot addresses and flags. Currently we
> are handling this difference by adding lots of soc_is_exynosMMM checks in
> the code, in an attempt to remove the dependency of such helper functions
> specific to each SoC, let's separate helper functions for these helper
> functions by moving them into SoC specific hooks in struct exynos_s2r_data.
>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  arch/arm/mach-exynos/pm.c | 60 +++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 50 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
> index fa24098..c3fa537 100644
> --- a/arch/arm/mach-exynos/pm.c
> +++ b/arch/arm/mach-exynos/pm.c
> @@ -32,26 +32,56 @@
>  #include "common.h"
>
>  struct exynos_s2r_data {
> +       void __iomem* (*boot_vector_addr)(void);
> +       void __iomem* (*boot_vector_flag)(void);
>         void (*enter_aftr)(void);
>  };

OK, now I see more uses of this structure so the naming could be
"exynos_pm_data"?

>
>  static const struct exynos_s2r_data *s2r_data;
>
> -static inline void __iomem *exynos_boot_vector_addr(void)
> +static void __iomem *exynos_boot_vector_addr(void)
> +{
> +       if (s2r_data && s2r_data->boot_vector_addr)
> +               return s2r_data->boot_vector_addr();
> +
> +       return NULL;
> +}
> +
> +static inline void __iomem *exynos4210_rev11_boot_vector_addr(void)

Inlines here are mixed up and you are changing them without
explanation in commit msg. Previously the exynos_boot_vector_addr()
was inlined, now not. Okay, I can accept that but please mention this
in commit msg.
But below you are adding new inline functions which are stored as
pointers in ops. This looks both inconsistent with above and incorrect
from logical point of view. How would you like to inline them if they
are referenced through pointer? (okay, compilers are smart and crazy
so maybe they can do it but anyway I am curious how this would look
like).

> +{
> +       return pmu_base_addr + S5P_INFORM7;
> +}
> +
> +static inline void __iomem *exynos4210_rev10_boot_vector_addr(void)
> +{
> +       return sysram_base_addr + 0x24;
> +}
> +
> +static inline void __iomem *exynos_common_boot_vector_addr(void)
>  {
> -       if (samsung_rev() == EXYNOS4210_REV_1_1)
> -               return pmu_base_addr + S5P_INFORM7;
> -       else if (samsung_rev() == EXYNOS4210_REV_1_0)
> -               return sysram_base_addr + 0x24;
>         return pmu_base_addr + S5P_INFORM0;
>  }
>
> -static inline void __iomem *exynos_boot_vector_flag(void)
> +static void __iomem *exynos_boot_vector_flag(void)

ditto for the flag.

Best regards,
Krzysztof
