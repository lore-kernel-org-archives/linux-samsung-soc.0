From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH V2] ARM: S5P: Fix compilation error for exynos4_defconfig
Date: Fri, 03 Jun 2011 14:14:32 +0530
Message-ID: <4DE89EF0.5090707@linaro.org>
References: <1307084654-22052-1-git-send-email-tushar.behera@linaro.org> <4DE8924B.5010003@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:54432 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752795Ab1FCIoi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Jun 2011 04:44:38 -0400
Received: by pwi15 with SMTP id 15so882210pwi.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Jun 2011 01:44:38 -0700 (PDT)
In-Reply-To: <4DE8924B.5010003@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linaro-dev@lists.linaro.org, kgene.kim@samsung.com, nicolas.pitre@linaro.org, patches@linaro.org, samsung@lists.linaro.org, m.szyprowski@samsung.com

Hi,

On Friday 03 June 2011 01:20 PM, Joonyoung Shim wrote:
> On 2011-06-03 =EC=98=A4=ED=9B=84 4:04, Tushar Behera wrote:
>> Added Kconfig entry for setup-usb-phy.c on which EHCI support is
>> dependent on.
>>
>> Following the naming convention of other setup files, we have follow=
ing
>> renaming.
>> usb-phy.c =3D=3D> setup-usb-phy.c
>>
>> Signed-off-by: Tushar Behera<tushar.behera@linaro.org>
>> ---
>> arch/arm/mach-exynos4/Kconfig | 6 ++++++
>> arch/arm/mach-exynos4/Makefile | 2 +-
>> .../mach-exynos4/{usb-phy.c =3D> setup-usb-phy.c} | 0
>> 3 files changed, 7 insertions(+), 1 deletions(-)
>> rename arch/arm/mach-exynos4/{usb-phy.c =3D> setup-usb-phy.c} (100%)
>>
>
> There is one white space but
>
> Acked-by: Joonyoung Shim <jy0922.shim@samsung.com>
>
>> diff --git a/arch/arm/mach-exynos4/Kconfig
>> b/arch/arm/mach-exynos4/Kconfig
>> index b92c1e5..a45a022 100644
>> --- a/arch/arm/mach-exynos4/Kconfig
>> +++ b/arch/arm/mach-exynos4/Kconfig
>> @@ -91,6 +91,11 @@ config EXYNOS4_SETUP_FIMC
>> help
>> Common setup code for the camera interfaces.
>>
>> +config EXYNOS4_SETUP_USB_PHY
>> + bool
>> + help
>> + Common setup code for USB PHY controller
>
> White space.
The space was added so that it is formatted in the same way as other=20
Kconfig entries.
>
>> +
>> # machine support
>>
>> menu "EXYNOS4 Machines"
>> @@ -176,6 +181,7 @@ config MACH_NURI
>> select EXYNOS4_SETUP_I2C3
>> select EXYNOS4_SETUP_I2C5
>> select EXYNOS4_SETUP_SDHCI
>> + select EXYNOS4_SETUP_USB_PHY
>> select SAMSUNG_DEV_PWM
>> help
>> Machine support for Samsung Mobile NURI Board.
>> diff --git a/arch/arm/mach-exynos4/Makefile
>> b/arch/arm/mach-exynos4/Makefile
>> index a9bb94f..60fe5ec 100644
>> --- a/arch/arm/mach-exynos4/Makefile
>> +++ b/arch/arm/mach-exynos4/Makefile
>> @@ -56,4 +56,4 @@ obj-$(CONFIG_EXYNOS4_SETUP_KEYPAD) +=3D setup-keyp=
ad.o
>> obj-$(CONFIG_EXYNOS4_SETUP_SDHCI) +=3D setup-sdhci.o
>> obj-$(CONFIG_EXYNOS4_SETUP_SDHCI_GPIO) +=3D setup-sdhci-gpio.o
>>
>> -obj-$(CONFIG_USB_SUPPORT) +=3D usb-phy.o
>> +obj-$(CONFIG_EXYNOS4_SETUP_USB_PHY) +=3D setup-usb-phy.o
>> diff --git a/arch/arm/mach-exynos4/usb-phy.c
>> b/arch/arm/mach-exynos4/setup-usb-phy.c
>> similarity index 100%
>> rename from arch/arm/mach-exynos4/usb-phy.c
>> rename to arch/arm/mach-exynos4/setup-usb-phy.c


--=20
Tushar Behera
