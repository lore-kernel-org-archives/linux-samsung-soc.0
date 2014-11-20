From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v5] usb: dwc2/gadget: rework disconnect event handling
Date: Thu, 20 Nov 2014 13:53:17 -0600
Message-ID: <20141120195317.GG23217@saruman>
References: <54699561.5040303@samsung.com>
 <1416214782-13911-1-git-send-email-m.szyprowski@samsung.com>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1giRMj6yz/+FOIRq"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:53356 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756845AbaKTTxE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Nov 2014 14:53:04 -0500
Content-Disposition: inline
In-Reply-To: <1416214782-13911-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Paul Zimmerman <paulz@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Felipe Balbi <balbi@ti.com>

--1giRMj6yz/+FOIRq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2014 at 09:59:42AM +0100, Marek Szyprowski wrote:
> This patch adds a call to s3c_hsotg_disconnect() from 'end session'
> interrupt (GOTGINT_SES_END_DET) to correctly notify gadget subsystem
> about unplugged usb cable. DISCONNINT interrupt cannot be used for this
> purpose, because it is asserted only in host mode.
>=20
> To avoid reporting disconnect event more than once, a disconnect call has
> been moved from USB_REQ_SET_ADDRESS handling function to SESSREQINT
> interrupt. This way driver ensures that disconnect event is reported
> either when usb cable is unplugged or every time the host starts a new
> session. To handle devices which has been synthesized without
> SRP support, connected state is set in ENUMDONE interrupt.
>=20
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

doesn't apply, please rebase on my testing/next:

checking file drivers/usb/dwc2/core.h
Hunk #1 FAILED at 210.
1 out of 1 hunk FAILED
checking file drivers/usb/dwc2/gadget.c
Hunk #1 FAILED at 1029.
Hunk #2 succeeded at 1108 (offset 1 line).
Hunk #3 succeeded at 2031 (offset 1 line).
Hunk #4 FAILED at 2293.
2 out of 4 hunks FAILED

thanks

--=20
balbi

--1giRMj6yz/+FOIRq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUbkatAAoJEIaOsuA1yqRErioP/0EOjytlBcn8HVwuEGD+vOpz
zM2RZ2rAJTc3F6stVOH+ddPd2e4AL4thH4vsz58nBNvoU+9oOL0TABSSoS864pqz
C+sfZURJyeaMj0g0DtFCeikTBesdk8Nda2ABgXXOiBJe4OxIA26jy3pQigTTYeOp
OII4feNMo9g5wkKYpZ4hpdULpAzY84i7Eil/cvs82RTd5P6PwFDdAbN6Lqk0wd3D
5GOaS2a2TlFJrGotcdTssiSA7xYdztN15wWrAjB1hyamnlrHWKRRxA5PXPBcJjEb
U53os/cAE8g0ZXgHvyJyS169AWeS3mml+yM4u/cNiw98MHfbS5MhAokFI1Wxzmxg
MRFRPr5cqcQ3hGAH3KyXr7nIpd4KVd8nEoHMHcQJQXZYcF8zXocqIUt/01W6mdBZ
6tQbhdMUaNFlxbEDwwG8eDELWavsHiowFKrU3FtWMTJEc1CsvwbxheXjfM/p8Srj
Yfk1Iz8cSVT/tzbY44Fr3jSnXF+wnOWq87yPwrtkNfug9mxPPfQI/vpntf4LYIqy
/hnlwAOJaV2AdWyASEwh/IDg3zGYvb/YIi9nQZJ5u9vriwBixNCQ+00kizaEmXpw
rrfIfq6f94Jg1T9r063/3AZl1dwTVPL0+uv0zlm6B40wul3cGW9xT9L7Pw8nMmqX
bLYvvoBEWJ9Lc3wgSqkP
=HF4Z
-----END PGP SIGNATURE-----

--1giRMj6yz/+FOIRq--
