From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v3 1/2] usb: dwc2/gadget: add mutex to serialize
 init/deinit calls
Date: Thu, 20 Nov 2014 13:53:43 -0600
Message-ID: <20141120195343.GH23217@saruman>
References: <54535F82.7020406@samsung.com>
 <1414750354-19571-1-git-send-email-m.szyprowski@samsung.com>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X+8siUETKMkW99st"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:38312 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755849AbaKTTxa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Nov 2014 14:53:30 -0500
Content-Disposition: inline
In-Reply-To: <1414750354-19571-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Paul Zimmerman <paulz@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Felipe Balbi <balbi@ti.com>

--X+8siUETKMkW99st
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2014 at 11:12:33AM +0100, Marek Szyprowski wrote:
> This patch adds mutex, which protects initialization and
> deinitialization procedures against suspend/resume methods.
>=20
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

doesn't apply either:

checking file drivers/usb/dwc2/core.h
Hunk #1 FAILED at 187.
1 out of 1 hunk FAILED
checking file drivers/usb/dwc2/gadget.c
Hunk #2 succeeded at 2863 (offset -46 lines).
Hunk #3 succeeded at 2889 (offset -46 lines).
Hunk #4 succeeded at 2915 (offset -47 lines).
Hunk #5 succeeded at 2934 (offset -47 lines).
Hunk #6 succeeded at 2964 (offset -47 lines).
Hunk #7 succeeded at 2976 (offset -47 lines).
Hunk #8 FAILED at 3518.
Hunk #9 succeeded at 3579 (offset -84 lines).
Hunk #10 succeeded at 3603 with fuzz 1 (offset -84 lines).
Hunk #11 succeeded at 3614 (offset -84 lines).
Hunk #12 succeeded at 3632 with fuzz 1 (offset -84 lines).
1 out of 12 hunks FAILED

please rebase on testing/next. Also, add Paul's Ack when doing so ;-)

thanks

--=20
balbi

--X+8siUETKMkW99st
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUbkbHAAoJEIaOsuA1yqREeCQQAIVRIH0AeeXG1ey49EVmnoWc
UEgPrhamy9oxWr89cbn0Ga636zyRDC69qhYOlBi92vlg6o0zkDJPNh5XNIU0pjR0
GWImmCkgdmBoZGYoK0I/qmfcEy6LRKDi7zmgru3yhmTvYs6gG2ZttvlsdWq/uRyR
9iyljSoWYGMADfwnoCOI3OWQlECATiHsT0U+RPvV5oHOUj9Y0W6IU6RncH9AX9yQ
kCditkpE1cuNQ5UdhgpfMQuOHZnl4sD7RwzMEHLAWYdsrs0g4BSafg0gjAfFzuKQ
RpQwvNKvq0osaHtYdAA4EqXseP2PzMaTxYxrNN4UdUT3sRKntK4pjRnuCqUSUT1I
WE1KjSTInTS7g5N6gzhsjeJ5Ot3nnJbj6hI8Xrr6XdD/LElO6tqjmw0Mfxey8xJe
F8TQZL1vpnecugKXt+Ym48SogbSosugPeC/Z/Edbh/7yVzfW2H9EIpP5ejBllH9d
j9xUNJd71fZmRos3lQZripIOjZhoybYbwgifrpB09dG3p9kHlu1iQ/hrOvqWjzEm
F9EosIQkHBVxyVeDob+kMDpkagRrQnEJnU8Sw/b8isBJqOPCcJZDJyP7t/p6o2Fu
s/9B5ZnNWf5PSVyCItgBx7aMO+Y001/EKlI1V5BE4TIFBhsBo1Lm2cZMeZAwa4Zt
UOunhezZHzF/AZqm1Gsj
=uozP
-----END PGP SIGNATURE-----

--X+8siUETKMkW99st--
