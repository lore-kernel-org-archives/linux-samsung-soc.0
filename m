From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RFC 3/6] ASoC: max98504: Add max98504 speaker amplifier
 driver
Date: Wed, 15 Jun 2016 10:25:27 +0100
Message-ID: <20160615092527.GU2282@sirena.org.uk>
References: <1465815160-28504-1-git-send-email-s.nawrocki@samsung.com>
 <1465815160-28504-4-git-send-email-s.nawrocki@samsung.com>
 <20160613151429.GI2282@sirena.org.uk>
 <57601A1F.5030906@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YSDgblk1kzV93dSz"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:39102 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751889AbcFOJZt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Jun 2016 05:25:49 -0400
Content-Disposition: inline
In-Reply-To: <57601A1F.5030906@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, robh@kernel.org, linux-samsung-soc@vger.kernel.org, ideal.song@samsung.com, beomho.seo@samsung.com, inki.dae@samsung.com, k.kozlowski@samsung.com, b.zolnierkie@samsung.com


--YSDgblk1kzV93dSz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 14, 2016 at 04:52:15PM +0200, Sylwester Nawrocki wrote:
> On 06/13/2016 05:14 PM, Mark Brown wrote:

> > Removed the regulator handling code?  Why?

> Because it was effectively a dead code (disabled by a DT flag property)
> and didn't make any sense on our test board. It was setting regulator's
> load and voltage on a shared fixed voltage regulator. Even if calls like
> regulator_set_optimum_mode() were added that wouldn't make any difference,
> since the corresponding PMIC driver ops were not implemented.
> I started more or less with something like this [1].

The mode and voltage setting code there are just obviously broken but
having the get and enable is useful, even if it doesn't do anything on
your board it's nice to have them there already to avoid any transition
issues adding them later and help get more complete and accurate DTs in
=66rom the get go.

--YSDgblk1kzV93dSz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXYR8CAAoJECTWi3JdVIfQmcoH/3YTqRsICteSut7PYwP+DhAA
THwqBbWe+CRRW4Ikn1SlrYvw9DDGJgZNJ1MBHIaiLVBP2TqCeFqRydJv9iwtjYpt
Y0KBKOSVHO3hXiSmgo6lWuhlAKugY5ho8tLOCaHRmccq//Ty9ppdfcU6cFDJ21B6
yi2p67KROT7YufcJlVX1cJjiNfv65QgaK5xgauGdwJ6dh8eCv/eGvc55UAvPjVrm
7DqnFyySPDHQsFxKdzLMlyiU7UoY0oyITMHegb/J0Mxu7fI1Q3AvkkpFlQ/fSWS1
PpcmnsPzYgL+FhlXT2H85NG7g79Q/4J8nAU4FTH/vcyJrsxmGYKPpTOMDAIWgOA=
=48VA
-----END PGP SIGNATURE-----

--YSDgblk1kzV93dSz--
