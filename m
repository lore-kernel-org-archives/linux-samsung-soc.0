From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH] ARM: exynos_defconfig: Enable WiFi-Ex as a module instead
 built-in
Date: Tue, 29 Sep 2015 15:20:18 +0200
Message-ID: <560A9012.2090802@suse.de>
References: <1443530546-3066-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:51293 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S964908AbbI2NUW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Sep 2015 09:20:22 -0400
In-Reply-To: <1443530546-3066-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Thierry Reding <treding@nvidia.com>, Anand Moon <linux.amoon@gmail.com>, Russell King <linux@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, linux-arm-kernel@lists.infradead.org

Am 29.09.2015 um 14:42 schrieb Javier Martinez Canillas:
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exy=
nos_defconfig
> index d4f6063d8a72..5aad617f02c7 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -64,8 +64,8 @@ CONFIG_SMSC911X=3Dy
>  CONFIG_USB_USBNET=3Dy
>  CONFIG_USB_NET_SMSC75XX=3Dy
>  CONFIG_USB_NET_SMSC95XX=3Dy
> -CONFIG_MWIFIEX=3Dy
> -CONFIG_MWIFIEX_SDIO=3Dy
> +CONFIG_MWIFIEX=3Dm
> +CONFIG_MWIFIEX_SDIO=3Dm
>  CONFIG_INPUT_EVDEV=3Dy
>  CONFIG_KEYBOARD_GPIO=3Dy
>  CONFIG_KEYBOARD_CROS_EC=3Dy

Makes sense,

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

What about multi_v7?

Cheers,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer, Jane Smithard, Graham Norton; HRB 21284 (AG N=FC=
rnberg)
