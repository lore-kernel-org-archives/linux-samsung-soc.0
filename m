From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/9] regulator: max77802: Add
 .set_suspend_{enable,disable} callbacks
Date: Thu, 16 Oct 2014 10:37:16 +0200
Message-ID: <20141016083716.GF724@sirena.org.uk>
References: <1413390039-19364-1-git-send-email-javier.martinez@collabora.co.uk>
 <1413390039-19364-2-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kR3zbvD4cgoYnS/6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1413390039-19364-2-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Doug Anderson <dianders@chromium.org>, Chanwoo Choi <cw00.choi@samsung.com>, Olof Johansson <olof@lixom.net>, Chris Zhong <zyw@rock-chips.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--kR3zbvD4cgoYnS/6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 15, 2014 at 06:20:31PM +0200, Javier Martinez Canillas wrote:
> The max77802 PMIC has an enable pin (PWRREQ) that can be used to switch
> regulators ON and OFF automatically by the Application Processor when
> the system is leaving and entering sleep mode.

Applied, thanks.

--kR3zbvD4cgoYnS/6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUP4O7AAoJECTWi3JdVIfQQqcH/2ekGsWXcJ10RMVmLGR7rEgZ
FH0yZgEcbglsybBSmeRRqpVH6KeG0bN4FuobaCbhrBBc0r00BEpJdEUynjLLr7F0
wjO88DzIAkZb0lr1ZexE7dxbmJbyzwUI0ufspDgYSjv9p+xWSYtHQsJ1hRndkqMB
R5I60Ys6SHWt0hzQZU0SFPiGEdSy+6Rj4UIJ7rd4lAcbpnpvobASAEqOPopCzTG6
usrikXgFeTdr25T3fHRYmToOk07MqaN8opt3+6grd4+H1P8kq5d7p0HIUykCNyr+
D77iiGq8BWHAPyq9swNinZ1fSi5SCDwmcQxrFsa34NyoArSDSjHZlX9HdjZioU8=
=0PxP
-----END PGP SIGNATURE-----

--kR3zbvD4cgoYnS/6--
