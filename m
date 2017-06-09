From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: exynos: Add the OF graph between fimd and dsi
Date: Fri, 9 Jun 2017 09:27:54 +0200
Message-ID: <20170609072754.GB4018@kozik-book>
References: <CGME20170609025951epcas1p19f5ca8c241b8b79068a84eb239ed46ed@epcas1p1.samsung.com>
 <1496977173-20550-1-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34236 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751506AbdFIH16 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Jun 2017 03:27:58 -0400
Content-Disposition: inline
In-Reply-To: <1496977173-20550-1-git-send-email-hoegeun.kwon@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Cc: inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, airlied@linux.ie, kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, javier@osg.samsung.com, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, a.hajda@samsung.com

On Fri, Jun 09, 2017 at 11:59:33AM +0900, Hoegeun Kwon wrote:
> It should be connected to OF graph between fimd and dsi.
> Add the OF graph between fimd and dsi.

I need more explanation why this is needed. What happens without this?
What issue is fixed here?

What about Exynos5250 and Exynos5420? I think we do not have a board in
mainline using FIMD but maybe this should be added just for correct
hardware description?


Best regards,
Krzysztof

> 
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> ---
>  arch/arm/boot/dts/exynos3250.dtsi | 26 ++++++++++++++++++++++++++
>  arch/arm/boot/dts/exynos4.dtsi    | 26 ++++++++++++++++++++++++++
>  2 files changed, 52 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
> index 590ee44..22d523f 100644
> --- a/arch/arm/boot/dts/exynos3250.dtsi
> +++ b/arch/arm/boot/dts/exynos3250.dtsi
> @@ -311,6 +311,19 @@
>  			iommus = <&sysmmu_fimd0>;
>  			samsung,sysreg = <&sys_reg>;
>  			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					fimd_to_dsi: endpoint {
> +						remote-endpoint =
> +							<&dsi_to_fimd>;
> +					};
> +				};
> +			};
>  		};
>  
>  		dsi_0: dsi@11C80000 {
> @@ -326,6 +339,19 @@
>  			#address-cells = <1>;
>  			#size-cells = <0>;
>  			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					dsi_to_fimd: endpoint {
> +						remote-endpoint =
> +							<&fimd_to_dsi>;
> +					};
> +				};
> +			};
>  		};
>  
>  		sysmmu_fimd0: sysmmu@11E20000 {
> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> index 497a947..773d392 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -193,6 +193,19 @@
>  		status = "disabled";
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				dsi_to_fimd: endpoint {
> +					remote-endpoint =
> +						<&fimd_to_dsi>;
> +				};
> +			};
> +		};
>  	};
>  
>  	camera {
> @@ -715,6 +728,19 @@
>  		iommus = <&sysmmu_fimd0>;
>  		samsung,sysreg = <&sys_reg>;
>  		status = "disabled";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				fimd_to_dsi: endpoint {
> +					remote-endpoint =
> +						<&dsi_to_fimd>;
> +				};
> +			};
> +		};
>  	};
>  
>  	tmu: tmu@100C0000 {
> -- 
> 1.9.1
> 
