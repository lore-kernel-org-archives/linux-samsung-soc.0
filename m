From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 4/5] ASoC: samsung: Document compatible
 strings for Odroid X/X2, Odroid XU3
Date: Mon, 19 Mar 2018 09:45:12 +0800
Message-ID: <20180319014512.GB2186@sirena.org.uk>
References: <CGME20180314164301epcas1p105f42730914735774284892b71839572@epcas1p1.samsung.com>
 <20180314164242.22927-1-s.nawrocki@samsung.com>
 <CAJKOXPdxSULHestFBc2YmtVzEpu422VdqtKMmy9FoCOjGV3wgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8864332222568641391=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <CAJKOXPdxSULHestFBc2YmtVzEpu422VdqtKMmy9FoCOjGV3wgw@mail.gmail.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, =?utf-8?Q?Bart=C5=82omiej_=C5=BBo=C5=82nierkiewicz?= <b.zolnierkie@samsung.com>, sbkim73@samsung.com, lgirdwood@gmail.com, robh+dt@kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============8864332222568641391==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wDIVdgWPGyZzZswh"
Content-Disposition: inline


--wDIVdgWPGyZzZswh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 16, 2018 at 08:37:28AM +0100, Krzysztof Kozlowski wrote:
> On Wed, Mar 14, 2018 at 5:42 PM, Sylwester Nawrocki

> > - - compatible - "hardkernel,odroid-xu3-audio" - for Odroid XU3 board,
> > + - compatible - "hardkernel,odroid-u3-audio" - for Odroid U3 board,
> > +               "hardkernel,odroid-x-audio" - for Odroid X, Odroid X2 boards,
> > +               "hardkernel,odroid-xu3-audio" - for Odroid XU3 board,
> >                 "hardkernel,odroid-xu4-audio" - for Odroid XU4 board

> These are the same so I think they should not get separate
> compatibles. By definition [2] the compatible expresses the
> compatibility with family of devices. In this case - these belong to
> the same family.

> The same applies to patch 5/5 (implementation of this).

I don't see a problem with adding the compatibles - the software
handling might be identical but it's not really causing a problem to
explicit document which board it is if people want.  It may end up
coming in useful at some point if there's some mechanical/plastics
difference which ends up being useful to handle (though that's much less
likely for dev boards like this than for finished products).  But
equally it's not essential, whatever you two decide.

--wDIVdgWPGyZzZswh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlqvFicACgkQJNaLcl1U
h9BpdQf+PTSYmQtGxBX8xXq8mXk+c58fcg+uQJM23M7mKv/O02VPqufeYzb1PIYA
YzlZLsg9HVwi9J4VrhMAOxnqn6W7PfSoZ0AApYJeNSeBI11dTpV5PyntzgyxqIIx
BoG3VD8noHGPKbJvNsi7yWJHkaXsikbUSPNAX7cMReD0XyVQi85b8Bm2dChseZ4q
g2Zs1Pk4ryuRl/K4cU5FmBfMtGV1kmvoPLUySLVzmkhBKwhVnKZKS+0MXxFsO3Ck
nn78g5O8iKdxGxQWxezjcKGWn1nJgKmsBwm3Z0AxNyIfTQ7e8sGnMUTFAdC7vcyJ
iASbUVfQUaYyMhVziu6QePAFiK88Ew==
=fmOW
-----END PGP SIGNATURE-----

--wDIVdgWPGyZzZswh--

--===============8864332222568641391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============8864332222568641391==--
