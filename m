From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: Make BT platform data structure static in
 mach-origen.c file
Date: Tue, 08 May 2012 14:49:03 +0900
Message-ID: <018401cd2cde$46385070$d2a8f150$%kim@samsung.com>
References: <1336362415-15144-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:52711 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750834Ab2EHFtF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 May 2012 01:49:05 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M3O00H18W4STM00@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 08 May 2012 14:49:04 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M3O00H7XW5SZV00@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 08 May 2012 14:49:04 +0900 (KST)
In-reply-to: <1336362415-15144-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Sachin Kamat wrote:
> 
> Adds missing storage class static to origen_bt_pdata structure.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/mach-exynos/mach-origen.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-
> exynos/mach-origen.c
> index 4a8b3ff..df32cf4 100644
> --- a/arch/arm/mach-exynos/mach-origen.c
> +++ b/arch/arm/mach-exynos/mach-origen.c
> @@ -607,7 +607,7 @@ static struct s3c_fb_platdata origen_lcd_pdata
> __initdata = {
>  };
> 
>  /* Bluetooth rfkill gpio platform data */
> -struct rfkill_gpio_platform_data origen_bt_pdata = {
> +static struct rfkill_gpio_platform_data origen_bt_pdata = {
>  	.reset_gpio	= EXYNOS4_GPX2(2),
>  	.shutdown_gpio	= -1,
>  	.type		= RFKILL_TYPE_BLUETOOTH,
> --
> 1.7.4.1

OK, will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
