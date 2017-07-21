From: Jochen Sprickerhof <jochen@sprickerhof.de>
Subject: Re: USB 3.0 is broken on Odroid Xu4 on latest kernel
Date: Fri, 21 Jul 2017 11:09:09 +0200
Message-ID: <20170721090909.z5eol2v3bxlz7opr@vis.informatik.uni-osnabrueck.de>
References: <CANAwSgSoo7g=RN4wQ96+NJRYZYy2WeHwPA-xJ2JY7yt25irDfA@mail.gmail.com>
 <87zic0b8hi.fsf@linux.intel.com>
 <20170721075616.ma57ixucid7233bm@vis.informatik.uni-osnabrueck.de>
 <87vamm43dc.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6gwqnfhhcjjr6il4"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtprelay07.ispgateway.de ([134.119.228.104]:5603 "EHLO
        smtprelay07.ispgateway.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753537AbdGUJZj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 21 Jul 2017 05:25:39 -0400
Content-Disposition: inline
In-Reply-To: <87vamm43dc.fsf@linux.intel.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Anand Moon <linux.amoon@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>


--6gwqnfhhcjjr6il4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Felipe Balbi <balbi@kernel.org> [2017-07-21 11:10]:
> Hi,
>=20
> Jochen Sprickerhof <jochen@sprickerhof.de> writes:
> > Hi,
> >
> > I've send a patch for this some time ago here:
> >
> > http://marc.info/?l=3Dlinux-usb&m=3D149945465112440&w=3D2
> >
> > This goes along with the patch in this thread:
> >
> > http://marc.info/?l=3Dlinux-usb&m=3D149983203023058&w=3D2
> >
> > Would be great if you could give it a try and report back.
> >
> > @Felipe can I do anything more to get it accepted upstream?
>=20
> you got rid of *all* context. I have no idea what you're replying
> to. Looking at the patch, though, I think this may be caused by the
> regression on the order of when to get the PHY. That was fixed by TI,
> patch is already on next and greg's queue for next -rc. Please check if
> commit 541768b08a400d9d292cfd9c898401b8178856ac helps you guys.

No, as I wrote In my patch, it's on top of 541768b08a400d9d292cfd9c898401b8=
178856ac:

| This needs and is supposed to be applied on top of
| https://patchwork.kernel.org/patch/9815981/

So we still need it.

> ps: leave context on your replies next time, man. We get a TON of emails
> every day; it's difficult to keep track of everything without context.

Sorry for that.

--6gwqnfhhcjjr6il4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEc7KZy9TurdzAF+h6W//cwljmlDMFAllxxLIACgkQW//cwljm
lDMtqBAAoxzouY0qQVNWKOttzL+oud+4BTxqZn7CXg3n5TSkKa/QY3k/4Lr4W0p6
yfN5H4+80dsSB3Eoh9T38cdt9El4Prp0MLpxex4bYFtOJB8ndJ6mxXgTxBk+SClO
qOkUkN7ncZ2rFMZQSn8HO/G8dZyESwvgbDjG1076g415L6SAJYqHHr8SBTT/GZzP
9j7fc1YxWwditVHILjIKF1ZyaSd6jlQoPLDNatlgKn7Q4QRFeG00NxbMWa8Qff6J
BYKCVZURXfq0b7mN1OH+jpxcYKeE5NSvQcY0UpAyoBuKwVnJ0qZju0RSE/fV1C4J
21fARlZ3CmTr+xKaZx/1p/O2yQP/NXOrJHKH4nNpga9okyA7zg2mxNb8VrxXvqDW
4eKD3i5oLvmuM0kQ0SSQnYhz0SsvgA1B6tj5OfCrjZdUWGzQcdBz8d3Bd4wVgRqz
OybYeRtELdCbOs5T0DnLCHoR2yfDDwq21cmjFqUX/uKqF0pXdVjc/Lj1RvgvzmRm
+feb8+dUOkNnspwH9gaDj/R7CBnAeX50oywpEhDvk1QOkBYFIiEP5fz3I02Wt9bZ
J3rj0LjzvwQLgy9PXjFotvMyBhSCO9ZY6LyV7Pi7n+OhqeVpIJ9aJKJ5LmMbHDKc
m7R3YvxO24TXJMPDDaEHexIYD/O1QnRGEI+HiZeSPi0CBSzSIEQ=
=dbkK
-----END PGP SIGNATURE-----

--6gwqnfhhcjjr6il4--
