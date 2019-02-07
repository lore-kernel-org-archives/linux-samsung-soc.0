From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: samsung: Prevent clk_get_rate()
 calls in atomic context
Date: Thu, 7 Feb 2019 14:54:06 +0000
Message-ID: <20190207145406.GD6190@sirena.org.uk>
References: <CGME20190207142052epcas1p22f1dc03c371674434ff40150cf376b6a@epcas1p2.samsung.com>
 <20190207142041.19394-1-s.nawrocki@samsung.com>
 <20190207143214.GC6190@sirena.org.uk>
 <21b8ccd7-e379-b4aa-3257-c9644ce3664c@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8249281812048385322=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <21b8ccd7-e379-b4aa-3257-c9644ce3664c@samsung.com>
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


--===============8249281812048385322==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F8dlzb82+Fcn6AgP"
Content-Disposition: inline


--F8dlzb82+Fcn6AgP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 07, 2019 at 03:47:14PM +0100, Sylwester Nawrocki wrote:
> On 2/7/19 15:32, Mark Brown wrote:

> > Please think hard before including complete backtraces in upstream
> > reports, they are very large and contain almost no useful information
> > relative to their size so often obscure the relevant content in your
> > message. If part of the backtrace is usefully illustrative then it's
> > usually better to pull out the relevant sections.

> OK, let me trim the backtrace some more and resend.

It's fine, I already applied.

--F8dlzb82+Fcn6AgP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlxcRo0ACgkQJNaLcl1U
h9BwYgf8C1wS4SbsPYJfIJffKguSMIG2PsJNdhD6sjPzrZy8INW/8DEB/oJWpFbo
U4YTznjK0tz/aLPGm7XS4qliocS6x1QcK4dq+E1DhtUGg5WUoehyS0pxJJnc6Mn/
lX62rgFrCbHz3g9CGh/IxsNdLtkRTeh2jS64tmK/Mp/gLJ/I1Xv6AtsPtjWnZXIe
6b6Wo047tPUHcOto0Ud4yZcf9rUeVYNDSU8dU1/EJVMQdRc7Qs54OCa0mo4KpTW7
07dmJNqCaj3RBt1T8WBpy2uMfoYkghpow9N6XnnpDMwlovAbS52oxDzlmNALZ9wJ
5+fLAdrwdirSHTp2Sg9+4dnutCl53Q==
=9x5Y
-----END PGP SIGNATURE-----

--F8dlzb82+Fcn6AgP--

--===============8249281812048385322==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============8249281812048385322==--
