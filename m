From: Andi Shyti <andi.shyti@samsung.com>
Subject: Re: [PATCH v5] clk: exynos5433: remove CLK_IGNORE_UNUSED flag from SPI
 clocks
Date: Fri, 08 Jul 2016 23:27:48 +0900
Message-ID: <20160708142748.GL23620@samsunx.samsung>
References: <1467982058-14339-1-git-send-email-andi.shyti@samsung.com>
 <CGME20160708132447epcas1p34cafe41f04b10ffa54bbd66813e656f6@epcas1p3.samsung.com>
 <577FA99C.9020600@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-disposition: inline
In-reply-to: <577FA99C.9020600@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andi Shyti <andi@etezian.org>
List-Id: linux-samsung-soc@vger.kernel.org

> >  drivers/clk/samsung/clk-exynos5433.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> 
> Patch is okay:
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 
> but I think this should not go in separately. This should be part of
> SPI-related changes which add proper ioclk consumer to the SPI driver.
> Without these changes, as you said to me, synchronous abort will happen.

OK, I will send this patch with the SPI patchset.

Please ignore.

Thanks,
Andi
