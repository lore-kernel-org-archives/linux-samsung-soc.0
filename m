From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos: Add TMU nodes regulator supply for Peach
 boards
Date: Wed, 01 Jun 2016 10:50:25 +0200
Message-ID: <574EA1D1.6020606@samsung.com>
References: <1464731280-24588-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1464731280-24588-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 05/31/2016 11:48 PM, Javier Martinez Canillas wrote:
> The Exynos5800 Peach Pi and Exynos5420 Peach Pit Chromebooks have the
> LDO10 1.8V output connected to the VDD18_TS{01,23,4} Exynos SoC pins.
> 
> Add this regulator as the input supply of the Thermal Management Unit
> channels and also remove the always-on property since all the devices
> using LDO10 as input supply are now defined.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
> 
>  arch/arm/boot/dts/exynos5420-peach-pit.dts | 21 ++++++++++++++++++++-
>  arch/arm/boot/dts/exynos5800-peach-pi.dts  | 21 ++++++++++++++++++++-
>  2 files changed, 40 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
> index c1247402cb17..a55760b5fa82 100644
> --- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
> +++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
> @@ -425,7 +425,6 @@
>  				regulator-name = "vdd_ldo10";
>  				regulator-min-microvolt = <1800000>;
>  				regulator-max-microvolt = <1800000>;
> -				regulator-always-on;
>  				regulator-state-mem {
>  					regulator-off-in-suspend;
>  				};
> @@ -924,6 +923,26 @@
>  	assigned-clock-parents = <&clock CLK_FIN_PLL>;
>  };
>  
> +&tmu_cpu0 {
> +	vtmu-supply = <&ldo10_reg>;
> +};
> +
> +&tmu_cpu1 {
> +	vtmu-supply = <&ldo10_reg>;
> +};
> +
> +&tmu_cpu2 {
> +	vtmu-supply = <&ldo10_reg>;
> +};
> +
> +&tmu_cpu3 {
> +	vtmu-supply = <&ldo10_reg>;
> +};
> +
> +&tmu_gpu {
> +	vtmu-supply = <&ldo10_reg>;
> +};
> +

Here and for Peach Pi please put the nodes in alphabetical order.

Best regards,
Krzysztof
