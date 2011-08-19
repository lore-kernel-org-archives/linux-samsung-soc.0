From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S5P64X0: Add the devname for DMA clock
Date: Fri, 19 Aug 2011 14:24:09 +0900
Message-ID: <000601cc5e30$3a38bda0$aeaa38e0$%kim@samsung.com>
References: <1313649828-27642-1-git-send-email-boojin.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:63948 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752417Ab1HSFYO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Aug 2011 01:24:14 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQ500BV0TOB23L0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Aug 2011 14:24:12 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQ500KA7TOA6V@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Aug 2011 14:24:11 +0900 (KST)
In-reply-to: <1313649828-27642-1-git-send-email-boojin.kim@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Boojin Kim' <boojin.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Boojin Kim wrote:
> 
> This patch adds devname for DMA clock.
> NOTE: This patch should be added after merging new pl330 driver on
dmaengine.
> 
> Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
> ---
>  arch/arm/mach-s5p64x0/clock-s5p6440.c |    1 +
>  arch/arm/mach-s5p64x0/clock-s5p6450.c |    1 +
>  2 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s5p64x0/clock-s5p6440.c b/arch/arm/mach-
> s5p64x0/clock-s5p6440.c
> index c1f548f..c54c65d 100644
> --- a/arch/arm/mach-s5p64x0/clock-s5p6440.c
> +++ b/arch/arm/mach-s5p64x0/clock-s5p6440.c
> @@ -147,6 +147,7 @@ static struct clk init_clocks_off[] = {
>  		.ctrlbit	= (1 << 8),
>  	}, {
>  		.name		= "dma",
> +		.devname	= "dma-pl330",
>  		.parent		= &clk_hclk_low.clk,
>  		.enable		= s5p64x0_hclk0_ctrl,
>  		.ctrlbit	= (1 << 12),
> diff --git a/arch/arm/mach-s5p64x0/clock-s5p6450.c b/arch/arm/mach-
> s5p64x0/clock-s5p6450.c
> index 3d9b609..2d04abf 100644
> --- a/arch/arm/mach-s5p64x0/clock-s5p6450.c
> +++ b/arch/arm/mach-s5p64x0/clock-s5p6450.c
> @@ -180,6 +180,7 @@ static struct clk init_clocks_off[] = {
>  		.ctrlbit	= (1 << 3),
>  	}, {
>  		.name		= "dma",
> +		.devname	= "dma-pl330",
>  		.parent		= &clk_hclk_low.clk,
>  		.enable		= s5p64x0_hclk0_ctrl,
>  		.ctrlbit	= (1 << 12),
> --
> 1.7.1

OK, will apply.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
