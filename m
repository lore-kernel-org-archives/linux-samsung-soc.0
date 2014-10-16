From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH 8/9] usb: dwc2/gadget: fix calls to phy control functions
 in suspend/resume code
Date: Thu, 16 Oct 2014 08:42:40 -0500
Message-ID: <20141016134240.GK3480@saruman>
References: <1413464285-24172-1-git-send-email-m.szyprowski@samsung.com>
 <1413464285-24172-9-git-send-email-m.szyprowski@samsung.com>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rwbb4r/vLufKlfJs"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:45592 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752249AbaJPNmx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Oct 2014 09:42:53 -0400
Content-Disposition: inline
In-Reply-To: <1413464285-24172-9-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Paul Zimmerman <paulz@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

--rwbb4r/vLufKlfJs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 16, 2014 at 02:58:04PM +0200, Marek Szyprowski wrote:
> This patch moves calls to phy enable/disable out of spinlock protected
> blocks in device suspend/resume to fix incorrect caller context. Phy
> related functions must not be called from atomic context.
>=20
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/usb/dwc2/gadget.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index cdf417a7ae63..052b1a857291 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c
> @@ -3656,11 +3656,13 @@ static int s3c_hsotg_suspend(struct platform_devi=
ce *pdev, pm_message_t state)
>  			 hsotg->driver->driver.name);
> =20
>  	spin_lock_irqsave(&hsotg->lock, flags);
> +	s3c_hsotg_core_disconnect(hsotg);
>  	s3c_hsotg_disconnect(hsotg);
> -	s3c_hsotg_phy_disable(hsotg);
>  	hsotg->gadget.speed =3D USB_SPEED_UNKNOWN;
>  	spin_unlock_irqrestore(&hsotg->lock, flags);
> =20
> +	s3c_hsotg_phy_disable(hsotg);

this is aching to have a locked version as well as an unlocked version.
Look at what you do here. There's a minor race when you release that
spinlock. By the time ->suspend() is called, IRQs are not yet disabled.

--=20
balbi

--rwbb4r/vLufKlfJs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUP8tQAAoJEIaOsuA1yqRElsAP/0e9QOFR0zwI9RebMP50p3hA
TUKoZ93YWxZ5XDYaf35rnKdD2V+ybjDRRunSpP8RPtHf2BOsFmLhFmhoGcM3rzWp
ko1crXROz3oF3gnUSd5riiKcp1ZjlxokLe1mmrUNn06xypL2v+/geCmJNQ7n6ISh
M7662x7OhNC6qZEGchV8Z4XO+w6ChhdCTTEoHzmLaKAW/AjqeAWMGzZ11F1+ok+Q
rDAM3y5TThQ9Ogq9Z6nVWmwI2T1dQu2ePllUxudal1BaIUKVGkS1MhWtRlVOyOOp
3WTLlzRLFTt7sO2BuVpfRt203qfIK6PuEaV+Gc2m221w8NS5zaCmdCIJoT11oZV5
Yp2WM9tIWHtUVqKbOxT+9xviR1Z8kONKiHo0bnKO0NF+DDk+BJr41J9J8yYnC7ik
BUkGXX3nrxkZDwObN2KYM+QFyHq4phyIumJn6P9VYYGCwnnlMoC7OJ2D0+O3dBTz
QenZgrEMWpKRi14k+DeS8kRz12Q0ULlowhTFkIQsAVfXKTFtBcEM6yY1vBrMEKNw
GpjylbvwCRdBxj8OdKPJpC848fgDD8ZzxyIRn15lCING/W1bxOj+tRfqD2/VBy+5
U2JkNok9jIJoLs4MFQ0+LVtYmRfprc8j1hBE/uRsMkXzV/IXubs05tQweh8eZ1LB
oWOI57mEDVidXIAzkotC
=4K0P
-----END PGP SIGNATURE-----

--rwbb4r/vLufKlfJs--
