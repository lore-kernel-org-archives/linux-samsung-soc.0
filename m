From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/4] ARM: S5P64X0: Changed the name for mmc special clock
 on s5p6440
Date: Mon, 20 Dec 2010 14:52:32 +0900
Message-ID: <010501cba00a$1b2185d0$51649170$%kim@samsung.com>
References: <1292219185-3911-1-git-send-email-sbkim73@samsung.com>
 <1292219185-3911-2-git-send-email-sbkim73@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:64280 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752882Ab0LTFwj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Dec 2010 00:52:39 -0500
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LDP00LKZPNP5G30@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 20 Dec 2010 14:52:37 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LDP007O5PNPD8@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 20 Dec 2010 14:52:37 +0900 (KST)
In-reply-to: <1292219185-3911-2-git-send-email-sbkim73@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sangbeom Kim' <sbkim73@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, 'Abhilash Kesavan' <a.kesavan@samsung.com>

Sangbeom Kim wrote:
> 
> From: Abhilash Kesavan <a.kesavan@samsung.com>
> 
> Change the name of mmc spcial clock from mmc_bus to sclk_mmc to be
> in line with the naming across the s5p series
> 
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
> ---
>  arch/arm/mach-s5p64x0/clock-s5p6440.c |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/mach-s5p64x0/clock-s5p6440.c b/arch/arm/mach-
> s5p64x0/clock-s5p6440.c
> index e4883dc..d27ff1a 100644
> --- a/arch/arm/mach-s5p64x0/clock-s5p6440.c
> +++ b/arch/arm/mach-s5p64x0/clock-s5p6440.c
> @@ -419,7 +419,7 @@ static struct clksrc_sources clkset_audio = {
>  static struct clksrc_clk clksrcs[] = {
>  	{
>  		.clk	= {
> -			.name		= "mmc_bus",
> +			.name		= "sclk_mmc",
>  			.id		= 0,
>  			.ctrlbit	= (1 << 24),
>  			.enable		= s5p64x0_sclk_ctrl,
> @@ -429,7 +429,7 @@ static struct clksrc_clk clksrcs[] = {
>  		.reg_div = { .reg = S5P64X0_CLK_DIV1, .shift = 0, .size = 4
},
>  	}, {
>  		.clk	= {
> -			.name		= "mmc_bus",
> +			.name		= "sclk_mmc",
>  			.id		= 1,
>  			.ctrlbit	= (1 << 25),
>  			.enable		= s5p64x0_sclk_ctrl,
> @@ -439,7 +439,7 @@ static struct clksrc_clk clksrcs[] = {
>  		.reg_div = { .reg = S5P64X0_CLK_DIV1, .shift = 4, .size = 4
},
>  	}, {
>  		.clk	= {
> -			.name		= "mmc_bus",
> +			.name		= "sclk_mmc",
>  			.id		= 2,
>  			.ctrlbit	= (1 << 26),
>  			.enable		= s5p64x0_sclk_ctrl,
> --

Yeah, you're right.

Looks ok to me...will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
