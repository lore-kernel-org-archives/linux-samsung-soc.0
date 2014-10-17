From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH 3/9] usb: dwc2/gadget: fix support for soft_connect udc
 framework feature
Date: Fri, 17 Oct 2014 10:44:35 -0500
Message-ID: <20141017154435.GP26260@saruman>
References: <1413464285-24172-1-git-send-email-m.szyprowski@samsung.com>
 <1413464285-24172-4-git-send-email-m.szyprowski@samsung.com>
 <20141016133610.GH3480@saruman>
 <5440F2E4.3030901@samsung.com>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FRaepaAnLTQkJ4tS"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:40082 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752325AbaJQPot (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 Oct 2014 11:44:49 -0400
Content-Disposition: inline
In-Reply-To: <5440F2E4.3030901@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: balbi@ti.com, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Paul Zimmerman <paulz@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

--FRaepaAnLTQkJ4tS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2014 at 12:43:48PM +0200, Marek Szyprowski wrote:
> Hello,
>=20
> On 2014-10-16 15:36, Felipe Balbi wrote:
> >On Thu, Oct 16, 2014 at 02:57:59PM +0200, Marek Szyprowski wrote:
> >>Enabling and disabling usb gadget by writing to
> >>/sys/class/udc/*hsotg/soft_connect results in calling udc_start/udc_stop
> >>functions with the same usb gadget driver, so the driver should not WARN
> >>about such case.
> >>
> >>Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >>---
> >>  drivers/usb/dwc2/gadget.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >>diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> >>index 8870e38c1d82..37fda4c03397 100644
> >>--- a/drivers/usb/dwc2/gadget.c
> >>+++ b/drivers/usb/dwc2/gadget.c
> >>@@ -2892,7 +2892,7 @@ static int s3c_hsotg_udc_start(struct usb_gadget =
*gadget,
> >>  		return -EINVAL;
> >>  	}
> >>-	WARN_ON(hsotg->driver);
> >>+	WARN_ON(hsotg->driver && hsotg->driver !=3D driver);
> >the bug is in your ->udc_stop(). You should clear hsotg->driver to NULL
> >there.
>=20
> Ok, I will change udc_stop() to always zero hsotg->driver, like other udc
> drivers. I was a bit confused by the fact that udc core passes driver to
> udc_stop(), when called from soft_connect and NULL on gadget removal.

That can probably be cleaned up, I'll go have a look on all UDCs and
make sure I won't break anything.

--=20
balbi

--FRaepaAnLTQkJ4tS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUQTljAAoJEIaOsuA1yqREXGwQAIINnLQq3GrL6392i7fEDmjP
J/h//aNIFMtu+SIll1L1nNNfgZT3nVhbM+0z/NPgS6zcBN4fJqF+zkDPanBEJKfc
wGnvo3gQzK8XDN2+8gLQqtQOcQsyOF6VrZl/ARJvuOJbAQLZ+sfnsTGKyAmgpZtZ
LTaJvjLTb0CsKKXlrxQ/0ZvuqMJmBPgYSJN3dhk2eO75PFi6Lw06LFTvkg7HNOnA
XQ9HkrO8i5ugDkGI2SDXFyFeBw8u00XGurqUZuSb+1icB/wEqKCI9TwZUfyIwQx1
p3ENAvJZ5awksqXaSs9Nm+IPItkFADi1Tb8ukR2bVMWYHhTMurCZOQ7yJt6VpCTe
Q0tvu9iru02JiUkB+qfOw5XOVp0FVltUa7Txl2FHLU1zFeHx44e4ZcDQyk4gLKDh
PlQXgBvF5P3u+8S8ADH8oOKEb/ys6UUz2MmkFRzL8LmUaYHQpwC5iEJzQIwdxiVd
msF+9bdpUE6iqP6LPsaY2mA8gGuZuh3ERN3ku6eVCfruvxtgYlz7gpoDEsC9gESB
UBBBbkYjSRbEt9ry/m5sIBESDps6zlYxGHwPvbhuFahu+ABzY7EUi28ZcZtilx4s
78Hb4eyKnx3VcqFtkWWlCwr9vn3dqgNy59K6aMSoVpfCZd/dqTvPrP6Y8oI3xbfg
BRREM6C6ukU60zEv62/5
=8LkZ
-----END PGP SIGNATURE-----

--FRaepaAnLTQkJ4tS--
