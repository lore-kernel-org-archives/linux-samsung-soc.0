From: Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: Re: [PATCH v2 3/3] crypto: s5p: add AES support for Exynos5433
Date: Thu, 24 Jan 2019 14:37:29 +0100
Message-ID: <20190124133729.GB13624@Red>
References: <20190123165533.29645-1-k.konieczny@partner.samsung.com>
 <CGME20190123165551eucas1p1cd99462e3767dbb4feb88b996225ed21@eucas1p1.samsung.com>
 <20190123165533.29645-4-k.konieczny@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190123165533.29645-4-k.konieczny@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kamil Konieczny <k.konieczny@partner.samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jan 23, 2019 at 05:55:33PM +0100, Kamil Konieczny wrote:
> Add AES crypto HW acceleration for Exynos5433, with the help of SlimSSS IP.
> 
> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> ---
>  drivers/crypto/s5p-sss.c | 50 ++++++++++++++++++++++++++++++++++++----
>  1 file changed, 46 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/crypto/s5p-sss.c b/drivers/crypto/s5p-sss.c
> index 0064be0e3941..e2d247f59254 100644
> --- a/drivers/crypto/s5p-sss.c
> +++ b/drivers/crypto/s5p-sss.c
> @@ -232,6 +232,7 @@
>   * struct samsung_aes_variant - platform specific SSS driver data
>   * @aes_offset: AES register offset from SSS module's base.
>   * @hash_offset: HASH register offset from SSS module's base.
> + * @clk_names: names of clocks needed to run SSS IP
>   *
>   * Specifies platform specific configuration of SSS module.
>   * Note: A structure for driver specific platform data is used for future
> @@ -240,6 +241,7 @@
>  struct samsung_aes_variant {
>  	unsigned int			aes_offset;
>  	unsigned int			hash_offset;
> +	char				*clk_names[];

Hello

this could be set as const

Regards
