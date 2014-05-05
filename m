From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: Re: [PATCH] arm: exynos: add generic function to calculate cpu number
Date: Mon, 5 May 2014 09:37:51 +0530
Message-ID: <CANuQgHGtTFcP1baipTwTTPw_t3JV42nn-Kh4n72_9VRZ8ZwaPA@mail.gmail.com>
References: <1398404653-14407-1-git-send-email-chander.kashyap@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:55355 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750838AbaEEEHw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 May 2014 00:07:52 -0400
Received: by mail-ob0-f172.google.com with SMTP id wp18so204439obc.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 04 May 2014 21:07:51 -0700 (PDT)
In-Reply-To: <1398404653-14407-1-git-send-email-chander.kashyap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chander Kashyap <chander.kashyap@linaro.org>, Chander Kashyap <k.chander@samsung.com>

On 25 April 2014 11:14, Chander Kashyap <chander.kashyap@linaro.org> wrote:
> The address of cpu power registers in pmu is based on cpu number
> offsets. This function calculate the same. This is essentially
> required in case of multicluster SoC's e.g Exynos5420.
>
> Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
> Signed-off-by: Chander Kashyap <k.chander@samsung.com>
> ---
>  arch/arm/mach-exynos/regs-pmu.h |    9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm/mach-exynos/regs-pmu.h b/arch/arm/mach-exynos/regs-pmu.h
> index 4f6a256..217da2e 100644
> --- a/arch/arm/mach-exynos/regs-pmu.h
> +++ b/arch/arm/mach-exynos/regs-pmu.h
> @@ -313,4 +313,13 @@
>
>  #define EXYNOS5_OPTION_USE_RETENTION                           (1 << 4)
>
> +#include <asm/cputype.h>
> +#define MAX_CPUS_IN_CLUSTER    4
> +
> +static inline unsigned int exynos_pmu_cpunr(unsigned int mpidr)
> +{
> +       return ((MPIDR_AFFINITY_LEVEL(mpidr, 1) * MAX_CPUS_IN_CLUSTER)
> +                + MPIDR_AFFINITY_LEVEL(mpidr, 0));
> +}
> +
>  #endif /* __ASM_ARCH_REGS_PMU_H */
> --
> 1.7.9.5
>

Kukjin, Can you please have a look.



-- 
with warm regards,
Chander Kashyap
