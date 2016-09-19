From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: samsung: make audio interface/controller explicitly
Date: Mon, 19 Sep 2016 11:23:06 +0100
Message-ID: <20160919102306.GJ10189@sirena.org.uk>
References: <1474207751-9804-1-git-send-email-ayaka@soulik.info>
 <1474207751-9804-2-git-send-email-ayaka@soulik.info>
 <20160919083342.GE10189@sirena.org.uk>
 <1BBB8B7D-0C1B-48E0-A516-402515A04568@soulik.info>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UlxN1C6awaFNesUv"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:57426 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759487AbcISKXr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 19 Sep 2016 06:23:47 -0400
Content-Disposition: inline
In-Reply-To: <1BBB8B7D-0C1B-48E0-A516-402515A04568@soulik.info>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ayaka <ayaka@soulik.info>
Cc: alsa-devel@alsa-project.org, sbkim73@samsung.com, s.nawrocki@samsung.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, krzk@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org


--UlxN1C6awaFNesUv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 19, 2016 at 05:41:50PM +0800, Ayaka wrote:
> =E5=BE=9E=E6=88=91=E7=9A=84 iPad =E5=82=B3=E9=80=81

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

> > Are you *sure* simple-card works for AC'97?

> Not sure. I could hardly find a AC97 device in embedded market. If it
> didn't I could disable it. I have only tested simple sound card for
> i2s and SPDIF.

I would be very surprised if it does and AC'97 is supposed to be
enumerable and not need a card binding anyway so best to remove this one
for the time being.

--UlxN1C6awaFNesUv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJX37yJAAoJECTWi3JdVIfQKCEH/jcdL3TMu28relB+MD7pvak7
c3qkaukosdLSGSZpo1WZQVyiMsqeHrFB9pVT1lYh79jkyZtRNtf5mZFpvl45LNED
hw0oEidEMTVFLP2/9sKBUKRLW05jutaxHGppW+TSzdqCYECkVsTAYwWz4SOceP7x
i4goC7JXGOhJdSR3aaa0E6Re7gtR2taZs5S4hNxCfpP9coXWAC/ES8n2+p5U53jI
R15+O9PgjSbg5BXvt6zkhTkyL5J6+schXoOuy6rZdk7EwvUp79uw6044AZerPtqY
7a+sOCosFNgbgHrZbSN0whK25FS/87ee/WRgNPZMjgatqMkrujQdsOWx9t7ttow=
=rYr5
-----END PGP SIGNATURE-----

--UlxN1C6awaFNesUv--
