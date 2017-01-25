From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 4/7] arm64: dts: exynos: Add clocks to Exynos5433 LPASS
 module
Date: Wed, 25 Jan 2017 21:50:22 +0200
Message-ID: <20170125195022.yiqxnfted2vw4owh@kozik-lap>
References: <1485345031-2948-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170125115103eucas1p1d0e446fa6e998da257e3c17922a00d7f@eucas1p1.samsung.com>
 <1485345031-2948-5-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1485345031-2948-5-git-send-email-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Lee Jones <lee.jones@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jan 25, 2017 at 12:50:28PM +0100, Marek Szyprowski wrote:
> Exynos5433 LPASS module requires some clocks for proper operation with
> power domain.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> index 57c7bbeb65a7..16072c1c3ed3 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -1494,6 +1494,8 @@
>  		audio-subsystem@11400000 {
>  			compatible = "samsung,exynos5433-lpass";
>  			reg = <0x11400000 0x100>, <0x11500000 0x08>;
> +			clocks = <&cmu_aud CLK_PCLK_SFR0_CTRL>;
> +			clock-names = "sfr0_ctrl";

You wrote that 6/7 depends on this. I prefer not to take DTS changes if
the corresponding user (driver) is still under discussion because the
bindings might change. I'll take it when bindings got acked or accepted.

BTW, the 6/7 is a quite reasonable ABI break, but for the sake of
documentation - why you did not continue with the patch for marking
bidings as experimental/under-development?

Best regards,
Krzysztof

>  			samsung,pmu-syscon = <&pmu_system_controller>;
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> -- 
> 1.9.1
> 
