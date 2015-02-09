From: Mark Brown <broonie@kernel.org>
Subject: Re: [RESEND PATCH V3 14/15] ARM: dts: Switch Odroid X2/U2 to
 simple-audio-card
Date: Mon, 9 Feb 2015 14:18:54 +0800
Message-ID: <20150209061854.GB23228@finisterre.sirena.org.uk>
References: <1422972382-18520-1-git-send-email-s.nawrocki@samsung.com>
 <1422972382-18520-2-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Y7xTucakfITjPcLV"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:57054 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752801AbbBIGTY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Feb 2015 01:19:24 -0500
Content-Disposition: inline
In-Reply-To: <1422972382-18520-2-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: kgene@kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org


--Y7xTucakfITjPcLV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 03, 2015 at 03:06:21PM +0100, Sylwester Nawrocki wrote:
> Now when the CDCLK I2S output clock can be handled through the clock
> API the Odroid X2/U3 can be switched to the simple-audio-card DT binding.

Applied, thanks.

--Y7xTucakfITjPcLV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU2FFNAAoJECTWi3JdVIfQaTUH/imgR/dhlRYyvTqStUlxy24P
qSj+bxcNYilTykbjxZP+jSoeLIsYo/IV8cMLA79ZuxynCAvzJApWeba5Q08rHco7
3r+yG6e0njdJ0ITlniWUAdFGmzHwJAIakUwdPl9sMNt6CWvmg10NIhoRVWo4MUDs
M/VZDttN8C2IP8QusWBnyJkTqzniI2gnuF3e99CqV/5fg9MK0GSv5Y+x6IxsZlod
YYD7K9op7uJhfEUCwXafMxaclXc3TKkgzHzB3PYufQjotpRtYc1MilVLCsAey6GJ
CjEUd2w0G+ZsMmSRGfHoJ3tLVGXduvLf439NxXbvEhDgft75sSWe+LvJzhLZdZE=
=n+09
-----END PGP SIGNATURE-----

--Y7xTucakfITjPcLV--
