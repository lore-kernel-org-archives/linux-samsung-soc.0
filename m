From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v9 09/12] ARM: EXYNOS: introduce exynos_cpu_info struct
Date: Fri, 7 Apr 2017 12:47:39 +0200
Message-ID: <CAJKOXPddiZ3i9WgW3deg3pQ1CsbxuK1=HtO_DdT-VebTbREKxQ@mail.gmail.com>
References: <CGME20170330131438epcas1p459ce93da17fcd05249eddaef18d5021e@epcas1p4.samsung.com>
 <1490879826-16754-1-git-send-email-pankaj.dubey@samsung.com> <1490879826-16754-10-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:59010 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751759AbdDGKro (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 7 Apr 2017 06:47:44 -0400
Received: from mail.kernel.org (localhost [127.0.0.1])
        by mail.kernel.org (Postfix) with ESMTP id 0B04B202A1
        for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Apr 2017 10:47:43 +0000 (UTC)
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com [209.85.214.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D715920274
        for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Apr 2017 10:47:40 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id a140so40695390ita.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Apr 2017 03:47:40 -0700 (PDT)
In-Reply-To: <1490879826-16754-10-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arnd@arndb.de, Marek Szyprowski <m.szyprowski@samsung.com>, kgene@kernel.org, m.reichl@fivetechno.de, a.hajda@samsung.com, cwchoi00@gmail.com, Javier Martinez Canillas <javier@osg.samsung.com>

On Thu, Mar 30, 2017 at 3:17 PM, Pankaj Dubey <pankaj.dubey@samsung.com> wrote:
> Various Exynos SoC has different CPU related information, such as CPU
> boot register, programming sequence making CPU up/down. Currently this
> is handled by adding lots of soc_is_exynosMMM checks in the code, in
> an attempt to remove the dependency of such helper functions specific to
> each SoC, let's separate this information pertaining to CPU by introducing
> a new "struct exynos_cpu_info". This struct will contain differences
> associated with CPU on various Exynos SoC. This can be matched by using
> generic API "soc_device_match".
>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  arch/arm/mach-exynos/platsmp.c | 146 +++++++++++++++++++++++++++++++++++++----
>  1 file changed, 135 insertions(+), 11 deletions(-)

(...)

>  static int exynos_boot_secondary(unsigned int cpu, struct task_struct *idle)
>  {
>         unsigned long timeout;
> +       const struct soc_device_attribute *match;
>         u32 mpidr = cpu_logical_map(cpu);
>         u32 core_id = MPIDR_AFFINITY_LEVEL(mpidr, 0);
>         int ret = -ENOSYS;
>
> +       if (of_machine_is_compatible("samsung,exynos4210")) {
> +               match = soc_device_match(exynos_soc_revision);
> +               if (match)
> +                       cpu_info = (const struct exynos_cpu_info *) match->data;
> +       }
> +
>         /*
>          * Set synchronisation state between this boot processor
>          * and the secondary one
> @@ -387,6 +499,18 @@ static int exynos_boot_secondary(unsigned int cpu, struct task_struct *idle)
>
>  static void __init exynos_smp_prepare_cpus(unsigned int max_cpus)
>  {
> +       const struct of_device_id *match;
> +       struct device_node *np;
> +
> +       if (!of_machine_is_compatible("samsung,exynos4210")) {

This differentiation is unnatural. It looks like the chipid
soc_device_match driver is not simplifying things but complicating.
Maybe the solution I mentioned in previous mails (initialize these in
proper order from some of machine init calls) would simplify it...

Best regards,
Krzysztof
