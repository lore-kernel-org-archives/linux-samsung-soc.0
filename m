From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 3/9] usb: dwc2/gadget: fix support for soft_connect udc
 framework feature
Date: Fri, 17 Oct 2014 10:49:25 -0500
Message-ID: <20141017154925.GR26260@saruman>
References: <1413464285-24172-1-git-send-email-m.szyprowski@samsung.com>
 <1413464285-24172-4-git-send-email-m.szyprowski@samsung.com>
 <20141016133610.GH3480@saruman>
 <5440F2E4.3030901@samsung.com>
 <20141017154435.GP26260@saruman>
 <20141017154630.GQ26260@saruman>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="foM9DbudB2CcldhH"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141017154630.GQ26260@saruman>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--foM9DbudB2CcldhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2014 at 10:46:30AM -0500, Felipe Balbi wrote:
> Hi,
>=20
> On Fri, Oct 17, 2014 at 10:44:35AM -0500, Felipe Balbi wrote:
> > On Fri, Oct 17, 2014 at 12:43:48PM +0200, Marek Szyprowski wrote:
> > > Hello,
> > >=20
> > > On 2014-10-16 15:36, Felipe Balbi wrote:
> > > >On Thu, Oct 16, 2014 at 02:57:59PM +0200, Marek Szyprowski wrote:
> > > >>Enabling and disabling usb gadget by writing to
> > > >>/sys/class/udc/*hsotg/soft_connect results in calling udc_start/udc=
_stop
> > > >>functions with the same usb gadget driver, so the driver should not=
 WARN
> > > >>about such case.
> > > >>
> > > >>Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > > >>---
> > > >>  drivers/usb/dwc2/gadget.c | 2 +-
> > > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >>
> > > >>diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> > > >>index 8870e38c1d82..37fda4c03397 100644
> > > >>--- a/drivers/usb/dwc2/gadget.c
> > > >>+++ b/drivers/usb/dwc2/gadget.c
> > > >>@@ -2892,7 +2892,7 @@ static int s3c_hsotg_udc_start(struct usb_gad=
get *gadget,
> > > >>  		return -EINVAL;
> > > >>  	}
> > > >>-	WARN_ON(hsotg->driver);
> > > >>+	WARN_ON(hsotg->driver && hsotg->driver !=3D driver);
> > > >the bug is in your ->udc_stop(). You should clear hsotg->driver to N=
ULL
> > > >there.
> > >=20
> > > Ok, I will change udc_stop() to always zero hsotg->driver, like other=
 udc
> > > drivers. I was a bit confused by the fact that udc core passes driver=
 to
> > > udc_stop(), when called from soft_connect and NULL on gadget removal.
> >=20
> > That can probably be cleaned up, I'll go have a look on all UDCs and
> > make sure I won't break anything.
>=20
> looks like chipidea is the only one still using that argument, if you

meant dwc2

--=20
balbi

--foM9DbudB2CcldhH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUQTqFAAoJEIaOsuA1yqRET+EQAKogtE6i0xGJw6hIXciasyur
bXHOY/7ZlS92lk2tDenjrxiRmRuJNDilNyBreO2SCTOYHlSvTmQysNWuwxgYCos7
ZuHWEHucLrsUSz1beqnkrp12xAZRIaizn8YcXYU2cMsygH7+nuGOG/Wq3XRC/s0Q
pgvDrklHQd21KGbhC1MFMAbX4kqi4BUAmWgjXPVyyN3fzRadA0/LqRB317P6I5LO
vk4SGptqz7VZ7RdsInUPbbrU729tV6F0Y+FqW0ZhCBB9+ok+nWcc3Tbn5INKdJh0
Nk168SFMQYikrmT+UQg3J7PfMzhY5Y6alISryTN0v0Q8VOJMj1fzxmktpnaaaeJK
TDEdcs4JT7coExP+Zq+iJrz5PUsBqLDZLOCjBVQ9TZ5kYvHS4kAVGhZ6fIRVqa5C
w8p2Q9BT8A7zmUIDFbGPrnVmlHgHKyyaOoTGkQzLiy2n/pB0/846nQoIu7NFPCeY
udv4jn0Nl+6NPOtNICtHX9ZN3icG78w/pWLycO4mnf6aoT5APUbUgnhOJuaa2qrD
OQyoQXjB7HmAf6+96kTeMPJmhOgsD4Rm9imWLD9g1FFLJCmBHiQEbilf1KF4DpyO
MekmZqwI0FqrQcsna1s+Il/5IqNWQvCTUGOXNWi45CoVzw3wBeauKALb+kHLLQ8y
v0zld97xwB4PDxGJWWrI
=sj/v
-----END PGP SIGNATURE-----

--foM9DbudB2CcldhH--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
