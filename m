From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v1 9/9] ARM: dts: arndale: Add audio support (WM1811
 CODEC boards)
Date: Thu, 19 Sep 2019 10:26:21 +0200
Message-ID: <20190919082621.GG13195@pi3>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104715eucas1p2a051a537a0e86becfbbcb36c172ef705@eucas1p2.samsung.com>
 <20190918104634.15216-10-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190918104634.15216-10-s.nawrocki@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com, b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com, lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Sep 18, 2019 at 12:46:34PM +0200, Sylwester Nawrocki wrote:
> Add sound node and the clock configurations for the I2S controller
> for audio support on the Exynos5250 SoC Arndale boards with
> WM1811 based audio daugther board.
> 
> We need to increase drive strength of the I2S bus, otherwise
> the audio CODEC doesn't work. Likely the CODEC's master clock
> is the main issue here.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250-arndale.dts | 27 +++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
> index dc6fa6fe83f1..62aa6720aa88 100644
> --- a/arch/arm/boot/dts/exynos5250-arndale.dts
> +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/clock/samsung,s2mps11.h>
> +#include <dt-bindings/sound/samsung-i2s.h>
>  #include "exynos5250.dtsi"
>  
>  / {
> @@ -135,6 +136,12 @@
>  		};
>  	};
>  
> +	sound {
> +		compatible = "samsung,arndale-wm1811";
> +		samsung,audio-cpu = <&i2s0>;
> +		samsung,audio-codec = <&wm1811>;
> +	};
> +
>  	fixed-rate-clocks {
>  		xxti {
>  			compatible = "samsung,clock-xxti";
> @@ -499,12 +506,24 @@
>  	};
>  };
>  
> +&clock {
> +	assigned-clocks = <&clock CLK_FOUT_EPLL>;
> +	assigned-clock-rates = <49152000>;
> +};
> +
> +&clock_audss {
> +	assigned-clocks = <&clock_audss EXYNOS_MOUT_AUDSS>;
> +	assigned-clock-parents = <&clock CLK_FOUT_EPLL>;
> +};

Put them before "cpu" so alphabetical order is preserved.

Best regards,
Krzysztof

> +
>  &i2c_3 {
>  	status = "okay";
>  
> -	wm1811a@1a {
> +	wm1811: codec@1a {
>  		compatible = "wlf,wm1811";
>  		reg = <0x1a>;
> +		clocks = <&i2s0 CLK_I2S_CDCLK>;
> +		clock-names = "MCLK1";
>  
>  		AVDD2-supply = <&main_dc_reg>;
>  		CPVDD-supply = <&main_dc_reg>;
> @@ -540,9 +559,15 @@
>  };
>  
>  &i2s0 {
> +	assigned-clocks = <&i2s0 CLK_I2S_RCLK_SRC>;
> +	assigned-clock-parents = <&clock_audss EXYNOS_I2S_BUS>;
>  	status = "okay";
>  };
>  
> +&i2s0_bus {
> +	samsung,pin-drv = <EXYNOS4_PIN_DRV_LV2>;
> +};
> +
>  &mixer {
>  	status = "okay";
>  };
> -- 
> 2.17.1
> 
