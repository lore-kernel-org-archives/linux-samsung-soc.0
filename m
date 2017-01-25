From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 5/7] mfd: exynos-lpass: Remove pad retention control
Date: Wed, 25 Jan 2017 21:51:41 +0200
Message-ID: <20170125195141.zqz6temoeqkoaqpo@kozik-lap>
References: <1485345031-2948-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170125115104eucas1p219f763cea7fdb2dfea092d1f2a28fc31@eucas1p2.samsung.com>
 <1485345031-2948-6-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1485345031-2948-6-git-send-email-m.szyprowski@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Lee Jones <lee.jones@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jan 25, 2017 at 12:50:29PM +0100, Marek Szyprowski wrote:
> Pad retention should be controlled from pin control driver, so remove it
> from Exynos LPASS driver. After this change, no more access to PMU regmap
> is needed, so remove also the code for handling PMU regmap.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  .../bindings/mfd/samsung,exynos5433-lpass.txt           |  2 --
>  drivers/mfd/exynos-lpass.c                              | 17 -----------------
>  include/linux/mfd/syscon/exynos5-pmu.h                  |  3 ---
>  3 files changed, 22 deletions(-)
> 

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

