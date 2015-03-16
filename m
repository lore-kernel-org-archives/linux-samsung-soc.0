From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 3/3] ARM: dts: Define stdout-path property for Spring
 board
Date: Mon, 16 Mar 2015 12:05:44 +0100
Message-ID: <5506B908.1060007@suse.de>
References: <1426501710-24177-1-git-send-email-javier.martinez@collabora.co.uk> <1426501710-24177-4-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:60440 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751450AbbCPLFr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Mar 2015 07:05:47 -0400
In-Reply-To: <1426501710-24177-4-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

Am 16.03.2015 um 11:28 schrieb Javier Martinez Canillas:
> The kernel can use as the default console a serial port if is defined

"The kernel can use a serial port as the default console if it's define=
d
=2E.."

> as stdout device in the Device Tree.
>=20
> This allows a board to be booted without the need of having a console
> parameter in the kernel command line.
>=20
> Currently the Spring DTS has bootargs in the /chosen node and this is
> kept since users that don't have a serial console on this board might
> be using it to have the boot log shown in the display. This will have
> more precedence than the stdout-path but it's fine since is only used

"since it's"

> when CONFIG_ARM_ATAG_DTB_COMPAT_CMDLINE_EXTEND is enabled.
>=20
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
> ---
>  arch/arm/boot/dts/exynos5250-spring.dts | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm/boot/dts/exynos5250-spring.dts b/arch/arm/boot/=
dts/exynos5250-spring.dts
> index f02775487cd4..b9ec763a5602 100644
> --- a/arch/arm/boot/dts/exynos5250-spring.dts
> +++ b/arch/arm/boot/dts/exynos5250-spring.dts
> @@ -25,6 +25,7 @@
> =20
>  	chosen {
>  		bootargs =3D "console=3Dtty1";
> +		stdout-path =3D "serial3:115200n8";

Is this a guess or did you verify that against some schematics?

>  	};
> =20
>  	gpio-keys {

Assuming that bootargs still work,

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

I do wonder why this mechanism could not point to the same location as
bootargs? ("dp-controller"?) The device does not even have screws for
opening it, so accessing the serial port is highly theoretical.

Regards,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer, Jane Smithard, Jennifer Guild, Dilip Upmanyu,
Graham Norton; HRB 21284 (AG N=FCrnberg)
