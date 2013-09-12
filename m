From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 3/3] ARM: dts: Disable I2C controllers by default on
 Exynos5250
Date: Thu, 12 Sep 2013 14:58:59 +0200
Message-ID: <2175767.kktjrZWOAr@amdc1227>
References: <1378982427-5802-1-git-send-email-broonie@kernel.org>
 <1378982427-5802-3-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:41376 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753854Ab3ILM7b (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Sep 2013 08:59:31 -0400
In-reply-to: <1378982427-5802-3-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@vger.kernel.org, Mark Brown <broonie@linaro.org>

Hi Mark,

On Thursday 12 of September 2013 11:40:27 Mark Brown wrote:
> From: Mark Brown <broonie@linaro.org>
> 
> Ensure that unused I2C controllers are not activated, causing problems
> due to inappropriate pinmuxing or similar, by marking the controllers as
> disabled by default and requiring boards to explicitly enable those that
> are in use.
> 
> Signed-off-by: Mark Brown <broonie@linaro.org>
> ---
>  arch/arm/boot/dts/exynos5250-arndale.dts  | 31
> ++-----------------------------
> arch/arm/boot/dts/exynos5250-smdk5250.dts | 25 +++++--------------------
> arch/arm/boot/dts/exynos5250-snow.dts     |  4 ++++
>  arch/arm/boot/dts/exynos5250.dtsi         | 10 ++++++++++
>  4 files changed, 21 insertions(+), 49 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts
> b/arch/arm/boot/dts/exynos5250-arndale.dts index 4687fa0..4c10901 100644
> --- a/arch/arm/boot/dts/exynos5250-arndale.dts
> +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
> @@ -31,6 +31,7 @@
>  	};
> 
>  	i2c@12C60000 {
> +		status = "okay";

I would keep the status properties at the end of all properties, indicating 
that at this point the description is complete and also to be consistent 
with other dts files around.

>  		samsung,i2c-sda-delay = <100>;
>  		samsung,i2c-max-bus-freq = <20000>;
>  		samsung,i2c-slave-addr = <0x66>;
> @@ -319,16 +320,8 @@
>  		};
>  	};
> 
> -	i2c@12C70000 {
> -		status = "disabled";
> -	};
> -
> -	i2c@12C80000 {
> -		status = "disabled";
> -	};
> -
>  	i2c@12C90000 {
> -		wm1811a@1a {
> +		status = "okay";

Hmm, I sense something wrong going on here.

>  			compatible = "wlf,wm1811";
>  			reg = <0x1a>;
> 
> @@ -346,26 +339,6 @@
>  		};
>  	};
> 
> -	i2c@12CA0000 {
> -		status = "disabled";
> -	};
> -
> -	i2c@12CB0000 {
> -		status = "disabled";
> -	};
> -
> -	i2c@12CC0000 {
> -		status = "disabled";
> -	};
> -
> -	i2c@12CD0000 {
> -		status = "disabled";
> -	};
> -
> -	i2c@121D0000 {
> -		status = "disabled";
> -	};
> -
>  	dwmmc_0: dwmmc0@12200000 {
>  		num-slots = <1>;
>  		supports-highspeed;
> diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts
> b/arch/arm/boot/dts/exynos5250-smdk5250.dts index 67d3c43..90127e3
> 100644
> --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
> +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> @@ -28,6 +28,7 @@
>  	};
> 
>  	i2c@12C60000 {
> +		status = "okay";
>  		samsung,i2c-sda-delay = <100>;
>  		samsung,i2c-max-bus-freq = <20000>;
> 
> @@ -62,6 +63,7 @@
>  	};
> 
>  	i2c@12C70000 {
> +		status = "okay";
>  		samsung,i2c-sda-delay = <100>;
>  		samsung,i2c-max-bus-freq = <20000>;
> 
> @@ -86,6 +88,7 @@
>  	};
> 
>  	i2c@121D0000 {
> +		status = "okay";
>  		samsung,i2c-sda-delay = <100>;
>  		samsung,i2c-max-bus-freq = <40000>;
>  		samsung,i2c-slave-addr = <0x38>;
> @@ -101,6 +104,7 @@
>  	};
> 
>  	i2c@12C80000 {
> +		status = "okay";
>  		samsung,i2c-sda-delay = <100>;
>  		samsung,i2c-max-bus-freq = <66000>;
> 
> @@ -110,27 +114,8 @@
>  		};
>  	};
> 
> -	i2c@12C90000 {
> -		status = "disabled";
> -	};
> -
> -	i2c@12CA0000 {
> -		status = "disabled";
> -	};
> -
> -	i2c@12CB0000 {
> -		status = "disabled";
> -	};
> -
> -	i2c@12CC0000 {
> -		status = "disabled";
> -	};
> -
> -	i2c@12CD0000 {
> -		status = "disabled";
> -	};
> -
>  	i2c@12CE0000 {
> +		status = "okay";
>  		samsung,i2c-sda-delay = <100>;
>  		samsung,i2c-max-bus-freq = <66000>;
> 
> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts
> b/arch/arm/boot/dts/exynos5250-snow.dts index fd711e2..b7674d5 100644
> --- a/arch/arm/boot/dts/exynos5250-snow.dts
> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
> @@ -48,6 +48,10 @@
>  		};
>  	};
> 
> +	i2c@12CA0000 {
> +		status = "okay";

Hmm, no other properties needed here?

> +	};
> +
>  	i2c-arbitrator {
>  		compatible = "i2c-arb-gpio-challenge";
>  		#address-cells = <1>;
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi
> b/arch/arm/boot/dts/exynos5250.dtsi index a886ee4..4d6312e 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -229,6 +229,7 @@
> 
>  	i2c_0: i2c@12C60000 {
>  		compatible = "samsung,s3c2440-i2c";
> +		status = "disabled";

For the sake of consistency, I would place the status property as last here 
as well.

Best regards,
Tomasz
