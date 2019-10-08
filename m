From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: core: Skip balancing of the enabled
 regulators in regulator_enable()
Date: Tue, 8 Oct 2019 18:17:47 +0100
Message-ID: <20191008171747.GS4382@sirena.co.uk>
References: <20191008101709.13827-1-m.szyprowski@samsung.com>
 <20191008115025.GF4382@sirena.co.uk>
 <0e222fdd-4407-51ea-b75c-a62621cbe622@samsung.com>
 <20191008120611.GG4382@sirena.co.uk>
 <9268b455-ec66-97e1-909d-f964ac31c0ef@samsung.com>
 <20191008124736.GJ4382@sirena.co.uk>
 <86b9b4b5-cca5-9052-7c87-c5679dfffff4@samsung.com>
 <be8d3280-9855-ed18-b2ab-d7fb28d80b82@gmail.com>
 <20191008161535.GN4382@sirena.co.uk>
 <4ad890b7-705e-94f9-2e61-1f3a60984c91@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QRtLtq+kfJNLc57H"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4ad890b7-705e-94f9-2e61-1f3a60984c91@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, Kamil Konieczny <k.konieczny@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--QRtLtq+kfJNLc57H
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 08, 2019 at 08:05:03PM +0300, Dmitry Osipenko wrote:
> 08.10.2019 19:15, Mark Brown =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> > That sounds like it might just postpone the inevitable - if you set the
> > wrong voltage first it might decide to drop down some voltage that
> > wasn't expected.  There's a bit of a bootstrapping issue.  I think it
> > would be safer to just say that anything that is within spec won't get
> > changed any time we balance, we'd only change things if needed to bring
> > them back into spec.

> Yes, the case of changing voltage before regulator is enabled seems
> won't work as expected.

> Maybe it won't hurt to disallow a non always-on regulators to be coupled
> until there will be a real user for that case.

I thought that coupling with the CPU core and main SoC power regulators
was one of the main use cases for this feature?

--QRtLtq+kfJNLc57H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2cxLoACgkQJNaLcl1U
h9DjLgf9Gvem9ox+y3vOfD+4C0f4CIR0bUNT/g2GkBLpFmcExWG9djaEFeIaXmKh
FBRYi092ZOLmSGhxNxpqAG3+FjYmhj8k+9jlUxfJVLKwehNy89kG9tCT7tQzJRLO
35ZV/rK+GIfgyqWq4B64zzkXJRClUxJviej0Gxgp+pFPakvcbk28iTxUeLoGL5lE
fXBh4nSGvvgMyiN72ZJQG43hcWx5X5wBHQEmyIjCFspqI69SQTFmkz52I/C5h0Tk
ABSznYUeftAKn70ca1kHF2XYogz+5HILCc+IkF4V5LaZhzIQgGe4F7QX3WWIvHtn
zPsltgmkpnhWYap9ItVsU0j5xOu9Ww==
=XoKN
-----END PGP SIGNATURE-----

--QRtLtq+kfJNLc57H--
