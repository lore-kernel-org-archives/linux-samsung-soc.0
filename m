From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/2] ARM: dts: exynos: Use correct mfc_pd async-bridge
 clock for Exynos5420
Date: Fri, 20 Jan 2017 18:28:46 +0200
Message-ID: <20170120162846.x766u3nzblqywggj@kozik-lap>
References: <1484864995-10679-1-git-send-email-javier@osg.samsung.com>
 <1484864995-10679-2-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1484864995-10679-2-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Inki Dae <inki.dae@samsung.com>, Andi Shyti <andi.shyti@samsung.com>, Shuah Khan <shuahkh@osg.samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Jan 19, 2017 at 07:29:55PM -0300, Javier Martinez Canillas wrote:
> Commit 94aed538e032 ("ARM: dts: exynos: Add async-bridge clock to MFC
> power domain for Exynos5420") fixed an imprecise external abort error
> when the MFC registers were tried to be accessed and the needed clock
> for the asynchronous bridges were gated.
> 
> But according to the Exynos5420 manual the "Gating AXI clock for MFC"
> is not CLK_ACLK333 but CLK_MFC.
> 
> The end effect is the same because CLK_ACLK333 is a parent of CLK_MFC
> but the correct clock should be used instead.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> ---
> 
>  arch/arm/boot/dts/exynos5420.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Is this still needed?

Best regards,
Krzysztof

> 
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index 906a1a42a7ea..ffb148ea91d6 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -294,7 +294,7 @@
>  			reg = <0x10044060 0x20>;
>  			clocks = <&clock CLK_FIN_PLL>,
>  				 <&clock CLK_MOUT_USER_ACLK333>,
> -				 <&clock CLK_ACLK333>;
> +				 <&clock CLK_MFC>;
>  			clock-names = "oscclk", "clk0","asb0";
>  			#power-domain-cells = <0>;
>  		};
> -- 
> 2.7.4
> 
