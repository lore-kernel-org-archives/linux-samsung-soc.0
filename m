From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: exynos: Fix audio (microphone) routing on
 Odroid XU3
Date: Tue, 19 Mar 2019 21:55:22 +0100
Message-ID: <20190319205522.GD16150@kozik-lap>
References: <CGME20190311155023epcas2p428a025925f6442554b50e14e328a6d04@epcas2p4.samsung.com>
 <20190311155012.15797-1-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190311155012.15797-1-s.nawrocki@samsung.com>
Sender: stable-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: kgene@kernel.org, robh+dt@kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Mar 11, 2019 at 04:50:12PM +0100, Sylwester Nawrocki wrote:
> The name of CODEC input widget to which microphone is connected through
> the "Headphone" jack is "IN12" not "IN1". This fixes microphone support
> on Odroid XU3.
> 
> Cc: <stable@vger.kernel.org> # v4.14+
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

This does not apply on my next/dt nor on v5.1-rc1 branch.  Probably
because of 885b005d232c ("ARM: dts: exynos: Add support for secondary
DAI to Odroid XU3"). Can you rebase?

Best regards,
Krzysztof


> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi
> index e84544b220b9..b90cea8b7368 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi
> @@ -22,7 +22,7 @@
>  			"Headphone Jack", "HPL",
>  			"Headphone Jack", "HPR",
>  			"Headphone Jack", "MICBIAS",
> -			"IN1", "Headphone Jack",
> +			"IN12", "Headphone Jack",
>  			"Speakers", "SPKL",
>  			"Speakers", "SPKR";
>  
> -- 
> 2.17.1
> 
