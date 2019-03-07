From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] crypto: s5p-sss - fix AES support for Exynos5433
Date: Thu, 7 Mar 2019 16:25:50 +0800
Message-ID: <20190307082550.4ijrmlrupyvwdyl5@gondor.apana.org.au>
References: <CGME20190301140321eucas1p2bf17a6e35d29e8d5f582a2d99fbf4c83@eucas1p2.samsung.com>
 <20190301140254.19341-1-k.konieczny@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190301140254.19341-1-k.konieczny@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kamil Konieczny <k.konieczny@partner.samsung.com>
Cc: "David S. Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzk@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-crypto@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Mar 01, 2019 at 03:02:54PM +0100, Kamil Konieczny wrote:
> Commit 0918f18c7179 ("crypto: s5p - add AES support for Exynos5433")
> introduced bug in dereferencing clk_names[1] on platforms different from
> Exynos5433. On Exynos board XU3 call trace is:
> 
> "Unable to handle kernel paging request at virtual address 00004000"
> (strcmp) from [<c0774014>] (of_property_match_string+0x58/0xd0)
> ...
> (devm_clk_get) from [<c075c248>] (s5p_aes_probe+0xd4/0x4a0)
> (s5p_aes_probe) from [<c059dbc4>] (platform_drv_probe+0x6c/0xa4)
> 
> Fix this by setting array clk_names size to 2.
> 
> Fixes: 0918f18c7179 ("crypto: s5p - add AES support for Exynos5433")
> Reported-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> ---
>  drivers/crypto/s5p-sss.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
