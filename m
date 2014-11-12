From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH v2 2/2] arm: dts: Exynos5: Use pmu_system_controller
 phandle for dp phy
Date: Wed, 12 Nov 2014 13:21:08 +0900
Message-ID: <000101cffe30$155793a0$4006bae0$%han@samsung.com>
References: <1414675442-3471-1-git-send-email-gautam.vivek@samsung.com>
 <1414675442-3471-2-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1414675442-3471-2-git-send-email-gautam.vivek@samsung.com>
Content-language: ko
Sender: linux-kernel-owner@vger.kernel.org
To: 'Vivek Gautam' <gautam.vivek@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, seanpaul@google.com, ajaykumar.rs@samsung.com, 'Jingoo Han' <jg1.han@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thursday, October 30, 2014 10:24 PM, Vivek Gautam wrote:
> 
> DP PHY now require pmu-system-controller to handle PMU register
> to control PHY's power isolation. Adding the same to dp-phy
> node.
> 
> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
> Cc: Jingoo Han <jg1.han@samsung.com>

Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> ---
> 
> Changes from V1:
>  - none.
> 
>  arch/arm/boot/dts/exynos5250.dtsi |    2 +-
>  arch/arm/boot/dts/exynos5420.dtsi |    4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index 012b021..69f5eb0 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -732,7 +732,7 @@
> 
>  	dp_phy: video-phy@10040720 {
>  		compatible = "samsung,exynos5250-dp-video-phy";
> -		reg = <0x10040720 4>;
> +		samsung,pmu-syscon = <&pmu_system_controller>;
>  		#phy-cells = <0>;
>  	};
> 
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index 8617a03..1353a09 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -503,8 +503,8 @@
>  	};
> 
>  	dp_phy: video-phy@10040728 {
> -		compatible = "samsung,exynos5250-dp-video-phy";
> -		reg = <0x10040728 4>;
> +		compatible = "samsung,exynos5420-dp-video-phy";
> +		samsung,pmu-syscon = <&pmu_system_controller>;
>  		#phy-cells = <0>;
>  	};
> 
> --
> 1.7.10.4
