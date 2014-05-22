From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: samsung: Handle errors when getting the op_clk
 clock
Date: Thu, 22 May 2014 17:57:44 +0100
Message-ID: <20140522165744.GK12304@sirena.org.uk>
References: <1400753452-6943-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u13C/yEOc42HESKG"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:39179 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750913AbaEVQ6A (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 12:58:00 -0400
Content-Disposition: inline
In-Reply-To: <1400753452-6943-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--u13C/yEOc42HESKG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 22, 2014 at 12:10:52PM +0200, Sylwester Nawrocki wrote:
> Ensure i2s->op_clk is not used when clk_get() for this clock fails.
> This prevents working with an incorrectly configured clock in some
> conditions.

Applied, thanks.

--u13C/yEOc42HESKG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTfiyFAAoJELSic+t+oim97nEQAJbA+nP1eer0RBqNFmmwBl2n
PIdLJy2rwvCvzyfjukgqFuzWarEIjdzjUosHFmDOBFochjkW9+C0Zz3DREXzKc62
J+l+85KOCkp4bfu1LoIOJjFL7Wl2I1SBrj39DFbj4uH4bPmB2NXCnyxVZTzIl/+f
D1OYubU/hpPfckwbCwcnYaxvSkOzLu3U2Oo4lpmRjlykrDvzVIv5IuTaQ+oeaugF
paI1wE0VhFAlb0ufHcn+HUwHFAu3Rl5MUrE0/8ebLoOpZSJ7IY4cKfQJD55EgyVI
DDt0r7n6B2VWmx5R8/IhtCKZC7cwHnkmhUm6zHiSng9qq7Mw2sAKpVmhIMX0Z0qK
YBX1Hm1VY2tSilnkvcbZjCRSkrZXq4HiTMLdQyAnc7puYZB4nIcmFhjrLAPT3rCC
jbdFGA/LtEfTS+4zIRIRIEqo4GsN9JyMMbwWpDbzBytyzlS948HAFEbKgfQ4nnmo
hMLA98QWc0OgLUqfF3FDPf5Gexp6ZP43Jq1CH1bq9hwn68fDt5gwCkqqci3B8RLc
kczhzfPMxro2uIQbRHCVhHbLn2fFuNOZuDS+tEUQHo2qBnj984uDGRKivCzvX9/Q
p6E8eXlD7TzeiFO8NJX/+Ow5+o+zcpaye3s4j5S0w096fpyXucZI1k48OH/hpBEB
xZiQd13VXJsYOV2z5SWw
=YNfL
-----END PGP SIGNATURE-----

--u13C/yEOc42HESKG--
