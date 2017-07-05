From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: samsung: i2s: Supported high
	resolution rates
Date: Wed, 5 Jul 2017 11:11:46 +0100
Message-ID: <20170705101146.5pk4hxuyco4va32r@sirena.org.uk>
References: <CGME20170705055835epcas5p32d60ee0f1acaf4e04c8a80d49bc2a730@epcas5p3.samsung.com>
 <20170705055832.4893-1-jcsing.lee@samsung.com>
 <20170705061323.a45ylipylcerz3te@gangnam.samsung>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5970853484838447306=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20170705061323.a45ylipylcerz3te@gangnam.samsung>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Andi Shyti <andi.shyti@samsung.com>
Cc: alsa-devel <alsa-devel@alsa-project.org>, linux-samsung-soc@vger.kernel.org, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, Jaechul Lee <jcsing.lee@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, Jaechul Lee <galaxyra@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============5970853484838447306==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="agcgp7bgjh2dfoeo"
Content-Disposition: inline


--agcgp7bgjh2dfoeo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 05, 2017 at 03:13:23PM +0900, Andi Shyti wrote:

> > +	if (IS_ENABLED(CONFIG_OF) && pdev->dev.of_node)

> I do not like drivers to check the Kernel's configuration, I
> think just checking "pdev->dev.of_node" is enough.

This idiom gets used because it allows the compiler to optimize out the
DT section if the kernel is built without DT support, it's fine.

--agcgp7bgjh2dfoeo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAllcu14ACgkQJNaLcl1U
h9CoiQf/Y/gHLo/ZgFYoFcydvKn1EQxjIpuvXRkjm7hu2Edd2cOOqVImX9zgwYwl
yLcRMav3Ggc/QhMBp/s+ExZYPk1ypQBDqN9K6OClUDsJACgAaSbtWvCb/530K3Ra
Y2FY00amGPkGxRaFWXb8YUn3Kc6byspU8CDoKLg7k5TIaiVxSnR5H5fJvNL2SAHy
QG+Dn7rQ8E5SXAOeK9ASgJburQlgiRpaymN4zXgfqGgNjD5qq405FWHZsTLYjYVF
a6DPYFbbgvLrlx/t2xUHyfx9zhyaUqnUfBoajX1DnYzsPqyXKgUmEUyil1PpIoCD
YxfbsJf49lwpPPxQ4YaOyvDvg0LKSQ==
=IqYE
-----END PGP SIGNATURE-----

--agcgp7bgjh2dfoeo--

--===============5970853484838447306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============5970853484838447306==--
