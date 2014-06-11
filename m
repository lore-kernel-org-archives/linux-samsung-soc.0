From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2 v3] spi: s3c64xx: use "cs-gpios" from spi node
 instead of "cs-gpio"
Date: Wed, 11 Jun 2014 19:27:13 +0100
Message-ID: <20140611182713.GM5099@sirena.org.uk>
References: <1402468318-7342-1-git-send-email-ch.naveen@samsung.com>
 <539839D6.1050305@collabora.co.uk>
 <CAHfPSqCYqTRBBH56y81na-t18pvoPmyWobZwXNgkrtq=H_79CQ@mail.gmail.com>
 <5398918F.4060800@collabora.co.uk>
 <539896FB.4050702@gmail.com>
 <CAHfPSqB3V+vBCj03WLkeLQ5e7O4r+pUKQ-yZpK=tdAqVV1GuLw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k9n1VOENd6u0x2wl"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:37411 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753486AbaFKS16 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jun 2014 14:27:58 -0400
Content-Disposition: inline
In-Reply-To: <CAHfPSqB3V+vBCj03WLkeLQ5e7O4r+pUKQ-yZpK=tdAqVV1GuLw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, spi-devel-general@lists.sourceforge.net, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, grant.likely@secretlab.ca, jaswinder.singh@linaro.org, Kukjin Kim <kgene.kim@samsung.com>, cpgs@samsung.com, devicetree@vger.kernel.org, Doug Anderson <dianders@chromium.org>, Tomasz Figa <t.figa@samsung.com>


--k9n1VOENd6u0x2wl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 11, 2014 at 11:53:30PM +0530, Naveen Krishna Ch wrote:
> On 11 June 2014 23:20, Tomasz Figa <tomasz.figa@gmail.com> wrote:

> > - in DT case, don't do anything in the driver about the GPIO chip
> > select, because it will be handled automatically by the core.

> But, i see that gpio_request_one is needed in _setup function in the driver.
> Except that no other gpio related operation is needed in the driver.

Ideally this code could be moved into the core too - indeed, ideally the
non-DT case could be handled by the core too except for the bit where we
look up what GPIO to use.

--k9n1VOENd6u0x2wl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTmJ9+AAoJELSic+t+oim9U9YP/02PvE9yF0YgqaZH3csNWqRe
iNc6tOq5vx2t0O22i1SiV6+M/ww/+zdYnCgqCtw5ZygCUtwmZc7HNB8/dRwx3tMc
rdklA2uzCiZR+ZC9cTG7TnuP9RUceYHNPh+UkaQltvH1LeR3BspcEB9SPmLheWSp
yTl48Nl78itm2Fs/V1Yy4o2iIXclEIB7KxqN9PqPyKYsBZT2c5ArMD9NhaW8pB5a
jz3ALc93c3Llk0DxenthwlTnoB0IeggkGAoC06AGnr356AMD++0uW6jHt9gbruw1
Dm6rO7IIe31OcZXoytPTMbsd4r+qKFE3PvsLGRAs4et8jyolyA+DeFXm1Vk6tr5S
jeB3jnabtKHe0UmcJ5tN1hxmaN+Mxqz2Q8fIJmBl7tUw7tDFWLDgOcQ/y3gtr4kI
MQum8xWMOzAJJIMnTmSYR+RU/CE976ZjWxEQ7WrwNk8LjcVh6bp6F3FoZZkc1rtN
tiXq9qB4jUEzTDY3Y4+izWJTGFiSVwtSqBIq/mnO/zBg77VWxZmznVoSXXon2FTl
pmLblanqutaJ5nBvaSWte6wvGF5L10ebFUy2gSCBIbAhe8rzr6+VrF3Rys8jAxbH
TxoW9YlFvP9nGf0UtBX4UbRPr4Y5C8orZduf5iSa8XiR2WtOnkrx2niWjNrUZ03w
zYdmudrwZVcRW5ANZTAd
=a8bh
-----END PGP SIGNATURE-----

--k9n1VOENd6u0x2wl--
