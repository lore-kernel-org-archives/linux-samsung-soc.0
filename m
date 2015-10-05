From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/2] ARM: exynos_defconfig: Enable rtl8152 ethernet
 driver for Odroid-XU4
Date: Mon, 5 Oct 2015 08:14:35 +0100
Message-ID: <20151005071435.GC3377@x1>
References: <1444026570-14076-1-git-send-email-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:35913 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751462AbbJEHOj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Oct 2015 03:14:39 -0400
Received: by wicgb1 with SMTP id gb1so105283585wic.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Oct 2015 00:14:38 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1444026570-14076-1-git-send-email-linux.amoon@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, Thierry Reding <treding@nvidia.com>, Andreas Faerber <afaerber@suse.de>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Geert Uytterhoeven <geert+renesas@glider.be>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Ray Jui <rjui@broadcom.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 05 Oct 2015, Anand Moon wrote:

> Enable CONFIG_USB_RTL8152 for Odroid-XU4.
>=20
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  arch/arm/configs/exynos_defconfig | 1 +
>  1 file changed, 1 insertion(+)

Why have you sent this to me?

Please be more selective with your recipient list. =20

> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exy=
nos_defconfig
> index 1ff2bfa..5d1937b 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -61,6 +61,7 @@ CONFIG_BLK_DEV_DM=3Dy
>  CONFIG_DM_CRYPT=3Dm
>  CONFIG_NETDEVICES=3Dy
>  CONFIG_SMSC911X=3Dy
> +CONFIG_USB_RTL8152=3Dy
>  CONFIG_USB_USBNET=3Dy
>  CONFIG_USB_NET_SMSC75XX=3Dy
>  CONFIG_USB_NET_SMSC95XX=3Dy

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
