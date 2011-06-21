From: Felipe Balbi <balbi@ti.com>
Subject: Re: [RFC][PATCH 2/5] ARM: SAMSUNG: Changing the build condition of
 OTG platform device for samsung.
Date: Tue, 21 Jun 2011 14:49:41 +0300
Message-ID: <20110621114940.GB2531@legolas.emea.dhcp.ti.com>
References: <1308639827-2121-1-git-send-email-p.paneri@samsung.com>
 <1308639827-2121-3-git-send-email-p.paneri@samsung.com>
 <4E0084B8.1040201@ru.mvista.com>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TRYliJ5NKNqkz5bu"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from na3sys009aog105.obsmtp.com ([74.125.149.75]:39255 "EHLO
	na3sys009aog105.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753051Ab1FULts (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Jun 2011 07:49:48 -0400
Content-Disposition: inline
In-Reply-To: <4E0084B8.1040201@ru.mvista.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sergei Shtylyov <sshtylyov@mvista.com>
Cc: p.paneri@samsung.com, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, balbi@ti.com, tmarri@apm.com, naushad@samsung.com, thomas.ab@samsung.com, a.kesavan@samsung.com


--TRYliJ5NKNqkz5bu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 21, 2011 at 03:47:04PM +0400, Sergei Shtylyov wrote:
> Hello.
>=20
> On 21-06-2011 11:03, p.paneri@samsung.com wrote:
>=20
> >From: Praveen Paneri<p.paneri@samsung.com>
>=20
> >Adding dwc driver name in existing platform device
> >to probe DWC OTG driver.
> >Introduced otg_set_platdata function to pass platform data
> >Added selectable config option to add DWC OTG driver for different
> >machines.
>=20
> >Signed-off-by: Praveen Paneri<p.paneri@samsung.com>
> [...]
>=20
> >diff --git a/arch/arm/plat-samsung/dev-usb-hsotg.c b/arch/arm/plat-samsu=
ng/dev-usb-hsotg.c
> >index 33a844a..7e6228b 100644
> >--- a/arch/arm/plat-samsung/dev-usb-hsotg.c
> >+++ b/arch/arm/plat-samsung/dev-usb-hsotg.c
> [...]
> >@@ -37,7 +39,12 @@ static struct resource s3c_usb_hsotg_resources[] =3D {
> >  static u64 s3c_hsotg_dmamask =3D DMA_BIT_MASK(32);
> >
> >  struct platform_device s3c_device_usb_hsotg =3D {
> >+#ifdef CONFIG_S3C_DEV_USB_HSOTG
> >  	.name		=3D "s3c-hsotg",
> >+#endif
> >+#ifdef CONFIG_S3C_DEV_DWC_OTG
> >+	.name		=3D "dwc_otg",
> >+#endif
>=20
>    I'd done it as:
>=20
> +#if defined(CONFIG_S3C_DEV_USB_HSOTG)
>   	.name		=3D "s3c-hsotg",
> +#elif defined(CONFIG_S3C_DEV_DWC_OTG)
> +	.name		=3D "dwc_otg",
> +#endif

no... don't do that. How many times do I have to repeat ? No ifdefs!! we
want both drivers to be able to be compiled as modules, so add both
platform devices.

--=20
balbi

--TRYliJ5NKNqkz5bu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOAIVUAAoJEAv8Txj19kN1rGYH/2XDV9sE1PEJN10lVeIzH6QG
g/rJZaQwXfZxG3d1jANpUHmFyLCebFkSdngyIfs8XksPGp09vdXGCqMxKaEMlMPA
qpQy5ddhhcvlkL1t7OdfNeFGkyqBsensLUK0nG9iJGwRL37klt40uNGo5yIxlXDA
/aovyhjLDjQ+SyWrpdA8l2+gech+JmxR2lD/NQNCCEugB/L18uvIx1V2e2xR4Sho
vtlU65CIhUyND3hwZEYUrirLO2yQRMTbSwXyGfnRR2RR+0ny4euENwkl7/d2Jczf
U5dk8YCOjsV7JkQ7sR6Wevpf01BXqaL5LPxxS6008SlsqWwYYm0rFWqEF0ycUqU=
=5ymy
-----END PGP SIGNATURE-----

--TRYliJ5NKNqkz5bu--
