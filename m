From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFT PATCH 1/3] usb: misc: usb3503: Fix HUB mode after
 bootloader initialization
Date: Fri, 29 Apr 2016 17:44:48 +0100
Message-ID: <20160429164448.GY3217@sirena.org.uk>
References: <1461927591-7864-1-git-send-email-k.kozlowski@samsung.com>
 <1461927591-7864-2-git-send-email-k.kozlowski@samsung.com>
 <20160429113059.GX3217@sirena.org.uk>
 <57234BA2.6020304@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pJWGhKxYz0gFF1YW"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <57234BA2.6020304@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, linux.amoon@gmail.com, tjakobi@math.uni-bielefeld.de, m.szyprowski@samsung.com, hverkuil@xs4all.nl, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--pJWGhKxYz0gFF1YW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 29, 2016 at 01:55:14PM +0200, Krzysztof Kozlowski wrote:
> On 04/29/2016 01:30 PM, Mark Brown wrote:

> > Supplies are only optional if they may be physically absent.  In this
> > case it's possible that on device regulators may be used instead, a
> > pattern more like that used for arizona-ldo1 where we represent those
> > regulators might be better as it's more clearly describing the
> > situation.  I'm just wondering if the supply lookup stuff there should
> > be factored out as this is not an uncommon pattern..

> > It should at least be clearly stated what's going on, ignoring failure
> > to get supplies is generally a bug and people will tend to blindly cut
> > and paste things (witness all the breakage in graphics drivers with
> > this).

> The VDD33 is really optional. The device can work in different
> configuration, e.g. only on VBAT. How the reset logic would work then? I
> don't know... I would suspect that it could be exactly the same (just
> replace VDD33 with VBAT) but I am not sure.

What the Arizona example I mentioned does is look for the property
specifying an external supply in DT and if there isn't one assumes that
it must be using the internal regulator.  That's a bit icky but it does
the right thing and is much simpler from a user point of view.

--pJWGhKxYz0gFF1YW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXI49/AAoJECTWi3JdVIfQJWkH/RKWxiRKAo28sPRxKp0DzRog
4TQDH0Y6agkZowh7D5oexH2wyw2PBMni7LFkX7sxrM+1j14gnGwRN4pJ80Zc5tnE
wZ1MiqFE1FIuDf8JzyM99ZNw9zPP1DO8bvIla+eG2WQx6AslGdY937FA+AzvQh8C
AjJTQyNmeQHqwGVk5xteIkwT1PYFjBLWGt0KftCeMQN5R3ZLGI2vB3BkuyNnrIad
j8u8vyTAtfNKog8PuinGCSsz4SnFKAPJUqWJdYUxciHaySO3VWsoerNGtcIX18t8
7kcXIzZOJByfik2SS92oUyl+5sdcG5OJLPYUdbI+D5fev8sHCmnUhy7FOJPRcaI=
=7PCN
-----END PGP SIGNATURE-----

--pJWGhKxYz0gFF1YW--
