From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH 8/8] s3c-hsudc: remove the_controller global
Date: Tue, 20 Dec 2011 13:27:17 +0200
Message-ID: <20111220112716.GH31842@legolas.emea.dhcp.ti.com>
References: <201112191938.22254.heiko@sntech.de>
 <201112191943.35591.heiko@sntech.de>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4LFBTxd4L5NLO6ly"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from na3sys009aog116.obsmtp.com ([74.125.149.240]:39739 "EHLO
	na3sys009aog116.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751422Ab1LTL1X (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Dec 2011 06:27:23 -0500
Content-Disposition: inline
In-Reply-To: <201112191943.35591.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Felipe Balbi <balbi@ti.com>, Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Linux USB Mailing List <linux-usb@vger.kernel.org>


--4LFBTxd4L5NLO6ly
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Dec 19, 2011 at 07:43:35PM +0100, Heiko St=FCbner wrote:
> Instead use container_of to retrieve the s3c_hsudc from the
> struct usb_gadget pointer.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

aha, it's here. So I replied too fast. Sorry about that and thanks for
doing this.

--=20
balbi

--4LFBTxd4L5NLO6ly
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJO8HEUAAoJEIaOsuA1yqRE/ioQAI25zvuHFThehSRfgI0vaeh9
DcYUxsnfvgg5/0UDOdGDREvliajbAnVWWhRb1qZQSyHEQt4cKWnq1ANVo+DOWwE4
EwJJdK+4uk53zJwvxF33P11B3J6YvdzjHZ6J1Yc4c90og6e+UfM+PgI5oCbWhl7a
14/wjz6gd1vesa3833fYEaBjuB2eRHOOmHhKyrIr7nVd5O1EPuWheqG83Ji6FfhH
fAQwjmsQXaNUsSzE364L/R4HBoGpftwxedQN+VTynSFEfpn6X96mFUzJnh6u4DGa
Js7oljSBpT5Ty6kset30uOxvkfV26ccVEgI9Iwhnih8tCOUvV+Crp6ZcbsYN0qmd
qn6VGbfiCyh4iRm9Yo6f7/j3hdlxkwy7nxif24wvxGh1n5ygaxyzUvpJ9WU6+9XR
HYG8E2xGo96r/ZL8DgyIq4TMWp4nxWOkjfiOFtmgGDgAdqWBX/AnSVmMxBMvtDlt
BH9MLZbBpJ2Eebuj+dSvSTDSluRuunQ1YyFYCVnVuw5YBZjV1t61tgL0YlMrgNDF
2qnG88CBn+WKxII2Z/gsPXQVHOLAitY/fkXfM40gLfznw8r7qwr2/WWQ+8RU+tIe
tXQ/4pBVKwDOSIME9nBLFtzFKblaGs9GXOheKk1G3Q9f7lykRFYZLH9Rh9sXGMWa
rt+oJrnbcTLmkY7qGXub
=NelE
-----END PGP SIGNATURE-----

--4LFBTxd4L5NLO6ly--
