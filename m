From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 01/16] ASoC: samsung: i2s: Remove unused gpios field
 from struct i2s
Date: Tue, 6 Jan 2015 18:13:39 +0000
Message-ID: <20150106181339.GO2634@sirena.org.uk>
References: <1418997336-17777-1-git-send-email-s.nawrocki@samsung.com>
 <1418997336-17777-2-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YgZDKPIOvldTssBR"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:38991 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932434AbbAFSNs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Jan 2015 13:13:48 -0500
Content-Disposition: inline
In-Reply-To: <1418997336-17777-2-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: kgene@kernel.org, alsa-devel@alsa-project.org, padma.v@samsung.com, drake@endlessm.com, sbkim73@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org


--YgZDKPIOvldTssBR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 19, 2014 at 02:55:21PM +0100, Sylwester Nawrocki wrote:
> The 'gpios' field in 'struct i2s' is now unused, this change
> seems to be missing in commit 0429ffeff460c4302bd1520e6
> ("ASoC: samsung: Remove obsolete GPIO based DT pinmuxing").

Applied, thanks.

--YgZDKPIOvldTssBR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUrCXSAAoJECTWi3JdVIfQeEIH/A/rCfw+aqTKD++CX/fOv4Mi
RUqAQvLYCY7Rj75+DHoIGOfz2eIzGtJa8VtBpDXOhzWbyp1ibZIlXZxeV8sy05of
hdizgRhqTyH4FnNSbCY/002jnyW4wCokITNfRoWz6Q57UJLWBmMWkyFzcFJvVxwF
jZSrUMxLDnkGXBlqq4KLQmdcBPlt6DYgLq2JxFmH0XZLQwO6fbkpuWRMDqNs4YTz
61WHHkVpeB9a7otBHXZyrlGPbOLhwuaGKti59cwJwhqtxoikb7Zz229mJp04DKsx
9hAlosRa2kcqVrOU+0cBPLTa2F6x/3BSyxiJ7YsAhrDTCOjr/HognOIb5/Czexs=
=RjbT
-----END PGP SIGNATURE-----

--YgZDKPIOvldTssBR--
