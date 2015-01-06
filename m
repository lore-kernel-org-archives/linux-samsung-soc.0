From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 00/16] ASoC: samsung: Add clk provider for I2S
 internal clocks
Date: Tue, 6 Jan 2015 18:17:01 +0000
Message-ID: <20150106181701.GR2634@sirena.org.uk>
References: <1418997336-17777-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SLRDCdsRrCd4mzuj"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:39019 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753294AbbAFSRU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Jan 2015 13:17:20 -0500
Content-Disposition: inline
In-Reply-To: <1418997336-17777-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: kgene@kernel.org, alsa-devel@alsa-project.org, padma.v@samsung.com, drake@endlessm.com, sbkim73@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org


--SLRDCdsRrCd4mzuj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 19, 2014 at 02:55:20PM +0100, Sylwester Nawrocki wrote:
> This series is an attempt to resolve the CDCLK clock gating issue on Odro=
id
> X2/U3 as reported by Daniel Drake [1], by exposing the CDCLK gate clock=
=20
> (and the two other clocks) through clk API.=20

This all looks basically fine apart from the comments I made but since I
couldn't apply patch 2 I've not been able to to test anything.

--SLRDCdsRrCd4mzuj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUrCacAAoJECTWi3JdVIfQz7oH/1JUPrnl+UVUb9sp6lIDGpUg
bAEDZk15SY0m7vuItgfB2OTHTJ7j90ZJARIDvfvGzQouhDuJ4msIFjlAXw2o9Exj
Zb0WLDCV0fPIzXPO6GOc6OkZvvegAbKa6zBE+kT4rhDvL1XHb90r0blrp7Ijaqkf
QOePawNPCQZUMAnW/EjHOpG5eziEHOs8zSJvl1ETTFvmef0ztnI7viudDZxYO546
wqIUKFlNZlTx5LiX/EQRZG8UaeXxUWgZYKawpTOJXfW1vxuUlpFPWLqC6sHBgTa+
Onx8HAMb2YZ7YkvlQXSbf8/CS7bWRaYVkQ5ObUq2RO9VMu/Cg6S45sq3VcbSIxM=
=hNSA
-----END PGP SIGNATURE-----

--SLRDCdsRrCd4mzuj--
