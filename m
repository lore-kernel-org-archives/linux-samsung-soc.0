From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: Unable to boot mainline on snow chromebook since 3.15
Date: Tue, 30 Sep 2014 08:12:07 +0200
Message-ID: <20140930061206.GG29874@ulmo>
References: <540C8577.2070907@gmail.com>
 <20140908112112.GK26030@arm.com>
 <CACxGe6v40wMSW8LJRtyZ3C6PinRMcQM-Zog+XpTJ-QG3HHJknw@mail.gmail.com>
 <CAD=FV=VAqzvJQDQMjjeQ1p5okyDzE=ff_sguObZxh59qbzcaTQ@mail.gmail.com>
 <CACxGe6t_ex1bU=CvTpXR4VJgNf1hAq33hr6ykbHy_sMXEk4h-g@mail.gmail.com>
 <CAOesGMipX3MV6sMWLuY=D+bQ6qe8P17YFbTFwZOHPeSc3Pw9Cg@mail.gmail.com>
 <20140910143144.GF7960@sirena.org.uk>
 <CACxGe6u=QkGTKGfaE_jJ5VFMhdVKQNggp3qVBUgNP7rDbZss_A@mail.gmail.com>
 <20140929125716.GE26008@ulmo>
 <CACxGe6uDYNOuhgM_5iQTp=iB4X-osSz8WESiUb2QGj5ZmWFp-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FwyhczKCDPOVeYh6"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:47254 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752238AbaI3GMK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Sep 2014 02:12:10 -0400
Received: by mail-wi0-f181.google.com with SMTP id n3so3565952wiv.14
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Sep 2014 23:12:09 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CACxGe6uDYNOuhgM_5iQTp=iB4X-osSz8WESiUb2QGj5ZmWFp-A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Mark Brown <broonie@kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Will Deacon <will.deacon@arm.com>, Doug Anderson <dianders@chromium.org>, Tomasz Figa <tomasz.figa@gmail.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Prashanth G <prashanth.g@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "rahul.sharma@samsung.com" <rahul.sharma@samsung.com>


--FwyhczKCDPOVeYh6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 29, 2014 at 02:12:43PM +0100, Grant Likely wrote:
> On Mon, Sep 29, 2014 at 1:57 PM, Thierry Reding <thierry.reding@gmail.com=
> wrote:
> > Though there are two cases: one is to use simplefb as a means to have
> > early boot messages on a graphical display (and optionally hand off to a
> > real driver). The other is to use simplefb as the only framebuffer
> > driver until a proper driver has been implemented. The latter would have
> > the disadvantage of not allowing unused resources from being garbage
> > collected at all. Then again, I don't think power consumption is going
> > to be a very big issue on hardware where no proper display driver is
> > available.
>=20
> When simplefb is the only framebuffer to get a platform working, it is
> reasonable to have a placeholder driver that grabs the resources and
> nothing else. When a real driver is implemented, and merged, the
> placeholder driver should drop compatibility with the device node at
> the same time.

You mean the device node for the real device should be compatible with
"simplefb"? One problem I see with that is that there may be multiple
dummy drivers for different pieces of hardware, all of them binding to
the simplefb compatible and conflicting.

Also this assumes that a device tree node exists for the device. One of
the reasons for using simplefb is so that you don't have to write that
device tree node and its binding yet.

Presumably, though, if the firmware already knows what resources are
needed and generate them at runtime it should be possible to come up
with a static device tree node, too.

Thierry

--FwyhczKCDPOVeYh6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUKkm2AAoJEN0jrNd/PrOh53AP/REF5Sh1ccz6EgXWNalmhdP/
zleTHsBUPyEBznzlWpkzS6cvJOMa/s2ObP/Gds9b8jlZGVXAMnuJKQlvbWTnHcdk
FH14e9AyUnDxa92t86w/g9Nlqoa9ukCCp1HjeIDwq42Aa9Fw1SiwmI3FS2c50BV1
8fNyXruSH/u6qnR7kbNNysVpB79U4HhvWTpXvQeRvfRogn5SY+7lwIV/qw40Onrj
Q+AzCSIJezmf/LZRWWuLr9axF+tu20rORL6TsDEXOFjpJw+xKjImvZ3soPSxoMzW
LqsaMTLjh5RGJeojlCq2HCRoJl4ihFe+hD72VS3x6ejENeS4hSAE+Cc5hnFEjTaw
b1m4GC4+P8gNH/6fJmnopQCllpsTS4HE0XOImEHA1EeH7OhlVjHEZHBknABl7d0o
l6P3RK1Udr5qiw2IP9/JMCAAHHRRMJpw+oXY+ZRTC4uA5wVbWydFgul6VLy0n1jQ
mwjgMHHivCcGJcngr1cJcs/6CXYvz7SqHOR6kuspv306FHScltdma1wMKpESBvmi
Iw/knP9PQxemAUHQ1AnOZR0KirQ0MF8yXKPTwiefHyoQaJMdwA7Q2Z1Ye3d00UtR
oeQFy00gN2+kxfnvlxS/O8vg394ieYCC0i7KXSk7jZ6wCdIUDUPy+IFcpoY2n2Tu
iE8aX6MgMDq64LjQY64M
=u7UP
-----END PGP SIGNATURE-----

--FwyhczKCDPOVeYh6--
