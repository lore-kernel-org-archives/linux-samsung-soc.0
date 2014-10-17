From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 3/9] usb: dwc2/gadget: fix support for soft_connect udc
 framework feature
Date: Fri, 17 Oct 2014 12:07:00 -0500
Message-ID: <20141017170700.GU26260@saruman>
References: <1413464285-24172-1-git-send-email-m.szyprowski@samsung.com>
 <1413464285-24172-4-git-send-email-m.szyprowski@samsung.com>
 <20141016133610.GH3480@saruman>
 <5440F2E4.3030901@samsung.com>
 <20141017154435.GP26260@saruman>
 <20141017154630.GQ26260@saruman>
 <20141017154925.GR26260@saruman>
 <20141017160234.GS26260@saruman>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vKcNkqnJHUUp475E"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141017160234.GS26260@saruman>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--vKcNkqnJHUUp475E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2014 at 11:02:34AM -0500, Felipe Balbi wrote:
> On Fri, Oct 17, 2014 at 10:49:25AM -0500, Felipe Balbi wrote:
> > On Fri, Oct 17, 2014 at 10:46:30AM -0500, Felipe Balbi wrote:
> > > Hi,
> > >=20
> > > On Fri, Oct 17, 2014 at 10:44:35AM -0500, Felipe Balbi wrote:
> > > > On Fri, Oct 17, 2014 at 12:43:48PM +0200, Marek Szyprowski wrote:
> > > > > Hello,
> > > > >=20
> > > > > On 2014-10-16 15:36, Felipe Balbi wrote:
> > > > > >On Thu, Oct 16, 2014 at 02:57:59PM +0200, Marek Szyprowski wrote:
> > > > > >>Enabling and disabling usb gadget by writing to
> > > > > >>/sys/class/udc/*hsotg/soft_connect results in calling udc_start=
/udc_stop
> > > > > >>functions with the same usb gadget driver, so the driver should=
 not WARN
> > > > > >>about such case.
> > > > > >>
> > > > > >>Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > > > > >>---
> > > > > >>  drivers/usb/dwc2/gadget.c | 2 +-
> > > > > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >>
> > > > > >>diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadge=
t.c
> > > > > >>index 8870e38c1d82..37fda4c03397 100644
> > > > > >>--- a/drivers/usb/dwc2/gadget.c
> > > > > >>+++ b/drivers/usb/dwc2/gadget.c
> > > > > >>@@ -2892,7 +2892,7 @@ static int s3c_hsotg_udc_start(struct usb=
_gadget *gadget,
> > > > > >>  		return -EINVAL;
> > > > > >>  	}
> > > > > >>-	WARN_ON(hsotg->driver);
> > > > > >>+	WARN_ON(hsotg->driver && hsotg->driver !=3D driver);
> > > > > >the bug is in your ->udc_stop(). You should clear hsotg->driver =
to NULL
> > > > > >there.
> > > > >=20
> > > > > Ok, I will change udc_stop() to always zero hsotg->driver, like o=
ther udc
> > > > > drivers. I was a bit confused by the fact that udc core passes dr=
iver to
> > > > > udc_stop(), when called from soft_connect and NULL on gadget remo=
val.
> > > >=20
> > > > That can probably be cleaned up, I'll go have a look on all UDCs and
> > > > make sure I won't break anything.
> > >=20
> > > looks like chipidea is the only one still using that argument, if you
> >=20
> > meant dwc2
>=20
> Hmm, there are still a few other gadgets relying on that argument. It'll
> take a little more effort to remove it.

Alright, just pending your bug fix. I have fixed all other drivers. Will
send out shortly.

--=20
balbi

--vKcNkqnJHUUp475E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUQUy0AAoJEIaOsuA1yqREWHgP/RtnoLk0F9vzuqAL8K1BHr06
ZEJeQktReoRuJhafBOoW9ayIDYYc8b1u105W+Aff+KE+dIfmaQbYgdKVRMwFy4VT
528Rcayo6W8E3Cp6lt3x4RYdSarcRLvz36+FXVlzr+3F+fGkTykdrlaILJloLa3Y
Pt6DyA627lZGx0Y45/a8V97ZZSc67vVm350iLL1Je892p9K9MQ0/4wLyoeBunZJV
D8awopJwSIFPG8773U1oroldbL9lKalMCWLDtmYXwOibWJRGkkAHOHxhkodRJuKr
8Hpj44DpzS2/PCl98Zur4afLnEWcAAzlvVWZonqD2a4vb2acxMoNtcLemNEpOjzE
xkWWQz/o+3u53hf4QHTz1ZRz38vE1jNOBao7y7SGCU0zQ5/fIH/pFOnSptizqYNa
HmJNLs88YAVtKjz24nKLBTW+MLCkHDcT0HbKhPPA+tq4vD0nvNz0hZxkuFWPXFix
AfV3up5mEqN7A5iXvzWaS0jWRZYLmAzBdsd6wNtWwMwyjy2b4Tm2dziznddsiIql
0wGhQbt0yeAPmhpFbz8po3oHtAub0+3erjhDGZ3RqgAlwt1QaunYTktJ2uBJpn5Z
OMQqKFixTfQeyEAFU7upoXiD/DwP/+XIQKcoFeZ4EYMfhAdbJDjIz8md6G4UBGb4
OL2KBt73i7aCXiTaDZjx
=H2gI
-----END PGP SIGNATURE-----

--vKcNkqnJHUUp475E--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
