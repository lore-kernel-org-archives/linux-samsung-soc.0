From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 3/9] usb: dwc2/gadget: fix support for soft_connect udc
 framework feature
Date: Fri, 17 Oct 2014 10:46:30 -0500
Message-ID: <20141017154630.GQ26260@saruman>
References: <1413464285-24172-1-git-send-email-m.szyprowski@samsung.com>
 <1413464285-24172-4-git-send-email-m.szyprowski@samsung.com>
 <20141016133610.GH3480@saruman>
 <5440F2E4.3030901@samsung.com>
 <20141017154435.GP26260@saruman>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="A7FgPGrDEcSmmdo/"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141017154435.GP26260@saruman>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--A7FgPGrDEcSmmdo/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 17, 2014 at 10:44:35AM -0500, Felipe Balbi wrote:
> On Fri, Oct 17, 2014 at 12:43:48PM +0200, Marek Szyprowski wrote:
> > Hello,
> >=20
> > On 2014-10-16 15:36, Felipe Balbi wrote:
> > >On Thu, Oct 16, 2014 at 02:57:59PM +0200, Marek Szyprowski wrote:
> > >>Enabling and disabling usb gadget by writing to
> > >>/sys/class/udc/*hsotg/soft_connect results in calling udc_start/udc_s=
top
> > >>functions with the same usb gadget driver, so the driver should not W=
ARN
> > >>about such case.
> > >>
> > >>Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > >>---
> > >>  drivers/usb/dwc2/gadget.c | 2 +-
> > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >>diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> > >>index 8870e38c1d82..37fda4c03397 100644
> > >>--- a/drivers/usb/dwc2/gadget.c
> > >>+++ b/drivers/usb/dwc2/gadget.c
> > >>@@ -2892,7 +2892,7 @@ static int s3c_hsotg_udc_start(struct usb_gadge=
t *gadget,
> > >>  		return -EINVAL;
> > >>  	}
> > >>-	WARN_ON(hsotg->driver);
> > >>+	WARN_ON(hsotg->driver && hsotg->driver !=3D driver);
> > >the bug is in your ->udc_stop(). You should clear hsotg->driver to NULL
> > >there.
> >=20
> > Ok, I will change udc_stop() to always zero hsotg->driver, like other u=
dc
> > drivers. I was a bit confused by the fact that udc core passes driver to
> > udc_stop(), when called from soft_connect and NULL on gadget removal.
>=20
> That can probably be cleaned up, I'll go have a look on all UDCs and
> make sure I won't break anything.

looks like chipidea is the only one still using that argument, if you
make your patch look like below:

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 7b5856f..ac14328 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -2934,8 +2934,7 @@ static int s3c_hsotg_udc_stop(struct usb_gadget *gadg=
et,
=20
 	spin_lock_irqsave(&hsotg->lock, flags);
=20
-	if (!driver)
-		hsotg->driver =3D NULL;
+	hsotg->driver =3D NULL;
=20
 	hsotg->gadget.speed =3D USB_SPEED_UNKNOWN;
=20

I'll remove the argument.

--=20
balbi

--A7FgPGrDEcSmmdo/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUQTnWAAoJEIaOsuA1yqRE+N4P/j48cNkwb5H+7FPAl595mLNb
wtS99NefIgr7cxNxOQIY15O27SJYldkIiyNmbPaROGETgeOVSeRwDHiKV3tfHBAv
3JUaAwpPOta0bvLnYJBw7iSC7z8+g1t71Qo3zBy/1DTvxVcx7kl+5Uf/fgkolebX
SYAEG6xeURidOInGXQQazsxFNcroaHzRm2gUCHUJ8j27VZeARjgWa+hl8oJ4DoOM
+RorwswOA79gogG4DL21znXAqts5Uil2k5tPYfI+X0v55rU3VETPNNlAdqXKN6f8
frXsFY285CSFfhWJ8hRJfU9DopWJwcqfEee6ZGL44rSOsqGNWjy0vydv94zgwvii
iALvVyXTrCY0Mi0H89UJYqT47syx9ms6epcPggqVkoP8BXDVIN2//vYV289EukSR
5dyZeA9conpQjuSclp3Yt5lZb6bLUzmXouhtc/15G5zCZBqFJSdx6cSfumt8BFmw
p4BOJEC+rF/pEsQbwPPBiIUIM70O/DsbaE+s38UXNVuOCHiw9qQxDY+FOXyKnbfI
xaTSXvrkH44QpwlQbSw6k+M+n9Sezpm2zCwL/mEypMvSx4t9zuwJkFSxZpcaL1+o
DuruBkcULrVqnFIO0FOAQDXKVgDb1ASdJvk2YHf7TSJ6X5PZzPSH6CVJDPzTs3Zz
K1/8qLo9vSwbEYEHZnt9
=PqWD
-----END PGP SIGNATURE-----

--A7FgPGrDEcSmmdo/--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
