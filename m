From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH -next 03/12] crypto: exynos - use devm_platform_ioremap_resource()
 to simplify code
Date: Mon, 5 Aug 2019 11:18:17 +0200
Message-ID: <CAJKOXPfvMLehLn+iNOGDEFvsWc93eShUx0=8fn9JWiBOc7wpFw@mail.gmail.com>
References: <20190802132809.8116-1-yuehaibing@huawei.com> <20190802132809.8116-4-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190802132809.8116-4-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: YueHaibing <yuehaibing@huawei.com>
Cc: herbert@gondor.apana.org.au, lars.persson@axis.com, jesper.nilsson@axis.com, davem@davemloft.net, thomas.lendacky@amd.com, gary.hook@amd.com, kgene@kernel.org, antoine.tenart@bootlin.com, matthias.bgg@gmail.com, jamie@jamieiles.com, agross@kernel.org, heiko@sntech.de, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, clabbe.montjoie@gmail.com, mripard@kernel.org, wens@csie.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-crypto@vger.kernel.org, linux-arm-kernel@axis.com, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 2 Aug 2019 at 15:31, YueHaibing <yuehaibing@huawei.com> wrote:
>
> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/crypto/exynos-rng.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
