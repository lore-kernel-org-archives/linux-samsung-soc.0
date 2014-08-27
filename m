From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 1/2] ARM: exynos_defconfig: Enable Control Groups support
Date: Wed, 27 Aug 2014 18:10:14 +0200
Message-ID: <53FE02E6.3030302@suse.de>
References: <1409137341-20516-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:39394 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S935294AbaH0QKR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Aug 2014 12:10:17 -0400
In-Reply-To: <1409137341-20516-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Am 27.08.2014 13:02, schrieb Javier Martinez Canillas:
> systemd needs control groups support to be enabled in the
> kernel so let's enable it by default since is quite likely
> that a user-space with systemd will be used.
>=20
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
> ---
>  arch/arm/configs/exynos_defconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exy=
nos_defconfig
> index 676c744..590abde 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -1,6 +1,7 @@
>  CONFIG_SYSVIPC=3Dy
>  CONFIG_NO_HZ=3Dy
>  CONFIG_HIGH_RES_TIMERS=3Dy
> +CONFIG_CGROUPS=3Dy
>  CONFIG_BLK_DEV_INITRD=3Dy
>  CONFIG_KALLSYMS_ALL=3Dy
>  CONFIG_MODULES=3Dy

CONFIG_FHANDLE=3Dy is also needed for systemd to get a serial console.
multi_v7 has that already.

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
