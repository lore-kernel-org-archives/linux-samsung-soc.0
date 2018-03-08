From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: Use proper DT compatible string for
 Hardkernel Odroid boards
Date: Thu, 8 Mar 2018 10:40:54 +0000
Message-ID: <20180308104054.GA6019@sirena.org.uk>
References: <CGME20180307174638epcas2p33f071928807ccaa40ad07922c15be31c@epcas2p3.samsung.com>
 <20180307174625.16597-1-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6867409056689916381=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20180307174625.16597-1-s.nawrocki@samsung.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, lgirdwood@gmail.com, robh+dt@kernel.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org


--===============6867409056689916381==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 07, 2018 at 06:46:25PM +0100, Sylwester Nawrocki wrote:
> The Odroid boards are manufactured by Hardkernel, not Samsung. New compatible
> string entries are added, with "hardkernel," instead of "samsung," vendor
> prefix. Support for the old compatible strings is going to be removed after
> some time.

Acked-by: Mark Brown <broonie@kernel.org>

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlqhEzIACgkQJNaLcl1U
h9Bgsgf/V8hGKfUtgONhXn77+UYhFKqAk3/zFF5mJcsU/RV5vsC1A2joXqp9NhRn
GpsInXIkiIKhXh2nKF7IR7VoWPV74mqiC8g7q2E4iWS9uAKMT0umhhHDSq/H74LY
8xzQdZktIXu+kvdupO2xkKWN95NThGzZQimI6nrNpG1dLlPtH6LojjdRnWWtLnlU
azcwW7mJyMI0/abvy7b2n4rSLn1U+xb34lEygxEaTiKJlL7Ad6ZZoQw+358Jl9OC
k4uejlKqOsbGPoPDbkur9TijUsmCPmHLAY4+23EJQ+QvWq2Jk6m6KsrTfMlh4x7x
A71CitI7AqZ3Pl6CNYdDgaQ0Be3Fww==
=v7wv
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--

--===============6867409056689916381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============6867409056689916381==--
