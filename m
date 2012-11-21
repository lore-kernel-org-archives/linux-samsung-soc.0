From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: EXYNOS: Add aliases for i2c controller for exynos4
Date: Wed, 21 Nov 2012 18:43:04 +0900
Message-ID: <0dfb01cdc7cc$9aa39500$cfeabf00$%kim@samsung.com>
References: <1353450428-2615-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1353450428-2615-1-git-send-email-dianders@chromium.org>
Content-language: ko
Sender: linux-kernel-owner@vger.kernel.org
To: 'Doug Anderson' <dianders@chromium.org>, linux-samsung-soc@vger.kernel.org
Cc: linux-i2c@vger.kernel.org, 'Olof Johansson' <olof@lixom.net>, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Russell King' <linux@arm.linux.org.uk>, 'Tomasz Figa' <t.figa@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Doug Anderson wrote:
> 
> This is similar to a recent commit for exynos5250 titled:
>   ARM: EXYNOS: Add aliases for i2c controller
> 
> Adding aliases will be useful to prevent warnings in a future
> change.  See:
>   i2c: s3c2410: Get the i2c bus number from alias id
> 
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> 
> ---
>  arch/arm/boot/dts/exynos4.dtsi |   24 ++++++++++++++++--------
>  1 files changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4.dtsi
> b/arch/arm/boot/dts/exynos4.dtsi
> index a26c3dd..824d362 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -28,6 +28,14 @@
>  		spi0 = &spi_0;
>  		spi1 = &spi_1;
>  		spi2 = &spi_2;
> +		i2c0 = &i2c_0;
> +		i2c1 = &i2c_1;
> +		i2c2 = &i2c_2;
> +		i2c3 = &i2c_3;
> +		i2c4 = &i2c_4;
> +		i2c5 = &i2c_5;
> +		i2c6 = &i2c_6;
> +		i2c7 = &i2c_7;
>  	};
> 
>  	gic:interrupt-controller@10490000 {
> @@ -121,7 +129,7 @@
>  		status = "disabled";
>  	};
> 
> -	i2c@13860000 {
> +	i2c_0: i2c@13860000 {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  		compatible = "samsung,s3c2440-i2c";
> @@ -130,7 +138,7 @@
>  		status = "disabled";
>  	};
> 
> -	i2c@13870000 {
> +	i2c_1: i2c@13870000 {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  		compatible = "samsung,s3c2440-i2c";
> @@ -139,7 +147,7 @@
>  		status = "disabled";
>  	};
> 
> -	i2c@13880000 {
> +	i2c_2: i2c@13880000 {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  		compatible = "samsung,s3c2440-i2c";
> @@ -148,7 +156,7 @@
>  		status = "disabled";
>  	};
> 
> -	i2c@13890000 {
> +	i2c_3: i2c@13890000 {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  		compatible = "samsung,s3c2440-i2c";
> @@ -157,7 +165,7 @@
>  		status = "disabled";
>  	};
> 
> -	i2c@138A0000 {
> +	i2c_4: i2c@138A0000 {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  		compatible = "samsung,s3c2440-i2c";
> @@ -166,7 +174,7 @@
>  		status = "disabled";
>  	};
> 
> -	i2c@138B0000 {
> +	i2c_5: i2c@138B0000 {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  		compatible = "samsung,s3c2440-i2c";
> @@ -175,7 +183,7 @@
>  		status = "disabled";
>  	};
> 
> -	i2c@138C0000 {
> +	i2c_6: i2c@138C0000 {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  		compatible = "samsung,s3c2440-i2c";
> @@ -184,7 +192,7 @@
>  		status = "disabled";
>  	};
> 
> -	i2c@138D0000 {
> +	i2c_7: i2c@138D0000 {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  		compatible = "samsung,s3c2440-i2c";
> --
> 1.7.7.3

Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
