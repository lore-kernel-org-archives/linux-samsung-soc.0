From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 5/5] ARM: dts: exynos4412-trats2: Add ADC's dt data to get
 temperature of SoC/battery
Date: Tue, 11 Mar 2014 14:09:00 +0100
Message-ID: <531F0AEC.7010606@samsung.com>
References: <1394524494-30641-1-git-send-email-cw00.choi@samsung.com>
 <1394524494-30641-6-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1394524494-30641-6-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, kgene.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kyungmin.park@samsung.com, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, linux@arm.linux.org.uk
List-Id: linux-samsung-soc@vger.kernel.org

Hi Chanwoo,

On 11.03.2014 08:54, Chanwoo Choi wrote:
> This patch use ADC to get the temperature of SoC/battery by using NTC thermistor
> driver in hwmon. NTC thermistor driver covnvert ADC's raw data to temperature
> by using following variables:
>
> - pullup-uv    : Voltage
> - pullup-ohm   : Pull-up resistance
> - pulldown-ohm : Pull-down resistance
> - io-channels  : It means ADC channel.
>

Those properties are well-defined in "ntc,ncp15wb473" DT bindings 
documentation. There is no need to repeat them here.

> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>   arch/arm/boot/dts/exynos4412-trats2.dts | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
> index 4f851cc..fc517c3 100644
> --- a/arch/arm/boot/dts/exynos4412-trats2.dts
> +++ b/arch/arm/boot/dts/exynos4412-trats2.dts
> @@ -106,6 +106,27 @@
>   		};
>   	};
>
> +	adc: adc@126C0000 {
> +		vdd-supply = <&ldo3_reg>;
> +		status = "okay";
> +
> +		ncp15wb473@0 {

style: Nodes should have generic names, e.g. thermistor@0.

Also if node name is suffixed with @unit-address, then the node should 
have a reg property with its first entry corresponding to the 
unit-address. Now there is no physical unit-address definition for those 
thermistors, so they shouldn't use this naming pattern, but rather 
something like "thermistor-0" or "thermistor-ap".

> +			compatible = "ntc,ncp15wb473";
> +			pullup-uv = <1800000>;	 /* VCC_1.8V_AP */
> +			pullup-ohm = <100000>;	 /* 100K */
> +			pulldown-ohm = <100000>; /* 100K */
> +			io-channels = <&adc 1>;  /* AP temperature */
> +		};
> +
> +		ncp15wb473@1 {
> +			compatible = "ntc,ncp15wb473";
> +			pullup-uv = <1800000>;	 /* VCC_1.8V_AP */
> +			pullup-ohm = <100000>;	 /* 100K */
> +			pulldown-ohm = <100000>; /* 100K */
> +			io-channels = <&adc 2>;  /* Battery temperature */
> +		};

Anyway, I don't think it is correct to place IIO consumers under IIO 
provider node, because IIO is not a control bus, but rather a resource 
provider, like GPIO, clock, etc. So both thermistor nodes should be 
placed outside the adc node. (They might be grouped in a simple-bus 
subnode, though, to improve readability.)

Best regards,
Tomasz
