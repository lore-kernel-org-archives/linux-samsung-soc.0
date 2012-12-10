From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/5] cpufreq: exynos: Remove unused variable & IS_ERR
Date: Mon, 10 Dec 2012 11:23:50 +0900
Message-ID: <033001cdd67d$64635560$2d2a0020$%kim@samsung.com>
References: <008e01cdd453$afeaff00$0fc0fd00$%choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:40725 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750826Ab2LJCXw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 9 Dec 2012 21:23:52 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MES00IBVMNQ1XG0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Dec 2012 11:23:50 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MES00132MNQ59C0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Dec 2012 11:23:50 +0900 (KST)
In-reply-to: <008e01cdd453$afeaff00$0fc0fd00$%choi@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jonghwan Choi' <jhbird.choi@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Jaecheol Lee' <jc.lee@samsung.com>, "'Rafael J. Wysocki'" <rjw@sisk.pl>, 'Russell King' <linux@arm.linux.org.uk>

Jonghwan Choi wrote:
> 
> The variable 'max_support_idx, min_support_idx, pm_lock_idx"
> are never used, so remove the unused variable.
> 
> Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
> ---
>  arch/arm/mach-exynos/include/mach/cpufreq.h |    3 ---
>  drivers/cpufreq/exynos-cpufreq.c            |    3 +--
>  drivers/cpufreq/exynos4210-cpufreq.c        |   15 +++------------
>  drivers/cpufreq/exynos4x12-cpufreq.c        |    8 --------
>  drivers/cpufreq/exynos5250-cpufreq.c        |    8 --------
>  5 files changed, 4 insertions(+), 33 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/include/mach/cpufreq.h
> b/arch/arm/mach-exynos/include/mach/cpufreq.h
> index 7517c3f..39f0dc6 100644
> --- a/arch/arm/mach-exynos/include/mach/cpufreq.h
> +++ b/arch/arm/mach-exynos/include/mach/cpufreq.h
> @@ -21,9 +21,6 @@ enum cpufreq_level_index {
>  struct exynos_dvfs_info {
>         unsigned long   mpll_freq_khz;
  ^^^^^^^^ ???

Should be tab.

>         unsigned int    pll_safe_idx;
  ^^^^^^^^ ???

Same.

> -       unsigned int    pm_lock_idx;

Same.

> -       unsigned int    max_support_idx;

Same.

> -       unsigned int    min_support_idx;

Same.

Hmm...many white spaces are used at places that tab should be used...it
seems that e-mail client had some problems when you're sending...

Note, you can see following with checkpatch.

WARNING: please, no spaces at the start of a line

[...]

> @@ -289,14 +283,11 @@ int exynos4210_cpufreq_init(struct exynos_dvfs_info
> *info)
>         return 0;
> 
>  err_mout_apll:
> -       if (!IS_ERR(mout_mpll))
> -               clk_put(mout_mpll);
> +       clk_put(mout_mpll);
> "0001-cpufreq-exynos-Remove-unused-variable-IS_ERR.patch" 160L, 5092C
> 1,1           Top

What's this?

> -               clk_put(mout_mpll);
> +       clk_put(mout_mpll);
>  err_mout_mpll:
> -       if (!IS_ERR(moutcore))
> -               clk_put(moutcore);
> +       clk_put(moutcore);
>  err_moutcore:
> -       if (!IS_ERR(cpu_clk))
> -               clk_put(cpu_clk);
> +       clk_put(cpu_clk);
> 
>         pr_debug("%s: failed initialization\n", __func__);
>         return -EINVAL;

[...]

Basically, this whole series' contents look good to me, but need to re-send
:-)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
