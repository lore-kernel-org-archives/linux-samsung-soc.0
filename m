From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S5P: fix bug in spdif_clk_get_rate
Date: Fri, 19 Aug 2011 22:07:49 +0900
Message-ID: <002c01cc5e70$fef41960$fcdc4c20$%kim@samsung.com>
References: <1313753215-29173-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:15282 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751277Ab1HSNHu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Aug 2011 09:07:50 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQ600A14F4PR5B0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Aug 2011 22:07:49 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQ600MQLF51HM@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Aug 2011 22:07:49 +0900 (KST)
In-reply-to: <1313753215-29173-1-git-send-email-ch.naveen@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Naveen Krishna Chatradhi' <ch.naveen@samsung.com>, jassisinghbrar@gmail.com, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Naveen Krishna Chatradhi wrote:
> 
> Should be passing the parent clk object when
> calling for parent rate.
> 
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> ---
>  arch/arm/plat-s5p/clock.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/plat-s5p/clock.c b/arch/arm/plat-s5p/clock.c
> index 02af235..5f84a3f 100644
> --- a/arch/arm/plat-s5p/clock.c
> +++ b/arch/arm/plat-s5p/clock.c
> @@ -192,7 +192,7 @@ unsigned long s5p_spdif_get_rate(struct clk *clk)
>  	if (IS_ERR(pclk))
>  		return -EINVAL;
> 
> -	rate = pclk->ops->get_rate(clk);
> +	rate = pclk->ops->get_rate(pclk);
>  	clk_put(pclk);
> 
>  	return rate;
> --
> 1.7.2.3

Yes, applied.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
