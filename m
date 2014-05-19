From: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH 1/2] s5p-mfc: Update mfc-v6 firmware
Date: Mon, 19 May 2014 12:18:30 +0100
Message-ID: <1400498310.17377.34.camel@deadeye.wl.decadent.org.uk>
References: <1400233490-5677-1-git-send-email-arun.kk@samsung.com>
	 <04be01cf70ec$d5f37a10$81da6e30$%debski@samsung.com>
	 <CALt3h7_A2TmyoXFBjr7Ncy8560oBT6EOD7nq9qdRtD34O56FdQ@mail.gmail.com>
	 <04bf01cf70ee$f2184d40$d648e7c0$%debski@samsung.com>
	 <5375E6DB.70303@samsung.com>
	 <06bd01cf733d$bc903380$35b09a80$%debski@samsung.com>
	 <CALt3h7_gxaUdmzao1pQw6xTTu+u2YR7_hdP1eb-wrLhum1Td_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-NC3sgbH77c/7w6WvVu2h"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:58914 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750957AbaESLSq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 May 2014 07:18:46 -0400
In-Reply-To: <CALt3h7_gxaUdmzao1pQw6xTTu+u2YR7_hdP1eb-wrLhum1Td_g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>
Cc: Kamil Debski <k.debski@samsung.com>, Tomasz Figa <t.figa@samsung.com>, dwmw2 <dwmw2@infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>


--=-NC3sgbH77c/7w6WvVu2h
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2014-05-19 at 15:12 +0530, Arun Kumar K wrote:
> Hi Kamil, Tomasz,
>=20
> On Mon, May 19, 2014 at 2:08 PM, Kamil Debski <k.debski@samsung.com> wrot=
e:
> > Hi Tomasz, Arun,
> >
> >> From: Tomasz Figa [mailto:t.figa@samsung.com]
> >> Sent: Friday, May 16, 2014 12:22 PM
[...]
> >> May I suggest a little different solution?
> >>
> >> Since to not break compatibility, support for both firmware versions i=
s
> >> needed in the driver anyway, why not simply make the new, incompatible
> >> firmware always use a different filename.
> >>
> >> Then let the driver try to load the new one first and if it fails then
> >> load the old one? This would also let you get rid of that version chec=
k
> >> by hardcoded date, as you would know which firmware type was found.
> >>
> >
> > Tomasz, I really like your idea. I find it both simple and elegant.
> > This way there will be no need to rename the firmware file in the repo =
or
> > by the user, if the user wishes to use the new version.
> >
> > Arun, what is your opinion?
> >
>=20
> Yes this seems like a better approach to me too.
> With this the new FW used in older kernel issue is also resolved as the n=
ew
> fw file will have a different name and is not accepted in old kernel.

This is the right way to do it.  New firmware files must not break old
drivers, as distributions and users will usually install everything from
linux-firmware without checking things like that.

If the new driver can work with the old firmware, that's a bonus, but
less important.

Ben.

--=20
Ben Hutchings
It is easier to change the specification to fit the program than vice versa=
.

--=-NC3sgbH77c/7w6WvVu2h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIVAwUAU3noi+e/yOyVhhEJAQoTpg//fXo9u3KX9NRQFHhj/abwbGJQV7yE+Mj+
oRPEU0jbycUJ5VSwMCFZuGwqdSFaWDL3NWAZS+IEj3vJF95V2QdvSa8kao56R1dA
HyQGLkflS7kZGlG0mcEKIOj8VGGfuEh5swg3oTY3TiMcoP/4oKvm7U42aV/QYyuf
hcNwva42FbBZTuXkjdXlCKFP8jlvOFvNDb4yUtW0alQcCTdladC1H9ei0AAaCzYQ
7MMw4hrd7aYAVSl83s60qag+5hs45fN9c5I1eht6/AMgKqd9vID8TApkJwtB0739
8f0EN0z/HT1KrLV3Yi6+l4T+9g/7iAnaHAakCdPx2EyG8UExvBAyOBf8SfqzuEyj
d/RMgDOYzJUJ7hSvtfb5vfPdMNgsIKq4iOVbfm3d+K5EAqDeHa8tgyI4n9yf+Bxf
M+/3n0ChekJGWOqyCaSgtmRIDJMkhVWhbLEsmjbvST5JBvXe26/VCq3jDaGy8/4p
sw/Decxuk/qhF5EPRf+SiOJMViPOoJW6p4OrpTX3SR1anYFsch47gQxcTkVapZ3E
tlhgElzj9hLYiKF4QjvS1lgP7HJf2UsA85kvHqdARkl7SeJLafUarDQlbfjIRXBI
uZN9AsfnY699zw0sGf5nBbKxZvO4bcP3ziTOqovz4ESTZGPKi0EmjMPxFm9rtIzy
UJbn7oZBkgc=
=BS9F
-----END PGP SIGNATURE-----

--=-NC3sgbH77c/7w6WvVu2h--
