From: Michael Turquette <mturquette@linaro.org>
Subject: Re: [PATCH] clk: samsung: exynos4: Disable ARMCLK down feature on Exynos4210
 SoC
Date: Sun, 12 Apr 2015 21:02:12 -0700
Message-ID: <20150413040212.19585.31796@quantum>
References: <1430933.sM2tQimLcT@amdc1032>
 <CAJKOXPc_M=rY0aYpE_bhfa6Ku-E09UZ5YXXF3uH9ENTbPJsqMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPc_M=rY0aYpE_bhfa6Ku-E09UZ5YXXF3uH9ENTbPJsqMA@mail.gmail.com>
Sender: stable-owner@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Tomasz Figa <tomasz.figa@gmail.com>, stable@vger.kernel.org, Daniel Drake <drake@endlessm.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Quoting Krzysztof Kozlowski (2015-03-28 09:37:05)
> 2015-03-27 17:27 GMT+01:00 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>:
> > Commit 42773b28e71d ("clk: samsung: exynos4: Enable ARMCLK
> > down feature") enabled ARMCLK down feature on all Exynos4
> > SoCs.  Unfortunately on Exynos4210 SoC ARMCLK down feature
> > causes a lockup when ondemand cpufreq governor is used.
> > Fix it by limiting ARMCLK down feature to Exynos4x12 SoCs.
> >
> > This patch was tested on:
> > - Exynos4210 SoC based Trats board
> > - Exynos4210 SoC based Origen board
> > - Exynos4412 SoC based Trats2 board
> > - Exynos4412 SoC based Odroid-U3 board
> >
> > Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > Cc: Daniel Drake <drake@endlessm.com>
> > Cc: Tomasz Figa <t.figa@samsung.com>
> > Cc: Kukjin Kim <kgene@kernel.org>
> > Fixes: 42773b28e71d ("clk: samsung: exynos4: Enable ARMCLK down feature")
> > Cc: <stable@vger.kernel.org> # v3.17+
> > Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > ---
> >  drivers/clk/samsung/clk-exynos4.c |   11 +++++------
> >  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Applied.

Thanks,
Mike

> 
> Best regards,
> Krzysztof
