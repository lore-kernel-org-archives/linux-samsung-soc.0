From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 12/14] regulator: max77802: Use unsigned int for modes
 in max77802_map_mode()
Date: Mon, 3 Nov 2014 16:08:38 +0000
Message-ID: <20141103160838.GY3815@sirena.org.uk>
References: <1415025649-8119-1-git-send-email-javier.martinez@collabora.co.uk>
 <1415025649-8119-13-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bNvn4bxlrUVLu6cT"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1415025649-8119-13-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Olof Johansson <olof@lixom.net>, Chris Zhong <zyw@rock-chips.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--bNvn4bxlrUVLu6cT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 03, 2014 at 03:40:47PM +0100, Javier Martinez Canillas wrote:
> All function dealing with operating modes use unsigned int for modes
> so change max77802_map_mode() function signature for consistency.

Applied, thanks.

--bNvn4bxlrUVLu6cT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUV6iFAAoJECTWi3JdVIfQsg8H/1bmFVxguNOvT8px9folEsWJ
SIIdYqDb3jdQGYxtdPc5Ls4xse9He2lGJs4PwqrsdJl+fjsN7sH+9qOiSMEPinRJ
w7PWs1pblnZC9Y3K/Ora/se7Hx7lxVGHh5AAIHm96jCDxu29MTQfoL+yHfPx0VxM
ccLssFRbjIz7GCxmPScFhC7H84NjgaencbR6RqXA/Vh/BcWSTuwTg2S6Ps/OmSpT
bddq1lBdrIe+sdjNEcs+yejvrUV2VmzrQEAkHBC5SGyQpOizq+RiaWgOez44BISh
EaMFfRNTKT3f9dYHM/aKEjDwWGaEpW3ZNgxkL+gVvNzi+1A2yh9Wntbhnhd3+8M=
=i9oE
-----END PGP SIGNATURE-----

--bNvn4bxlrUVLu6cT--
