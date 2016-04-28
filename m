From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] crypto: s5p-sss: fix incorrect usage of scatterlists api
Date: Thu, 28 Apr 2016 09:21:43 +0800
Message-ID: <20160428012143.GB5940@gondor.apana.org.au>
References: <1461655766-27346-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from helcar.hengli.com.au ([209.40.204.226]:43845 "EHLO
	helcar.hengli.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751267AbcD1BVw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Apr 2016 21:21:52 -0400
Content-Disposition: inline
In-Reply-To: <1461655766-27346-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-crypto@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "David S. Miller" <davem@davemloft.net>, Vladimir Zapolskiy <vz@mleia.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, stable@vger.kernel.org

On Tue, Apr 26, 2016 at 09:29:26AM +0200, Marek Szyprowski wrote:
> sg_dma_len() macro can be used only on scattelists which are mapped, so
> all calls to it before dma_map_sg() are invalid. Replace them by proper
> check for direct sg segment length read.
> 
> Fixes: a49e490c7a8a ("crypto: s5p-sss - add S5PV210 advanced crypto engine support")
> Fixes: 9e4a1100a445 ("crypto: s5p-sss - Handle unaligned buffers")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Applied.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
