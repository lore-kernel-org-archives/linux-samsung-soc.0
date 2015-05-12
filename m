From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH v3] ARM: dts: Add HS400 support for exynos5422-odroidxu3
Date: Wed, 13 May 2015 02:50:35 +0900
Message-ID: <55523D6B.9080605@kernel.org>
References: <5550CA0D.3050003@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:54117 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933091AbbELRun (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 May 2015 13:50:43 -0400
In-Reply-To: <5550CA0D.3050003@fivetechno.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Markus Reichl <m.reichl@fivetechno.de>
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Anand Moon <linux.amoon@gmail.com>, 'Jaehoon Chung' <jh80.chung@samsung.com>

On 05/12/15 00:26, Markus Reichl wrote:
> HS400 timing values are added for exynos5422-odroidxu3 board.
> 
> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
> Acked-by: Jaehoon Chung <jh80.chung@samsung.com>
> Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
> Changes since v2:
> 1. Rebased onto linux-samsung/for-next
> 2. Added Acked-by tag
> Changes since v1:
> 1. Dropped num_slots
> 2. Rebased onto 4.1-rc3
> 3. Added Acked-by tag
> ---
>  arch/arm/boot/dts/exynos5422-odroidxu3.dts | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> index cb649b1..8dd8e8e 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> @@ -312,10 +312,14 @@
>  	samsung,dw-mshc-ciu-div = <3>;
>  	samsung,dw-mshc-sdr-timing = <0 4>;
>  	samsung,dw-mshc-ddr-timing = <0 2>;
> +	samsung,dw-mshc-hs400-timing = <0 2>;
> +	samsung,read-strobe-delay = <90>;
>  	pinctrl-names = "default";
> -	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus1 &sd0_bus4 &sd0_bus8 &sd0_cd>;
> +	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus1 &sd0_bus4 &sd0_bus8 &sd0_cd &sd0_rclk>;
>  	bus-width = <8>;
>  	cap-mmc-highspeed;
> +	mmc-hs200-1_8v;
> +	mmc-hs400-1_8v;
>  };
>  
>  &mmc_2 {
> --

Looks good to me, applied.

Thanks,
Kukjin
