From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH 1/6] spi: spi-s3c64xx: Remove platform dependent code
Date: Mon, 9 Sep 2013 15:38:01 +0100
Message-ID: <20130909143801.GA29403@sirena.org.uk>
References: <1378735766-12330-1-git-send-email-l.czerwinski@samsung.com>
 <1378735766-12330-2-git-send-email-l.czerwinski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RQRqO9v0HfCoqppm"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:34813 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752167Ab3IIOiE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Sep 2013 10:38:04 -0400
Content-Disposition: inline
In-Reply-To: <1378735766-12330-2-git-send-email-l.czerwinski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lukasz Czerwinski <l.czerwinski@samsung.com>
Cc: s.nawrocki@samsung.com, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org


--RQRqO9v0HfCoqppm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 09, 2013 at 04:09:21PM +0200, Lukasz Czerwinski wrote:
> Since support for generic DMA engine has beed added, there is no need
> to keep platform specific code (behind the #ifdef CONFIG_S3C_DMA).

This would break s3c64xx at least until Tomasz's dmaengine conversion
for that gets merged (hopefully this time around...).  Given that one=20
of my main development systems is based on s3c64xx I'm even more keen
to keep that working than otherwise.

--RQRqO9v0HfCoqppm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSLd1FAAoJELSic+t+oim9RFAQAJTIBlZriqZzBD/UYYtctaru
CVERQdGGfa0PUIZmvLeVihxxTYlh8zxuHt3+FAarH7BDpNvmDm2MqWCCtyOAllZx
q8iYN6chupM06adoGAoG5GcJuA1S6cci9B2If8yAcP/lgvcTjs8CJJ8CMfKqzubZ
uGiE1V3PUCUKRWjWWCtnum23LmOGEGqxP21JBOThSKcMKzrxgHvSYXy+2B+rQJjF
p7cieSAc5xH+o9OAb/KeyhNxGU/DN/dafl7q20GDdZ9yK1A2YQPrnx1dkQIxfWBu
EIZnSu9HbFSogkiVbIEj6Wt9Z2EsN93kJ6WJtzQnEB48DaCSbmhSdNXI+g9Q+53x
QKtTX1BhYZ/mdB8Tzrnes70bToMzkrez4BOa/M9TVk/zK05HSM70Yr+lnzhhqujF
TTqbOfv+3DQHMfNol4XbPkw0IZyPtKNG5SAswamalO1saX8F+z1Xj/l9Z/3aM9fp
RDuCfd3yM/L9ZzVmfFQfEkMJuwneXqXklkmuaAz8gm7OKZuCwkIotqGeef3N6aLL
8xFD1zWCmPsGsOuN6mKVhYozTl9uv5Mg/CNPVyVkyREZzOreG12fS/PMhMXqNLTP
F5CODUrTaUzxc7dWnjHh8GBIixWHa3LKTW1Dy+5rzBDKhLp+4bMlEqGaLlqeXPzs
B6yrq3Ik2FVwfY4QqTXL
=B+rl
-----END PGP SIGNATURE-----

--RQRqO9v0HfCoqppm--
