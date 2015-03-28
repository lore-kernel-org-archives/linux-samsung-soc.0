From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] clk: samsung: exynos4: Disable ARMCLK down feature on
 Exynos4210 SoC
Date: Sat, 28 Mar 2015 17:37:05 +0100
Message-ID: <CAJKOXPc_M=rY0aYpE_bhfa6Ku-E09UZ5YXXF3uH9ENTbPJsqMA@mail.gmail.com>
References: <1430933.sM2tQimLcT@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f172.google.com ([209.85.160.172]:36383 "EHLO
	mail-yk0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751066AbbC1QhH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 28 Mar 2015 12:37:07 -0400
In-Reply-To: <1430933.sM2tQimLcT@amdc1032>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Mike Turquette <mturquette@linaro.org>, linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Tomasz Figa <tomasz.figa@gmail.com>, stable@vger.kernel.org, Daniel Drake <drake@endlessm.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org

2015-03-27 17:27 GMT+01:00 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>:
> Commit 42773b28e71d ("clk: samsung: exynos4: Enable ARMCLK
> down feature") enabled ARMCLK down feature on all Exynos4
> SoCs.  Unfortunately on Exynos4210 SoC ARMCLK down feature
> causes a lockup when ondemand cpufreq governor is used.
> Fix it by limiting ARMCLK down feature to Exynos4x12 SoCs.
>
> This patch was tested on:
> - Exynos4210 SoC based Trats board
> - Exynos4210 SoC based Origen board
> - Exynos4412 SoC based Trats2 board
> - Exynos4412 SoC based Odroid-U3 board
>
> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: Daniel Drake <drake@endlessm.com>
> Cc: Tomasz Figa <t.figa@samsung.com>
> Cc: Kukjin Kim <kgene@kernel.org>
> Fixes: 42773b28e71d ("clk: samsung: exynos4: Enable ARMCLK down feature")
> Cc: <stable@vger.kernel.org> # v3.17+
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos4.c |   11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
