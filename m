From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 1/4] crypto: exynos - Support Exynos5250+ SoCs
Date: Wed, 13 Dec 2017 09:06:37 +0100
Message-ID: <CAJKOXPetPjgZ=AZk38gAYmZHWiTyNQk6wX8vn-tRH3RS1SurXw@mail.gmail.com>
References: <CGME20171212163610eucas1p2c42f1448547bb4914fd7c1b79fc2e892@eucas1p2.samsung.com>
 <20171212163607.2985-1-l.stelmach@samsung.com> <20171212163607.2985-2-l.stelmach@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-crypto-owner@vger.kernel.org>
In-Reply-To: <20171212163607.2985-2-l.stelmach@samsung.com>
Sender: linux-crypto-owner@vger.kernel.org
To: =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>
Cc: robh+dt@kernel.org, Stephan Mueller <smueller@chronox.de>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, Kukjin Kim <kgene@kernel.org>, linux-crypto@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Dec 12, 2017 at 5:36 PM, Łukasz Stelmach <l.stelmach@samsung.com> wrote:
> Add support for PRNG in Exynos5250+ SoCs.
>
> Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
> ---
>  .../bindings/crypto/samsung,exynos-rng4.txt        |  4 +++-
>  drivers/crypto/exynos-rng.c                        | 27 ++++++++++++++++++++--
>  2 files changed, 28 insertions(+), 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
