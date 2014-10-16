From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH 3/9] usb: dwc2/gadget: fix support for soft_connect udc
 framework feature
Date: Thu, 16 Oct 2014 08:36:10 -0500
Message-ID: <20141016133610.GH3480@saruman>
References: <1413464285-24172-1-git-send-email-m.szyprowski@samsung.com>
 <1413464285-24172-4-git-send-email-m.szyprowski@samsung.com>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2oox5VnwalALFvA7"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:55338 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752035AbaJPNgX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Oct 2014 09:36:23 -0400
Content-Disposition: inline
In-Reply-To: <1413464285-24172-4-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Paul Zimmerman <paulz@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

--2oox5VnwalALFvA7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 16, 2014 at 02:57:59PM +0200, Marek Szyprowski wrote:
> Enabling and disabling usb gadget by writing to
> /sys/class/udc/*hsotg/soft_connect results in calling udc_start/udc_stop
> functions with the same usb gadget driver, so the driver should not WARN
> about such case.
>=20
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/usb/dwc2/gadget.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index 8870e38c1d82..37fda4c03397 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c
> @@ -2892,7 +2892,7 @@ static int s3c_hsotg_udc_start(struct usb_gadget *g=
adget,
>  		return -EINVAL;
>  	}
> =20
> -	WARN_ON(hsotg->driver);
> +	WARN_ON(hsotg->driver && hsotg->driver !=3D driver);

the bug is in your ->udc_stop(). You should clear hsotg->driver to NULL
there.

--=20
balbi

--2oox5VnwalALFvA7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUP8nKAAoJEIaOsuA1yqREwUUQAJlnXaKqgKl+c1IvnN5UL8NT
weGlC9Bj3v4iShc+PBQ7gAHV2i4vXs9/0SXPGyuRxFRN2iZ+EsfpAxv6Asqvu0Z0
YaEr9g/n/WpBOSvTxeFjPwcBTF9pLrBcLysppixoLZQM5zeFkid9OvZdX6XVkZgn
2Dw4Qa2L/GMewwfqMUdZyEiwdQFubX53Y99YTtXYAXtM7HhKVcLnYKz9zYGSrA7M
EUdZr/U9PTM3i3twIpC9dEIkhfEYn2uBZ68SmHkYOeSgqmnkG93UenLjiDysUrWx
lWTk6yXh/7pOxpnASRoU0AVhk6bs91+BIzBdag7GHFiWWQWK23qa4kVrf5nzx3yl
bnQkZuikBL/89sxTMrp2J1qWCgOlal2xvZbxiFsZeGxP1LbcmzOSA8vi7kajiDrl
76SEz7q16lBQffYWV77+Cdi7KUsxYFAg390jYZwqWW+id01giF8ve0O2bmZslP7Q
ZYbgnp2+bbldLY4Sleuz/kSmVjULrWhzlWW0WTJ6Mxlt4ijhfDkPEsgBka45zj0L
LsNDURaY0jXEISlUMzgazGh6RXygjvsW7KQdHsMFYzTgGTfo2WYrePk3GJ3O+837
JJO97i4Qv3iyMYuSfZRY0MO9S2gJZ6FMynBYMg0eFLid4pF7SWvYXaN5iCMOGkKt
BM+wiO3w6RZWE90mFS2I
=xNJR
-----END PGP SIGNATURE-----

--2oox5VnwalALFvA7--
