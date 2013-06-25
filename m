From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH 1/4] usb: gadget: s3c-hsotg: Allow driver instantiation
 using device tree
Date: Wed, 26 Jun 2013 00:00:44 +0300
Message-ID: <20130625210044.GD9748@arwen.pp.htv.fi>
References: <1372174706-5459-1-git-send-email-t.figa@samsung.com>
 <1372174706-5459-2-git-send-email-t.figa@samsung.com>
 <20130625204632.GB9748@arwen.pp.htv.fi>
 <5782443.xpFZv1Saq0@flatron>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xA/XKXTdy9G3iaIz"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:33582 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751802Ab3FYVBZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Jun 2013 17:01:25 -0400
Content-Disposition: inline
In-Reply-To: <5782443.xpFZv1Saq0@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: balbi@ti.com, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-usb@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, m.szyprowski@samsung.com, l.majewski@samsung.com, Kyungmin Park <kyungmin.park@samsung.com>, Paul Zimmerman <paul.zimmerman@synopsys.com>

--xA/XKXTdy9G3iaIz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2013 at 10:57:06PM +0200, Tomasz Figa wrote:
> On Tuesday 25 of June 2013 23:46:32 Felipe Balbi wrote:
> > On Tue, Jun 25, 2013 at 05:38:23PM +0200, Tomasz Figa wrote:
> > > This patch adds OF match table to the driver to allow instantiating it
> > > using device tree.
> > >=20
> > > Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> > > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> >=20
> > when will this driver get merged into dwc2 ?
>=20
> What's dwc2? I can only see dwc3 in mainline kernel tree and it doesn't=
=20
> seem to be compatible with s3c-hsotg.

drivers/staging/dwc2/

That's the same IP you're using Paul Zimmerman (now in Cc) is working
towards getting that out of staging. It currently has only host mode, so
plugging your code in there shouldn't be too difficult.

OTOH, it might be better to make your code a device-only version of dwc2
(drivers/usb/dwc2) and have Paul move his host side to that instead.

--=20
balbi

--xA/XKXTdy9G3iaIz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRygT8AAoJEIaOsuA1yqRE7IEP/2BXwRU0CkBAg0etnDCkypk1
L2vlxKcZjJOvqxlvYh3Ij7sYKt/KzALl6VbVbHlLDOArEgo4s2YFkOKUNgbGc0sL
J5OsZ33pEMpsw2Unks0oJuBVfGMJSIUq4z5PrNSkexNSWgea9Pf3/zCU+7HkvTZv
ofv0XBsWhFqnWX4WZ+FcloJimeQNX4IzS6+H+5SjyedLxewPQcOBIiQ9s8kveQ0e
UW3Htd1HUX83i72Qaie4fgokxKovcFZXfesZapXHVv2bfn5Qg8chGOEEgNlNflho
DDJio5vZi1QPOz2fZZqDc1XBHnKDROWXyxTbO8GuPb3ONYvoOfycjSXK1orevISO
Eu71JqS535u6pp3NpiXaCUEk1V8uI5xIHhS3OTSdN70TI6OwGPmHfmKOimrf3uQg
+hFMvSt18ThhT+RO4uQwD9vs5I0/x76/LC88gIKib0Tj+sGoeHTXeWDXitYFF43o
7mKipnGZxzVuG5ZMTbVinoqyKn++3M84490CyGOzmDjhv5HEVzABQSSAc6mDo0XZ
/PyIasLtnH7UVxoiGZW1uBj4QnOH384VeoVmEPyF/FjYmWmzj3neOdlh9O4RiiW/
t6Wm2DruOMcmGnij/MshPfPzodYXeYHKlwYKcYp1lauq4Y697n4Eq9fMUbJxegzm
DSTJe64U+HPCtgobpzQ6
=Ydif
-----END PGP SIGNATURE-----

--xA/XKXTdy9G3iaIz--
