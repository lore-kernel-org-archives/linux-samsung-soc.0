From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: exynos5250: Add clocks to DISP1 domain
Date: Fri, 16 Oct 2015 08:44:52 +0900
Message-ID: <56203A74.7040305@samsung.com>
References: <1444905084-22540-1-git-send-email-tomeu.vizoso@collabora.com>
 <1444905084-22540-3-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1444905084-22540-3-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org
Cc: Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Javier Martinez Canillas <javier@osg.samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kukjin Kim <kgene@kernel.org>, Inki Dae <inki.dae@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 15.10.2015 19:31, Tomeu Vizoso wrote:
> Adds to the node of the DISP1 power domain the two clocks that need to
> be reparented while the domain is powered off:
> CLK_MOUT_ACLK200_DISP1_SUB and CLK_MOUT_ACLK300_DISP1_SUB.
> 
> Otherwise the state is unknown at power up and the mixer's clocks are
> all messed up.
> 
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Link: http://lkml.kernel.org/g/561CDC33.7050103@collabora.com
> ---
> 
> 
>  arch/arm/boot/dts/exynos5250.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index b24610ea8c2a..88b9cf5f226f 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -130,6 +130,10 @@
>  		compatible = "samsung,exynos4210-pd";
>  		reg = <0x100440A0 0x20>;
>  		#power-domain-cells = <0>;
> +		clocks = <&clock CLK_FIN_PLL>,
> +			 <&clock CLK_MOUT_ACLK200_DISP1_SUB>,
> +			 <&clock CLK_MOUT_ACLK300_DISP1_SUB>;
> +		clock-names = "oscclk", "clk0", "clk1";
>  	};
>  
>  	clock: clock-controller@10010000 {
> 

I reviewed it already. Any changes here since v1?

Best regards,
Krzysztof
