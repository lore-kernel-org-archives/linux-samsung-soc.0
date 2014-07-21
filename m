From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH v2 1/2] clk: samsung: exynos4: Enable ARMCLK down feature
Date: Mon, 21 Jul 2014 13:51:59 +0100
Message-ID: <CAD8Lp45UtZ_aao2ScUUjRq9AfnxGq9GuT24SLzY-koeBfTTDCw@mail.gmail.com>
References: <1405694193-29643-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1405694193-29643-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Tomasz Figa <t.figa@samsung.com>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Jul 18, 2014 at 3:36 PM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:
> Enable ARMCLK down feature on all Exynos4 SoCs. The frequency of
> ARMCLK will be reduced upon entering idle mode (WFI or WFE).
>
> The feature behaves like very fast cpufreq ondemand governor. In idle
> mode this reduces energy consumption on full frequency chosen by
> cpufreq governor by approximately:
>  - Trats2:  6.5% (153 mA -> 143 mA)
>  - Trats:  33.0% (180 mA -> 120 mA)
>  - Gear1:  27.0% (180 mA -> 130 mA)
>
> The patch uses simillar settings as Exynos5250 (clk-exynos5250.c),
> except it disables clock up feature and on Exynos4412 ARMCLK down is
> enabled for all 4 cores.
>
> Tested on Trats board (Exynos4210), Trats2 board (Exynos4412) and
> Samsung Gear 1 (Exynos4212).
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Tested on ODROID-U2, seems to be working. I don't have a way of
measuring the power usage, but the system seems as stable as before.

Tested-by: Daniel Drake <drake@endlessm.com>
