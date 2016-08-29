From: Michael =?ISO-8859-1?Q?Niew=F6hner?= <linux@mniewoehner.de>
Subject: Re: PROBLEM: DWC3 USB 3.0 not working on Odroid-XU4 with Exynos
 5422
Date: Mon, 29 Aug 2016 13:05:30 +0200
Message-ID: <1472468730.4925.3.camel@mniewoehner.de>
References: <1472414695.3845.3.camel@mniewoehner.de>
         <87lgzgdof3.fsf@linux.intel.com> <57C41582.1030604@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-jyv3cEXS29gAGWCVilli"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sender163-mail.zoho.com ([74.201.84.163]:24545 "EHLO
        sender163-mail.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757210AbcH2LH7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 29 Aug 2016 07:07:59 -0400
In-Reply-To: <57C41582.1030604@linux.intel.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mathias Nyman <mathias.nyman@linux.intel.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org


--=-jyv3cEXS29gAGWCVilli
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mathias,
On Mo, 2016-08-29 at 13:59 +0300, Mathias Nyman wrote:
> On 29.08.2016 10:28, Felipe Balbi wrote:
> >=20
> >=20
> > Hi,
> >=20
> > Michael Niew=C3=B6hner <linux@mniewoehner.de> writes:
> > >=20
> > > [1.] One line summary of the problem:
> > > DWC3 USB 3.0 not working on Odroid-XU4 with Exynos 5422
> > >=20
> > > [2.] Full description of the problem/report:
> > > No usb 3.0 devices are being detected when attached while USB 2.0
> > > devices work on the same port.
> > > USB 3.0 works after applying patches [9.1] and [9.2], but seems
> > > to be
> > > buggy. The usb hub is redetected every time an usb device is
> > > attached.
> >=20
> > dwc3 is host, which means it's actually XHCI :-)
> >=20
> > Adding Mathias
> >=20
> > >=20
> > > dmesg:
> > > [=C2=A0=C2=A0192.287080] usb 3-1.2: USB disconnect, device number 7
> > > [=C2=A0=C2=A0210.370699] hub 3-1:1.0: hub_ext_port_status failed (err=
 =3D
> > > -71)
>=20
> Looks like the hub GetPortStatus request fails with protocol error.
>=20
> Reading xhci root hub port status is mostly just register reads and
> writes. It
> shouldn't include any actual transfers that could return -EPROTO
>=20
> So this is not the root hub? but a external or integrated on your
> board, right?
>=20
> The protocol error -71 is returned at transfer errors or if device
> stalled.
>=20
> Adding more xhci debugging options could show something:
> echo -n 'module xhci_hcd =3Dp' >
> /sys/kernel/debug/dynamic_debug/control
>=20
> >=20
> > >=20
> > > [9.] Other notes, patches, fixes, workarounds:
> > > [9.1] https://lkml.org/lkml/2014/4/28/234
> > > [9.2] https://lkml.org/lkml/2015/2/2/259
>=20
> The additional patches that makes things somehow work involve tuning
> the PHY,
> this is an area I'm not familiar with
>=20
> -Mathias
>=20


I'm sorry, I should have said that this is the dmesg output with the
patches applied. Without them there is no output at all when I attach
an usb 3.0 device.

Michael
--=-jyv3cEXS29gAGWCVilli
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGcBAABCAAGBQJXxBb6AAoJECInTNFyFqn8SqIL/i2Ns2K+uMVHviT8pTOZoG5R
Wk0VZLbmFtYth0R+5/ML61pWf0A4Rhp6X83cDdaY5Pn4GXtT/42gPepxRq548J8q
cs5ISHcUBxl9tEeNjU1B9Lrviej/GzxB+8JRtMYmlywJdf+pQvno2lIv+xjIaUjB
ktYW/q94p832hdVrbn8Wfr+wyo4Uk50YN7aNjMlCF5M8o5jdO/KAyKylvSOAqgRE
75BtCAUvsalTirtmGYbvxAZWXe4cEUp4iHdUeNiPibUM9VkYKFGtURX8eutjuEHE
h5nM3bRbhIO73BuX/CXUdQ8qucZV6cvvGpBJFWALGKak+3Yc3EVfA7LFyKkKtYw9
+SGqnkkbuyjkg7tUOk0SJcYfT708CXzBx1cDBj7/+PjwD7ty95KQ0UGYevGmctmg
iO6gwhL7pn8CAUdfRhHGDqQ3rYuArYS6Zbj9Vy5Lks/yQH0L3vnbLcdgPN0wxq/y
W0v5S8dnkbOGtouesLFLN6RRtXiuETcjOIiHLybBzw==
=5g22
-----END PGP SIGNATURE-----

--=-jyv3cEXS29gAGWCVilli--
