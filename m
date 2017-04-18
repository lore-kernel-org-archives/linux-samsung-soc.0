From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/7] regulator: arizona: Prepare for sharing with Madera
 codecs
Date: Tue, 18 Apr 2017 20:49:34 +0100
Message-ID: <20170418194934.kbuckzbdd6pkis25@sirena.org.uk>
References: <1492512234-19210-1-git-send-email-rf@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="flxfu6c3dw2pupvn"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1492512234-19210-1-git-send-email-rf@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
Cc: lee.jones@linaro.org, kgene@kernel.org, krzk@kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--flxfu6c3dw2pupvn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 18, 2017 at 11:43:46AM +0100, Richard Fitzgerald wrote:
> These patches make various changes to the Arizona regulators so that they
> can be re-used for the Cirrus Madera codecs:

This all looks good to me but needs review from Lee for the MFD overlap.

--flxfu6c3dw2pupvn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlj2bc0ACgkQJNaLcl1U
h9DIHgf/eU3P/7fK0mI9OdRSIKXRGtF+mp+CN4LTDiDCKpPGOZgJgapHK4KBpBfO
z4SLXXAE8RR/vRQ7QrIh9mFiX7JjLv+GdfCitInYgE7qrU1+Jo8KYrVqdHkuSJVn
Andlg4MGXrd4cCIXmYRbOzLxYQq3sb5g9p5TC8T5zijZPgC146NCwqn5SP6za2Vb
RvX9Sjkzu/pe4jK/mV8M1IbQFKTIQtujLGkm6Y69Vae1gqwGQLZFO+yoec2v1u9y
5d2CNgDZYmIOTzzT3lr5z997qPJdvKnjfHy4cLGp3MmwYrNArZ4MBvDIzC/DLUFC
c7VyrxnX1L28ZH19ufxv8dBcUEW73w==
=t5qm
-----END PGP SIGNATURE-----

--flxfu6c3dw2pupvn--
