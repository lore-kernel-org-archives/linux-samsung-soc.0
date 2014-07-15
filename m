From: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Subject: Re: [PATCH] ARM: config: update multi_v7_defconfig
Date: Tue, 15 Jul 2014 13:39:15 +0530
Message-ID: <CAHfPSqCphGLYiiby4zrqvydUALo2+JdHx5CT-RuryapeQisvaw@mail.gmail.com>
References: <1405411346-12471-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f47.google.com ([209.85.216.47]:55820 "EHLO
	mail-qa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751467AbaGOIJg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Jul 2014 04:09:36 -0400
Received: by mail-qa0-f47.google.com with SMTP id i13so4177385qae.20
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Jul 2014 01:09:35 -0700 (PDT)
In-Reply-To: <1405411346-12471-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dianders@chromium.org, olofj@chromium.org, cpgs@samsung.com

Hello All,

On 15 July 2014 13:32, Naveen Krishna Chatradhi <ch.naveen@samsung.com> wrote:
> Enabled S3C24XX I2C driver and MAX77686 PMIC MFD and Voltage
> regulator drivers used on Exynos5250 based Snow board.
>
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> ---
> By enabling the symbols to compile S3C24XX I2C driver, MAX77686 PMIC
> under MFD and REGULATOR.
>
> http://arm-soc.lixom.net/bootlogs/next/next-20140711/snow-multi_v7_defconfig.html
> The warnings by cpufreq on Snow board are fixed.
>
> Booted and verified on  on Exynos5420 based Snow board

* Exynos5250 based Snow board.

>
>  arch/arm/configs/multi_v7_defconfig |    3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index 5348364..1aaf91d 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -193,6 +193,7 @@ CONFIG_I2C_CADENCE=y
>  CONFIG_I2C_DESIGNWARE_PLATFORM=y
>  CONFIG_I2C_EXYNOS5=y
>  CONFIG_I2C_MV64XXX=y
> +CONFIG_I2C_S3C2410=y
>  CONFIG_I2C_SIRF=y
>  CONFIG_I2C_TEGRA=y
>  CONFIG_SPI=y
> @@ -231,6 +232,7 @@ CONFIG_MFD_AS3722=y
>  CONFIG_MFD_BCM590XX=y
>  CONFIG_MFD_CROS_EC=y
>  CONFIG_MFD_CROS_EC_SPI=y
> +CONFIG_MFD_MAX77686=y
>  CONFIG_MFD_MAX8907=y
>  CONFIG_MFD_SEC_CORE=y
>  CONFIG_MFD_PALMAS=y
> @@ -243,6 +245,7 @@ CONFIG_REGULATOR_AS3722=y
>  CONFIG_REGULATOR_BCM590XX=y
>  CONFIG_REGULATOR_GPIO=y
>  CONFIG_REGULATOR_MAX8907=y
> +CONFIG_REGULATOR_MAX77686=y
>  CONFIG_REGULATOR_PALMAS=y
>  CONFIG_REGULATOR_S2MPS11=y
>  CONFIG_REGULATOR_S5M8767=y
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Shine bright,
(: Nav :)
