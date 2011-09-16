From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] ARM: EXYNOS4: Add HDMI support for Origen
Date: Fri, 16 Sep 2011 21:19:57 +0900
Message-ID: <00d301cc746a$f295a2f0$d7c0e8d0$%kim@samsung.com>
References: <1315475289-10967-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:19957 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751820Ab1IPMT6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Sep 2011 08:19:58 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LRM00EBU7L86L80@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 16 Sep 2011 21:19:57 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LRM0056N7L9R8@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 16 Sep 2011 21:19:57 +0900 (KST)
In-reply-to: <1315475289-10967-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org

Sachin Kamat wrote:
> 
> This patch adds HDMI (TVout) support for Origen board.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
> Re-submitting the patch with minor changes since v1:
> * Re-ordered the entries in Kconfig and init data
> 
> This patch is based on for-next branch of Kukjin Kim's tree:
>
http://git.kernel.org/?p=linux/kernel/git/kgene/linux-samsung.git;a=summary
> 
> This patch is tested using Hatim's patch:
> http://www.spinics.net/lists/linux-samsung-soc/msg06367.html
> ---
>  arch/arm/mach-exynos4/Kconfig       |    2 ++
>  arch/arm/mach-exynos4/mach-origen.c |    4 ++++
>  2 files changed, 6 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
> index 181fb04..e0c217f 100644
> --- a/arch/arm/mach-exynos4/Kconfig
> +++ b/arch/arm/mach-exynos4/Kconfig
> @@ -224,6 +224,8 @@ config MACH_ORIGEN
>  	select S3C_DEV_RTC
>  	select S3C_DEV_WDT
>  	select S3C_DEV_HSMMC2
> +	select S5P_DEV_I2C_HDMIPHY
> +	select S5P_DEV_TV
>  	select EXYNOS4_SETUP_SDHCI
>  	help
>  	  Machine support for ORIGEN based on Samsung EXYNOS4210
> diff --git a/arch/arm/mach-exynos4/mach-origen.c
b/arch/arm/mach-exynos4/mach-
> origen.c
> index ed59f86..5525329 100644
> --- a/arch/arm/mach-exynos4/mach-origen.c
> +++ b/arch/arm/mach-exynos4/mach-origen.c
> @@ -83,6 +83,9 @@ static struct platform_device *origen_devices[]
__initdata = {
>  	&s3c_device_hsmmc2,
>  	&s3c_device_rtc,
>  	&s3c_device_wdt,
> +	&s5p_device_i2c_hdmiphy,
> +	&s5p_device_hdmi,
> +	&s5p_device_mixer,
>  };
> 
>  static void __init origen_map_io(void)
> @@ -95,6 +98,7 @@ static void __init origen_map_io(void)
>  static void __init origen_machine_init(void)
>  {
>  	s3c_sdhci2_set_platdata(&origen_hsmmc2_pdata);
> +	s5p_i2c_hdmiphy_set_platdata(NULL);
>  	platform_add_devices(origen_devices, ARRAY_SIZE(origen_devices));
>  }
> 
> --
> 1.7.4.1

Looks ok, will apply.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
