From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 06/16] ASoC: samsung: i2s: Move clk
 enable to the platform driver probe()
Date: Tue, 6 Jan 2015 18:06:19 +0000
Message-ID: <20150106180619.GN2634@sirena.org.uk>
References: <1418997336-17777-1-git-send-email-s.nawrocki@samsung.com>
 <1418997336-17777-7-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4761836745454779082=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1418997336-17777-7-git-send-email-s.nawrocki@samsung.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, padma.v@samsung.com, sbkim73@samsung.com, drake@endlessm.com, kgene@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org


--===============4761836745454779082==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sA8oU60uXPLxwof5"
Content-Disposition: inline


--sA8oU60uXPLxwof5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 19, 2014 at 02:55:26PM +0100, Sylwester Nawrocki wrote:
> Gating the I2S bus clock in the driver's runtime PM callbacks has
> currently really no effect since the clock is being enabled
> in the DAI's probe() and thus is permanently turned on. Now we just
> move the enable to the platform driver's probe(), which doesn't
> change the situation much. It will allow us to register a clock
> provider already in samsung_i2s_probe() function.

That doesn't sound quite right - the normal idiom for this stuff is to
enable on probe, mark the device as active then if runtime PM is enabled
it can idle the device and turn off the clock.  That way if runtime PM
is disabled things continue to run.  I've not checked to see if this is
actually happening correctly all the way through but that's what's
supposed to happen and means that enabling in the probe should still
result in working clock management.

It will as things currently stand be broken for the dual DAI case so
this is a fix for that (the dual DAI case will double enable if both
links are in use) but the analysis isn't quite correct.

--sA8oU60uXPLxwof5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUrCQaAAoJECTWi3JdVIfQlIUH/RYdJ2VwQHhaRl9ov9rsuiHx
bxF8VH2rHFlfBq4wccmY8OrTmBopXo21gVDgaML23FJkMwsLhuydc+GNL9NfHB7z
PXh0UGWlzJJLVNyzMUmAHj0KmZxQhRxqZzdSs2PwlC54XqsMdBw0Hhp2gO1PRHou
kf16wAe4tKDKXblgDncG4t8vHNYu4ETk7sH/PfyfItihlKek1XllA2l2nCAWZqO8
IuqRx+ZUpZdceOVXrXzo/HHloKQ4dwbyrE2aFm5u4vHroyInV3kR4HZsO7vpVwTV
sMUw720/nApvU1dQp06mztQT0+xtVbF+eqIJWiZDaLBR1pFtSabqH/OSAFm1DDo=
=N9kF
-----END PGP SIGNATURE-----

--sA8oU60uXPLxwof5--

--===============4761836745454779082==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============4761836745454779082==--
