From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 3/7] regulator: max77802: Don't treat OFF as an
 operating mode
Date: Fri, 17 Oct 2014 14:44:59 +0200
Message-ID: <20141017124459.GN1820@sirena.org.uk>
References: <1413478133-2577-1-git-send-email-javier.martinez@collabora.co.uk>
 <1413478133-2577-4-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sy9WyBOsCRoUO165"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1413478133-2577-4-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Lee Jones <lee.jones@linaro.org>, Doug Anderson <dianders@chromium.org>, Chanwoo Choi <cw00.choi@samsung.com>, Olof Johansson <olof@lixom.net>, Chris Zhong <zyw@rock-chips.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--sy9WyBOsCRoUO165
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 16, 2014 at 06:48:49PM +0200, Javier Martinez Canillas wrote:
> The only operating modes that are supported by the regulators in the
> max77802 PMIC are Output ON (normal) and Output On in Low Power Mode.
> OFF was wrongly counted as an operating mode while is only a regulator
> status. Make clear in the code that OFF is not an operating mode.

Applied, thanks.

--sy9WyBOsCRoUO165
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUQQ9LAAoJECTWi3JdVIfQQ+YH/0lPxUlhpiGB4bAmAEYteRKv
eoRD2iBdR5RbWxNGymYUBSiPS+kMFm/1ucQv2GGVcNywjsx6wrlrlfkKVBtYyIob
hNQ/GuEnBnQtw6ZJEpVhIq6tXiWGbcWtQUS7BMkgMe0hmy9gNkOZ2LKzmCUK/gqd
tBKEmzj2lAJyGeePIRFMRpa4mjW61urWWimXcOSEWBkMUIGeeAfsRuTqnfwNDCzb
qdOTgRsrllu34Vnfv2D3o9T7BQZjD3PgwSMhsMaThwEZU7rmyWG64eIX1FLgBcGR
NW5g+gY0GtiJSfKYXcn2itNCaJe7TBeDzy+ojuve9rADCEnCOQ4hpNMBL3rBmko=
=JRuo
-----END PGP SIGNATURE-----

--sy9WyBOsCRoUO165--
