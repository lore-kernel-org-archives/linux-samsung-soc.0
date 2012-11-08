From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH] ARM: SAMSUNG: Fix typo in definition of
 VIDCON1_VSTATUS_FRONTPORCH value
Date: Thu, 08 Nov 2012 10:33:42 +0900
Message-ID: <000001cdbd51$160995e0$421cc1a0$%han@samsung.com>
References: <1429686.vBaRDnu5Be@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:37063 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752923Ab2KHBdn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Nov 2012 20:33:43 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MD5002KSAZU26K0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 08 Nov 2012 10:33:42 +0900 (KST)
Received: from DOJG1HAN02 ([12.23.120.99])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MD5001G1B06MN40@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 08 Nov 2012 10:33:42 +0900 (KST)
In-reply-to: <1429686.vBaRDnu5Be@amdc1227>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>
Cc: 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Marek Szyprowski' <m.szyprowski@samsung.com>, 'Jingoo Han' <jg1.han@samsung.com>

On Wednesday, November 07, 2012 9:31 PM Jingoo Han wrote
> 
> The correct value for VIDCON1_VSTATUS_FRONTPORCH is 3, not 0.
> 
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

According to the datasheet, 3 is right value.

Acked-by: Jingoo Han <jg1.han@samsung.com>

> ---
>  include/video/samsung_fimd.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/video/samsung_fimd.h b/include/video/samsung_fimd.h
> index 7ae6c07..263ed4b 100644
> --- a/include/video/samsung_fimd.h
> +++ b/include/video/samsung_fimd.h
> @@ -82,7 +82,7 @@
>  #define VIDCON1_VSTATUS_VSYNC			(0x0 << 13)
>  #define VIDCON1_VSTATUS_BACKPORCH		(0x1 << 13)
>  #define VIDCON1_VSTATUS_ACTIVE			(0x2 << 13)
> -#define VIDCON1_VSTATUS_FRONTPORCH		(0x0 << 13)
> +#define VIDCON1_VSTATUS_FRONTPORCH		(0x3 << 13)
>  #define VIDCON1_VCLK_MASK			(0x3 << 9)
>  #define VIDCON1_VCLK_HOLD			(0x0 << 9)
>  #define VIDCON1_VCLK_RUN			(0x1 << 9)
> --
> 1.8.0
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
