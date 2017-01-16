From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 2/4] clk: samsung: Remove Exynos4415 driver (SoC not
 supported anymore)
Date: Mon, 16 Jan 2017 12:55:50 +0900
Message-ID: <587C4446.5040802@samsung.com>
References: <20170114123642.15581-1-krzk@kernel.org>
 <CGME20170114123726epcas1p3fd30d91d4101297a65acf45f76f85790@epcas1p3.samsung.com>
 <20170114123642.15581-3-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20170114123642.15581-3-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-gpio@vg
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On 2017년 01월 14일 21:36, Krzysztof Kozlowski wrote:
> Support for Exynos4415 is going away because there are no internal nor
> external users.
> 
> Since commit 46dcf0ff0de3 ("ARM: dts: exynos: Remove exynos4415.dtsi"),
> the platform cannot be instantiated so remove also the drivers.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../devicetree/bindings/clock/exynos4415-clock.txt |   38 -
>  drivers/clk/samsung/Makefile                       |    1 -
>  drivers/clk/samsung/clk-exynos4415.c               | 1022 --------------------
>  include/dt-bindings/clock/exynos4415.h             |  360 -------
>  4 files changed, 1421 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/exynos4415-clock.txt
>  delete mode 100644 drivers/clk/samsung/clk-exynos4415.c
>  delete mode 100644 include/dt-bindings/clock/exynos4415.h

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

[snip]

-- 
Best Regards,
Chanwoo Choi
S/W Center, Samsung Electronics
