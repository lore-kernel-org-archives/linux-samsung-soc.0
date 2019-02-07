From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: samsung: Prevent clk_get_rate()
 calls in atomic context
Date: Thu, 7 Feb 2019 14:32:14 +0000
Message-ID: <20190207143214.GC6190@sirena.org.uk>
References: <CGME20190207142052epcas1p22f1dc03c371674434ff40150cf376b6a@epcas1p2.samsung.com>
 <20190207142041.19394-1-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5905087365857886784=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20190207142041.19394-1-s.nawrocki@samsung.com>
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
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, sbkim73@samsung.com, lgirdwood@gmail.com, krzk@kernel.org, linux-kernel@vger.kernel.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org


--===============5905087365857886784==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GZVR6ND4mMseVXL/"
Content-Disposition: inline


--GZVR6ND4mMseVXL/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 07, 2019 at 03:20:41PM +0100, Sylwester Nawrocki wrote:

> [   82.109780] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:908
> [   82.117009] in_atomic(): 1, irqs_disabled(): 128, pid: 1554, name: speaker-test
> [   82.124235] 3 locks held by speaker-test/1554:
> [   82.128653]  #0: cc8c5328 (snd_pcm_link_rwlock){...-}, at: snd_pcm_stream_lock_irq+0x20/0x38

Please think hard before including complete backtraces in upstream
reports, they are very large and contain almost no useful information
relative to their size so often obscure the relevant content in your
message. If part of the backtrace is usefully illustrative then it's
usually better to pull out the relevant sections.

--GZVR6ND4mMseVXL/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlxcQW0ACgkQJNaLcl1U
h9ARiAf/WPaVRLaN6Qvhkmt2ZqSONQrzGcEnijel7RLZtrfYhDNLMdolFs7ICoLp
E9P0Lfknnizbx3iaxkgxBzn6YhdTAophE80N4xr9xvvCxepPWbA/HjFZpRepR2i2
R4k6AfZ1E/5sscLmn1r9TCJaDwRY5H4ERzHyGL78FJngmlrfzCptR6VjTs6Dcv+A
FNUxsYsQOtbe6ZH1G+3K0xxvvEc3phXyCfegkKZwmZ8fR26JVczrQ+k9Rcv/O4eN
eRdZ4cu1N3/eRjWrg5yO/TPfbLzFuc4w6NUhH0Hhb/gOaQvxxQvdkCRt0xcTn0eu
vCCZBNNQYhvJynqU3ZOOo4ySpZjNVg==
=4Q8x
-----END PGP SIGNATURE-----

--GZVR6ND4mMseVXL/--

--===============5905087365857886784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============5905087365857886784==--
