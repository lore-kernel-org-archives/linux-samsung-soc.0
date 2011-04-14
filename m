From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: Register HSMMC2 before HSMMC0 on SMDKV310
 board
Date: Thu, 14 Apr 2011 10:07:08 +0900
Message-ID: <01cd01cbfa40$4ac9ef30$e05dcd90$%kim@samsung.com>
References: <1302669534-28926-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:43817 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752105Ab1DNBHQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Apr 2011 21:07:16 -0400
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LJM00DKJB43M500@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Apr 2011 10:07:15 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LJM00HGYB43KD@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Apr 2011 10:07:15 +0900 (KST)
In-reply-to: <1302669534-28926-1-git-send-email-tushar.behera@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, linaro-dev@lists.linaro.org, patches@linaro.org

Tushar Behera wrote:
> 
> On Exynos4210 SOC, of all the HSMMC controllers only HSMMC2 can
> be used as a boot media. Hence the default SD/MMC card should be
> connected to HSMMC2. The secondary card is connected to HSMMC0.
> 
> If HSMMC0 is registered before HSMMC2, the device node for default
> MMC card changes depending on whether secondary card is connected
> or not. It creates problem in mounting the file-system present in
> default SD/MMC card. Hence HSMMC2 should be registered before HSMMC0.
> 
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
>  arch/arm/mach-exynos4/mach-smdkv310.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-
> exynos4/mach-smdkv310.c
> index f6b1c7e..4f34d43 100644
> --- a/arch/arm/mach-exynos4/mach-smdkv310.c
> +++ b/arch/arm/mach-exynos4/mach-smdkv310.c
> @@ -168,9 +168,9 @@ static struct i2c_board_info i2c_devs1[] __initdata =
{
>  };
> 
>  static struct platform_device *smdkv310_devices[] __initdata = {
> +	&s3c_device_hsmmc2,
>  	&s3c_device_hsmmc0,
>  	&s3c_device_hsmmc1,
> -	&s3c_device_hsmmc2,
>  	&s3c_device_hsmmc3,
>  	&s3c_device_i2c1,
>  	&s3c_device_rtc,
> --
> 1.7.1

Hmm...I can understand your pointing out and situation.

But as you know, channel 4 also can be used for boot media when eMMC booting
and SMDKV310 can support it by jumper setting.

I mean it can be modified according to each board's situation for mass
production and we don't need this for SMDK in mainline now.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
