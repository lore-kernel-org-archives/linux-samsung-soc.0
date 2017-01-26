From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 1/8] soc: samsung: pmu: Add dummy support for
 Exynos5433 SoC
Date: Thu, 26 Jan 2017 21:57:06 +0200
Message-ID: <20170126195706.an4ykk3bamvews6d@kozik-lap>
References: <1485419634-28331-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170126083401eucas1p24b0f04c62332e0b6e446ecca83145bc5@eucas1p2.samsung.com>
 <1485419634-28331-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1485419634-28331-2-git-send-email-m.szyprowski@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Lee Jones <lee.jones@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Jan 26, 2017 at 09:33:47AM +0100, Marek Szyprowski wrote:
> Add compatible for Exynos5433 SoC, so the driver will bind and let other
> drivers to use PMU regmap.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/soc/samsung/exynos-pmu.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Thanks, applied.

I already have some PMU patches on separate branch (and tag), so this
lands on top of it.

Best regards,
Krzysztof

