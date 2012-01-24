From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH 2/3] s3c-hsudc: add basic runtime_pm calls
Date: Tue, 24 Jan 2012 11:37:30 +0200
Message-ID: <20120124093729.GS27414@legolas.emea.dhcp.ti.com>
References: <201201082156.44142.heiko@sntech.de>
 <201201082158.28694.heiko@sntech.de>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DIYaQRZjygY6fA2m"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from na3sys009aog104.obsmtp.com ([74.125.149.73]:33854 "EHLO
	na3sys009aog104.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754181Ab2AXJhe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jan 2012 04:37:34 -0500
Content-Disposition: inline
In-Reply-To: <201201082158.28694.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Felipe Balbi <balbi@ti.com>, 'Ben Dooks' <ben-linux@fluff.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--DIYaQRZjygY6fA2m
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 08, 2012 at 09:58:28PM +0100, Heiko St=FCbner wrote:
> This will enable the system to check for activity of the usb gadget
> and also in a later patch to control the usbphy power-domain.
> When handling the power domain there, it will be possible to remove
> another reference to architecture code.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

applied, thanks

--=20
balbi

--DIYaQRZjygY6fA2m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPHnvZAAoJEIaOsuA1yqREMgMQAJbPYrZR8h6/zhrEK0LO5ssX
JTwVd7pJykcPLCUrTNSvh2ICNvck+80cflpdoBPCNaYGq5ugg7nwVH/4DelHhjCZ
nX4axDu0v9wwD/6T4BaWF7gEz94ojqxYdFAPrmmViJVVNkJpMILRGtYtfCMFpMYU
/tcg+MpicPaxVK7YldtLzg17WrQix7790ko9/9OKc+8OhuCkxhlOHoFC90kPYmO6
Vx8pw4nzaDEPLXM75Dz9CuhXN1xQJewNYS0kg3byyb68yNuHPNOQEC9zi3Of9bRl
o0CCGzkpkzNTAGH9g3IJ3d33EdFYWGNIWFszf5fso7kj3SLe0ZMYtXLDR+MQQpR9
NJAzdHqyd+pDjs3vVmgGi8TX/FXhBCToNDgij5/3bdACZ+rT1KtKNYiqK2d6VVil
SbD2JG2zlA52WWOQZDAiwx/qGnBNb99LeurQubDCdDlZfwytxAQeZaT4ut1E7H9y
+54gsaeEoCfQ0YyKQzQ9nBTkcW4pf932wnw8dpyN1JG08Rrg6gdJMgsD240AGm0T
gjYfy6Qeb1Of8A5xe5OHmleL2x9MbNOsP6glp/5Y4iOKf5k49tFXmrnR2GplWVWD
H7SUips49VHQGZxgb1lViBJWUOEd57OyeuRfFoAwIIZ9GY/kERctOeKhcSnShV9H
noWByR6v2SElv+ju9dhE
=5F15
-----END PGP SIGNATURE-----

--DIYaQRZjygY6fA2m--
