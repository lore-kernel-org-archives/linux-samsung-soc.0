From: "HeungJun, Kim" <riverful.kim@samsung.com>
Subject: RE: Exynos4: NURI: Remove redundant S5P_SETUP_MIPIPHY configuration
Date: Tue, 15 May 2012 13:03:40 +0900
Message-ID: <002901cd324f$b644cda0$22ce68e0$%kim@samsung.com>
References: <1335785081-5398-1-git-send-email-riverful.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:26892 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750767Ab2EOEDr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 May 2012 00:03:47 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M4100EVXPY1UM00@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 May 2012 13:03:45 +0900 (KST)
Received: from NORIVERFULK04 ([165.213.219.118])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M4100GGIPY94LI0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 May 2012 13:03:45 +0900 (KST)
In-reply-to: <1335785081-5398-1-git-send-email-riverful.kim@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "'HeungJun, Kim'" <riverful.kim@samsung.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, 'Kyungmin Park' <kyungmin.park@samsung.com>

Ping?

> -----Original Message-----
> From: HeungJun, Kim [mailto:riverful.kim@samsung.com]
> Sent: Monday, April 30, 2012 8:25 PM
> To: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org; HeungJun, Kim; Kyungmin Park
> Subject: ARM: Exynos4: NURI: Remove redundant S5P_SETUP_MIPIPHY configuration
> 
> From: "HeungJun, Kim" <riverful.kim@samsung.com>
> 
> Signed-off-by: HeungJun, Kim <riverful.kim@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos/Kconfig |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index eb35b8a..0f9bbca 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -297,7 +297,6 @@ config MACH_NURI
>  	select S5P_DEV_G2D
>  	select S5P_DEV_MFC
>  	select S5P_DEV_USB_EHCI
> -	select S5P_SETUP_MIPIPHY
>  	select S3C_DEV_USB_HSOTG
>  	select EXYNOS4_DEV_DMA
>  	select EXYNOS_DEV_DRM
> --
> 1.7.5.4
