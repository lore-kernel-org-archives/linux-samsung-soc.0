From: Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH v2 3/3] crypto: s5p-sss - Sort the headers to improve
 readability
Date: Tue, 15 Mar 2016 00:36:03 +0200
Message-ID: <56E73CD3.4020305@mleia.com>
References: <1457573507-1687-1-git-send-email-k.kozlowski@samsung.com>
 <1457573507-1687-3-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-crypto-owner@vger.kernel.org>
In-Reply-To: <1457573507-1687-3-git-send-email-k.kozlowski@samsung.com>
Sender: linux-crypto-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 10.03.2016 03:31, Krzysztof Kozlowski wrote:
> Sort the headers alphabetically to improve readability and to spot
> duplications easier.
> 
> Suggested-by: Vladimir Zapolskiy <vz@mleia.com>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 
> ---
> 
> Changes since v1:
> 1. New patch.
> 
> My email differs from one used in previous patches because this time I
> am sending this from work.
> ---
>  drivers/crypto/s5p-sss.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/crypto/s5p-sss.c b/drivers/crypto/s5p-sss.c
> index bac1f4593f98..46fbeb933939 100644
> --- a/drivers/crypto/s5p-sss.c
> +++ b/drivers/crypto/s5p-sss.c
> @@ -11,23 +11,23 @@
>   *
>   */
>  
> +#include <linux/clk.h>
> +#include <linux/crypto.h>
> +#include <linux/dma-mapping.h>
>  #include <linux/err.h>
> -#include <linux/module.h>
> -#include <linux/init.h>
>  #include <linux/errno.h>
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
>  #include <linux/kernel.h>
> -#include <linux/clk.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/scatterlist.h>
> -#include <linux/dma-mapping.h>
> -#include <linux/io.h>
> -#include <linux/of.h>
> -#include <linux/crypto.h>
> -#include <linux/interrupt.h>
>  
> -#include <crypto/algapi.h>
> -#include <crypto/aes.h>
>  #include <crypto/ctr.h>
> +#include <crypto/aes.h>
> +#include <crypto/algapi.h>
>  #include <crypto/scatterwalk.h>
>  
>  #define _SBF(s, v)                      ((v) << (s))
> 

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

--
With best wishes,
Vladimir
