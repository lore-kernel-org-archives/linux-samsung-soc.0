From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RFC 6/6] ASoC: samsung: Add DT bindings documentation for
 TM2 sound subsystem
Date: Wed, 15 Jun 2016 10:47:30 +0100
Message-ID: <20160615094730.GX2282@sirena.org.uk>
References: <1465815160-28504-1-git-send-email-s.nawrocki@samsung.com>
 <1465815160-28504-7-git-send-email-s.nawrocki@samsung.com>
 <20160614233224.GA4477@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NEtstXYywuKat6/o"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:39204 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750882AbcFOJrr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Jun 2016 05:47:47 -0400
Content-Disposition: inline
In-Reply-To: <20160614233224.GA4477@rob-hp-laptop>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, ideal.song@samsung.com, beomho.seo@samsung.com, inki.dae@samsung.com, k.kozlowski@samsung.com, b.zolnierkie@samsung.com


--NEtstXYywuKat6/o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 14, 2016 at 06:32:24PM -0500, Rob Herring wrote:
> On Mon, Jun 13, 2016 at 12:52:40PM +0200, Sylwester Nawrocki wrote:

> > +Samsung Exynos5433 TM2(E) audio complex with WM5110 codec

> > +Required properties:

> > + - compatible : "samsung,tm2-audio"

> SoC specific compatible string please.

No, this isn't a SoC IP - this is a binding for a board called TM2(E)
which has a bunch of chips on it including this.

> > + - samsung,i2s-controller : the phandle of the I2S controller
> > + - samsung,speaker-amplifier : the phandle of the MAX98504 amplifier

> We should have standard properties for these. 2nd ones I've seen today.

No, these aren't fixed roles in a system, you couldn't have standard
handling for them.

--NEtstXYywuKat6/o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXYSQxAAoJECTWi3JdVIfQVxwH/2y1qnvMW30RYprHLpVWteWf
FRl+svFiDf++PWjYhNHNmdCIzJWHvQ54hQUSF6OQD718ii8QNb1JNsEuPtI1s0AM
ua9Zhxr0hAUKkUwQg1l3NZL1kJCBChEWEIDMKY/8OOfBMSnBAlNMv/LSIRtazvYC
Cb7dMWKCUD6KFYPF1DbtWknAWHAaGBKw7hBs9eLF3NF5z0MWVC3u0UQvIRPzCIBs
ZFi1FPD0VfDR1Oyl22QOiloD1GCQ004q3CNsIvXB6tkhY1nSgk14Hywnk/VagHfh
wtk5ud/5la/VvoFe20EtMyUkireYYNhhQop6B5dk+m5p9h4BO6+QtDQzkQiQV/Q=
=6s1h
-----END PGP SIGNATURE-----

--NEtstXYywuKat6/o--
