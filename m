From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC 12/17] ASoC: samsung: Switch to new clock controller API
Date: Tue, 16 Aug 2016 15:13:45 +0100
Message-ID: <20160816141345.GT9347@sirena.org.uk>
References: <1471354514-24224-1-git-send-email-k.kozlowski@samsung.com>
 <1471354514-24224-13-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rePSHXHJe0GetUdz"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1471354514-24224-13-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, alsa-devel@alsa-project.org, Marek Szyprowski <m.szyprowski@samsung.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Javier Martinez Canillas <javier@osg.samsung.com>, a.hajda@samsung.comB
List-Id: linux-samsung-soc@vger.kernel.org


--rePSHXHJe0GetUdz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 16, 2016 at 03:35:09PM +0200, Krzysztof Kozlowski wrote:
> Allocate a clock controller and use new clk_register_with_ctrl() API.

Acked-by: Mark Brown <broonie@kernel.org>

>  	i2s_unregister_clocks(i2s);
> +	clk_ctrl_unregister(i2s->clk_ctrl);

devm?

--rePSHXHJe0GetUdz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXsx+YAAoJECTWi3JdVIfQtXkH/iuQ4LWIduWwXQhaP0MDv7bv
D4skQGj8vnnKjTNLSjxJaC5ozrwCOStLomdUmHsv9imnx5c5Ynr+ZJJttj2XrWOD
T25EVIJdolAgYIFvi1VqG5P+K38mvpDD1Ku5zMc5LGoQSr7gflSDZujLqR47L/I8
ISCbZ3tR02qdIQTFjSyC1NfRQJk2+p6KWsZVfPw64Gpce3/UrOziZzGAyCm7oDOz
mxEJPuWxoGxOBdvznAx/T5bRgkxu9A8sAjoZ4KylH8xbmB6jPzHqWEsJOHc7Pt5e
ByWqwA5SgiY4on1zD+SQ+VqhqlubXA/csSwVe1NBn50XbpXMiECryyWcH63bijM=
=VovP
-----END PGP SIGNATURE-----

--rePSHXHJe0GetUdz--
