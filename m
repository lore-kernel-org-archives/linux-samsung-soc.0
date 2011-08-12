From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: Fix wrong devname to support clkdev
Date: Fri, 12 Aug 2011 18:26:38 +0900
Message-ID: <007401cc58d1$f1a7fff0$d4f7ffd0$%kim@samsung.com>
References: <1311671562-1483-1-git-send-email-jhbird.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:19321 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751074Ab1HLJ0m (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Aug 2011 05:26:42 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LPT00DLC683DDP0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Aug 2011 18:26:41 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LPT009L568H4F@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Aug 2011 18:26:41 +0900 (KST)
In-reply-to: <1311671562-1483-1-git-send-email-jhbird.choi@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jhbird.choi@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

jhbird.choi@samsung.com wrote:
> 
> From: Jonghwan Choi <jhbird.choi@samsung.com>
> 
> Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
> ---
>  arch/arm/mach-exynos4/clock.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/clock.c
> index 66494f2..8e9699e 100644
> --- a/arch/arm/mach-exynos4/clock.c
> +++ b/arch/arm/mach-exynos4/clock.c
> @@ -520,7 +520,7 @@ static struct clk init_clocks_off[] = {
>  		.ctrlbit	= (1 << 21),
>  	}, {
>  		.name		= "ac97",
> -		.id		= -1,
> +		.devname	= "samsung-ac97",
>  		.enable		= exynos4_clk_ip_peril_ctrl,
>  		.ctrlbit	= (1 << 27),
>  	}, {
> --
> 1.7.1

OK, applied.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
