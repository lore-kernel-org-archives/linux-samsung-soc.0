From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH V4 1/4] ARM: dts: Move dwmmc nodes from exynos5.dtsi to
 exynos5250.dtsi
Date: Mon, 21 Oct 2013 05:50:06 +0900
Message-ID: <526441FE.406@samsung.com>
References: <1378188264-22382-1-git-send-email-yuvaraj.cd@samsung.com> <1378188264-22382-2-git-send-email-yuvaraj.cd@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:52526 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751654Ab3JTUuN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 20 Oct 2013 16:50:13 -0400
In-Reply-To: <1378188264-22382-2-git-send-email-yuvaraj.cd@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, devicetree@vger.kernel.org, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ian.campbell@citrix.com, t.figa@samsung.com, dianders@chromium.org, cjb@laptop.org, thomas.abraham@linaro.org, ks.giri@samsung.com, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>

On 09/03/13 15:04, Yuvaraj Kumar C D wrote:
> Exynos5 series SOC's 5250 and 5420 have different versions of
> DWMMC controller.So there is a new compatible string to distinguish
> between them.So these nodes should be moved out of Exynos5 series
> common device tree source to SOC specific device tree source.
>
> Changes since V3: none
>
> Changes since V2:
> 	1.remove from exynos5.dtsi and add in exynos5250.dtsi
> 	  in single patch.
>
> Changes since V1: none
>
BTW, above changes should be under '---' because the changes are not 
needed in git log. I modified when I applied.

Thanks,
Kukjin

> Signed-off-by: Yuvaraj Kumar C D<yuvaraj.cd@samsung.com>
> ---
>   arch/arm/boot/dts/exynos5.dtsi    |   21 ---------------------
>   arch/arm/boot/dts/exynos5250.dtsi |   12 ++++++++++++
>   2 files changed, 12 insertions(+), 21 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
> index 074739d..e52b038 100644
> --- a/arch/arm/boot/dts/exynos5.dtsi
> +++ b/arch/arm/boot/dts/exynos5.dtsi
> @@ -50,27 +50,6 @@
>   		interrupts =<1 9 0xf04>;
>   	};
>
> -	dwmmc_0: dwmmc0@12200000 {
> -		compatible = "samsung,exynos5250-dw-mshc";
> -		interrupts =<0 75 0>;
> -		#address-cells =<1>;
> -		#size-cells =<0>;
> -	};
> -
> -	dwmmc_1: dwmmc1@12210000 {
> -		compatible = "samsung,exynos5250-dw-mshc";
> -		interrupts =<0 76 0>;
> -		#address-cells =<1>;
> -		#size-cells =<0>;
> -	};
> -
> -	dwmmc_2: dwmmc2@12220000 {
> -		compatible = "samsung,exynos5250-dw-mshc";
> -		interrupts =<0 77 0>;
> -		#address-cells =<1>;
> -		#size-cells =<0>;
> -	};
> -
>   	serial@12C00000 {
>   		compatible = "samsung,exynos4210-uart";
>   		reg =<0x12C00000 0x100>;
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index 864ae90..d42844b 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -388,18 +388,30 @@
>   	};
>
>   	dwmmc_0: dwmmc0@12200000 {
> +		compatible = "samsung,exynos5250-dw-mshc";
> +		interrupts =<0 75 0>;
> +		#address-cells =<1>;
> +		#size-cells =<0>;
>   		reg =<0x12200000 0x1000>;
>   		clocks =<&clock 280>,<&clock 139>;
>   		clock-names = "biu", "ciu";
>   	};
>
>   	dwmmc_1: dwmmc1@12210000 {
> +		compatible = "samsung,exynos5250-dw-mshc";
> +		interrupts =<0 76 0>;
> +		#address-cells =<1>;
> +		#size-cells =<0>;
>   		reg =<0x12210000 0x1000>;
>   		clocks =<&clock 281>,<&clock 140>;
>   		clock-names = "biu", "ciu";
>   	};
>
>   	dwmmc_2: dwmmc2@12220000 {
> +		compatible = "samsung,exynos5250-dw-mshc";
> +		interrupts =<0 77 0>;
> +		#address-cells =<1>;
> +		#size-cells =<0>;
>   		reg =<0x12220000 0x1000>;
>   		clocks =<&clock 282>,<&clock 141>;
>   		clock-names = "biu", "ciu";
