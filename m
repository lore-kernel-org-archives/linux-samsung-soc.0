From: Benson Leung <bleung@google.com>
Subject: Re: [PATCH 2/3] arm/arm64: configs: Remove the MFD_ prefix for
 MFD_CROS_EC_I2C/SPI symbols.
Date: Mon, 2 Jul 2018 16:02:26 -0700
Message-ID: <20180702230226.GA86110@decatoncale.mtv.corp.google.com>
References: <20180702102201.13461-1-enric.balletbo@collabora.com>
 <20180702102201.13461-3-enric.balletbo@collabora.com>
 <CAJKOXPd51yU8-zObXszc4zJpHsGtMNFTsbQsQdKBFg=k22xZLA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJKOXPd51yU8-zObXszc4zJpHsGtMNFTsbQsQdKBFg=k22xZLA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee.jones@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Benson Leung <bleung@chromium.org>, Olof Johansson <olof@lixom.net>, Gwendal Grignou <gwendal@chromium.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org, kernel@collabora.com, Guenter Roeck <groeck@google.com>, linux-arm-kernel@lists.infradead.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Gregory CLEMENT <gregory.clement@bootlin.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Geert Uytterhoeven <geert+renesas@glide>
List-Id: linux-samsung-soc@vger.kernel.org


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Mon, Jul 02, 2018 at 01:05:40PM +0200, Krzysztof Kozlowski wrote:
> On 2 July 2018 at 12:22, Enric Balletbo i Serra
> <enric.balletbo@collabora.com> wrote:
> > The cros-ec I2C and SPI transport drivers have been moved from MFD
> > subsystem to platform/chrome, at the same time, the config symbol has
> > been renamed and lost the MFD_ prefix, so update all configs to the new
> > config symbol name.
> >
> > Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> > ---
> >
> >  arch/arm/configs/exynos_defconfig   | 4 ++--
> >  arch/arm/configs/multi_v7_defconfig | 4 ++--
> >  arch/arm/configs/pxa_defconfig      | 4 ++--
> >  arch/arm64/configs/defconfig        | 4 ++--
> >  4 files changed, 8 insertions(+), 8 deletions(-)
>=20
> Since you put in one patch multiple defconfigs belonging to multiple
> maintainers, I assume you are pushing this through arm-soc or Russell.
> In such case, for Exynos boards:
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
>=20
> Best regards,
> Krzysztof

I was planning on creating an immutable branch for this series and merging =
it
through platform/chrome.

Lee, Russell, Dmitry, what do you think?

Benson

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6gYDF28Li+nEiKLaHwn1ewov5lgFAls6rwEACgkQHwn1ewov
5lhvDg/8Ctet9aT5WelDcq5dXHCWbGiDxsm+8Nl+ZzfjWInJL2HUBWOPSYYHOcKh
tL2EMtraikirjj0oPbOEjaq7EcJNi3MYqj308oNQ6SlJy4X9QxVrFMs7RwuM494r
UlyNBmEKf8kSHUUMX6IWM4LDPjzUlCuqXqFCLCjKlt2NhjBMmf1/nQiyxF5Vt9MM
LwNZTi3+SAHrUeYOM1YUwyEl2ZACC5M8LWr7uLZuPDOBPhTvtQHTbueeOhKFZmo3
lLVXs+7cBN6hJsaL6p7HB4Nuv9wNBZ1hNitE7WUpAoxaSvYFYUE4pz/ZEaZTVcfT
WaqM0Ob+gwluUBlsSdGxF5wPPs7z9OrHnaLEN920tl+JFzOUr45Q+hmbZn+duA98
fAZZIru1eqViveBMEiHPTTokImjirWf5f5bdqHkfjcLJtkOb/ksjyyKqQxAIFtAa
TtuBq6Dl4/p2xkO4OiIO76xyx8S/TRafFNmaBADM7bcPE0JS71RTenrW/iG3IIOr
cKn5gAd9p833BNynFHWGUHTdnAS5oA2wTzQW1VYjytPFCHk9HdPl+XTP9huWcDZ7
IwXwH8+6L9pcfMc363FJUKsSChq5y1/Ap9sWxLlZypwV3GcQKdu9O14H7Uz7B3MN
EeuYo9lti4dxFcbxlJPrw3Q+ZxEvr0eY3uVv7cgdF106RehhuGg=
=xCVU
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
