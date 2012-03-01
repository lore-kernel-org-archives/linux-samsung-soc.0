From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/6] ARM: SAMSUNG: Fix memory size for hsotg
Date: Thu, 01 Mar 2012 13:40:22 +0900
Message-ID: <077101ccf765$69bea0c0$3d3be240$%kim@samsung.com>
References: <1328870146-20312-1-git-send-email-l.majewski@samsung.com>
 <1328870146-20312-3-git-send-email-l.majewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:44597 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756607Ab2CAEkX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Feb 2012 23:40:23 -0500
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0M0600BRQVN9AZA0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 01 Mar 2012 13:40:22 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0M0600DMWVNA3C20@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 01 Mar 2012 13:40:22 +0900 (KST)
In-reply-to: <1328870146-20312-3-git-send-email-l.majewski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Lukasz Majewski' <l.majewski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Marek Szyprowski' <m.szyprowski@samsung.com>, 'Joonyoung Shim' <jy0922.shim@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>

Lukasz Majewski wrote:
> 
> From: Joonyoung Shim <jy0922.shim@samsung.com>
> 
> The device link core registers for hsotg is base + 0000h ~ base +
> 11000h.
> 
> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> [Rebased on the newest git/kgene/linux-samsung #for-next]
> Signed-off-by: Lukasz Majewski <l.majewski@samsung.com>
> ---
>  arch/arm/plat-samsung/devs.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
> index 21168ea..7ca0875 100644
> --- a/arch/arm/plat-samsung/devs.c
> +++ b/arch/arm/plat-samsung/devs.c
> @@ -1436,7 +1436,7 @@ void __init s5p_ehci_set_platdata(struct
> s5p_ehci_platdata *pd)
> 
>  #ifdef CONFIG_S3C_DEV_USB_HSOTG
>  static struct resource s3c_usb_hsotg_resources[] = {
> -	[0] = DEFINE_RES_MEM(S3C_PA_USB_HSOTG, SZ_16K),
> +	[0] = DEFINE_RES_MEM(S3C_PA_USB_HSOTG, SZ_128K),
>  	[1] = DEFINE_RES_IRQ(IRQ_OTG),
>  };
> 
> --
> 1.7.2.3

OK, will apply.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
