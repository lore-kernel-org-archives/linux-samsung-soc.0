From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/4] ARM: S5PC110: add fimc clocks.
Date: Thu, 09 Sep 2010 09:23:02 +0900
Message-ID: <000101cb4fb5$2cbbc850$863358f0$%kim@samsung.com>
References: <1283745044-15514-1-git-send-email-m.szyprowski@samsung.com>
 <1283745044-15514-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:60701 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753194Ab0IIAWu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Sep 2010 20:22:50 -0400
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L8G00J7VEE1KG40@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Sep 2010 09:22:49 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L8G00AZQEE0AI@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Sep 2010 09:22:49 +0900 (KST)
In-reply-to: <1283745044-15514-2-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, ben-linux@fluff.org

Marek Szyprowski wrote:
> 
> These clocks enables FIMC driver to operate on machines, which bootloader
> power gated FIMC devices to save power on boot.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-s5pv210/clock.c |   18 ++++++++++++++++++
>  1 files changed, 18 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/clock.c
> index af91fef..9c199ef 100644
> --- a/arch/arm/mach-s5pv210/clock.c
> +++ b/arch/arm/mach-s5pv210/clock.c
> @@ -281,6 +281,24 @@ static struct clk init_clocks_disable[] = {
>  		.enable		= s5pv210_clk_ip0_ctrl,
>  		.ctrlbit	= (1<<29),
>  	}, {
> +		.name		= "fimc",
> +		.id		= 0,
> +		.parent		= &clk_hclk_dsys.clk,
> +		.enable		= s5pv210_clk_ip0_ctrl,
> +		.ctrlbit	= (1 << 24),
> +	}, {
> +		.name		= "fimc",
> +		.id		= 1,
> +		.parent		= &clk_hclk_dsys.clk,
> +		.enable		= s5pv210_clk_ip0_ctrl,
> +		.ctrlbit	= (1 << 25),
> +	}, {
> +		.name		= "fimc",
> +		.id		= 2,
> +		.parent		= &clk_hclk_dsys.clk,
> +		.enable		= s5pv210_clk_ip0_ctrl,
> +		.ctrlbit	= (1 << 26),
> +	}, {
>  		.name		= "otg",
>  		.id		= -1,
>  		.parent		= &clk_hclk_psys.clk,
> --
> 1.7.2.2

Ok..will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
