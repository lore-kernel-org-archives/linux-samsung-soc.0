From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 7/7] arm64: dts: exynos: configure TV path clocks for
 Ultra HD modes
Date: Fri, 20 Jan 2017 16:51:38 +0200
Message-ID: <20170120145138.yhjngt2cxbikq32z@kozik-lap>
References: <1484895145-511-1-git-send-email-a.hajda@samsung.com>
 <CGME20170120065232eucas1p170340d5a71e89db7c08d7218adbe4c2c@eucas1p1.samsung.com>
 <1484895145-511-8-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1484895145-511-8-git-send-email-a.hajda@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Jan 20, 2017 at 07:52:25AM +0100, Andrzej Hajda wrote:
> Ultra HD modes requires clock ticking at increased rate.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> index f120d99..314d928 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -764,6 +764,9 @@
>  			clock-names = "pclk", "aclk_decon", "aclk_smmu_decon0x",
>  				      "aclk_xiu_decon0x", "pclk_smmu_decon0x",
>  				      "sclk_decon_vclk", "sclk_decon_eclk";
> +			assigned-clocks = <&cmu_mif CLK_MOUT_SCLK_DECON_TV_ECLK_A>, <&cmu_mif CLK_DIV_SCLK_DECON_TV_ECLK>, <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK_USER>, <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK>;
> +			assigned-clock-parents = <&cmu_mif CLK_MOUT_BUS_PLL_DIV2>, <0>, <&cmu_mif CLK_SCLK_DECON_TV_ECLK_DISP>, <&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK_USER>;
> +			assigned-clock-rates = <0>, <400000000>;

Lines got too long, please split them.

Best regards,
Krzysztof

>  			samsung,disp-sysreg = <&syscon_disp>;
>  			interrupt-names = "fifo", "vsync", "lcd_sys";
>  			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
> -- 
> 2.7.4
> 
