From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 3/3] crypto: s5p: add AES support for Exynos5433
Date: Thu, 24 Jan 2019 11:03:19 +0100
Message-ID: <CAJKOXPes9CmAX4ZE+2jwGdid2b9na_yqpauvgYZEFq17wk7Cnw@mail.gmail.com>
References: <CGME20190123165551eucas1p1cd99462e3767dbb4feb88b996225ed21@eucas1p1.samsung.com>
 <20190123165533.29645-1-k.konieczny@partner.samsung.com> <20190123165533.29645-4-k.konieczny@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190123165533.29645-4-k.konieczny@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kamil Konieczny <k.konieczny@partner.samsung.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, 23 Jan 2019 at 17:55, Kamil Konieczny
<k.konieczny@partner.samsung.com> wrote:
>
> Add AES crypto HW acceleration for Exynos5433, with the help of SlimSSS IP.
>
> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> ---
>  drivers/crypto/s5p-sss.c | 50 ++++++++++++++++++++++++++++++++++++----
>  1 file changed, 46 insertions(+), 4 deletions(-)
>

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
