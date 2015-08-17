From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 0/4] ARM: dts: exynos3250: Add UART2 and MMC2 dt node with
 related clocks
Date: Mon, 17 Aug 2015 09:33:43 +0900
Message-ID: <CAJKOXPfvGypFymHzXDMEA295Copi0sjpMG9oKmJ+a_BQoK+SNw@mail.gmail.com>
References: <1439264784-30322-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1439264784-30322-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, tomasz.figa@gmail.com, kgene@kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, mturquette@baylibre.com, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

2015-08-11 12:46 GMT+09:00 Chanwoo Choi <cw00.choi@samsung.com>:
> This patch add the UART2 / MMC2 devicetree node for Exynos3250 SoC and add
> the related clocks (mux, divider, gate) of UART2 / MMC2 device.

What is the benefit of adding them? Why they are needed?

Best regards,
Krzysztof


>
> Chanwoo Choi (4):
>   clk: samsung: exynos3250: Add UART2 clock
>   clk: samsung: exynos3250: Add MMC2 clock
>   ARM: dts: Add UART2 dt node for Exynos3250 SoC
>   ARM: dts: Add MSHC2 dt node for Exynos3250 SoC
>
>  arch/arm/boot/dts/exynos3250-pinctrl.dtsi | 42 +++++++++++++++++++++++++++++++
>  arch/arm/boot/dts/exynos3250.dtsi         | 25 ++++++++++++++++++
>  drivers/clk/samsung/clk-exynos3250.c      | 15 +++++++++++
>  include/dt-bindings/clock/exynos3250.h    | 11 +++++++-
>  4 files changed, 92 insertions(+), 1 deletion(-)
>
> --
> 1.8.5.5
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
