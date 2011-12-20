From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH 8/8] s3c-hsudc: remove the_controller global
Date: Tue, 20 Dec 2011 13:29:31 +0200
Message-ID: <20111220112930.GI31842@legolas.emea.dhcp.ti.com>
References: <201112191938.22254.heiko@sntech.de>
 <201112191943.35591.heiko@sntech.de>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CD/aTaZybdUisKIc"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from na3sys009aog115.obsmtp.com ([74.125.149.238]:48693 "EHLO
	na3sys009aog115.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750755Ab1LTL3h (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Dec 2011 06:29:37 -0500
Content-Disposition: inline
In-Reply-To: <201112191943.35591.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Felipe Balbi <balbi@ti.com>, Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Linux USB Mailing List <linux-usb@vger.kernel.org>


--CD/aTaZybdUisKIc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 19, 2011 at 07:43:35PM +0100, Heiko St=FCbner wrote:
> Instead use container_of to retrieve the s3c_hsudc from the
> struct usb_gadget pointer.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  drivers/usb/gadget/s3c-hsudc.c |   11 ++++++-----
>  1 files changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/usb/gadget/s3c-hsudc.c b/drivers/usb/gadget/s3c-hsud=
c.c
> index 8e69758..23cac9d 100644
> --- a/drivers/usb/gadget/s3c-hsudc.c
> +++ b/drivers/usb/gadget/s3c-hsudc.c
> @@ -161,7 +161,6 @@ struct s3c_hsudc {
>  #define ep_index(_ep)		((_ep)->bEndpointAddress & \
>  					USB_ENDPOINT_NUMBER_MASK)
> =20
> -static struct s3c_hsudc *the_controller;
>  static const char driver_name[] =3D "s3c-udc";
>  static const char ep0name[] =3D "ep0-control";
> =20
> @@ -1141,7 +1140,8 @@ static irqreturn_t s3c_hsudc_irq(int irq, void *_de=
v)
>  static int s3c_hsudc_start(struct usb_gadget *gadget,
>  		struct usb_gadget_driver *driver)
>  {
> -	struct s3c_hsudc *hsudc =3D the_controller;
> +	struct s3c_hsudc *hsudc =3D
> +			container_of(gadget, struct s3c_hsudc, gadget);

I have changed all these container_of() to your to_hsudc() helper
function.

--=20
balbi

--CD/aTaZybdUisKIc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJO8HGaAAoJEIaOsuA1yqREuOIP/0KJY4Hca7LLqaNGBGXwAhjd
23GRM3ARxNIyUqaayTQ3KDdf0e6TTpgsr7mGhyxZnpj7lmUk1I2gxgvFvUi3hdvd
YnRxmJ0IymS7MKL2BNmII5tPvpQWV2riCiPgm/J7nIh1hoe1fOEhYrCGy547+FMA
zZ4UxQHTokFWDxRekSVAlZsWE7/+UH2vUpH8rdUGTcn19hq5E0c8u7+bVYFctN5I
XsTofUK3ggwsTr5TUcAOlcgWI3w/bREFpa2e5MSxX9VctxU4j5Uc+mzNb1Re+dTh
P2aoP4vD4+ltciGbrSt4pzXjtTwTL3z34cJzY2pfgAEwkegpOEnDXyM11OX+yq6G
rYMXJCcK7V4pINNUZE7jAvFyJN4QM2w7um5U+mqwq9YLGQVCP6tcTllNyfbzbRie
Cslmw97xqAzfQH94AHsEuxTq/tgXEBYuy3Jd7yJCIMgd4FUo1S9h7VkyXpnolWIA
6ErDw6rIJah6tdpE+d1XSB782A6tOnq0Ugz68+jHcl/e6xNgF768z4ZaT+8jdJhy
YYh8HYteORtAwfrU8dLnI3nXOXsaO3vbURJW2rHn1Pp4cmQ8YDJxr6mz9MS/LzMF
Vw90bUSpgxZM0GHM4RuMI3Rb694kAXG5MTkhaBzKPAVJZ3G/kzwgDhzJ7etR2ZMC
gMVVtP0OIX74Y3rFofLK
=PNuE
-----END PGP SIGNATURE-----

--CD/aTaZybdUisKIc--
