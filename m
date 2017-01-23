From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: exynos: configure TV path clocks for
 Ultra HD modes
Date: Mon, 23 Jan 2017 10:08:32 +0100
Message-ID: <a9812091-2b97-0abf-da74-313ff941bb76@samsung.com>
References: <20170120145138.yhjngt2cxbikq32z@kozik-lap>
 <CGME20170123075623eucas1p19a1edd12eec91abdbbf786b308f65051@eucas1p1.samsung.com>
 <1485158175-22342-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:29439 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751050AbdAWJIh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Jan 2017 04:08:37 -0500
In-reply-to: <1485158175-22342-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

Hi Andrzej,

On 2017-01-23 08:56, Andrzej Hajda wrote:
> Ultra HD modes requires clock ticking at increased rate.
>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>   arch/arm64/boot/dts/exynos/exynos5433.dtsi | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> index f120d99..4d28e93 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi

I think that exynos5433-tm2-common.dtsi is a better place for such 
definitions.
They can be also moved to &cmu_disp node to match convention for the clocks
configuration used on particular board.

> @@ -764,6 +764,17 @@
>   			clock-names = "pclk", "aclk_decon", "aclk_smmu_decon0x",
>   				      "aclk_xiu_decon0x", "pclk_smmu_decon0x",
>   				      "sclk_decon_vclk", "sclk_decon_eclk";
> +			assigned-clocks =
> +				<&cmu_mif CLK_MOUT_SCLK_DECON_TV_ECLK_A>,
> +				<&cmu_mif CLK_DIV_SCLK_DECON_TV_ECLK>,
> +				<&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK_USER>,
> +				<&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK>;
> +			assigned-clock-parents =
> +				<&cmu_mif CLK_MOUT_BUS_PLL_DIV2>,
> +				<0>,
> +				<&cmu_mif CLK_SCLK_DECON_TV_ECLK_DISP>,
> +				<&cmu_disp CLK_MOUT_SCLK_DECON_TV_ECLK_USER>;
> +			assigned-clock-rates = <0>, <400000000>;
>   			samsung,disp-sysreg = <&syscon_disp>;
>   			interrupt-names = "fifo", "vsync", "lcd_sys";
>   			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
