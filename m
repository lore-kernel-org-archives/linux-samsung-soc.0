From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/5] arm64: dts: exynos: Move the clock-frequency property
Date: Tue, 7 Feb 2017 22:13:35 +0200
Message-ID: <20170207201335.lyc7yvwed7cm25nj@kozik-lap>
References: <1486347584-6762-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170206021951epcas1p365db9f08f22cc223ca45538b0dbc86d6@epcas1p3.samsung.com>
 <1486347584-6762-3-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1486347584-6762-3-git-send-email-hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

I think the subject is not really matching the real work. You are rather
removing the OF graph from DSI node.

On Mon, Feb 06, 2017 at 11:19:41AM +0900, Hoegeun Kwon wrote:
> The OF graph is not needed because the panel is a child of dsi. So
> removed the ports and moved burst, esc clock-frequency property to the
> top.

Keep the commit style and tense - imperative mode (see
submitting-patches.rstsubmitting-patches.rst), so last sentence could
look like:

"Remove the ports node abd move burst and esc clock frequency properties
to the parent (DSI node)."

The information which is missing is the answer for WHY? Why are you
doing this?

Does the patch depends on 1/5?

Best regards,
Krzysztof

> 
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> index 6ce93a3..77ba238 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> @@ -298,23 +298,11 @@
>  	status = "okay";
>  	vddcore-supply = <&ldo6_reg>;
>  	vddio-supply = <&ldo7_reg>;
> +	samsung,burst-clock-frequency = <512000000>;
> +	samsung,esc-clock-frequency = <16000000>;
>  	samsung,pll-clock-frequency = <24000000>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&te_irq>;
> -
> -	ports {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		port@1 {
> -			reg = <1>;
> -
> -			dsi_out: endpoint {
> -				samsung,burst-clock-frequency = <512000000>;
> -				samsung,esc-clock-frequency = <16000000>;
> -			};
> -		};
> -	};
>  };
>  
>  &hdmi {
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
