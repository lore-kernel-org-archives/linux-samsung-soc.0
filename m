From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/6] ARM: Exynos4: Fix the incorrect hierarchy of spi
 controller bus clock
Date: Thu, 24 May 2012 16:27:23 +0900
Message-ID: <006601cd397e$a9932df0$fcb989d0$%kim@samsung.com>
References: <1337334392-6441-1-git-send-email-thomas.abraham@linaro.org>
 <1337334392-6441-2-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:28365 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751263Ab2EXH10 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 May 2012 03:27:26 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M4I003VXNDN2YO0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 24 May 2012 16:27:25 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M4I008B0NDNIVB1@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 24 May 2012 16:27:24 +0900 (KST)
In-reply-to: <1337334392-6441-2-git-send-email-thomas.abraham@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, jaswinder.singh@linaro.org

Thomas Abraham wrote:
> 
> The sclk_spi clock is derived currently from the first level divider
> (MMCx_RATIO) which is incorrect. The output of the first level clock
> is divided by a second level divider (MMCx_PRE_RATIO), the output of
> which is used as the spi bus clock (sclk_spi). Fix the clock hierarchy
> issues for the sclk_spi clock.
> 
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> Acked-by: Jaswinder Singh <jaswinder.singh@linaro.org>
> ---
>  arch/arm/mach-exynos/clock-exynos4.c |   48
++++++++++++++++++++++++++++--
> ---
>  1 files changed, 40 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/clock-exynos4.c b/arch/arm/mach-
> exynos/clock-exynos4.c
> index 10a46a9..b5f0507 100644
> --- a/arch/arm/mach-exynos/clock-exynos4.c
> +++ b/arch/arm/mach-exynos/clock-exynos4.c
> @@ -1242,40 +1242,70 @@ static struct clksrc_clk exynos4_clk_sclk_mmc3 = {
>  	.reg_div = { .reg = EXYNOS4_CLKDIV_FSYS2, .shift = 24, .size = 8 },
>  };
> 
> +static struct clksrc_clk exynos4_clk_mdout_spi0 = {

In this case, it's expected that 'exynos4_clk_dout_spi0' will be used even
though this indicates the clock of mux_out and divider_out together.

> +	.clk	= {
> +		.name		= "sclk_spi_mdout",

So, this should be 'dout_spi0'

> +		.devname	= "exynos4210-spi.0",

[...]

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
