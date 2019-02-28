From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH v2] crypto: s5p: update iv after AES-CBC op end
Date: Thu, 28 Feb 2019 14:30:16 +0800
Message-ID: <20190228063016.dqhhvpnc6nbhgxlp@gondor.apana.org.au>
References: <CGME20190219160249eucas1p17f521e74a9acab6a330e72a3c682adce@eucas1p1.samsung.com>
 <20190219160232.22084-1-k.konieczny@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190219160232.22084-1-k.konieczny@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kamil Konieczny <k.konieczny@partner.samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, "David S. Miller" <davem@davemloft.net>, Eric Biggers <ebiggers@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-crypto@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Feb 19, 2019 at 05:02:32PM +0100, Kamil Konieczny wrote:
> Fix bug "s5p-sss crypto driver doesn't set next AES-CBC IV". While at this,
> fix also AES-CTR mode. Tested on Odroid U3 with Eric Biggers branch
> "iv-out-testing".
> 
> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> Reported-by: Eric Biggers <ebiggers@kernel.org>
> ---
> Changes since v1:
>  - reworded Subject and commit message
>  - changed code according to comments by Krzysztof Kozlowski
>  - added Reported-by line
> ---
>  drivers/crypto/s5p-sss.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
