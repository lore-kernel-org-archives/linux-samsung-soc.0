From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: Increase reset delay for USB HOST PHY
Date: Fri, 19 Aug 2011 14:24:09 +0900
Message-ID: <000101cc5e30$39bf20d0$ad3d6270$%kim@samsung.com>
References: <1313054848-20515-1-git-send-email-jg1.han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:63948 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751623Ab1HSFYM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Aug 2011 01:24:12 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQ500CI6TNXX0L0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Aug 2011 14:24:11 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQ500KA7TOA6V@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Aug 2011 14:24:11 +0900 (KST)
In-reply-to: <1313054848-20515-1-git-send-email-jg1.han@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jingoo Han' <jg1.han@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Yulgon Kim' <yulgon.kim@samsung.com>

Jingoo Han wrote:
> 
> From: Yulgon Kim <yulgon.kim@samsung.com>
> 
> This patch increases reset delay from 50 usec to 80 usec for USB HOST PHY.
> In order to reset USB HOST PHY controller properly, a little extra time is
> required during its reset cycle.
> 
> Signed-off-by: Yulgon Kim <yulgon.kim@samsung.com>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  arch/arm/mach-exynos4/setup-usb-phy.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/setup-usb-phy.c b/arch/arm/mach-
> exynos4/setup-usb-phy.c
> index 0883c1b..39aca04 100644
> --- a/arch/arm/mach-exynos4/setup-usb-phy.c
> +++ b/arch/arm/mach-exynos4/setup-usb-phy.c
> @@ -82,7 +82,7 @@ static int exynos4_usb_phy1_init(struct platform_device
> *pdev)
> 
>  	rstcon &= ~(HOST_LINK_PORT_SWRST_MASK | PHY1_SWRST_MASK);
>  	writel(rstcon, EXYNOS4_RSTCON);
> -	udelay(50);
> +	udelay(80);
> 
>  	clk_disable(otg_clk);
>  	clk_put(otg_clk);
> --
> 1.7.1

OK, will apply.
But I'm not sure why extra time is required on current kernel not on old
kernel...

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
