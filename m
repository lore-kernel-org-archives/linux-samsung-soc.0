From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S5P: Remove duplicate kdiv calculation
Date: Tue, 23 Aug 2011 16:19:19 +0900
Message-ID: <06c601cc6164$f9554280$ebffc780$%kim@samsung.com>
References: <1313803641-32169-1-git-send-email-jhbird.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:56962 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750748Ab1HWHTV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Aug 2011 03:19:21 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQD001UKDNFGOI0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Aug 2011 16:19:19 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQD002AUDO7ZC@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Aug 2011 16:19:19 +0900 (KST)
In-reply-to: <1313803641-32169-1-git-send-email-jhbird.choi@samsung.com>
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
>  arch/arm/plat-s5p/include/plat/pll.h |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/plat-s5p/include/plat/pll.h
b/arch/arm/plat-s5p/include/plat/pll.h
> index bf28fad..ebc142c 100644
> --- a/arch/arm/plat-s5p/include/plat/pll.h
> +++ b/arch/arm/plat-s5p/include/plat/pll.h
> @@ -72,7 +72,6 @@ static inline unsigned long s5p_get_pll46xx(unsigned
long
> baseclk,
>  	mdiv = (pll_con0 >> PLL46XX_MDIV_SHIFT) & PLL46XX_MDIV_MASK;
>  	pdiv = (pll_con0 >> PLL46XX_PDIV_SHIFT) & PLL46XX_PDIV_MASK;
>  	sdiv = (pll_con0 >> PLL46XX_SDIV_SHIFT) & PLL46XX_SDIV_MASK;
> -	kdiv = pll_con1 & PLL46XX_KDIV_MASK;
> 
>  	if (pll_type == pll_4650c)
>  		kdiv = pll_con1 & PLL4650C_KDIV_MASK;
> --
> 1.7.0

Yes, OK.
Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
