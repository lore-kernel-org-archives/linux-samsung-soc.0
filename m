From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: Register power domains on Origen.
Date: Mon, 10 Oct 2011 13:27:34 +0900
Message-ID: <034801cc8704$eecd4270$cc67c750$%kim@samsung.com>
References: <1317986853-21631-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:18290 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750810Ab1JJE1f (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Oct 2011 00:27:35 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSU00LWZ1PQZAI0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Oct 2011 13:27:34 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LSU004O91PXHG10@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Mon, 10 Oct 2011 13:27:34 +0900 (KST)
In-reply-to: <1317986853-21631-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Sachin Kamat wrote:
> 
> This patch registers all the available power domains on Origen.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/mach-exynos4/mach-origen.c |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/mach-origen.c
b/arch/arm/mach-exynos4/mach-
> origen.c
> index 18909cf..35b12d7 100644
> --- a/arch/arm/mach-exynos4/mach-origen.c
> +++ b/arch/arm/mach-exynos4/mach-origen.c
> @@ -601,6 +601,10 @@ static struct platform_device *origen_devices[]
__initdata
> = {
>  	&s5p_device_mixer,
>  	&exynos4_device_pd[PD_LCD0],
>  	&exynos4_device_pd[PD_TV],
> +	&exynos4_device_pd[PD_G3D],
> +	&exynos4_device_pd[PD_LCD1],
> +	&exynos4_device_pd[PD_CAM],
> +	&exynos4_device_pd[PD_GPS],
>  	&origen_device_gpiokeys,
>  	&origen_lcd_hv070wsa,
>  };
> --
> 1.7.4.1

Looks ok to me, will apply.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
