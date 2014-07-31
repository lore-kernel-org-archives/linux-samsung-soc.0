From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH] ARM: exynos_defconfig: Enable PL330 DMA
Date: Thu, 31 Jul 2014 08:09:49 +0200
Message-ID: <53D9DDAD.7040602@suse.de>
References: <1406785359-21669-1-git-send-email-tushar.b@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:50738 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756844AbaGaGJy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 02:09:54 -0400
In-Reply-To: <1406785359-21669-1-git-send-email-tushar.b@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.b@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, olof@lixom.net, khilman@linaro.org, trblinux@gmail.com

Hi Tushar,

Am 31.07.2014 07:42, schrieb Tushar Behera:
> We are getting a system hang on Arndale-Octa board if PL330_DMA is no=
t
> enabled. The issue is related to [1].
>=20
> AUDSS block provides the clock for audio DMA controller. Any operatio=
n
> on this clock requires that the clock to AUDSS block be enabled. In
> current configuration, the clock is gated during late boot process wh=
en
> all unused clocks are disabled.
>=20
> When PL330_DMA is enabled, the 'apb_pclk' is enabled/disabled during
> amba_probe(). Otherwise, this clock is also disabled during late boot=
=2E
> If the AUDSS block clock is disabled by then, we get a system hang.
>=20
> [1] https://lkml.org/lkml/2014/6/11/32
>=20
> Signed-off-by: Tushar Behera <tushar.b@samsung.com>
> ---
>  arch/arm/configs/exynos_defconfig |    2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exy=
nos_defconfig
> index e07a227..c5888e8 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -109,6 +109,8 @@ CONFIG_MMC_DW_IDMAC=3Dy
>  CONFIG_MMC_DW_EXYNOS=3Dy
>  CONFIG_RTC_CLASS=3Dy
>  CONFIG_RTC_DRV_S3C=3Dy
> +CONFIG_DMADEVICES=3Dy
> +CONFIG_PL330_DMA=3Dy
>  CONFIG_COMMON_CLK_MAX77686=3Dy
>  CONFIG_EXT2_FS=3Dy
>  CONFIG_EXT3_FS=3Dy

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Turns out I had those enabled in my local config when testing the memor=
y
patches on Arndale Octa.

multi_v7_defconfig has them already.

However, shouldn't Kconfig grow a dependency to enable those options
automatically for whatever driver or SoC needs them?

Cheers,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
