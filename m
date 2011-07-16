From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: Exynos4: don't change sclk_audio0 parent in core
 clocks code
Date: Sat, 16 Jul 2011 14:30:50 +0900
Message-ID: <037401cc4379$89f60f90$9de22eb0$%kim@samsung.com>
References: <1309159519-27412-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:33810 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750733Ab1GPFa6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 16 Jul 2011 01:30:58 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOE00HX4VBL4D10@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 16 Jul 2011 14:30:57 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOE00G91VBLSF@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 16 Jul 2011 14:30:57 +0900 (KST)
In-reply-to: <1309159519-27412-1-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Kyungmin Park' <kyungmin.park@samsung.com>

Marek Szyprowski wrote:
> 
> Core clock API code should not change parent clocks set initially by
> the boot-loader. This patch removes implicit sclk_audio0 clock change
> introduced in commit "ARM: EXYNOS4: Add PCM audio support for WM8994"

Since it happens problem on suspend-to-resume with above commit, I reverted
it and under debugging now.
I will be back on this after solving it :)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> (09c60e8). If SMDK board needs such change it should be done in respective
> board startup code or preferably in the boot-loader.
> 
> This patch fixes problems with suspend/resume on Samsung NURI board.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/mach-exynos4/clock.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/clock.c
> index 5091e13..6146c6e 100644
> --- a/arch/arm/mach-exynos4/clock.c
> +++ b/arch/arm/mach-exynos4/clock.c
> @@ -1287,7 +1287,6 @@ void __init_or_cpufreq exynos4_setup_clocks(void)
>  		s3c_set_clksrc(&clksrcs[ptr], true);
> 
>  	clk_audiocdclk0.rate = PCM_EXTCLK0;
> -	clk_set_parent(&clk_sclk_audio0.clk, &clk_audiocdclk0);
>  }
> 
>  static struct clk *clks[] __initdata = {
> --
> 1.7.1.569.g6f426
