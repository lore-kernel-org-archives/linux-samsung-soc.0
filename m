From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V3 13/15] ARM: dts: Exynos4 and Odroid X2/U3 sound device
 nodes update
Date: Tue, 3 Feb 2015 13:11:27 +0000
Message-ID: <20150203131127.GM21293@sirena.org.uk>
References: <1421260962-16892-1-git-send-email-s.nawrocki@samsung.com>
 <1421260962-16892-14-git-send-email-s.nawrocki@samsung.com>
 <20150114195452.GM3043@sirena.org.uk>
 <07a501d03f69$aba222b0$02e66810$@kernel.org>
 <54D0AB30.2010504@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MK0knf37bjPWw3rr"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54D0AB30.2010504-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, padma.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, drake-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--MK0knf37bjPWw3rr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 03, 2015 at 12:04:16PM +0100, Sylwester Nawrocki wrote:

> >> Sorry, I should've said - I applied the ASoC patches, not these.

> > Shall I take 13 to 15 DT patches in Samsung tree?

> Patches 13, 14 use macro definitions which are added in patch which is
> already in Mark's sound tree ("ASoC: samsung: i2s: Add clk provider DT
> binding documentation") [1]. We would need to consider that to avoid
> build breaks.

OK, I can apply them if people want but I'd need a resend - I discarded
them since they'd normally go via the arch tree.

--MK0knf37bjPWw3rr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU0Mj+AAoJECTWi3JdVIfQJcYH/j7G75SDZ4YqBvg2mg+eUE1i
dC5Sio9hI4pPqv/f5EJNGLVecLd3hd111gbmMz5t9ggAjzWTayUSLMOpkiNH/ld4
C6gncG6apYtfTi4hYGnEUx1DlokxIHxQ1obABiClzJrPpLjK0Gqhr8YfGTDlYhud
nqJiY8gH81YJPkGQoACjYxnB+kUSiDvzQ9Q3YHMXBTZR8UgMF71gff3Sv2o33HEx
TcEhA9BoBTbgodFamepBpN4Qan6CvwOU7ZEPoHMFa5HK5T639qKgROFm35J+xTSv
v4a4L9A3ekK4ZRYb2QUR0NINgVV3bEhiz5rPNVhuMmpQa2Vk8LwD9WlEdHO1ULY=
=gr3c
-----END PGP SIGNATURE-----

--MK0knf37bjPWw3rr--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
