From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] arm: dts: exynos: Add GPU/Mali T604 node to exynos5250
Date: Wed, 24 Jul 2019 21:43:13 +0200
Message-ID: <20190724194313.GA1898@kozik-lap>
References: <20190724072008.6272-1-guillaume.gardet@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190724072008.6272-1-guillaume.gardet@free.fr>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Guillaume GARDET <guillaume.gardet@free.fr>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, Guillaume GARDET <guillaume.gardet@arm.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

Thanks for the patch.

On Wed, Jul 24, 2019 at 09:20:08AM +0200, Guillaume GARDET wrote:
> From: Guillaume GARDET <guillaume.gardet@arm.com>
> 
> Add nodes for GPU (Mali T604) to Exynos5250, disabled by default.

Why disabled? If tested I would expect it to be enabled at least on
tested platforms.

> Tested with kmscube on Chromebook snow.
> 
> Signed-off-by: Guillaume GARDET <guillaume.gardet@arm.com>
> 
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> 
> ---
>  arch/arm/boot/dts/exynos5250.dtsi | 47 +++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index d5e0392b409e..5ce4b2853cf2 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -1097,6 +1097,53 @@
>  		 */
>  		clock-frequency = <24000000>;
>  	};
> +
> +	mali: gpu@0x11800000 {

1. Put the node under /soc (as recently pointed out by Marek Szyprowski)
in an address-sorted mode... if possible (nodes are mixed so find some
reasonable place based on address_.
2. Fix errors from:
make dtbs W=1

> +		compatible = "samsung,exynos5250-mali", "arm,mali-t604";

You also need to update the bindings.

> +		reg = <0x11800000 0x5000>;
> +		interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
> +		             <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,

Please run checkpatch and fix the errors.

> +			     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "job", "mmu", "gpu";
> +		clocks = <&clock CLK_G3D>;
> +		clock-names = "g3d";
> +		operating-points-v2 = <&gpu_opp_table>;
> +		power-domains = <&pd_g3d>;
> +		status = "disabled";
> +	};
> +
> +	gpu_opp_table: gpu-opp-table {

GPU opp table as subnode of Mali node.

Best regards,
Krzysztof
