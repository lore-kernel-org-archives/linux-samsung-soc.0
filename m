From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/9] regulator: max77802: Split regulator operations for
 BUCKs
Date: Thu, 16 Oct 2014 10:38:24 +0200
Message-ID: <20141016083824.GG724@sirena.org.uk>
References: <1413390039-19364-1-git-send-email-javier.martinez@collabora.co.uk>
 <1413390039-19364-4-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kadn00tgSopKmJ1H"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1413390039-19364-4-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Doug Anderson <dianders@chromium.org>, Chanwoo Choi <cw00.choi@samsung.com>, Olof Johansson <olof@lixom.net>, Chris Zhong <zyw@rock-chips.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--kadn00tgSopKmJ1H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 15, 2014 at 06:20:33PM +0200, Javier Martinez Canillas wrote:
> Not all the max77802 BUCKs regulators have the same functionality, for
> example BUCKs 2-4 support the output to be configured as normal or Low
> Power Mode by the PWRREQ enable pin while the other BUCKs only support
> their output to be set ON or OFF by PWRREQ. As a preparation for adding
> a set_suspend_mode function handler for all the regulators that support
> Low Power Mode by PWRREQ, split the operations for BUCKs regulators.

Applied, thanks.

--kadn00tgSopKmJ1H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUP4P/AAoJECTWi3JdVIfQtnoH/iXdwvHRtWfmpq3uTjX3V38H
t0rlBA1Ir3N43KNBI9qjjN0x8WV7yEu8K5pb+fJ1ofMmSBruldEVvpzeS9/xjKy8
eUFWiuc7zuJNMZBkkVzJsdlvk6stVeED6g83k45wp/DA7hmdHSydZfkXiHxwHx2V
0g1WoZJUeZu7SlqqFMGCRKSjhzCJ4XBSpetTH+kIT2p3gWmJNBHyjIaT5furIqg9
P2Bf1u4aaF0y3p5kJ7quQJBL0EWQGlMI4nz0HNg+DwFjcNzGuvC95/uj4bBH5cyn
h78C0fRckWvDt/97vEvKIzsAJF35ceedDNBKyo85Lf5TUMZFOTNItq7nEvisUQ4=
=aNti
-----END PGP SIGNATURE-----

--kadn00tgSopKmJ1H--
