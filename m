From: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH v2 2/2] s5p-mfc: Adding MFC v7 and v8 firmwares
Date: Mon, 16 Jun 2014 00:31:38 +0100
Message-ID: <1402875098.7797.65.camel@deadeye.wl.decadent.org.uk>
References: <1400676064-17819-1-git-send-email-arun.kk@samsung.com>
	 <1400676064-17819-2-git-send-email-arun.kk@samsung.com>
	 <1401824047.2412.7.camel@deadeye.wl.decadent.org.uk>
	 <1401837995.2412.45.camel@deadeye.wl.decadent.org.uk>
	 <CALt3h7-D1VA5WfyaZDpuOe0L6V2ZhiOsb-wDFx48Nk3-mxBAPA@mail.gmail.com>
	 <01f601cf7fe5$5b325fa0$11971ee0$%debski@samsung.com>
	 <1401884009.2412.73.camel@deadeye.wl.decadent.org.uk>
	 <CALt3h7_BHLwr2yt2bhO8zwNZh9-Q+qWLxkEfvy_mVzSpoRgMEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Ip93I4yuYrZVcyPGDAbV"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:35577 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751486AbaFOXbt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 15 Jun 2014 19:31:49 -0400
In-Reply-To: <CALt3h7_BHLwr2yt2bhO8zwNZh9-Q+qWLxkEfvy_mVzSpoRgMEw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>
Cc: Kamil Debski <k.debski@samsung.com>, David Woodhouse <dwmw2@infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, linux-firmware@kernel.org


--=-Ip93I4yuYrZVcyPGDAbV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2014-06-05 at 09:54 +0530, Arun Kumar K wrote:
> Hi Ben,
>=20
> On Wed, Jun 4, 2014 at 5:43 PM, Ben Hutchings <ben@decadent.org.uk> wrote=
:
> > On Wed, 2014-06-04 at 13:08 +0200, Kamil Debski wrote:
> >> Hi Arun, Ben,
> >>
> >>
> >> > From: arunkk.samsung@gmail.com [mailto:arunkk.samsung@gmail.com] On
> >> > Behalf Of Arun Kumar K
> >> > Sent: Wednesday, June 04, 2014 7:32 AM
> >> >
> >> > Hi Ben,
> >> >
> >> > On Wed, Jun 4, 2014 at 4:56 AM, Ben Hutchings <ben@decadent.org.uk>
[...]
> >> > > Just noticed a problem with all the s5p-mfc firmware: you are putt=
ing
> >> > > it in the s5p-mfc subdirectory, so distribution packages will inst=
all
> >> > > them in /lib/firmware/s5p-mfc.  However, unless I'm mistaken your
> >> > > driver requests it with a bare filename (e.g. "s5p-mfc-v7.fw") so =
it
> >> > > won't be found.
> >> > >
> >> >
> >> > Yes this issue is there.
> >> > Kamil, are you ok with changing the fw load path to s5p-mfc/s5p-mfc*=
.fw
> >> > in the driver?
> >>
> >> We have two options here:
> >> 1) Change the driver to request s5p-mfc/sp5-mfc-fw*
> >> 2) Move the files in the firmware repository
> >>
> >> I would opt for the second option. The driver was uploaded before the
> >> firmware. I see that there are many firmware files in the root folder
> >> of the repository
> >>
> >> Ben, what is your opinion? Which is preferred: creating subdirectories
> >> or storing firmware in the root folder?
> >
> > I prefer subdirectories, but compatibility wins.  So I'll apply the
> > following patch if no-one objects.
> >
> > Ben.
> >
> > ---
> > Subject: Move the s5p-mfc firmware out of its subdirectory
> >
> > The driver does not include this subdirectory name when requesting
> > firmware.
> >
> > Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> > ---
> >  WHENCE                                       |  10 +++++-----
> >  s5p-mfc/s5p-mfc-v6-v2.fw =3D> s5p-mfc-v6-v2.fw | Bin
> >  s5p-mfc/s5p-mfc-v6.fw =3D> s5p-mfc-v6.fw       | Bin
> >  s5p-mfc/s5p-mfc-v7.fw =3D> s5p-mfc-v7.fw       | Bin
> >  s5p-mfc/s5p-mfc-v8.fw =3D> s5p-mfc-v8.fw       | Bin
> >  s5p-mfc/s5p-mfc.fw =3D> s5p-mfc.fw             | Bin
> >  6 files changed, 5 insertions(+), 5 deletions(-)
> >  rename s5p-mfc/s5p-mfc-v6-v2.fw =3D> s5p-mfc-v6-v2.fw (100%)
> >  rename s5p-mfc/s5p-mfc-v6.fw =3D> s5p-mfc-v6.fw (100%)
> >  rename s5p-mfc/s5p-mfc-v7.fw =3D> s5p-mfc-v7.fw (100%)
> >  rename s5p-mfc/s5p-mfc-v8.fw =3D> s5p-mfc-v8.fw (100%)
> >  rename s5p-mfc/s5p-mfc.fw =3D> s5p-mfc.fw (100%)
[...]
> Looks good to me.

I've made this change.

Ben.

--=20
Ben Hutchings
When in doubt, use brute force. - Ken Thompson

--=-Ip93I4yuYrZVcyPGDAbV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUAU54s3+e/yOyVhhEJAQoFDBAAndmyIE+gRLdMTJ9AJ2OID9eywslHxzOS
3HWoO0ORdKvpNkTQSiR/cKMcu0O1iXR0awFKyfNi8hiRcrpthvKXbS1hkkIc4u++
a12IZAuapVZmOjdXqCRcq0npn9e8qlKVtanDO2zBboRn99R4g+XCaKrphVqwRzf0
VVTGazs57nqG7UetdE7Pw1thRuhQruc/nIKUPqFAda4+f5u0vkjRJ7rqYkC3D9Br
nq6DRYivhJ3IO5Kj8eUgZlilSyo0ixhxPim+QJgtOxY55ZBn1PbNZ44iEG9QyzxJ
BDxpZ/6FBkHqSQDCSUVq7j1W2/2yeyXAr3dSlQpW16nACsU3/wbah5koAgnc4OMn
nriN6MayFFPr77HRdmRC7VoxBBarjg2XFam4uHqP8VreoUptKxZrz8QGsKHrXSum
AvYWVj5dskSYIpZlDS71JIhcVk6JbFA1nP5J17AfEIhep18OZofuYzITLJ858W2T
ajaobgMn81aAKo5MS5I2Ldo5jFY22tZ7iMCxVsoBcjdWPBZfHjvxtMyD0203x8oC
VNKTo/3WLzXxhq9AQCxPBhqlelS7866tvkDnXBuEjE/LhgVuCKXPoFZzADWoBXaf
DIutQDwKgaTlX2mGIbi7ATnPKGAdPadxO6b2bG6tmp6eQgU3CqCAmqiqOOQ5QRbe
hRCEeuQ7jZg=
=6hrK
-----END PGP SIGNATURE-----

--=-Ip93I4yuYrZVcyPGDAbV--
