From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH V2] ARM: S5P: Fix compilation error for exynos4_defconfig
Date: Fri, 03 Jun 2011 15:32:11 -0700
Message-ID: <4DE960EB.2010305@samsung.com>
References: <1307084654-22052-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:32895 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754344Ab1FCWcP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Jun 2011 18:32:15 -0400
Received: by pzk9 with SMTP id 9so984124pzk.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Jun 2011 15:32:15 -0700 (PDT)
In-Reply-To: <1307084654-22052-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linaro-dev@lists.linaro.org, nicolas.pitre@linaro.org, patches@linaro.org, jy0922.shim@samsung.com, samsung@lists.linaro.org, m.szyprowski@samsung.com, thomas.abraham@linaro.org, jg1.han@samsung.com, Sangbeom Kim <sbkim73@samsung.com>

On 06/03/11 00:04, Tushar Behera wrote:
> Added Kconfig entry for setup-usb-phy.c on which EHCI support is
> dependent on.
>
> Following the naming convention of other setup files, we have following
> renaming.
> 	usb-phy.c ==>  setup-usb-phy.c
>
> Signed-off-by: Tushar Behera<tushar.behera@linaro.org>
> ---
>   arch/arm/mach-exynos4/Kconfig                      |    6 ++++++
>   arch/arm/mach-exynos4/Makefile                     |    2 +-
>   .../mach-exynos4/{usb-phy.c =>  setup-usb-phy.c}    |    0
>   3 files changed, 7 insertions(+), 1 deletions(-)
>   rename arch/arm/mach-exynos4/{usb-phy.c =>  setup-usb-phy.c} (100%)
>
> diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
> index b92c1e5..a45a022 100644
> --- a/arch/arm/mach-exynos4/Kconfig
> +++ b/arch/arm/mach-exynos4/Kconfig
> @@ -91,6 +91,11 @@ config EXYNOS4_SETUP_FIMC
>   	help
>   	  Common setup code for the camera interfaces.
>
> +config EXYNOS4_SETUP_USB_PHY
> +	bool
> +	help
> +	  Common setup code for USB PHY controller	
> +
>   # machine support
>
>   menu "EXYNOS4 Machines"
> @@ -176,6 +181,7 @@ config MACH_NURI
>   	select EXYNOS4_SETUP_I2C3
>   	select EXYNOS4_SETUP_I2C5
>   	select EXYNOS4_SETUP_SDHCI
> +	select EXYNOS4_SETUP_USB_PHY
>   	select SAMSUNG_DEV_PWM
>   	help
>   	  Machine support for Samsung Mobile NURI Board.
> diff --git a/arch/arm/mach-exynos4/Makefile b/arch/arm/mach-exynos4/Makefile
> index a9bb94f..60fe5ec 100644
> --- a/arch/arm/mach-exynos4/Makefile
> +++ b/arch/arm/mach-exynos4/Makefile
> @@ -56,4 +56,4 @@ obj-$(CONFIG_EXYNOS4_SETUP_KEYPAD)	+= setup-keypad.o
>   obj-$(CONFIG_EXYNOS4_SETUP_SDHCI)	+= setup-sdhci.o
>   obj-$(CONFIG_EXYNOS4_SETUP_SDHCI_GPIO)	+= setup-sdhci-gpio.o
>
> -obj-$(CONFIG_USB_SUPPORT)		+= usb-phy.o
> +obj-$(CONFIG_EXYNOS4_SETUP_USB_PHY)	+= setup-usb-phy.o
> diff --git a/arch/arm/mach-exynos4/usb-phy.c b/arch/arm/mach-exynos4/setup-usb-phy.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/usb-phy.c
> rename to arch/arm/mach-exynos4/setup-usb-phy.c

I think, basically, the setup-usbphy.c would be in plat-s5p/ because
s5p_usb_phy_{init,exit} is called from plat-s5p/dev-echi.c and need to
separate exynos(mach-) and common s5p(plat-) stuff so that can be used
from other s5p usb to control usb phy.

Since it is not used for others so will apply this to fix build error.

However, we need to sort this out later.

Tushar, you don't need to re-submit this for removing white space :)
But as you know, please make sure that your patch has no problem with
checkpatch.pl before submitting.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
