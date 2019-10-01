From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 08/10] ASoC: samsung: Rename Arndale card driver
Date: Tue, 1 Oct 2019 12:22:28 +0100
Message-ID: <20191001112228.GC5618@sirena.co.uk>
References: <20190920130218.32690-1-s.nawrocki@samsung.com>
 <CGME20190920130323eucas1p218c6822eca3869eb0d3b7380497bbca4@eucas1p2.samsung.com>
 <20190920130218.32690-9-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6937988834633936047=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190920130218.32690-9-s.nawrocki@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com, b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com, lgirdwood@gmail.com, krzk@kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org


--===============6937988834633936047==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ghzN8eJ9Qlbqn3iT"
Content-Disposition: inline


--ghzN8eJ9Qlbqn3iT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 20, 2019 at 03:02:17PM +0200, Sylwester Nawrocki wrote:
> Rename arndale_rt5631.c to just arnddale.c as we support other CODECs
> than RT5631.  While at it replace spaces in Kconfig with tabs.

This doesn't apply against current code, please check and resend.

--ghzN8eJ9Qlbqn3iT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2TNvMACgkQJNaLcl1U
h9B5/Qf/X9rpGHePKhgNMopSnhX5Qe21BJNNbNjUxWxPTwsw2b1QJJ6tvlNU1Plj
JxKTplpI0I8fQNhgBgK1zkc8SECbUDRSwkR/UOBthGp2s7/ZeClSHvyTD6Z2j5IT
OyFKkFi7MLpjK4eBoIlbW5NnfZYKyC7edq5RgFBn1TZsbdaGaDrx9urqoSQwJfTF
APcyzdbqNU0Y1UzyZ8jKGGXOLljoDAHW8gpGnunvRyE3Vaw4KLG6spBkuxIuep0L
hjlRBSmx0lR4UrG7CKYmWK6UmxDIaKIUfbp5nqKOQ8V3x0mHbw4cQxQp3hv7+WYk
R5jy35YHbr0NyF5bGBiPWb8OZxJhxw==
=x8KZ
-----END PGP SIGNATURE-----

--ghzN8eJ9Qlbqn3iT--


--===============6937988834633936047==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6937988834633936047==--
