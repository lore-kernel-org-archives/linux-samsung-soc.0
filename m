From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: exynos: add flash support to galaxy-s3 boards
Date: Sat, 15 Jun 2019 19:04:28 +0200
Message-ID: <20190615170428.GA3447@kozik-lap>
References: <20190614155419.14260-1-GNUtoo@cyberdimension.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190614155419.14260-1-GNUtoo@cyberdimension.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Simon Shields <simon@lineageos.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Jun 14, 2019 at 05:54:19PM +0200, Denis 'GNUtoo' Carikli wrote:
> From: Simon Shields <simon@lineageos.org>
> 
> The galaxy s3 boards use an aat1290 to control the flash LED.
> This patch adds the relevant device tree configuration to use it.
> 
> Signed-off-by: Simon Shields <simon@lineageos.org>
> Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org> [rebase]
> ---
>  arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi | 32 +++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
> index 30eee5942eff..375aeca09882 100644
> --- a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
> +++ b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
> @@ -15,6 +15,24 @@
>  		i2c10 = &i2c_cm36651;
>  	};
>  
> +	aat1290 {
> +		compatible = "skyworks,aat1290";
> +		flen-gpios = <&gpj1 1 GPIO_ACTIVE_HIGH>;
> +		enset-gpios = <&gpj1 2 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-names = "default", "host", "isp";
> +		pinctrl-0 = <&camera_flash_host>;
> +		pinctrl-1 = <&camera_flash_host>;
> +		pinctrl-2 = <&camera_flash_isp>;
> +
> +		flash-led {
> +			label = "flash";
> +			led-max-microamp = <520833>;
> +			flash-max-microamp = <1012500>;
> +			flash-max-timeout-us = <1940000>;
> +		};
> +	};
> +
>  	lcd_vdd3_reg: voltage-regulator-6 {
>  		compatible = "regulator-fixed";
>  		regulator-name = "LCD_VDD_2.2V";
> @@ -131,6 +149,20 @@
>  	regulator-max-microvolt = <2800000>;
>  };
>  
> +&pinctrl_0 {
> +	camera_flash_host: camera-flash-host {
> +		samsung,pins = "gpj1-0";
> +		samsung,pin-function = <1>;
> +		samsung,pin-val = <0>;

Please use the pin macros from:
include/dt-bindings/pinctrl/samsung.h

Best regards,
Krzysztof
