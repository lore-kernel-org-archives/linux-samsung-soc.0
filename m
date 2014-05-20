From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: samsung: Allow setting OP_CLK of the IIS Multi
 Audio Interface
Date: Tue, 20 May 2014 11:10:42 +0100
Message-ID: <20140520101042.GK12304@sirena.org.uk>
References: <1400520638-6907-1-git-send-email-s.nawrocki@samsung.com>
 <537AE4C1.7050703@linaro.org>
 <537B1BF0.8060302@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rteiRrka0usJZ0GW"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:34019 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752648AbaETKK6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 May 2014 06:10:58 -0400
Content-Disposition: inline
In-Reply-To: <537B1BF0.8060302@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Tushar Behera <tushar.behera@linaro.org>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--rteiRrka0usJZ0GW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2014 at 11:10:08AM +0200, Sylwester Nawrocki wrote:

> So how do you think this should be addressed ? Isn't it better to give
> options to the machine drivers to alter these clock settings, rather than
> hard coding it in the I2S driver ? Let's not forget it covers multiple=20
> Samsung SoC series.

Yes, it's better to make it controllable - ideally this could be moved
into the clock API but for ASoC level stuff set_sysclk() with a sensible
default is how it's supposed to be done.

--rteiRrka0usJZ0GW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTeyofAAoJELSic+t+oim9Y1sQAIPtTQ2xFjBWjPUyGwfZeBzk
lPHBq+UFajwqvjXWlY1WxyBVOkY8upMnsYzA+ELBvmDK30cj/VV0HplQl1q1zMxT
lO+IsBfLaoHuPsWC7Yd9yCJqShKGXQtOzQ5oc7E1bNbs4RoOoWaK3DNPESExNsSE
FGz6Fr21QFTBnaQFr2rlWXcPqRq3YH7g71Vi9i03MQX+SKEHVLvDB+8SEjUlWL//
ABIZlbrIhK0Sqfn3Qv5zVXXN0j5zAv/Lvh20HlRNq6STyRnsrdRN2LbWCWyOvkUL
hOlV/Ouyoo9xEGeqXXOaDU5BT0RlTShkXFF7Se57oyLnnuzFCxVdLdL1wacLR4EV
/3yWUu0KHlcQRhDEgCvSBQcPZlvQYoR32t4+9v8T9xubvFy7WdEALaeVW5Buzpvk
a+6W+NRuwgnkT5Z+MDGO3frvlpLXzdi2pWtHLcC1y3G5XLNiYf637jf8EcQzWRsF
ThhQ+WoQYVqBjEZ9E6xtUkewdfm6C4HWd1bS4Cm/d7U1BwUDG7ke5yERTeBMbtFL
qVc18UbQwPWwkChDTYC0hiyL5pqAksvwAfXbYUKGiF+gD/cucyQLcevj3X1gF3ls
bkfN5JIOQshlgL338/W6tB0RkoeLtCqm2+MIi8U396fdHSZ9hn56gWg8fEVVq1GU
lXFesr930l/lWl3RmGa8
=/psr
-----END PGP SIGNATURE-----

--rteiRrka0usJZ0GW--
