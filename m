From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCHv2 1/2] ARM: EXYNOS: Add EXYNOS4415 SoC ID
Date: Tue, 28 Oct 2014 13:28:22 +0900
Message-ID: <031101cff267$9b8daba0$d2a902e0$@kernel.org>
References: <1414373759-4362-1-git-send-email-cw00.choi@samsung.com>
 <1414373759-4362-2-git-send-email-cw00.choi@samsung.com>
 <02b501cff262$127d44b0$3777ce10$@kernel.org> <544F15F0.9080102@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:31352 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751667AbaJ1E23 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Oct 2014 00:28:29 -0400
In-reply-to: <544F15F0.9080102@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Chanwoo Choi' <cw00.choi@samsung.com>, 'Kukjin Kim' <kgene@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, arnd@arndb.de, olof@lixom.net, tomasz.figa@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, yj44.cho@samsung.com, jaewon02.kim@samsung.com, ideal.song@samsung.com

Chanwoo Choi wrote:
> 
> Dear Kukjin,
> 

[...]

> >>
> >> +config SOC_EXYNOS4415
> >> +	bool "SAMSUNG EXYNOS4415"
> >> +	default y
> >> +	depends on ARCH_EXYNOS4
> >> +
> >
> > I think, this is not required more...
> 
> But,
> The clock driver must need to CONFIG_SOC_EXYNOS4415 configuration
> to build it. The clock driver[1] of exynos4415 used CONFIG_SOC_EXYNOS4415 as following diff:
>   [1] https://lkml.org/lkml/2014/10/26/159
> 
Oh, yes. OK.

Thanks for quick reply.

- Kukjin

> diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
> index 8909c93..4561297 100644
> --- a/drivers/clk/samsung/Makefile
> +++ b/drivers/clk/samsung/Makefile
> @@ -5,6 +5,7 @@
>  obj-$(CONFIG_COMMON_CLK)	+= clk.o clk-pll.o clk-cpu.o
>  obj-$(CONFIG_SOC_EXYNOS3250)	+= clk-exynos3250.o
>  obj-$(CONFIG_ARCH_EXYNOS4)	+= clk-exynos4.o
> +obj-$(CONFIG_SOC_EXYNOS4415)	+= clk-exynos4415.o
> 
> Best Regards,
> Chanwoo Choi
