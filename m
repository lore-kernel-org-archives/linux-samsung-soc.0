From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 9/9] ARM: EXYNOS: temporary fixup regarding get_core_count()
Date: Wed, 1 Feb 2012 14:58:13 +0900
Message-ID: <CAH9JG2Us-Edqjq2FryX_wdHOkutdGdTzeCWMD2RjqNFCn=P9hA@mail.gmail.com>
References: <1328024354-4277-1-git-send-email-kgene.kim@samsung.com>
	<1328024354-4277-10-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-tul01m020-f174.google.com ([209.85.214.174]:62401 "EHLO
	mail-tul01m020-f174.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753271Ab2BAF6O (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Feb 2012 00:58:14 -0500
Received: by obcva7 with SMTP id va7so852916obc.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Jan 2012 21:58:13 -0800 (PST)
In-Reply-To: <1328024354-4277-10-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rmk+kernel@arm.linux.org.uk, arnd@arndb.de, olof@lixom.net

On 2/1/12, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/mach-exynos/platsmp.c |    9 ++++++---
>  1 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
> index 683aec7..dfb4630 100644
> --- a/arch/arm/mach-exynos/platsmp.c
> +++ b/arch/arm/mach-exynos/platsmp.c
> @@ -165,7 +165,10 @@ void __init smp_init_cpus(void)
>  	void __iomem *scu_base = scu_base_addr();
>  	unsigned int i, ncores;
>
> -	ncores = scu_base ? scu_get_core_count(scu_base) : 1;
> +	if (soc_is_exynos5250())
> +		ncores = 2;
I saw the related mail thread, I wonder then how to handle this at
other A15 board? Device Tree?
> +	else
> +		ncores = scu_base ? scu_get_core_count(scu_base) : 1;
>
>  	/* sanity check */
>  	if (ncores > nr_cpu_ids) {
> @@ -182,8 +185,8 @@ void __init smp_init_cpus(void)
>
>  void __init platform_smp_prepare_cpus(unsigned int max_cpus)
>  {
> -
> -	scu_enable(scu_base_addr());
> +	if (!soc_is_exynos5250())
> +		scu_enable(scu_base_addr());
>
>  	/*
>  	 * Write the address of secondary startup into the
> --
> 1.7.4.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
