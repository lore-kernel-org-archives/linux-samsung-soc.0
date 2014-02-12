From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 14/28] Remove MACH_SMDKC210
Date: Wed, 12 Feb 2014 16:04:31 +0000
Message-ID: <20140212160431.GB28112@sirena.org.uk>
References: <1391971686-9517-1-git-send-email-richard@nod.at>
 <1391971686-9517-15-git-send-email-richard@nod.at>
 <20140210114154.GQ1757@sirena.org.uk>
 <1392039072.3585.15.camel@x220>
 <20140210141255.GI1757@sirena.org.uk>
 <1392046242.3585.41.camel@x220>
 <20140210163621.GA13533@sirena.org.uk>
 <1392070159.27939.34.camel@x220>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6498213489241291189=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1392070159.27939.34.camel@x220>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, linux-kernel@vger.kernel.org, Sangbeom Kim <sbkim73@samsung.com>, Richard Weinberger <richard@nod.at>, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.de>, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org


--===============6498213489241291189==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2fowzm2eVyDiEwGH"
Content-Disposition: inline


--2fowzm2eVyDiEwGH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 10, 2014 at 11:09:19PM +0100, Paul Bolle wrote:

> See, if you scan v3.10:arch/arm/mach-exynos/mach-smdkv310.c you'll
> notice the string "smdk-audio". If you grep that string you get a few
> hits. But none in v3.10:sound/soc/samsung/smdk_wm9713.c. And if you scan
> v3.10:sound/soc/samsung/smdk_wm9713.c for strings you'll find stuff like
> "wm9713-hifi",  "wm9713-codec", and "soc-audio". But these don't show up
> in v3.10:arch/arm/mach-exynos/mach-smdkv310.c. So it's not obvious how
> these two files relate.

> And I'm left wondering why SND_SOC_SAMSUNG_SMDK_WM9713 actually depends
> on (among other symbols) MACH_SMDKV310 and MACH_SMDKC210 in v3.10.

The hardware is physically present on those boards but must be selected
with DIP switches, the device registration needs to be changed in the
kernel when that happens (as the DT must be when it is in use).

--2fowzm2eVyDiEwGH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJS+5uLAAoJELSic+t+oim9VugP/iZEteXqtzJ2i8/iw0CbFE2y
uvRWMNC3L+ewPETDiU+wtsq4MNUQsY25PK0u3FV2Wmqwt742P6AbX3jJ/zeV/knc
3pMhlRBPYP9/1scM2OBzw/4bkH4xPzgBJgXUQEyxeauj9cROSpg5pdGzWu5OSRyD
fMmj9tmLDkf30p9IP2s6xNorGhTDc+kXKlW6cU8+93bZyc9ZNG8kZjqRFIX03o36
SUm9seByWb7l0BQVoP56qAsu+j8yTKpNoqWP6QkYrjtiGHq5v9bX5+ZCoKS2Wlct
LmqK9x+cui4mfxxlz+d9zbHnQWc6FPIa3fZePqUp05r9BlN9EjqYD88touJiknbj
4rinWep1dTdqXoGm1rQ8T7PeqhHkyavzfsEVkc6M4g4hLYHP569m9fDtiLmwFGeV
rP0BguG5qVQ8uCWjPgOj5MMY7pp0/kaqrjGK+/81lyd3Gv/aSmIO/+4t+a4tf60s
Bqo6gDBY5eWZmNbNrMxhj4SZ0V6QOWI+kzMOdzqfzA+KFr8zwM+DJCWfSTOp+CWU
6n21C3EiSsLp/lHl2e86cUlVjfeBGjkzssoLqvjl/bc/TBZ5Xh/g4O1wrdwtSdgB
YB44X2Vc1Gz+wfZHxQ/rr3QSErHWJkIgXd0q2CsdcCFmOW9sTdhVkwsRPzikOKp+
49AGYVATCmQXu8nB0fB9
=kl1Y
-----END PGP SIGNATURE-----

--2fowzm2eVyDiEwGH--

--===============6498213489241291189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============6498213489241291189==--
