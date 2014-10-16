From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH 1/9] usb: dwc2/gadget: report disconnect event from 'end
 session' irq
Date: Thu, 16 Oct 2014 08:33:39 -0500
Message-ID: <20141016133339.GF3480@saruman>
References: <1413464285-24172-1-git-send-email-m.szyprowski@samsung.com>
 <1413464285-24172-2-git-send-email-m.szyprowski@samsung.com>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0hHDr/TIsw4o3iPK"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:45214 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752742AbaJPNdw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Oct 2014 09:33:52 -0400
Content-Disposition: inline
In-Reply-To: <1413464285-24172-2-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Paul Zimmerman <paulz@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

--0hHDr/TIsw4o3iPK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2014 at 02:57:57PM +0200, Marek Szyprowski wrote:
> This patch adds a call to s3c_hsotg_disconnect() from 'end session'
> interrupt to correctly notify gadget subsystem about unplugged usb
> cable.
>=20
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/usb/dwc2/gadget.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index 7b5856fadd93..119c8a3effc2 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c
> @@ -2279,6 +2279,12 @@ irq_retry:
>  		dev_info(hsotg->dev, "OTGInt: %08x\n", otgint);
> =20
>  		writel(otgint, hsotg->regs + GOTGINT);
> +
> +		if (otgint & GOTGINT_SES_END_DET) {

looks like this should be done for GINTSTS_DISCONNINT.

--=20
balbi

--0hHDr/TIsw4o3iPK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUP8kzAAoJEIaOsuA1yqREBJ0QAKahEsL1TExY8mA2+qE7+4Vh
Z2YytbK1l5RGC2upBvu3d/vL2HTkN0XwcQ7iANrOasdJ14I7zGGI2u5D0RTRHza6
gbRrmzz4rQDBDGjXI9ACnA+sNWS+XBv9NQlPackQAe/W8Y/KUcZYQtTi+sQ8appJ
YMavr9QcSFaU4bd+UtGkSwjx0M2vfITKRqSzIIPLMYEkhkStoRULRA8TqI2gxpOK
UywV9HQSFiRGc11WOkC3cvPvmssSUewQV9H7QqMMVEPgZwzNqFOnT5XI7UkZkzxG
+rO6AFivz0r7cEBY/NSTMAAGin7pOcqd2hfWxrO6wtLrBOQXKx7vVQ8tCimBl6b+
Eke89l6XpyRxxL3Gqq4ASoD5XPIXrSwSaF/PLWa8PqyLYxIKTdo11ir4n7a3eFsP
5mdhg6FCCxUvvU4R56nXtjIx4C/4hHsUTiWz1zKO/SvncPwQEkAC38K3EWH2YxY5
uuAZ91I14MtIrebSxFbUCiYvfq+0ZvKGpJN7xLU7JCL08zGePjp9ZAAyxLk6TmRa
amELcM7zQRY8Fqi62wB31IOgR9Ooqo9w1pI+vxIw2YQF6SA7uWA7dJom1I5wXl9O
tZRnlVaCrPTJqcZ0dII6jivMgav6yj9bNznlcCRKd/9E0vvQSl7UKRkhjj1FWjrt
a1HGcnNFls14TiY0w2RP
=KKjm
-----END PGP SIGNATURE-----

--0hHDr/TIsw4o3iPK--
