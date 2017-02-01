From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 5/8] mfd: exynos-lpass: Remove pad retention control
Date: Wed, 1 Feb 2017 07:24:04 -0600
Message-ID: <20170201132404.wxwcai7qbvcumaic@rob-hp-laptop>
References: <1485419634-28331-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170126083403eucas1p2328ed884334b453ffb1faac3c745cec3@eucas1p2.samsung.com>
 <1485419634-28331-6-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1485419634-28331-6-git-send-email-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Lee Jones <lee.jones@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Jan 26, 2017 at 09:33:51AM +0100, Marek Szyprowski wrote:
> Pad retention should be controlled from pin control driver, so remove it
> from Exynos LPASS driver. After this change, no more access to PMU regmap
> is needed, so remove also the code for handling PMU regmap.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../bindings/mfd/samsung,exynos5433-lpass.txt           |  2 --

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/mfd/exynos-lpass.c                              | 17 -----------------
>  include/linux/mfd/syscon/exynos5-pmu.h                  |  3 ---
>  3 files changed, 22 deletions(-)
