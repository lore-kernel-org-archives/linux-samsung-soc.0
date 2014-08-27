From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 2/2 v2] ARM: exynos_defconfig: enable USB gadget support
Date: Wed, 27 Aug 2014 03:38:53 +0200
Message-ID: <53FD36AD.1020509@suse.de>
References: <1409038230-7242-1-git-send-email-sjoerd.simons@collabora.co.uk> <1409038230-7242-3-git-send-email-sjoerd.simons@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:54180 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756102AbaH0Bi5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Aug 2014 21:38:57 -0400
In-Reply-To: <1409038230-7242-3-git-send-email-sjoerd.simons@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Am 26.08.2014 09:30, schrieb Sjoerd Simons:
> Enable USB gadget support without support for any specific gadgets to
> more easily catch cases where a devices dts doesn't specify the usb
> controllers dr_mode while it should.
>=20
> Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
> ---
>  Changes in v2: none
>=20
>  arch/arm/configs/exynos_defconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exy=
nos_defconfig
> index fc7d168..3664120 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -54,6 +54,7 @@ CONFIG_SMSC911X=3Dy
>  CONFIG_USB_USBNET=3Dy
>  CONFIG_USB_NET_SMSC75XX=3Dy
>  CONFIG_USB_NET_SMSC95XX=3Dy
> +CONFIG_USB_GADGET=3Dy

Do we also need CONFIG_USB_DWC3_DUAL_ROLE=3Dy? The default seemed to be
CONFIG_USB_DWC3_HOST.

>  CONFIG_INPUT_EVDEV=3Dy
>  CONFIG_KEYBOARD_GPIO=3Dy
>  CONFIG_KEYBOARD_CROS_EC=3Dy

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
