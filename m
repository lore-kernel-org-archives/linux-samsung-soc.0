From: Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH 2/2] crypto: s5p-sss: Add HASH support for Exynos
Date: Wed, 25 Oct 2017 18:09:08 +0300
Message-ID: <82a1fda5-d60b-2b79-033b-c9c1055aee4b@mleia.com>
References: <20171025145746.9712-1-k.konieczny@partner.samsung.com>
 <CGME20171025145805eucas1p13412c8e28388c2323ccc3d104ccbfc64@eucas1p1.samsung.com>
 <20171025145746.9712-3-k.konieczny@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mleia.com ([178.79.152.223]:44532 "EHLO mail.mleia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750891AbdJYPJL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Oct 2017 11:09:11 -0400
In-Reply-To: <20171025145746.9712-3-k.konieczny@partner.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kamil Konieczny <k.konieczny@partner.samsung.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Kamil,

thank you for updates, everything looks good from my point of view.

On 10/25/2017 05:57 PM, Kamil Konieczny wrote:
> Add support for MD5, SHA1, SHA256 hash algorithms for Exynos HW.
> It uses the crypto framework asynchronous hash api.
> It is based on omap-sham.c driver.
> S5P has some HW differencies and is not implemented.
> 
> Modifications in s5p-sss:
> 
> - Add hash supporting structures and functions.
> 
> - Modify irq handler to handle both aes and hash signals.
> 
> - Resize resource end in probe if EXYNOS_HASH is enabled in
>   Kconfig.
> 
> - Add new copyright line and new author.
> 
> - Tested on Odroid-U3 with Exynos 4412 CPU, kernel 4.13-rc6
>   with crypto run-time self test testmgr
>   and with tcrypt module with: modprobe tcrypt sec=1 mode=N
>   where N=402, 403, 404 (MD5, SHA1, SHA256).
> 
> Modifications in drivers/crypto/Kconfig:
> 
> - Add new CRYPTO_DEV_EXYNOS_HASH, depend on !EXYNOS_RNG
>   and CRYPTO_DEV_S5P
> 
> - Select sw algorithms MD5, SHA1 and SHA256 in EXYNOS_HASH
>   as they are needed for fallback.
> 
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> ---

I won't linger this time :)

Please feel free to add 

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

--
With best wishes,
Vladimir
