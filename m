From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: SAMSUNG: Enable watchdog parent clock for SMDKV310
Date: Wed, 09 Mar 2011 20:43:56 +0900
Message-ID: <000101cbde4f$4b19dd40$e14d97c0$%kim@samsung.com>
References: <1299486624-2446-1-git-send-email-inderpal.s@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:14865 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754031Ab1CILoI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Mar 2011 06:44:08 -0500
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LHS00BAUGLHJXC0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 Mar 2011 20:44:05 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LHS00E5KGLHKO@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 Mar 2011 20:44:05 +0900 (KST)
In-reply-to: <1299486624-2446-1-git-send-email-inderpal.s@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Inderpal Singh' <inderpal.s@samsung.com>, linux-samsung-soc@vger.kernel.org

Inderpal Singh wrote:
> 
> This patch adds the parent clock for watchdog timer for SMDKV310.
> 
> Signed-off-by: Inderpal Singh <inderpal.s@samsung.com>
> ---
>  arch/arm/mach-exynos4/clock.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/clock.c
> index 72d53d5..7bf3c4e 100644
> --- a/arch/arm/mach-exynos4/clock.c
> +++ b/arch/arm/mach-exynos4/clock.c
> @@ -489,6 +489,7 @@ static struct clk init_clocks_off[] = {
>  	}, {
>  		.name		= "watchdog",
>  		.id		= -1,
> +		.parent		= &clk_aclk_100.clk,
>  		.enable		= exynos4_clk_ip_perir_ctrl,
>  		.ctrlbit	= (1 << 14),
>  	}, {
> --
> 1.7.1

Ok, but this is not only for SMDKV310.
So will apply with editing description :)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
