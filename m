From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 0/7] clk: samsung: fix PLL rates
Date: Thu, 15 Feb 2018 16:55:55 +0900
Message-ID: <CA+Ln22HZKKJ4+Jz_qZGMpazr25NPawkYCsM-SyNc4NXkS6HeNg@mail.gmail.com>
References: <CGME20180213134056eucas1p270dae5e31eeb96f5c317fe512d761ddd@eucas1p2.samsung.com>
 <20180213134032.30235-1-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-io0-f172.google.com ([209.85.223.172]:33451 "EHLO
        mail-io0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754824AbeBOHz5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 15 Feb 2018 02:55:57 -0500
In-Reply-To: <20180213134032.30235-1-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, "moderated list:SAMSUNG SOC CLOCK DRIVERS" <linux-samsung-soc@vger.kernel.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>

Hi Andrzej,

2018-02-13 22:40 GMT+09:00 Andrzej Hajda <a.hajda@samsung.com>:
> Hi,
>
> This patchset fixes PLL clock rates in all Samsung PLLs, moreover it adds
> compile time validators to avoid such mistakes in the future.
> The patchset has been compile tested for all variants, and runtime tested on
> TM2 and Odroid XU3.
>
> Regards
> Andrzej
>
>
> Andrzej Hajda (7):
>   clk: samsung: exynos3250: fix PLL rates
>   clk: samsung: exynos5250: fix PLL rates
>   clk: samsung: exynos5260: fix PLL rates
>   clk: samsung: exynos5433: fix PLL rates
>   clk: samsung: exynos7: fix PLL rates
>   clk: samsung: s3c2410: fix PLL rates
>   clk: samsung: add compile time PLL rate validators

Thanks for the series. I really like the idea.

Acked-by: Tomasz Figa <tomasz.figa@gmail.com>

(with v2 of patch 7/7)

Best regards,
Tomasz
