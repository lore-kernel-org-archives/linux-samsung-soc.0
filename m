From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 07/10] ASoC: samsung: arndale: Add support for WM1811
 CODEC
Date: Tue, 1 Oct 2019 12:22:01 +0100
Message-ID: <20191001112201.GB5618@sirena.co.uk>
References: <20190920130218.32690-1-s.nawrocki@samsung.com>
 <CGME20190920130321eucas1p2efe85adb3df4c546a7d81326b4c75873@eucas1p2.samsung.com>
 <20190920130218.32690-8-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7869156921419844197=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190920130218.32690-8-s.nawrocki@samsung.com>
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


--===============7869156921419844197==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oC1+HKm2/end4ao3"
Content-Disposition: inline


--oC1+HKm2/end4ao3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 20, 2019 at 03:02:16PM +0200, Sylwester Nawrocki wrote:
> The Arndale boards come with different types of the audio daughter
> board.  In order to support the WM1811 one we add new definition of
> an ASoC card which will be registered when the driver matches on
> "samsung,arndale-wm1811" compatible.  There is no runtime detection of
> the audio daughter board type at the moment, compatible string of the
> audio card needs to be adjusted in DT, e.g. by the bootloader,
> depending on actual audio board (CODEC) used.

This doesn't apply against current code, please check and resend.

--oC1+HKm2/end4ao3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2TNtgACgkQJNaLcl1U
h9AYyAf/cMh/RnJSb91Y7ASAzq4JnJLv6QETGdT6/F2YvFYHwLw+XV88qB33VsOC
L9Xn5gOJxnSo/ewhwjmL2MyE8c7BOVuw7DUzg0hBhcmvFCb/AqZstgmedz0xWn4X
jaDpSyvvkCINxkOfmGc/7LFulw9q8tXAyLiBVKcvaqUiUXJwETSDJ1VSZVm12Fnk
lsLUyL+fE1bOUxBEwJhv3FiiUAyVj13mVfPN4xEWVY0JJHoe+YcN+HrYfHVcCwPo
vEVsnqVg4TV0ziGgzjW8nW4aHH6doqdnsojCOunjsTPhMqAVFwoTRF7xnSQgyFSJ
YPG6Fg/jY/DKErg6HcpOgX0em+1s+w==
=G3VW
-----END PGP SIGNATURE-----

--oC1+HKm2/end4ao3--


--===============7869156921419844197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7869156921419844197==--
