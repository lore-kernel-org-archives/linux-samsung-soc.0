From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 2/9] mfd: wm8994: Add support for MCLKn clock control
Date: Thu, 19 Sep 2019 15:33:14 +0100
Message-ID: <20190919143314.GM3642@sirena.co.uk>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104656eucas1p1d9cad1394b08d05a99151c4fbc9425ce@eucas1p1.samsung.com>
 <20190918104634.15216-3-s.nawrocki@samsung.com>
 <20190919075924.GB13195@pi3> <20190919125020.GJ3642@sirena.co.uk>
 <20190919143116.GL10204@ediswmail.ad.cirrus.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5934485049648689305=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190919143116.GL10204@ediswmail.ad.cirrus.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com, lgirdwood@gmail.com, Krzysztof Kozlowski <krzk@kernel.org>, robh+dt@kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org


--===============5934485049648689305==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yr/DzoowOgTDcSCF"
Content-Disposition: inline


--yr/DzoowOgTDcSCF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 19, 2019 at 02:31:16PM +0000, Charles Keepax wrote:
> On Thu, Sep 19, 2019 at 01:50:20PM +0100, Mark Brown wrote:

> > Yeah.  IIRC when these were added a machine driver was grabbing them.  I
> > don't think that machine driver ever made it's way upstream though.

> If you mean for the Arizona stuff, the machine driver using that
> was sound/soc/samsung/tm2_wm5110.c. Sylwester upstreamed it along
> with the patches.

No, there was a WM8994 thing before that.

> I think on wm8994 the clocks probably are only needed by the
> audio part of the driver, so probably can be moved in there,
> although as a disclaimer I have done a lot less with parts
> of that era. However on Arizona the clocking is needed from
> various parts of the driver so couldn't be moved exclusively
> to the codec driver.

Yes, they're only needed by the audio part of the driver.

--yr/DzoowOgTDcSCF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2DkakACgkQJNaLcl1U
h9CyCQf+MMpoS4FlVQq+9Xt+0Uket4UES+rOnjdNVAtME5x6rwp/rW3bJeTlegL3
qviOHfnz9mgXwuCeR5RxotyqaZ6WB0ihYC/Y1TXFxaM5mN8Xqg4s3tWs0roBVc5q
wFKYpZr1heeoP8/2Meitj68poZHiUIGcU5E8Lgs9qDDJK5hwzVZ/1hJTvY4Dx5GN
ZuWslKMKAitY8sH2wV2+kDB1JY0poPsScarR/z3MozVoEIg6ABbc/EwX8MObf4a5
0QiV/9mSwrQ2Ctjd1nnr8/a8wOMkKdqiHYbCRYB5dy432Dh3oWZ5eRqUodDDR9eK
uLi3a+I6dtNmKmWHdMYaoRG//ylGlA==
=ebz9
-----END PGP SIGNATURE-----

--yr/DzoowOgTDcSCF--


--===============5934485049648689305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5934485049648689305==--
