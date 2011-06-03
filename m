From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH V2] ARM: S5P: Fix compilation error for exynos4_defconfig
Date: Fri, 3 Jun 2011 17:21:31 +0530
Message-ID: <BANLkTimyRFHgfk_CnVDbny5w8jaJ5qq8hA@mail.gmail.com>
References: <1307084654-22052-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:39685 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754401Ab1FCLvc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Jun 2011 07:51:32 -0400
Received: by qyk7 with SMTP id 7so2870383qyk.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Jun 2011 04:51:32 -0700 (PDT)
In-Reply-To: <1307084654-22052-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linaro-dev@lists.linaro.org, kgene.kim@samsung.com, nicolas.pitre@linaro.org, patches@linaro.org, jy0922.shim@samsung.com, samsung@lists.linaro.org, m.szyprowski@samsung.com

On 3 June 2011 12:34, Tushar Behera <tushar.behera@linaro.org> wrote:
> Added Kconfig entry for setup-usb-phy.c on which EHCI support is
> dependent on.
>
> Following the naming convention of other setup files, we have followi=
ng
> renaming.
> =A0 =A0 =A0 =A0usb-phy.c =3D=3D> setup-usb-phy.c
>
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
> =A0arch/arm/mach-exynos4/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 =A06 ++++++
> =A0arch/arm/mach-exynos4/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A02 +-
> =A0.../mach-exynos4/{usb-phy.c =3D> setup-usb-phy.c} =A0 =A0| =A0 =A0=
0
> =A03 files changed, 7 insertions(+), 1 deletions(-)
> =A0rename arch/arm/mach-exynos4/{usb-phy.c =3D> setup-usb-phy.c} (100=
%)
>
> diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kc=
onfig
> index b92c1e5..a45a022 100644
> --- a/arch/arm/mach-exynos4/Kconfig
> +++ b/arch/arm/mach-exynos4/Kconfig
> @@ -91,6 +91,11 @@ config EXYNOS4_SETUP_FIMC
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Common setup code for the camera interfaces.
>
> +config EXYNOS4_SETUP_USB_PHY
> + =A0 =A0 =A0 bool
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 Common setup code for USB PHY controller
> +
> =A0# machine support
>
> =A0menu "EXYNOS4 Machines"
> @@ -176,6 +181,7 @@ config MACH_NURI
> =A0 =A0 =A0 =A0select EXYNOS4_SETUP_I2C3
> =A0 =A0 =A0 =A0select EXYNOS4_SETUP_I2C5
> =A0 =A0 =A0 =A0select EXYNOS4_SETUP_SDHCI
> + =A0 =A0 =A0 select EXYNOS4_SETUP_USB_PHY
> =A0 =A0 =A0 =A0select SAMSUNG_DEV_PWM
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Machine support for Samsung Mobile NURI Board.
> diff --git a/arch/arm/mach-exynos4/Makefile b/arch/arm/mach-exynos4/M=
akefile
> index a9bb94f..60fe5ec 100644
> --- a/arch/arm/mach-exynos4/Makefile
> +++ b/arch/arm/mach-exynos4/Makefile
> @@ -56,4 +56,4 @@ obj-$(CONFIG_EXYNOS4_SETUP_KEYPAD) =A0 =A0+=3D setu=
p-keypad.o
> =A0obj-$(CONFIG_EXYNOS4_SETUP_SDHCI) =A0 =A0 =A0+=3D setup-sdhci.o
> =A0obj-$(CONFIG_EXYNOS4_SETUP_SDHCI_GPIO) +=3D setup-sdhci-gpio.o
>
> -obj-$(CONFIG_USB_SUPPORT) =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D usb-phy.o
> +obj-$(CONFIG_EXYNOS4_SETUP_USB_PHY) =A0 =A0+=3D setup-usb-phy.o

Since plat-s5p/dev-ehci.c is the only consumer of setup-usb-phy.c,
could setup-usb-phy.o be made dependent on the S5P_DEV_USB_EHCI config
option? Any particular reason to create a new EXYNOS4_SETUP_USB_PHY
config option in this case? Will there be a case where usb phy
configuration code would be used irrespective of dev-ehci being used?

Thanks,
Thomas.

> diff --git a/arch/arm/mach-exynos4/usb-phy.c b/arch/arm/mach-exynos4/=
setup-usb-phy.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/usb-phy.c
> rename to arch/arm/mach-exynos4/setup-usb-phy.c
> --
> 1.7.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
