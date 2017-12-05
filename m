From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] crypto: exynos - Icrease the priority of the driver
Date: Tue, 5 Dec 2017 18:55:20 +0100
Message-ID: <20171205175520.2tl4sgy33sk72nw7@kozik-lap>
References: <CGME20171205162048eucas1p241590a1f62f8c49af8a7fb9282daed80@eucas1p2.samsung.com>
 <20171205162046.11621-1-l.stelmach@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:37685 "EHLO
        mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752500AbdLERzY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 5 Dec 2017 12:55:24 -0500
Content-Disposition: inline
In-Reply-To: <20171205162046.11621-1-l.stelmach@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>
Cc: robh+dt@kernel.org, Stephan Mueller <smueller@chronox.de>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Kukjin Kim <kgene@kernel.org>, linux-crypto@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, m.szyprowski@samsung.com, b.zolnierkie@samsung.com

On Tue, Dec 05, 2017 at 05:20:46PM +0100, Łukasz Stelmach wrote:
> exynos-rng is one of many implementations of stdrng. With priority as
> low as 100 it isn't selected, if software implementations (DRBG) are
> available. The value 300 was selected to give the PRNG priority before
> software implementations, but allow them to be selected in FIPS-mode
> (fips=1 in the kernel command line).

Typo in subject ("Increase").

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
