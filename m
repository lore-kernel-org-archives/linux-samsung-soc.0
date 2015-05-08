From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] clk samsung exynos5420 add CLK_RECALC_NEW_RATES flag to
 mout_apll and mout_kpll clock.
Date: Fri, 8 May 2015 09:14:34 +0900
Message-ID: <CAJKOXPcCc8j=i5FPdF62bGKar74+4U=C9BPN9ar2j52Y8dSMwA@mail.gmail.com>
References: <1431020935-5025-1-git-send-email-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431020935-5025-1-git-send-email-linux.amoon@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

2015-05-08 2:48 GMT+09:00 Anand Moon <linux.amoon@gmail.com>:
> Addition of CLK_RECALC_NEW_RATES flag to support Exynos5 cpu clk so that
> correct divider values are re-calculated after both pre/post
> clock notifiers had run for for mout_apll clock and mout_kpll clock.
s/for for/for/

Could you precise in commit message the observational effects
*without* this patch? In other words: what is fixed? The divider will
have incorrect values?

>
> Depend on https://lkml.org/lkml/2015/4/3/388
>
> Tested on OdroidXU3 Board.

Thanks for providing this information. However
1. Patch dependency should not be part of commit message, It simply
won't provide any meaningful information when they are merged.
2. Similarly testing platform also is not always put in commit message.

So just put them after separator (triple-dash).

After fixing the commit message:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
