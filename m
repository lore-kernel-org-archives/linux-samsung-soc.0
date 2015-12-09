From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 2/2] ARM: dts: exynos542x: add GSCL block parent clock
 management to pm domain
Date: Wed, 09 Dec 2015 13:52:30 +0900
Message-ID: <5667B38E.5020207@samsung.com>
References: <1449582415-30164-1-git-send-email-m.szyprowski@samsung.com>
 <1449582415-30164-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:31019 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751919AbbLIEwg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Dec 2015 23:52:36 -0500
In-reply-to: <1449582415-30164-2-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@baylibre.com>, Kukjin Kim <kgene@kernel.org>

On 08.12.2015 22:46, Marek Szyprowski wrote:
> Add support for restoring GScaler parent clocks configuration when GSCL
> power domain is turned on.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index 48a0a55..912143e 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -252,8 +252,10 @@
>  		compatible = "samsung,exynos4210-pd";
>  		reg = <0x10044000 0x20>;
>  		#power-domain-cells = <0>;
> -		clocks = <&clock CLK_GSCL0>, <&clock CLK_GSCL1>;
> -		clock-names = "asb0", "asb1";
> +		clocks = <&clock CLK_FIN_PLL>, <&clock CLK_MOUT_SW_ACLK300_GSCL>,
> +			<&clock CLK_MOUT_USER_ACLK300_GSCL>, <&clock CLK_GSCL0>,
> +			<&clock CLK_GSCL1>;
> +		clock-names = "oscclk", "pclk0", "clk0", "asb0", "asb1";

The pclkN name is not used.

Best regards,
Krzysztof
