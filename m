From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH 3/9] usb: dwc2/gadget: fix support for soft_connect udc
 framework feature
Date: Fri, 17 Oct 2014 11:02:34 -0500
Message-ID: <20141017160234.GS26260@saruman>
References: <1413464285-24172-1-git-send-email-m.szyprowski@samsung.com>
 <1413464285-24172-4-git-send-email-m.szyprowski@samsung.com>
 <20141016133610.GH3480@saruman>
 <5440F2E4.3030901@samsung.com>
 <20141017154435.GP26260@saruman>
 <20141017154630.GQ26260@saruman>
 <20141017154925.GR26260@saruman>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H88uUF932U8Oj0a6"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:32866 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751289AbaJQQCt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 Oct 2014 12:02:49 -0400
Content-Disposition: inline
In-Reply-To: <20141017154925.GR26260@saruman>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Paul Zimmerman <paulz@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

--H88uUF932U8Oj0a6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2014 at 10:49:25AM -0500, Felipe Balbi wrote:
> On Fri, Oct 17, 2014 at 10:46:30AM -0500, Felipe Balbi wrote:
> > Hi,
> >=20
> > On Fri, Oct 17, 2014 at 10:44:35AM -0500, Felipe Balbi wrote:
> > > On Fri, Oct 17, 2014 at 12:43:48PM +0200, Marek Szyprowski wrote:
> > > > Hello,
> > > >=20
> > > > On 2014-10-16 15:36, Felipe Balbi wrote:
> > > > >On Thu, Oct 16, 2014 at 02:57:59PM +0200, Marek Szyprowski wrote:
> > > > >>Enabling and disabling usb gadget by writing to
> > > > >>/sys/class/udc/*hsotg/soft_connect results in calling udc_start/u=
dc_stop
> > > > >>functions with the same usb gadget driver, so the driver should n=
ot WARN
> > > > >>about such case.
> > > > >>
> > > > >>Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > > > >>---
> > > > >>  drivers/usb/dwc2/gadget.c | 2 +-
> > > > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >>
> > > > >>diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> > > > >>index 8870e38c1d82..37fda4c03397 100644
> > > > >>--- a/drivers/usb/dwc2/gadget.c
> > > > >>+++ b/drivers/usb/dwc2/gadget.c
> > > > >>@@ -2892,7 +2892,7 @@ static int s3c_hsotg_udc_start(struct usb_g=
adget *gadget,
> > > > >>  		return -EINVAL;
> > > > >>  	}
> > > > >>-	WARN_ON(hsotg->driver);
> > > > >>+	WARN_ON(hsotg->driver && hsotg->driver !=3D driver);
> > > > >the bug is in your ->udc_stop(). You should clear hsotg->driver to=
 NULL
> > > > >there.
> > > >=20
> > > > Ok, I will change udc_stop() to always zero hsotg->driver, like oth=
er udc
> > > > drivers. I was a bit confused by the fact that udc core passes driv=
er to
> > > > udc_stop(), when called from soft_connect and NULL on gadget remova=
l.
> > >=20
> > > That can probably be cleaned up, I'll go have a look on all UDCs and
> > > make sure I won't break anything.
> >=20
> > looks like chipidea is the only one still using that argument, if you
>=20
> meant dwc2

Hmm, there are still a few other gadgets relying on that argument. It'll
take a little more effort to remove it.

--=20
balbi

--H88uUF932U8Oj0a6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUQT2aAAoJEIaOsuA1yqREMKcQALAW3KZCfJEFa/bBz06bVNa8
r+Bv3bZV+W//hVtshHVlDdnUHHgPe6k5Splxye0+2PN3W4ArVmDGn907yBJbcH6k
4o/Z2FsjwCJG4RY90uzLH/OgUgs3E0FJeDbbyoIqSLDnCRiDqxkBr20qd8oz5ZYc
SaxROLfnaSyXPvJhu1pPOlx/kGZee21MXPYYC2doPYYjbl+YM8u9OT+Wqmr/RBsX
aUkLBiRfW0Q0AEdrOvLqj3Yz4YNLNZIbnjY7EqAVGDf6VqWdSkqe5uiYpvmgK++U
ebzgQ802IRdbxGXeEXhiznRvSiSm13/1V9Qde/7RfMnRA8Ynr58ogPYjfngycDrl
I+Rz1uuhzpykU2Ub/NxHDNxlCjW4lZZV/Atx4xnHbxJXgTKxtfUQ9oUacjLCFTqR
evl51MHgB0SlGd/nIOLCEke8nAthiRAPydnYyba0plN6GTVr5h95Ww6GvDmfl15T
OSGVGdryIv2sPAmVJ9m14azZwXM06yZJRFcUO6GpoA0reiYFc91wh4lLWqEicT6s
aDCfrOEyzkfl1xL3+DybCtW/jKU0zTOiM4BYlJOcmwcUTEJFdtraKCajCFMcD4Dg
iwg6qI5ZLzOLowPX3BnQIVR+ZmQSfp/VITD4dx5JZiOzWmSJjVkTKTiYwEoAMino
nAsIqt3Ngpys3eTxEC2N
=9EvR
-----END PGP SIGNATURE-----

--H88uUF932U8Oj0a6--
