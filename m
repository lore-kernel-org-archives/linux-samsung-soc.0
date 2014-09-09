From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v6 4/4] phy: exynos5-usbdrd: Calibrate LOS levels for
 exynos5420/5800
Date: Tue, 9 Sep 2014 09:42:25 -0500
Message-ID: <20140909144225.GF6151@saruman.home>
References: <1409656338-20337-1-git-send-email-gautam.vivek@samsung.com>
 <1409656338-20337-5-git-send-email-gautam.vivek@samsung.com>
 <20140902143438.GB16872@saruman.home>
 <CAFp+6iEyqmbwMLFrBKD7NVLDAC=b+h1hPKFS=BG4k9D69hn_dg@mail.gmail.com>
 <20140903144225.GD31855@saruman.home>
 <CAFp+6iETPJCWMMkjHrpDcdCv=K0PbefYLa4eBOwN=aUY2=EHLA@mail.gmail.com>
 <20140905175651.GK24449@saruman.home>
 <CAFp+6iGU86yL8Ry3ArJJjBy2Cs0Em2B49yssH3BK5fJwyaZbtA@mail.gmail.com>
 <20140908134454.GK22409@saruman.home>
 <CAFp+6iG+gmD_JseytYuVQcRK9ErOqQrUEWJoU1KUU7PqMd=aRw@mail.gmail.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DO5DiztRLs659m5i"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAFp+6iG+gmD_JseytYuVQcRK9ErOqQrUEWJoU1KUU7PqMd=aRw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, kishon <kishon-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--DO5DiztRLs659m5i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 09, 2014 at 07:19:50AM +0530, Vivek Gautam wrote:
> Hi,
>=20
>=20
> On Mon, Sep 8, 2014 at 7:14 PM, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> wrote:
> > Hi,
> >
> > On Mon, Sep 08, 2014 at 09:53:09AM +0530, Vivek Gautam wrote:
> >> On Fri, Sep 5, 2014 at 11:26 PM, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> wrote:
> >> > On Thu, Sep 04, 2014 at 12:01:19PM +0530, Vivek Gautam wrote:
> >> >> > Don't we have phy_power_on()
> >> >> > for that ? It looks like you could just as well do this from
> >> >> > phy_power_on() ?
> >> >>
> >> >> No, unfortunately keeping these calibration settings in phy_power_o=
n()
> >> >> doesn't help, since we need to do this after XHCI reset has happene=
d.
> >> >
> >> > teach xHCI about PHYs ?
> >>
> >> sorry i couldn't understand you here.
> >> Aren't we trying to do the same with Heikki's patch about dwc3 :
> >> [PATCH 6/6] usb: dwc3: host: convey the PHYs to xhci
> >>
> >> and the 2nd patch in this series :
> >> [PATCH v6 2/4] usb: host: xhci-plat: Get PHYs for xhci's hcds
> >>
> >> Is there something else that is expected ?
> >
> > right, use that to call phy_init() at the right time, then you need to
> > add a new ->calibrate() method which, likely, will only be used by you
> > ;-)
>=20
> so you mean, the xhci should itself call phy_init() at a time suitable,
> so that ->calibrate() is not required at all ?
>=20
> i think you meant there - "then you __do not__ need to

right :-)

> > add a new ->calibrate() method which, likely,
> will only be used by you", is it ?

yup

--=20
balbi

--DO5DiztRLs659m5i
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUDxHRAAoJEIaOsuA1yqRE2wAP/R2EshzK10SMAvnGqNGl8SnA
CIFqb9R0HKjtuWOLwPlcC0gAwkObrKzv+eJaD4adnhfARwee1HN2PzZ/QNmvSU2G
FNHeOfT2WPnopmPkqAixsH1hF0llP3xhLnBOHgeHTYBQxCEi1x6eMpcp4RGGvhjI
YXM+eF+lrLE9CotyUEt2YW79tt0Vgjp/GIWoftZL5GCK4Y8QoNrsfwZEeD5Nxn9Z
xgG/z4Nw9QWR3uarUlvYw0l2sq+j4h5JGgXerNTRjOJ3Pb+iLTiEj8mT7HOKUA4+
qHq1hDog2szmYcTWaqLroFUSbURP20XQgRdD2xYjpuzjTl900uiSRVeL77fnWzO3
TNeuvCOMK+wMq1m42WnlR3ErSYCtOUJhBg5TRVLsrGI3Viadm7hmSelcKxpZaIal
EDucYL2KovBqtarq1qrmQr0MjdvaFTjIpi/zswwuvDIQdxEkiUIbyXWwgdlgC1HW
uePAtDnIKXF0oD60wxtROtP9e0BRwvD1OW/3lH+InM5rlRhikHaBhgqxx/VA/G5z
5ZsArc9fycjwl3Jnhc+0Qfb7I0PLos1zaOQeZgO9/5yGdtsuYFMlV91TUbGvbDCC
xD03xsO8TFJfqUk4bcPniRcFIvxalsrqEf8UiAYfVt50is0Gn5YSIlwrDbzvu/bt
CQaAnJV/ebQiA8odRnYJ
=5c+5
-----END PGP SIGNATURE-----

--DO5DiztRLs659m5i--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
