From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] crypto: s5p-sss - Use AES_BLOCK_SIZE define instead of
 number
Date: Thu, 28 Feb 2019 14:29:32 +0800
Message-ID: <20190228062932.kd7g7pa76umul5rb@gondor.apana.org.au>
References: <1550577663-10251-1-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1550577663-10251-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vladimir Zapolskiy <vz@mleia.com>, Kamil Konieczny <k.konieczny@partner.samsung.com>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Feb 19, 2019 at 01:01:03PM +0100, Krzysztof Kozlowski wrote:
> Replace hard coded AES block size with define.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/crypto/s5p-sss.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
