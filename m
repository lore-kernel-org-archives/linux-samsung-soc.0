From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] ASoC: samsung-ac97: Convert to
 devm_ioremap_resource()
Date: Wed, 26 Jun 2013 11:20:41 +0100
Message-ID: <20130626102041.GM27646@sirena.org.uk>
References: <1372239463-14603-1-git-send-email-broonie@linaro.org>
 <1372239463-14603-2-git-send-email-broonie@linaro.org>
 <000901ce7254$05e3fd50$11abf7f0$@samsung.com>
 <2023345.DFmjYSGTDl@amdc1227>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3060466918095831313=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <2023345.DFmjYSGTDl@amdc1227>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: alsa-devel@alsa-project.org, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Sangbeom Kim' <sbkim73@samsung.com>, Jingoo Han <jg1.han@samsung.com>, 'Liam Girdwood' <lgirdwood@gmail.com>, Sachin Kamat <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org, Thierry Reding <thierry.reding@avionic-design.de>
List-Id: linux-samsung-soc@vger.kernel.org


--===============3060466918095831313==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="j8X1oABZtE0u0BVD"
Content-Disposition: inline


--j8X1oABZtE0u0BVD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2013 at 12:10:15PM +0200, Tomasz Figa wrote:

> By the way, Mark, does this driver work for you? I have tried it on both=
=20
> mini6410 and smdk6410 (configured to use the onboard AC97 codec), with bo=
th=20
> old and new DMA drivers and I couldn't get it to play a single sound.

I've no access to any hardware which might use this driver, though IIRC
it didn't work last time I did have such access.

--j8X1oABZtE0u0BVD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRysB1AAoJELSic+t+oim9yYwP/3oVOVl9DK9vcl7PFJtgrIu3
qFCiOVmeSOq30piEQ9vvt+fLT8FjqSPTUhfF1L4VjUtaAcIX8d6e+J56Uc5kZH1T
nWPgq91fy+8bSsgUG9EIHjXHhT3YJhQRHWYDVPP6uA8b/iXwNapvYlol4tK0K2OX
BF9QVd7jDp/2ipgvIFlEFV3Q1EajHhNdl8kEL3cu6aQj39CI2m8LwmeeMYtHiVdE
Gjwz+hb/S6RqDthI2OO66ecjcCXChAIP5JHczKEwJeV19tvpKe7mzkVh2QLu2Q7X
qNfmoRv66+tX1dxnT2bAyKVrlkPgTx9UnU5Yg+OtHIKWpBgInDKTlD2fOeb+6+uN
z5AYZdY/3j60/eN6ePF7abyKQfOaK61nopFCd10o8Xcvai4oN8zmfIYiaVc7QqmA
odiyTtJ5ufmL7buuB/gjKH5dJHrsOI6Vgzte7a6V23j1dIE9UNIaVJ5LN8G6QRDl
eVgSYQwhrKjLaCl4XIMCVWaS79gFkMqVBdFZhhQB1crNvs6ipKPZW/I438ikRn3R
+IzpyVF53K21yUEyQAAVNnEqIiQXqcxmQ4NkaGSh/miK1F4VHguDaZfpklZYRfQM
O1d3PHMXt/olxxTJFndymgqHxpzZRG+u9RoQgOG6bpZtQMAsWI11jlCUwojTdg8t
OEuCaYZ/akjuRgKVYQUf
=tgzj
-----END PGP SIGNATURE-----

--j8X1oABZtE0u0BVD--

--===============3060466918095831313==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============3060466918095831313==--
