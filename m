From: Rob Herring <robh+dt@kernel.org>
Subject: Re: Bad MAINTAINERS pattern in section 'SAMSUNG EXYNOS TRUE RANDOM
 NUMBER GENERATOR (TRNG) DRIVER'
Date: Mon, 1 Oct 2018 07:47:12 -0500
Message-ID: <CAL_JsqLoZfU+DMxHJg7ZqD06dgcsxiDbYYW99x8H4C0sOwdiiw@mail.gmail.com>
References: <CGME20181001080750epcas2p21b4c3e14be32859f31bede0656ffa09d@epcas2p2.samsung.com>
 <20180928220330.31325-1-joe@perches.com> <875zym5bue.fsf%l.stelmach@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <875zym5bue.fsf%l.stelmach@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>
Cc: Joe Perches <joe@perches.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Oct 1, 2018 at 3:07 AM =C5=81ukasz Stelmach <l.stelmach@samsung.com=
> wrote:
>
> It was <2018-09-29 sob 00:03>, when Joe Perches wrote:
> > Please fix this defect appropriately.
> >
> > linux-next MAINTAINERS section:
> >
> >       12851   SAMSUNG EXYNOS TRUE RANDOM NUMBER GENERATOR (TRNG) DRIVER
> >       12852   M:      =C5=81ukasz Stelmach <l.stelmach@samsung.com>
> >       12853   L:      linux-samsung-soc@vger.kernel.org
> >       12854   S:      Maintained
> >       12855   F:      drivers/char/hw_random/exynos-trng.c
> > -->   12856   F:      Documentation/devicetree/bindings/rng/samsung,exy=
nos5250-trng.txt
> >
> > Commit that introduced this:
> >
> > commit 6cd225cc5d8a6526b2bea41955882be55d4f109e
> >  Author: =C5=81ukasz Stelmach <l.stelmach@samsung.com>
> >  Date:   Fri Dec 22 17:48:35 2017 +0100
> >
> >      hwrng: exynos - add Samsung Exynos True RNG driver
> >
> >      Add support for True Random Number Generator found in Samsung Exyn=
os
> >      5250+ SoCs.
> >
> >      Signed-off-by: =C5=81ukasz Stelmach <l.stelmach@samsung.com>
> >      Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> >      Acked-by: Philippe Ombredanne <pombredanne@nexb.com>
> >      Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
> >
> >   MAINTAINERS                          |   7 ++
> >   drivers/char/hw_random/Kconfig       |  12 ++
> >   drivers/char/hw_random/Makefile      |   1 +
> >   drivers/char/hw_random/exynos-trng.c | 237 ++++++++++++++++++++++++++=
+++++++++
> >   4 files changed, 257 insertions(+)
> >
> > No commit with Documentation/devicetree/bindings/rng/samsung,exynos5250=
-trng.txt found
>
> Please merge the version 3[1] of the patch you've acked[2].

Bindings in a series go in with the rest of the series. If you want me
to apply please resend as I don't have year old patches in my inbox.

Rob
