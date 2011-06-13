From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: Fix missing S5P_VA_AUDSS definition
Date: Mon, 13 Jun 2011 16:37:21 +0900
Message-ID: <002101cc299c$c1af2620$450d7260$%kim@samsung.com>
References: <1303954372-18565-2-git-send-email-sbkim73@samsung.com>
 <1307526340-19910-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:47626 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753145Ab1FMHhf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Jun 2011 03:37:35 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LMP00NHUX6D0BN0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 13 Jun 2011 16:37:33 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LMP00BH6X6KNS@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 13 Jun 2011 16:37:32 +0900 (KST)
In-reply-to: <1307526340-19910-1-git-send-email-ch.naveen@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Naveen Krishna Chatradhi' <ch.naveen@samsung.com>, linux-samsung-soc@vger.kernel.org

Naveen Krishna Chatradhi wrote:
> 
> This patch fixes the 'S5P_VA_AUDSS' missing definition
> causing compilation break.
> 
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> ---
>  arch/arm/plat-s5p/include/plat/map-s5p.h |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/plat-s5p/include/plat/map-s5p.h b/arch/arm/plat-
> s5p/include/plat/map-s5p.h
> index d973d39..daa4a44 100644
> --- a/arch/arm/plat-s5p/include/plat/map-s5p.h
> +++ b/arch/arm/plat-s5p/include/plat/map-s5p.h
> @@ -40,6 +40,7 @@
>  #define S5P_VA_GIC_DIST		S5P_VA_COREPERI(0x1000)
> 
>  #define S3C_VA_USB_HSPHY	S3C_ADDR(0x02900000)
> +#define S5P_VA_AUDSS		S3C_ADDR(0x02A00000)
> 
>  #define VA_VIC(x)		(S3C_VA_IRQ + ((x) * 0x10000))
>  #define VA_VIC0			VA_VIC(0)
> --

Hi Naveen,

Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
