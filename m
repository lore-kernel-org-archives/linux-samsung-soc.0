From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 3/3] ARM: EXYNOS: add CPU_METHOD_OF_DECLARE for exynos
 SoCs
Date: Sat, 10 Dec 2016 13:13:04 +0200
Message-ID: <20161210111304.GB24432@kozik-lap>
References: <1481366762-26413-1-git-send-email-pankaj.dubey@samsung.com>
 <1481366762-26413-4-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33955 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751388AbcLJLNK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 10 Dec 2016 06:13:10 -0500
Received: by mail-wm0-f65.google.com with SMTP id g23so1523580wme.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Dec 2016 03:13:09 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1481366762-26413-4-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, krzk@kernel.org, kgene@kernel.org, javier@osg.samsung.com, thomas.ab@samsung.com

On Sat, Dec 10, 2016 at 04:16:02PM +0530, Pankaj Dubey wrote:
> Add CPU_METHOD_OF_DECLARE to use enable_method property of
> cpus node. To keep compatibility with older DTBs lets keep
> older method of registering smp_ops via machine_descriptor.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  arch/arm/mach-exynos/platsmp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
> index 94405c7..43eec10 100644
> --- a/arch/arm/mach-exynos/platsmp.c
> +++ b/arch/arm/mach-exynos/platsmp.c
> @@ -474,3 +474,5 @@ const struct smp_operations exynos_smp_ops __initconst = {
>  	.cpu_die		= exynos_cpu_die,
>  #endif
>  };
> +
> +CPU_METHOD_OF_DECLARE(exynos_smp, "samsung,exynos-smp", &exynos_smp_ops);

Are you sure that smp_ops from DT will be set after mdesc->smp? The
arm_dt_init_cpu_maps() is called before smp_set_ops(mdesc->smp)... Have
you actually tried this?

Best regards,
Krzysztof
