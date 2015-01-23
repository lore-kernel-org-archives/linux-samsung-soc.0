From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH v3] ARM: dts: exynos5422-odroidxu3: add on-board INA231
 sensors
Date: Fri, 23 Jan 2015 15:37:50 +0900
Message-ID: <0b5701d036d7$1bdcad20$53960760$@kernel.org>
References: <1421963668-28359-1-git-send-email-khilman@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:15265 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751009AbbAWGhx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Jan 2015 01:37:53 -0500
In-reply-to: <1421963668-28359-1-git-send-email-khilman@kernel.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kevin Hilman' <khilman@kernel.org>, linux-samsung-soc@vger.kernel.org
Cc: linaro-kernel@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 'Javier Martinez Canillas' <javier.martinez@collabora.co.uk>, 'Sjoerd Simons' <sjoerd.simons@collabora.co.uk>, 'Kevin Hilman' <khilman@linaro.org>, 'Rob Herring' <robh+dt@kernel.org>, 'Pawel Moll' <pawel.moll@arm.com>, 'Mark Rutland' <mark.rutland@arm.com>, 'Ian Campbell' <ijc+devicetree@hellion.org.uk>, 'Kumar Gala' <galak@codeaurora.org>, 'Russell King' <linux@arm.linux.org.uk>, 'Kukjin Kim' <kgene@kernel.org>, "'open list:OPEN FIRMWARE AND...'" <devicetree@vger.kernel.org>, 'open list' <linux-kernel@vger.kernel.org>

Kevin Hilman wrote:
> 
> From: Kevin Hilman <khilman@linaro.org>
> 
> The odroid-xu3 has 4 INA231 current sensors on board which can be
> accessed from the Linux via the hwmon interface.
> 
> There is one sensor for each of these power rails:
> 
> - A15 cluster: VDD_ARM
> - A7 cluster: VDD_KFC
> - GPU: VDD_G3D
> - memory: VDD_MEM
> 
> In addition to adding the sensors, LDO26 from the PMIC needs to be
> enabled because it's powering these sensor.
> 
> Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> Cc: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
> Reviewed-By: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
> Signed-off-by: Kevin Hilman <khilman@linaro.org>
> ---
> v3: extend existing i2c_0 node
> v2: use "ti,ina231" as compatible string.
> 
> Applies on top of "ARM: dts: Add dts file for odroid XU3 board" from Sjoerd Simons.
> 
>  arch/arm/boot/dts/exynos5422-odroidxu3.dts | 39 ++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> index c29123c0734d..38694a4a5417 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> @@ -174,6 +174,13 @@
>  					regulator-always-on;
>  				};
> 
> +				ldo26_reg: LDO26 {
> +					regulator-name = "vdd_ldo26";
> +					regulator-min-microvolt = <3000000>;
> +					regulator-max-microvolt = <3000000>;
> +					regulator-always-on;
> +				};
> +
>  				buck1_reg: BUCK1 {
>  					regulator-name = "vdd_mif";
>  					regulator-min-microvolt = <800000>;
> @@ -330,3 +337,35 @@
>  &usbdrd_dwc3_1 {
>  	dr_mode = "otg";
>  };
> +
> +&i2c_0 {
> +	status = "okay";
> +
> +	/* A15 cluster: VDD_ARM */
> +	ina231@40 {
> +		compatible = "ti,ina231";
> +		reg = <0x40>;
> +		shunt-resistor = <10000>;
> +	};
> +
> +	/* memory: VDD_MEM */
> +	ina231@41 {
> +		compatible = "ti,ina231";
> +		reg = <0x41>;
> +		shunt-resistor = <10000>;
> +	};
> +
> +	/* GPU: VDD_G3D */
> +	ina231@44 {
> +		compatible = "ti,ina231";
> +		reg = <0x44>;
> +		shunt-resistor = <10000>;
> +	};
> +
> +	/* A7 cluster: VDD_KFC */
> +	ina231@45 {
> +		compatible = "ti,ina231";
> +		reg = <0x45>;
> +		shunt-resistor = <10000>;
> +	};
> +};
> --
> 2.1.3

OK, let me replace the applied patch with this in my tree.

Thanks,
Kukjin
