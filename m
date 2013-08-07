From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V3 5/7] ARM: dts: Add osc clock node on smdk5420.
Date: Wed, 07 Aug 2013 17:16:56 +0200
Message-ID: <4360230.6r2xpZjN04@amdc1227>
References: <1375866616-5541-1-git-send-email-padma.v@samsung.com>
 <1375866616-5541-6-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:41185 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750772Ab3HGPRA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Aug 2013 11:17:00 -0400
In-reply-to: <1375866616-5541-6-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, padma.kvr@gmail.com, broonie@kernel.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, abrestic@chromium.org

On Wednesday 07 of August 2013 14:40:14 Padmavathi Venna wrote:
> This patch adds 16MHz oscillator clock node required for audio
> on smdk5420 and adds the phandle of the same in wm8994 clock info.
> 
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420-smdk5420.dts |   10 ++++++++++
>  1 files changed, 10 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts
> b/arch/arm/boot/dts/exynos5420-smdk5420.dts index e86c1ae..3c56a91
> 100644
> --- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
> +++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> @@ -31,6 +31,13 @@
>  		};
>  	};
> 
> +	osc3_clk16mhz: clk16mhz {
> +		compatible = "osc3_clk16mhz";

Hmm?

What about the generic fixed rate clock binding[1]?

Also please name nodes being added with generic names, not platform-
specific ones. For example, fixed-rate-clock-0 or oscillator-0, just like 
it is done with fixed regulators.

Best regards,
Tomasz

[1] - Documentation/devicetree/bindings/clock/fixed-clock.txt

> +		#clock-cells = <0>;
> +		clock-frequency = <16934400>;
> +		clock-output-names = "osc3_clk16mhz";
> +	};
> +
>  	dwmmc0@12200000 {
>  		status = "okay";
>  		num-slots = <1>;
> @@ -123,6 +130,9 @@
>  			DBVDD-supply = <&dbvdd>;
>  			SPKVDD1-supply = <&spkvdd>;
>  			SPKVDD2-supply = <&spkvdd>;
> +
> +			clocks = <&osc3_clk16mhz>;
> +			clock-names = "mclk1";
>  		};
>  	};
