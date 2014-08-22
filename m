From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 1/2] ARM: dts: exynos: Explicitly set dr_mode on peach-pit
 and peach-pi
Date: Fri, 22 Aug 2014 23:30:27 +0200
Message-ID: <53F7B673.9030400@suse.de>
References: <1408741021-17759-1-git-send-email-sjoerd.simons@collabora.co.uk> <1408741021-17759-2-git-send-email-sjoerd.simons@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:39839 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751761AbaHVVab (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Aug 2014 17:30:31 -0400
In-Reply-To: <1408741021-17759-2-git-send-email-sjoerd.simons@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi,

Am 22.08.2014 22:57, schrieb Sjoerd Simons:
> In case the optional dr_mode property isn't set in the dwc3 nodes the
> the controller will go into OTG mode iff both USB host and USB gadget
> functionality are enabled in the kernel configuration. Unfortunately =
this
> results in USB not working on exynos5420-peach-pit and
> exynos5800-peach-pi with such a kernel configuration unless manually
> change the mode. To resolve that explicitely configure the dual role
> mode as host
>=20
> Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
> ---
>  arch/arm/boot/dts/exynos5420-peach-pit.dts | 8 ++++++++
>  arch/arm/boot/dts/exynos5420.dtsi          | 4 ++--
>  arch/arm/boot/dts/exynos5800-peach-pi.dts  | 8 ++++++++
>  3 files changed, 18 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/bo=
ot/dts/exynos5420-peach-pit.dts
> index 228a6b1..6c22610 100644
> --- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
> +++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
> @@ -427,10 +427,18 @@
>  	status =3D "okay";
>  };
> =20
> +&usbdrd_dwc3_0 {
> +	dr_mode =3D "host";
> +};
> +
>  &usbdrd_phy0 {
>  	vbus-supply =3D <&usb300_vbus_reg>;
>  };
> =20
> +&usbdrd_dwc3_1 {
> +	dr_mode =3D "host";
> +};

The sort order should be alphabetical here, which means dwc before phy.

> +
>  &usbdrd_phy1 {
>  	vbus-supply =3D <&usb301_vbus_reg>;
>  };
[...]
> diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boo=
t/dts/exynos5800-peach-pi.dts
> index f3ee48b..166b352 100644
> --- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
> +++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
> @@ -425,10 +425,18 @@
>  	status =3D "okay";
>  };
> =20
> +&usbdrd_dwc3_0 {
> +	dr_mode =3D "host";
> +};
> +
>  &usbdrd_phy0 {
>  	vbus-supply =3D <&usb300_vbus_reg>;
>  };
> =20
> +&usbdrd_dwc3_1 {
> +	dr_mode =3D "host";
> +};

Dito.

> +
>  &usbdrd_phy1 {
>  	vbus-supply =3D <&usb301_vbus_reg>;
>  };

Cheers,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
