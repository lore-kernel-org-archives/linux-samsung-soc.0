From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 7/10] ARM: S5PV210: Fix wrong EPLL rate getting on setup
 clocks
Date: Fri, 08 Oct 2010 19:37:00 +0900
Message-ID: <001e01cb66d4$c178a400$4469ec00$%kim@samsung.com>
References: <1286191550-22197-1-git-send-email-sw.youn@samsung.com>
 <1286193919-19830-1-git-send-email-sw.youn@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:40044 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753043Ab0JHKgr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Oct 2010 06:36:47 -0400
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9Y007BHW5AGV60@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Oct 2010 19:36:46 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9Y00MI3W5AK5@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Oct 2010 19:36:46 +0900 (KST)
In-reply-to: <1286193919-19830-1-git-send-email-sw.youn@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Seungwhan Youn' <sw.youn@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org
Cc: ben-linux@fluff.org, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, jassi.brar@samsung.com

Seungwhan Youn wrote:
> 
> This patch fix wrong EPLL getting on setup clocks on S5PV210.
> 
> Signed-off-by: Seungwhan Youn <sw.youn@samsung.com>
> ---
>  arch/arm/mach-s5pv210/clock.c                   |    3 ++-
>  arch/arm/mach-s5pv210/include/mach/regs-clock.h |    3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/clock.c
> index 3f3b7ba..bcbe7e9 100644
> --- a/arch/arm/mach-s5pv210/clock.c
> +++ b/arch/arm/mach-s5pv210/clock.c
> @@ -1040,7 +1040,8 @@ void __init_or_cpufreq s5pv210_setup_clocks(void)
> 
>  	apll = s5p_get_pll45xx(xtal, __raw_readl(S5P_APLL_CON), pll_4508);
>  	mpll = s5p_get_pll45xx(xtal, __raw_readl(S5P_MPLL_CON), pll_4502);
> -	epll = s5p_get_pll45xx(xtal, __raw_readl(S5P_EPLL_CON), pll_4500);
> +	epll = s5p_get_pll90xx(xtal, __raw_readl(S5P_EPLL_CON0),
> +				__raw_readl(S5P_EPLL_CON1));

Maybe you wanted to implement fractional PLL 4600B...not used 90xx in there.
So need to update plat/pll.h to epll of s5pv210.

>  	vpllsrc = clk_get_rate(&clk_vpllsrc.clk);
>  	vpll = s5p_get_pll45xx(vpllsrc, __raw_readl(S5P_VPLL_CON),
pll_4502);
> 
> diff --git a/arch/arm/mach-s5pv210/include/mach/regs-clock.h
b/arch/arm/mach-
> s5pv210/include/mach/regs-clock.h
> index 499aef7..5968535 100644
> --- a/arch/arm/mach-s5pv210/include/mach/regs-clock.h
> +++ b/arch/arm/mach-s5pv210/include/mach/regs-clock.h
> @@ -24,7 +24,8 @@
> 
>  #define S5P_APLL_CON		S5P_CLKREG(0x100)
>  #define S5P_MPLL_CON		S5P_CLKREG(0x108)
> -#define S5P_EPLL_CON		S5P_CLKREG(0x110)
> +#define S5P_EPLL_CON0		S5P_CLKREG(0x110)
> +#define S5P_EPLL_CON1		S5P_CLKREG(0x114)
>  #define S5P_VPLL_CON		S5P_CLKREG(0x120)
> 
>  #define S5P_CLK_SRC0		S5P_CLKREG(0x200)
> --


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
