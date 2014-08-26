From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 1/2 v2] ARM: dts: exynos: Explicitly set dr_mode on peach-pit
 and peach-pi
Date: Wed, 27 Aug 2014 00:59:11 +0200
Message-ID: <53FD113F.7080800@suse.de>
References: <1409038230-7242-1-git-send-email-sjoerd.simons@collabora.co.uk> <1409038230-7242-2-git-send-email-sjoerd.simons@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:52920 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755909AbaHZW7O (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Aug 2014 18:59:14 -0400
In-Reply-To: <1409038230-7242-2-git-send-email-sjoerd.simons@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Am 26.08.2014 09:30, schrieb Sjoerd Simons:
> In case the optional dr_mode property isn't set in the dwc3 nodes the
> the controller will go into OTG mode iff both USB host and USB gadget
> functionality are enabled in the kernel configuration. Unfortunately =
this
> results in USB not working on exynos5420-peach-pit and
> exynos5800-peach-pi with such a kernel configuration unless manually
> change the mode. To resolve that explicitely configure the dual role

"explicitly"

> mode as host
>=20
> Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
> ---
>   Changes in v2: alphabetically sort the dts entries
>=20
>  arch/arm/boot/dts/exynos5420-peach-pit.dts | 8 ++++++++
>  arch/arm/boot/dts/exynos5420.dtsi          | 4 ++--
>  arch/arm/boot/dts/exynos5800-peach-pi.dts  | 8 ++++++++
>  3 files changed, 18 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/bo=
ot/dts/exynos5420-peach-pit.dts
> index 228a6b1..29d3a59 100644
> --- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
> +++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
> @@ -427,6 +427,14 @@
>  	status =3D "okay";
>  };
> =20
> +&usbdrd_dwc3_0 {
> +	dr_mode =3D "host";
> +};
> +
> +&usbdrd_dwc3_1 {
> +	dr_mode =3D "host";
> +};
> +
>  &usbdrd_phy0 {
>  	vbus-supply =3D <&usb300_vbus_reg>;
>  };
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/ex=
ynos5420.dtsi
> index bfe056d..8617a03 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -815,7 +815,7 @@
>  		#size-cells =3D <1>;
>  		ranges;
> =20
> -		dwc3 {
> +		usbdrd_dwc3_0: dwc3 {
>  			compatible =3D "snps,dwc3";
>  			reg =3D <0x12000000 0x10000>;
>  			interrupts =3D <0 72 0>;
> @@ -841,7 +841,7 @@
>  		#size-cells =3D <1>;
>  		ranges;
> =20
> -		dwc3 {
> +		usbdrd_dwc3_1: dwc3 {
>  			compatible =3D "snps,dwc3";
>  			reg =3D <0x12400000 0x10000>;
>  			interrupts =3D <0 73 0>;
> diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boo=
t/dts/exynos5800-peach-pi.dts
> index f3ee48b..2064550 100644
> --- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
> +++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
> @@ -425,6 +425,14 @@
>  	status =3D "okay";
>  };
> =20
> +&usbdrd_dwc3_0 {
> +	dr_mode =3D "host";
> +};
> +
> +&usbdrd_dwc3_1 {
> +	dr_mode =3D "host";
> +};
> +
>  &usbdrd_phy0 {
>  	vbus-supply =3D <&usb300_vbus_reg>;
>  };

Thanks,

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
