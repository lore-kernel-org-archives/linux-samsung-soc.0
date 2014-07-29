From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC 5/5] ARM: dts: Improve Peach Pit and Pi power scheme model
Date: Tue, 29 Jul 2014 18:20:05 +0100
Message-ID: <20140729172005.GW17528@sirena.org.uk>
References: <1406651339-28901-1-git-send-email-javier.martinez@collabora.co.uk>
 <1406651339-28901-6-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iV2d/vj8ESJZTLS0"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1406651339-28901-6-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--iV2d/vj8ESJZTLS0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 29, 2014 at 06:28:59PM +0200, Javier Martinez Canillas wrote:
> The DeviceTree files for the Peach Pit and Pi machines have
> a simplistic model of the connections between the different
> regulators since not all the tps65090 regulators get their
> input supply voltage from the VDC. DCDC1-3, LD0-1 and fet7
> parent supply is indded VDC but the fet1-6 get their input
> supply from the DCDC1 and DCDC2 output voltage rails.

Acked-by: Mark Brown <broonie@linaro.org>

This *should* be independent of the rest of this series.

--iV2d/vj8ESJZTLS0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT19fCAAoJELSic+t+oim9GJUP/2pHMO6SaojAsT12eeQ/Ox+8
w0cxU1Vv6y+bJbsivw7rZ8LBUWWS16kltny2Dp7qRtENnRP67+ws5/q75wr+i7B+
SkoVR9vpCFupRt9/1ddvUPUG6BD6k96YxvHMlPnUi+JjpEWzGaXjR2hJjNEad8hT
m99QCw72prWA+csr1y8dnWjE4CqxELGXjoeoB7sIRyAAC1DY8s0x28DFyLmulQUt
cjppWNiIu5r1+2cBbOeS+/rYyYP/ZLZ7efzUg+qoOHqU7ToNt46ByZi8YAv2XwsJ
fp2HfRauGQjsQjsujB54GzMlMDK1oXl62ugZTw0Ia5yhBc8X4v6BmM5b3M+oE/PM
Nc/L1fZBpCQXwYsPYZdrUizdS1TVbeDXdTo4sjByluvybEEoAOQjROqCdwQkfRtX
PrVq8BCd3ZUvO6HfRvxgocrbCF3oFDqR8fhCkCKwiUIgXS4/UrMgkef1SflPzMDy
poglt9mWKHFfehWF037HpRT7wSU1HqxoEA4Hh2yKx9qOf8rcCoPLzxSVPrcw2VKT
noainkzL7zNF518uj8O1tq21twDiCczMi5aVjp2XkkNGozaxoIRBovyMRxBe1bml
WG/b38W2lhTSvz5UKEXYxhMV7YHBrrMISOVKoMwHoqYps6ntKTdWEtYihFE/7yYO
Q90vYzBL9TL/sju+cntj
=RgOI
-----END PGP SIGNATURE-----

--iV2d/vj8ESJZTLS0--
