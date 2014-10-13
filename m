From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 5/5] ARM: dts: Add initial regulator mode on exynos Peach
 boards
Date: Mon, 13 Oct 2014 13:14:44 +0200
Message-ID: <20141013111444.GV27755@sirena.org.uk>
References: <20141008195112.GI4609@sirena.org.uk>
 <54369B59.8000509@collabora.co.uk>
 <20141009174848.GW4609@sirena.org.uk>
 <543700C1.7050909@collabora.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mEvYxaKTQdy27sIr"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <543700C1.7050909@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Doug Anderson <dianders@chromium.org>, Chanwoo Choi <cw00.choi@samsung.com>, Olof Johansson <olof@lixom.net>, Chris Zhong <zyw@rock-chips.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--mEvYxaKTQdy27sIr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 09, 2014 at 11:40:17PM +0200, Javier Martinez Canillas wrote:
> On 10/09/2014 07:48 PM, Mark Brown wrote:
> > On Thu, Oct 09, 2014 at 04:27:37PM +0200, Javier Martinez Canillas wrote:

> >> only two modes: ON and OFF (and some of them have a third Low Power mode).

> > ...but let's be clear, only "on" (normal) and low power are modes here.
> > Like I keep saying please think things through - if modes also include
> > enable control why would they be treated separately in the API?

> Right, I got confused again by the terminology in the Maxim data-sheet that
> list output OFF as an opmode but I understand that OFF is not a mode and
> that the regulator API treats it separately.

OK, please do try to be careful with things like this - when there's
problems around confusion about concepts it's very important to make
sure that communication is clear.

--mEvYxaKTQdy27sIr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUO7QjAAoJECTWi3JdVIfQ8eYH/RsN7E2k7lL6Enkbkhr6zUpt
WPFBc8739fGP2sUJ+DxXYpXuC5+xEDBcL+zYlFj29BpYqzdWH2Em8Lj3urxZPNs5
RcSM4tnr1h2mCwhtW5ghcxbU0Vw80S2s4huu2CdOS1D5gaOLOpjEmKT/Q5/+C0Pb
Cs6Q090iGF+3fHV+fepX/wApUTQ2W4JPMmCizplBdEh8QD6Otke4sMjbxhqcybLB
9fh89oSJQw0mEIqfvkSqAjMPwiznEHVFlEJFF5r02CPrfN29MXP8xjv8vhQNkvYh
7ZGzWeF/R4cBM0Tqtb9tCoQbUT0c8S8HCIkPQXD8Rd45ISj80WT8gaVUDZ42GYM=
=XiXq
-----END PGP SIGNATURE-----

--mEvYxaKTQdy27sIr--
