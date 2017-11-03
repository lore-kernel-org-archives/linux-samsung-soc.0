From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH v8 0/2] crypto: s5p-sss: Add HASH support for Exynos
Date: Fri, 3 Nov 2017 22:28:00 +0800
Message-ID: <20171103142800.GR9011@gondor.apana.org.au>
References: <CGME20171025152754eucas1p2854a8c48544949585dcbfdd0286ad499@eucas1p2.samsung.com>
 <20171025152735.11382-1-k.konieczny@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from orcrist.hmeau.com ([104.223.48.154]:38356 "EHLO
        deadmen.hmeau.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752252AbdKCO2e (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Nov 2017 10:28:34 -0400
Content-Disposition: inline
In-Reply-To: <20171025152735.11382-1-k.konieczny@partner.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kamil Konieczny <k.konieczny@partner.samsung.com>
Cc: linux-crypto@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, "David S. Miller" <davem@davemloft.net>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Oct 25, 2017 at 05:27:33PM +0200, Kamil Konieczny wrote:
> First patch change spaces to tabs, second adds HASH support for Exynos.
> Changes:
> 
> version 8:
> - fixes suggested by Vladimir Zapolskiy: drop first condition check in 
>   s5p_hash_import, delete unused include delay.h, fix typo in commit
>   message, fix descriptions of struct s5p_hash_reqctx and function
>   s5p_hash_final()

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
